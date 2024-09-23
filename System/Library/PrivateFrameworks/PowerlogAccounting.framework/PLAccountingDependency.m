@implementation PLAccountingDependency

- (void)deactivate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__PLAccountingDependency_deactivate__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (deactivate_defaultOnce != -1)
      dispatch_once(&deactivate_defaultOnce, block);
    if (deactivate_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self=%@"), self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDependency deactivate]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 112);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PLAccountingDependency observingOwnerIDs](self, "observingOwnerIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PLAccountingDependency manager](self, "manager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stopObservingOwnerID:forDependency:", v15, self);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v12);
  }

  -[PLAccountingDependency setObservingOwnerIDs:](self, "setObservingOwnerIDs:", 0);
  -[PLAccountingDependency manager](self, "manager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "canFreeDependency:", self);

}

- (void)updateWithEndDate:(id)a3
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
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__PLAccountingDependency_updateWithEndDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (updateWithEndDate__defaultOnce != -1)
      dispatch_once(&updateWithEndDate__defaultOnce, block);
    if (updateWithEndDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("endDate=%@, self=%@"), v4, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDependency updateWithEndDate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 99);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingDependency range](self, "range");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v13);
  v15 = v14;

  if (v15 >= 0.0)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v28 = objc_opt_class();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __44__PLAccountingDependency_updateWithEndDate___block_invoke_49;
      v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v34[4] = v28;
      if (updateWithEndDate__defaultOnce_47 != -1)
        dispatch_once(&updateWithEndDate__defaultOnce_47, v34);
      if (updateWithEndDate__classDebugEnabled_48)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot push endDate further into the future"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDependency updateWithEndDate:]");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v31, v32, 103);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();
        goto LABEL_21;
      }
    }
  }
  else
  {
    -[PLAccountingDependency range](self, "range");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v17, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingDependency setRange:](self, "setRange:", v18);

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __44__PLAccountingDependency_updateWithEndDate___block_invoke_55;
      v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v33[4] = v19;
      if (updateWithEndDate__defaultOnce_53 != -1)
        dispatch_once(&updateWithEndDate__defaultOnce_53, v33);
      if (updateWithEndDate__classDebugEnabled_54)
      {
        v20 = (void *)MEMORY[0x24BDD17C8];
        -[PLAccountingDependency range](self, "range");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("range=%@"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDependency updateWithEndDate:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 108);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();
LABEL_21:

      }
    }
  }

}

- (void)activate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A62B000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (PLAccountingDependencyManager)manager
{
  return (PLAccountingDependencyManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setObservingOwnerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_observingOwnerIDs, a3);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (void)didReceiveOwner:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
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
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  int v30;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD block[6];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__PLAccountingDependency_didReceiveOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveOwner__defaultOnce != -1)
      dispatch_once(&didReceiveOwner__defaultOnce, block);
    if (didReceiveOwner__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("owner=%@, self=%@"), v4, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDependency didReceiveOwner:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 73);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __42__PLAccountingDependency_didReceiveOwner___block_invoke_36;
      v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v54[4] = v12;
      if (didReceiveOwner__defaultOnce_34 != -1)
        dispatch_once(&didReceiveOwner__defaultOnce_34, v54);
      if (didReceiveOwner__classDebugEnabled_35)
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        -[PLAccountingDependency observingOwnerIDs](self, "observingOwnerIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("observingOwnerIDs=%@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDependency didReceiveOwner:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 77);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    -[PLAccountingDependency observingOwnerIDs](self, "observingOwnerIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "containsObject:", v22);

    if (v23)
    {
      objc_msgSend(v4, "range");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "endDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAccountingDependency range](self, "range");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "endDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v27);
      v29 = v28;

      if (v29 >= -1.0)
      {
        v30 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
        v31 = MEMORY[0x24BDAC760];
        if (v30)
        {
          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = __42__PLAccountingDependency_didReceiveOwner___block_invoke_39;
          v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v53[4] = objc_opt_class();
          if (didReceiveOwner__defaultOnce_37 != -1)
            dispatch_once(&didReceiveOwner__defaultOnce_37, v53);
          if (didReceiveOwner__classDebugEnabled_38)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("owner exceeds dependency's range"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "lastPathComponent");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDependency didReceiveOwner:]");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 82);

            PLLogCommon();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingDependency observingOwnerIDs](self, "observingOwnerIDs");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "removeObject:", v39);

        -[PLAccountingDependency manager](self, "manager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stopObservingOwnerID:forDependency:", v41, self);

        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v52[0] = v31;
          v52[1] = 3221225472;
          v52[2] = __42__PLAccountingDependency_didReceiveOwner___block_invoke_44;
          v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v52[4] = objc_opt_class();
          if (didReceiveOwner__defaultOnce_42 != -1)
            dispatch_once(&didReceiveOwner__defaultOnce_42, v52);
          if (didReceiveOwner__classDebugEnabled_43)
          {
            v42 = (void *)MEMORY[0x24BDD17C8];
            -[PLAccountingDependency observingOwnerIDs](self, "observingOwnerIDs");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "stringWithFormat:", CFSTR("observingOwnerIDs.count=%i"), objc_msgSend(v43, "count"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingDependency.m");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "lastPathComponent");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDependency didReceiveOwner:]");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 89);

            PLLogCommon();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingDependency observingOwnerIDs](self, "observingOwnerIDs");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "count");

        if (!v51)
          -[PLAccountingDependency deactivate](self, "deactivate");
      }
    }
  }

}

- (NSMutableSet)observingOwnerIDs
{
  NSMutableSet *observingOwnerIDs;
  NSMutableSet *v4;
  NSMutableSet *v5;

  observingOwnerIDs = self->_observingOwnerIDs;
  if (!observingOwnerIDs)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_observingOwnerIDs;
    self->_observingOwnerIDs = v4;

    observingOwnerIDs = self->_observingOwnerIDs;
  }
  return observingOwnerIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingOwnerIDs, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (NSNumber)ID
{
  return (NSNumber *)&unk_24DD01420;
}

- (PLAccountingRange)range
{
  return 0;
}

- (NSDate)activationDate
{
  return 0;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled = result;
  return result;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_13 = result;
  return result;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_18 = result;
  return result;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_23 = result;
  return result;
}

uint64_t __34__PLAccountingDependency_activate__block_invoke_29(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_28 = result;
  return result;
}

uint64_t __42__PLAccountingDependency_didReceiveOwner___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveOwner__classDebugEnabled = result;
  return result;
}

uint64_t __42__PLAccountingDependency_didReceiveOwner___block_invoke_36(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveOwner__classDebugEnabled_35 = result;
  return result;
}

uint64_t __42__PLAccountingDependency_didReceiveOwner___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveOwner__classDebugEnabled_38 = result;
  return result;
}

uint64_t __42__PLAccountingDependency_didReceiveOwner___block_invoke_44(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveOwner__classDebugEnabled_43 = result;
  return result;
}

uint64_t __44__PLAccountingDependency_updateWithEndDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateWithEndDate__classDebugEnabled = result;
  return result;
}

uint64_t __44__PLAccountingDependency_updateWithEndDate___block_invoke_49(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateWithEndDate__classDebugEnabled_48 = result;
  return result;
}

uint64_t __44__PLAccountingDependency_updateWithEndDate___block_invoke_55(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateWithEndDate__classDebugEnabled_54 = result;
  return result;
}

uint64_t __36__PLAccountingDependency_deactivate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  deactivate_classDebugEnabled = result;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PLAccountingDependency ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDependency range](self, "range");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(ID=%@, range=%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setID:(id)a3
{
  objc_storeStrong((id *)&self->_ID, a3);
}

- (void)setActivationDate:(id)a3
{
  objc_storeStrong((id *)&self->_activationDate, a3);
}

@end
