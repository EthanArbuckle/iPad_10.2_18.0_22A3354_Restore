@implementation PLAccountingEngine

+ (id)allDistributionIDs
{
  if (allDistributionIDs_onceToken != -1)
    dispatch_once(&allDistributionIDs_onceToken, &__block_literal_global_103);
  return (id)allDistributionIDs_allDistributionIDs;
}

- (void)addDistributionEventIntervalWithLastDistributionEventForward:(id)a3 withDistributionEventForward:(id)a4
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
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PLAccountingDistributionEventIntervalEntry *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PLAccountingDistributionEventIntervalEntry *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __112__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__defaultOnce != -1)
      dispatch_once(&addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__defaultOnce, block);
    if (addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastDistributionEventForward=%@, distributionEventForward=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addDistributionEventIntervalWithLastDistributionEventForward:withDistributionEventForward:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 908);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "distributionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "distributionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (!v17)
        goto LABEL_20;
      -[PLAccountingEngine distributionManager](self, "distributionManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "distributionID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "range");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "closeLastDistributionEventForwardWithDistributionID:withEndDate:", v19, v21);

    }
    v22 = [PLAccountingDistributionEventIntervalEntry alloc];
    objc_msgSend(v7, "distributionID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "childNodeIDToWeight");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "range");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PLAccountingDistributionEventIntervalEntry initWithDistributionID:withChildNodeIDToWeight:withStartDate:withEndDate:](v22, "initWithDistributionID:withChildNodeIDToWeight:withStartDate:withEndDate:", v23, v24, v26, v27);

    -[PLEntry setWriteToDB:](v28, "setWriteToDB:", 0);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v29 = objc_opt_class();
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __112__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward___block_invoke_345;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v29;
      if (addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__defaultOnce_343 != -1)
        dispatch_once(&addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__defaultOnce_343, v37);
      if (addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__classDebugEnabled_344)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionEventIntervalOpen=%@"), v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addDistributionEventIntervalWithLastDistributionEventForward:withDistributionEventForward:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 924);

        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    -[PLAccountingEngine distributionManager](self, "distributionManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addDistributionEvent:", v28);

  }
LABEL_20:

}

- (void)didCreateChildEnergyEstimate:(id)a3 withParentEnergyEstimate:(id)a4
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
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
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
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce != -1)
      dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce, block);
    if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childEnergyEstimate=%@, parentEnergyEstimate=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 962);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v6)
  {
    objc_msgSend(v6, "energy");
    v16 = v15;
    +[PLAccountingEngine minEnergy](PLAccountingEngine, "minEnergy");
    if (v7
      && v16 <= v17
      && (objc_msgSend(v6, "distributionRuleID"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "intValue"),
          v18,
          v19 < 1))
    {
      objc_msgSend(v6, "setWriteToDB:", 0);
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v47 = objc_opt_class();
        v56[0] = MEMORY[0x24BDAC760];
        v56[1] = 3221225472;
        v56[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_367;
        v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v56[4] = v47;
        if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_365 != -1)
          dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_365, v56);
        if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_366)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("not logging"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "lastPathComponent");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v51, v52, 977);

          PLLogCommon();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "storage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "blockingWriteEntry:withCompletionBlock:", v6, &__block_literal_global_360);

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v22 = objc_opt_class();
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_2;
        v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v57[4] = v22;
        if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_361 != -1)
          dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_361, v57);
        if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_362)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("logged childEnergyEstimate=%@"), v6);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 970);

          PLLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }
      if (!v7)
      {
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v38 = objc_opt_class();
          v55[0] = MEMORY[0x24BDAC760];
          v55[1] = 3221225472;
          v55[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_372;
          v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v55[4] = v38;
          if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_370 != -1)
            dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_370, v55);
          if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_371)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("root node energy estimate"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "lastPathComponent");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 982);

            PLLogCommon();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingEngine correctionManager](self, "correctionManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "entryDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addRootEnergyEstimate:withNow:", v6, v37);
        goto LABEL_36;
      }
    }
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v29 = objc_opt_class();
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_377;
      v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v54[4] = v29;
      if (didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_375 != -1)
        dispatch_once(&didCreateChildEnergyEstimate_withParentEnergyEstimate__defaultOnce_375, v54);
      if (didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_376)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("not a root node energy estimate"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 988);

        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    -[PLAccountingEngine correctionManager](self, "correctionManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "correctChildEnergyEstimate:withParentEnergyEstimate:withNow:", v6, v7, v37);
LABEL_36:

    -[PLAccountingEngine distributionManager](self, "distributionManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addEnergyEstimate:withNow:", v6, v46);

  }
}

- (PLAccountingDistributionManager)distributionManager
{
  PLAccountingDistributionManager *distributionManager;
  PLAccountingDistributionManager *v4;
  PLAccountingDistributionManager *v5;

  distributionManager = self->_distributionManager;
  if (!distributionManager)
  {
    v4 = objc_alloc_init(PLAccountingDistributionManager);
    v5 = self->_distributionManager;
    self->_distributionManager = v4;

    -[PLAccountingDistributionManager setDelegate:](self->_distributionManager, "setDelegate:", self);
    distributionManager = self->_distributionManager;
  }
  return distributionManager;
}

+ (double)minEnergy
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__PLAccountingEngine_minEnergy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (minEnergy_onceToken != -1)
    dispatch_once(&minEnergy_onceToken, block);
  return *(double *)&minEnergy_minEnergy;
}

- (PLAccountingCorrectionManager)correctionManager
{
  PLAccountingCorrectionManager *correctionManager;
  PLAccountingCorrectionManager *v4;
  PLAccountingCorrectionManager *v5;

  correctionManager = self->_correctionManager;
  if (!correctionManager)
  {
    v4 = objc_alloc_init(PLAccountingCorrectionManager);
    v5 = self->_correctionManager;
    self->_correctionManager = v4;

    -[PLAccountingCorrectionManager setDelegate:](self->_correctionManager, "setDelegate:", self);
    correctionManager = self->_correctionManager;
  }
  return correctionManager;
}

- (void)didDistributeEnergyEstimate:(id)a3
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
  char v14;
  void *v15;
  void *v16;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __50__PLAccountingEngine_didDistributeEnergyEstimate___block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v5;
    if (didDistributeEnergyEstimate__defaultOnce_0 != -1)
      dispatch_once(&didDistributeEnergyEstimate__defaultOnce_0, &block);
    if (didDistributeEnergyEstimate__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energyEstimate=%@"), v4, block, v18, v19, v20, v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine didDistributeEnergyEstimate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1001);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v4)
  {
    objc_msgSend(v4, "correctionDate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(v4, "isRootNodeEnergyAggregated");

      if ((v14 & 1) == 0)
      {
        -[PLAccountingEngine createAggregateRootNodeEnergyEntryWithEnergyEstimate:](self, "createAggregateRootNodeEnergyEntryWithEnergyEstimate:", v4);
        -[PLAccountingEngine qualificationManager](self, "qualificationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "distributionDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEnergyEstimate:withNow:", v4, v16);

      }
    }
  }

}

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
  if ((objc_msgSend(v4, "storageLocked") & 1) != 0)
  {

    return 0;
  }
  v5 = objc_msgSend(MEMORY[0x24BE74FF8], "isPowerlogHelperd");

  if ((v5 & 1) != 0)
    return 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__PLAccountingEngine_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

- (void)createEventWithEvent:(id)a3 withActionBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, id, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
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
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  void *v60;
  uint64_t v61;
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD block[6];

  v5 = a3;
  v6 = (void (**)(id, void *, id, void *))a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (createEventWithEvent_withActionBlock__defaultOnce != -1)
      dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce, block);
    if (createEventWithEvent_withActionBlock__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("event=%@"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createEventWithEvent:withActionBlock:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 863);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v5 && v6)
  {
    v14 = 0x24BE75000uLL;
    objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "entryKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subEntryKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastEntryForKey:withSubEntryKey:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v20 = objc_opt_class();
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_314;
      v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v65[4] = v20;
      if (createEventWithEvent_withActionBlock__defaultOnce_312 != -1)
        dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_312, v65);
      if (createEventWithEvent_withActionBlock__classDebugEnabled_313)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastEvent=%@"), v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createEventWithEvent:withActionBlock:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 869);

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v14 = 0x24BE75000;
      }
    }
    objc_msgSend(v5, "rangeSinceEvent:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v28 = objc_opt_class();
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_319;
      v64[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v64[4] = v28;
      if (createEventWithEvent_withActionBlock__defaultOnce_317 != -1)
        dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_317, v64);
      if (createEventWithEvent_withActionBlock__classDebugEnabled_318)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sinceRange=%@"), v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createEventWithEvent:withActionBlock:]");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 873);

        PLLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v14 = 0x24BE75000uLL;
      }
    }
    if (v19)
    {
      if (!v27 || (objc_msgSend(v27, "length"), v35 == 0.0))
      {
        objc_msgSend(v19, "mergeWithEvent:", v5);
        if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
          goto LABEL_51;
        v36 = objc_opt_class();
        v63[0] = MEMORY[0x24BDAC760];
        v63[1] = 3221225472;
        v63[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_324;
        v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v63[4] = v36;
        if (createEventWithEvent_withActionBlock__defaultOnce_322 != -1)
          dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_322, v63);
        if (!createEventWithEvent_withActionBlock__classDebugEnabled_323)
          goto LABEL_51;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("combined for too short sinceRange, now lastEvent=%@"), v19);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lastPathComponent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createEventWithEvent:withActionBlock:]");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v40, v41, 878);

        PLLogCommon();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();
LABEL_33:

LABEL_51:
        goto LABEL_52;
      }
      if ((objc_msgSend(v19, "used") & 1) == 0
        && objc_msgSend(v19, "canMergeWithEvent:", v5)
        && objc_msgSend(v19, "isEqualContentsWithEvent:", v5))
      {
        objc_msgSend(v19, "mergeWithEvent:", v5);
        if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
          goto LABEL_51;
        v43 = objc_opt_class();
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_329;
        v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v62[4] = v43;
        if (createEventWithEvent_withActionBlock__defaultOnce_327 != -1)
          dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_327, v62);
        if (!createEventWithEvent_withActionBlock__classDebugEnabled_328)
          goto LABEL_51;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("combined for equal contents, now lastEvent=%@"), v19);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "lastPathComponent");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createEventWithEvent:withActionBlock:]");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v46, v47, 883);

        PLLogCommon();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();
        goto LABEL_33;
      }
    }
    objc_msgSend(*(id *)(v14 + 8), "sharedCore");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "storage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "blockingWriteEntry:withCompletionBlock:", v5, &__block_literal_global_333);

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v50 = objc_opt_class();
      v57 = MEMORY[0x24BDAC760];
      v58 = 3221225472;
      v59 = __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_2;
      v60 = &__block_descriptor_40_e5_v8__0lu32l8;
      v61 = v50;
      if (createEventWithEvent_withActionBlock__defaultOnce_334 != -1)
        dispatch_once(&createEventWithEvent_withActionBlock__defaultOnce_334, &v57);
      if (createEventWithEvent_withActionBlock__classDebugEnabled_335)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("logged new event=%@"), v5, v57, v58, v59, v60, v61);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "lastPathComponent");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createEventWithEvent:withActionBlock:]");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v54, v55, 889);

        PLLogCommon();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    v6[2](v6, v19, v5, v27);
    goto LABEL_51;
  }
LABEL_52:

}

+ (id)allQualificationIDs
{
  if (allQualificationIDs_onceToken != -1)
    dispatch_once(&allQualificationIDs_onceToken, &__block_literal_global_217);
  return (id)allQualificationIDs_allQualificationIDs;
}

- (void)createQualificationEventForwardWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke;
  v13[3] = &unk_24DCF9DE8;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

+ (double)minDistributionEnergy
{
  if (minDistributionEnergy_onceToken != -1)
    dispatch_once(&minDistributionEnergy_onceToken, &__block_literal_global_1);
  return *(double *)&minDistributionEnergy_minDistributionEnergy;
}

void __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingDistributionEventPointEntry *v11;
  void *v12;
  PLAccountingDistributionEventPointEntry *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_12_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_12_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_12_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionID=%i, childNodeNameToWeight=%@, startDate=%@"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 692);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingDistributionEventPointEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeNameToWeight:withRange:](v11, "initWithDistributionID:withChildNodeNameToWeight:withRange:", v12, *(_QWORD *)(a1 + 40), v10);

  v14 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_291;
  v15[3] = &unk_24DCF9CF8;
  v15[4] = v14;
  objc_msgSend(v14, "createEventWithEvent:withActionBlock:", v13, v15);

}

void __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingDistributionEventBackwardEntry *v11;
  void *v12;
  PLAccountingDistributionEventBackwardEntry *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_10_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_10_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_10_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionID=%i, childNodeNameToWeight=%@, endDate=%@"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 641);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", 0, *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingDistributionEventBackwardEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeNameToWeight:withRange:](v11, "initWithDistributionID:withChildNodeNameToWeight:withRange:", v12, *(_QWORD *)(a1 + 40), v10);

  v14 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke_287;
  v15[3] = &unk_24DCF9CF8;
  v15[4] = v14;
  objc_msgSend(v14, "createEventWithEvent:withActionBlock:", v13, v15);

}

void __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingPowerEventBackwardEntry *v11;
  void *v12;
  PLAccountingPowerEventBackwardEntry *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootNodeID=%i, power=%f, endDate=%@"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createPowerEventBackwardWithRootNodeID:withPower:withEndDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 461);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", 0, *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingPowerEventBackwardEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLAccountingPowerEventEntry initWithRootNodeID:withPower:withRange:](v11, "initWithRootNodeID:withPower:withRange:", v12, v10, *(double *)(a1 + 48));

  v14 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_264;
  v15[3] = &unk_24DCF9CF8;
  v15[4] = v14;
  objc_msgSend(v14, "createEventWithEvent:withActionBlock:", v13, v15);

}

void __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingPowerEventForwardEntry *v11;
  void *v12;
  PLAccountingPowerEventForwardEntry *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootNodeID=%i, power=%f, startDate=%@"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createPowerEventForwardWithRootNodeID:withPower:withStartDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 412);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", *(_QWORD *)(a1 + 40), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingPowerEventForwardEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLAccountingPowerEventEntry initWithRootNodeID:withPower:withRange:](v11, "initWithRootNodeID:withPower:withRange:", v12, v10, *(double *)(a1 + 48));

  v14 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_251;
  v15[3] = &unk_24DCF9CF8;
  v15[4] = v14;
  objc_msgSend(v14, "createEventWithEvent:withActionBlock:", v13, v15);

}

void __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingPowerEventIntervalEntry *v11;
  void *v12;
  PLAccountingPowerEventIntervalEntry *v13;
  void *v14;
  _QWORD v15[5];
  int v16;
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_6_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_6_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_6_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootNodeID=%i, power=%f, startDate=%@, endDate=%@"), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 503);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingPowerEventIntervalEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLAccountingPowerEventEntry initWithRootNodeID:withPower:withRange:](v11, "initWithRootNodeID:withPower:withRange:", v12, v10, *(double *)(a1 + 56));

  v14 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_271;
  v15[3] = &unk_24DCF9D48;
  v16 = *(_DWORD *)(a1 + 64);
  v15[4] = v14;
  objc_msgSend(v14, "createEventWithEvent:withActionBlock:", v13, v15);

}

+ (id)deviceRootNodeIDs
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__PLAccountingEngine_deviceRootNodeIDs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceRootNodeIDs_onceToken != -1)
    dispatch_once(&deviceRootNodeIDs_onceToken, block);
  return (id)deviceRootNodeIDs_deviceRootNodeIDs;
}

void __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingDistributionEventForwardEntry *v11;
  void *v12;
  PLAccountingDistributionEventForwardEntry *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_9_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_9_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_9_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionID=%i, childNodeNameToWeight=%@, startDate=%@"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 615);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", *(_QWORD *)(a1 + 48), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingDistributionEventForwardEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeNameToWeight:withRange:](v11, "initWithDistributionID:withChildNodeNameToWeight:withRange:", v12, *(_QWORD *)(a1 + 40), v10);

  v14 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_284;
  v15[3] = &unk_24DCF9CF8;
  v15[4] = v14;
  objc_msgSend(v14, "createEventWithEvent:withActionBlock:", v13, v15);

}

void __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingQualificationEventForwardEntry *v11;
  void *v12;
  void *v13;
  PLAccountingQualificationEventForwardEntry *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_14_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_14_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_14_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationID=%i, childNodeNames=%@, startDate=%@"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 769);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", *(_QWORD *)(a1 + 48), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingQualificationEventForwardEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLAccountingQualificationEventEntry initWithQualificationID:withChildNodeNames:withRange:](v11, "initWithQualificationID:withChildNodeNames:withRange:", v12, v13, v10);

  v15 = *(void **)(a1 + 32);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke_302;
  v16[3] = &unk_24DCF9CF8;
  v16[4] = v15;
  objc_msgSend(v15, "createEventWithEvent:withActionBlock:", v14, v16);

}

- (void)didCorrectEnergyEstimate:(id)a3
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
  char v14;
  void *v15;
  void *v16;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __47__PLAccountingEngine_didCorrectEnergyEstimate___block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v5;
    if (didCorrectEnergyEstimate__defaultOnce != -1)
      dispatch_once(&didCorrectEnergyEstimate__defaultOnce, &block);
    if (didCorrectEnergyEstimate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energyEstimate=%@"), v4, block, v18, v19, v20, v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine didCorrectEnergyEstimate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1015);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v4)
  {
    objc_msgSend(v4, "distributionDate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(v4, "isRootNodeEnergyAggregated");

      if ((v14 & 1) == 0)
      {
        -[PLAccountingEngine createAggregateRootNodeEnergyEntryWithEnergyEstimate:](self, "createAggregateRootNodeEnergyEntryWithEnergyEstimate:", v4);
        -[PLAccountingEngine qualificationManager](self, "qualificationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "correctionDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEnergyEstimate:withNow:", v4, v16);

      }
    }
  }

}

- (void)didQualifyEnergyEvent:(id)a3 withRootNodeID:(id)a4 withQualificationID:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  _QWORD block[5];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__PLAccountingEngine_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce_0 != -1)
      dispatch_once(&didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce_0, block);
    if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEnergyEvent=%@, rootNodeID=%@, qualificationID=%@"), v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine didQualifyEnergyEvent:withRootNodeID:withQualificationID:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1084);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v7)
  {
    if ((int)objc_msgSend(v8, "intValue") >= 1 && (int)objc_msgSend(v9, "intValue") >= 1)
    {
      objc_msgSend(v7, "energy");
      v18 = v17;
      +[PLAccountingEngine minEnergy](PLAccountingEngine, "minEnergy");
      if (v18 >= v19)
      {
        objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75200], *MEMORY[0x24BE75018]);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc(MEMORY[0x24BE74FB8]);
        objc_msgSend(v7, "range");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "startDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)v20;
        v24 = (void *)objc_msgSend(v21, "initWithEntryKey:withDate:", v20, v23);

        objc_msgSend(v7, "nodeID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BE75028]);

        objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75038]);
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75030]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", llround(v18 * 1000.0));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BE75020]);

        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v27 = objc_opt_class();
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __79__PLAccountingEngine_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke_403;
          v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v41[4] = v27;
          if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce_401 != -1)
            dispatch_once(&didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce_401, v41);
          if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled_402)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("aggregateQualificationEnergyEntry=%@"), v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lastPathComponent");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine didQualifyEnergyEvent:withRootNodeID:withQualificationID:]");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 1100);

            PLLogCommon();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "storage");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "range");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "startDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "range");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "endDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "writeProportionateAggregateEntry:withStartDate:withEndDate:", v24, v37, v39);

      }
    }
  }

}

- (void)createAggregateRootNodeEnergyEntryWithEnergyEstimate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  uint64_t v51;
  _QWORD v52[5];
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce != -1)
      dispatch_once(&createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce, block);
    if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energyEstimate=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createAggregateRootNodeEnergyEntryWithEnergyEstimate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1384);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  objc_msgSend(v4, "terminationRatio");
  v13 = v12;
  objc_msgSend(v4, "energy");
  v15 = v14;
  objc_msgSend(v4, "correctionEnergy");
  v17 = v13 * (v15 + v16);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v18 = objc_opt_class();
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke_496;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v18;
    if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce_494 != -1)
      dispatch_once(&createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce_494, v52);
    if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled_495)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("totalTerminalEnergy=%f"), *(_QWORD *)&v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createAggregateRootNodeEnergyEntryWithEnergyEstimate:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 1387);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingEngine minEnergy](PLAccountingEngine, "minEnergy");
  if (v17 >= v25
    && ((objc_msgSend(MEMORY[0x24BE74FF8], "gasGaugeEnabled") & 1) != 0
     || !-[PLAccountingEngine pluggedIn](self, "pluggedIn")))
  {
    objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75200], *MEMORY[0x24BE75040]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc(MEMORY[0x24BE74FB8]);
    objc_msgSend(v4, "range");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "startDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v27, "initWithEntryKey:withDate:", v26, v29);

    objc_msgSend(v4, "nodeID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, *MEMORY[0x24BE75050]);

    objc_msgSend(v4, "rootNodeID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BE75058]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", llround(v17 * 1000.0));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BE75048]);

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v34 = objc_opt_class();
      v47 = MEMORY[0x24BDAC760];
      v48 = 3221225472;
      v49 = __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke_501;
      v50 = &__block_descriptor_40_e5_v8__0lu32l8;
      v51 = v34;
      if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce_499 != -1)
        dispatch_once(&createAggregateRootNodeEnergyEntryWithEnergyEstimate__defaultOnce_499, &v47);
      if (createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled_500)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("aggregateRootNodeEnergyEntry=%@"), v30, v47, v48, v49, v50, v51);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lastPathComponent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createAggregateRootNodeEnergyEntryWithEnergyEstimate:]");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 1399);

        PLLogCommon();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "storage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "range");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "startDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "range");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "endDate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "writeProportionateAggregateEntry:withStartDate:withEndDate:", v30, v44, v46);

    objc_msgSend(v4, "setIsRootNodeEnergyAggregated:", 1);
  }

}

- (void)addDistributionEventIntervalWithLastDistributionEventBackward:(id)a3 withDistributionEventBackward:(id)a4
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
  int v17;
  PLAccountingDistributionEventIntervalEntry *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PLAccountingDistributionEventIntervalEntry *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __114__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__defaultOnce != -1)
      dispatch_once(&addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__defaultOnce, block);
    if (addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastDistributionEventBackward=%@, distributionEventBackward=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addDistributionEventIntervalWithLastDistributionEventBackward:withDistributionEventBackward:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 932);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v6, "distributionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "distributionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (v17)
      {
        v18 = [PLAccountingDistributionEventIntervalEntry alloc];
        objc_msgSend(v7, "distributionID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "childNodeIDToWeight");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "range");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "endDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "range");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "endDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[PLAccountingDistributionEventIntervalEntry initWithDistributionID:withChildNodeIDToWeight:withStartDate:withEndDate:](v18, "initWithDistributionID:withChildNodeIDToWeight:withStartDate:withEndDate:", v19, v20, v22, v24);

        -[PLEntry setWriteToDB:](v25, "setWriteToDB:", 0);
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v26 = objc_opt_class();
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __114__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward___block_invoke_352;
          v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v34[4] = v26;
          if (addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__defaultOnce_350 != -1)
            dispatch_once(&addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__defaultOnce_350, v34);
          if (addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__classDebugEnabled_351)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionEventInterval=%@"), v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lastPathComponent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addDistributionEventIntervalWithLastDistributionEventBackward:withDistributionEventBackward:]");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 941);

            PLLogCommon();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingEngine distributionManager](self, "distributionManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addDistributionEvent:", v25);

      }
    }
  }

}

- (void)addQualificationEventIntervalWithLastQualificationEventForward:(id)a3 withQualificationEventForward:(id)a4
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
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PLAccountingQualificationEventIntervalEntry *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PLAccountingQualificationEventIntervalEntry *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __115__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__defaultOnce != -1)
      dispatch_once(&addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__defaultOnce, block);
    if (addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastQualificationEventForward=%@, qualificationEventForward=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addQualificationEventIntervalWithLastQualificationEventForward:withQualificationEventForward:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 1029);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "qualificationID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "qualificationID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (!v17)
        goto LABEL_20;
      -[PLAccountingEngine qualificationManager](self, "qualificationManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "qualificationID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "range");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "closeLastQualificationEventForwardWithQualificationID:withEndDate:", v19, v21);

    }
    v22 = [PLAccountingQualificationEventIntervalEntry alloc];
    objc_msgSend(v7, "qualificationID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "childNodeIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "range");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PLAccountingQualificationEventIntervalEntry initWithQualificationID:withChildNodeIDs:withStartDate:withEndDate:](v22, "initWithQualificationID:withChildNodeIDs:withStartDate:withEndDate:", v23, v24, v26, v27);

    -[PLEntry setWriteToDB:](v28, "setWriteToDB:", 0);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v29 = objc_opt_class();
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __115__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward___block_invoke_386;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v29;
      if (addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__defaultOnce_384 != -1)
        dispatch_once(&addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__defaultOnce_384, v37);
      if (addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__classDebugEnabled_385)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEventIntervalOpen=%@"), v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addQualificationEventIntervalWithLastQualificationEventForward:withQualificationEventForward:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 1045);

        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    -[PLAccountingEngine qualificationManager](self, "qualificationManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addQualificationEvent:", v28);

  }
LABEL_20:

}

- (PLAccountingQualificationManager)qualificationManager
{
  PLAccountingQualificationManager *qualificationManager;
  PLAccountingQualificationManager *v4;
  PLAccountingQualificationManager *v5;

  qualificationManager = self->_qualificationManager;
  if (!qualificationManager)
  {
    v4 = objc_alloc_init(PLAccountingQualificationManager);
    v5 = self->_qualificationManager;
    self->_qualificationManager = v4;

    -[PLAccountingQualificationManager setDelegate:](self->_qualificationManager, "setDelegate:", self);
    qualificationManager = self->_qualificationManager;
  }
  return qualificationManager;
}

- (void)createDistributionEventForwardWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke;
  v13[3] = &unk_24DCF9DE8;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)createPowerEventForwardWithRootNodeID:(int)a3 withPower:(double)a4 withStartDate:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  int v14;

  v8 = a5;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke;
  v11[3] = &unk_24DCF9D20;
  v14 = a3;
  v13 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

}

- (void)createPowerEventIntervalWithRootNodeID:(int)a3 withPower:(double)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  double v18;
  int v19;

  v10 = a5;
  v11 = a6;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke;
  block[3] = &unk_24DCF9D70;
  v19 = a3;
  v18 = a4;
  block[4] = self;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

- (void)createPowerEventBackwardWithRootNodeID:(int)a3 withPower:(double)a4 withEndDate:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  int v14;

  v8 = a5;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke;
  v11[3] = &unk_24DCF9D20;
  v14 = a3;
  v13 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

}

- (void)createDistributionEventBackwardWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withEndDate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke;
  v13[3] = &unk_24DCF9DE8;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)createDistributionEventPointWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke;
  v13[3] = &unk_24DCF9DE8;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __26__PLAccountingEngine_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "chunkWithLastChunkDate:withNow:", a2, a3);
}

- (void)chunkWithLastChunkDate:(id)a3 withNow:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  PLAccountingEnergyEstimateEventEntry *v60;
  void *v61;
  void *v62;
  PLAccountingEnergyEstimateEventEntry *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  PLAccountingEngine *v74;
  id obj;
  id v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[5];
  _QWORD v82[5];
  _QWORD block[5];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  uint8_t buf[4];
  void *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v76 = a4;
  v7 = 0x24BE74000uLL;
  v73 = v6;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    v88[0] = MEMORY[0x24BDAC760];
    v88[1] = 3221225472;
    v88[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke;
    v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v88[4] = v8;
    if (chunkWithLastChunkDate_withNow__defaultOnce != -1)
      dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce, v88);
    if (chunkWithLastChunkDate_withNow__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastChunkDate=%@, now=%@"), v6, v76);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine chunkWithLastChunkDate:withNow:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 1164);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v6 = v73;
      v7 = 0x24BE74000uLL;
    }
  }
  if (v76)
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    objc_msgSend((id)objc_opt_class(), "deviceRootNodeIDs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    if (v78)
    {
      v77 = *(_QWORD *)v85;
      v74 = self;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v85 != v77)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v15);
          if (objc_msgSend(*(id *)(v7 + 4016), "debugEnabled"))
          {
            v17 = objc_opt_class();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_421;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v17;
            if (chunkWithLastChunkDate_withNow__defaultOnce_419 != -1)
              dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_419, block);
            if (chunkWithLastChunkDate_withNow__classDebugEnabled_420)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootNodeIDNumber=%@"), v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "lastPathComponent");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine chunkWithLastChunkDate:withNow:]");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 1168);

              PLLogCommon();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v90 = v18;
                _os_log_debug_impl(&dword_21A62B000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

            }
          }
          objc_msgSend(&unk_24DD03148, "objectAtIndexedSubscript:", (int)objc_msgSend(v16, "intValue"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "intValue");

          if (v25 == 1)
          {
            objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "storage");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLAccountingPowerEventForwardEntry entryKey](PLAccountingPowerEventForwardEntry, "entryKey");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lastEntryForKey:withSubEntryKey:", v28, v16);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(*(id *)(v7 + 4016), "debugEnabled"))
            {
              v30 = objc_opt_class();
              v82[0] = MEMORY[0x24BDAC760];
              v82[1] = 3221225472;
              v82[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_430;
              v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v82[4] = v30;
              if (chunkWithLastChunkDate_withNow__defaultOnce_428 != -1)
                dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_428, v82);
              if (chunkWithLastChunkDate_withNow__classDebugEnabled_429)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastPowerEvent=%@"), v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "lastPathComponent");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine chunkWithLastChunkDate:withNow:]");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 1176);

                PLLogCommon();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v90 = v31;
                  _os_log_debug_impl(&dword_21A62B000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            if (v29)
            {
              objc_msgSend(v29, "range");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "startDate");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v38;
              if (v6)
              {
                objc_msgSend(v38, "laterDate:", v6);
                v40 = objc_claimAutoreleasedReturnValue();

                v39 = (void *)v40;
              }

              +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v39, v76);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(*(id *)(v7 + 4016), "debugEnabled"))
              {
                v42 = objc_opt_class();
                v81[0] = MEMORY[0x24BDAC760];
                v81[1] = 3221225472;
                v81[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_435;
                v81[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v81[4] = v42;
                if (chunkWithLastChunkDate_withNow__defaultOnce_433 != -1)
                  dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_433, v81);
                if (chunkWithLastChunkDate_withNow__classDebugEnabled_434)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("range=%@"), v41);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = (void *)MEMORY[0x24BE74FA8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "lastPathComponent");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine chunkWithLastChunkDate:withNow:]");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 1185);

                  PLLogCommon();
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v90 = v43;
                    _os_log_debug_impl(&dword_21A62B000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v7 = 0x24BE74000uLL;
                }
              }
              objc_msgSend(v41, "length");
              v50 = v49;
              objc_msgSend(v29, "power");
              v52 = v50 * v51 / 3600.0;
              if (objc_msgSend(*(id *)(v7 + 4016), "debugEnabled"))
              {
                v53 = objc_opt_class();
                v80[0] = MEMORY[0x24BDAC760];
                v80[1] = 3221225472;
                v80[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_438;
                v80[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v80[4] = v53;
                if (chunkWithLastChunkDate_withNow__defaultOnce_436 != -1)
                  dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_436, v80);
                if (chunkWithLastChunkDate_withNow__classDebugEnabled_437)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energy=%f"), *(_QWORD *)&v52);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = (void *)MEMORY[0x24BE74FA8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "lastPathComponent");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine chunkWithLastChunkDate:withNow:]");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v57, v58, 1188);

                  PLLogCommon();
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v90 = v54;
                    _os_log_debug_impl(&dword_21A62B000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                }
              }
              v60 = [PLAccountingEnergyEstimateEventEntry alloc];
              objc_msgSend(v29, "rootNodeID");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "rootNodeID");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = -[PLAccountingEnergyEstimateEventEntry initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:](v60, "initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:", v61, v62, 0, 0, v41, v76, v52);

              -[PLAccountingEngine didCreateChildEnergyEstimate:withParentEnergyEstimate:](v74, "didCreateChildEnergyEstimate:withParentEnergyEstimate:", v63, 0);
              v7 = 0x24BE74000uLL;
              if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
              {
                v64 = objc_opt_class();
                v79[0] = MEMORY[0x24BDAC760];
                v79[1] = 3221225472;
                v79[2] = __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_441;
                v79[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v79[4] = v64;
                if (chunkWithLastChunkDate_withNow__defaultOnce_439 != -1)
                  dispatch_once(&chunkWithLastChunkDate_withNow__defaultOnce_439, v79);
                if (chunkWithLastChunkDate_withNow__classDebugEnabled_440)
                {
                  v65 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v29, "range");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "stringWithFormat:", CFSTR("after range adjustment: lastPowerEvent.range=%@"), v66);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();

                  v68 = (void *)MEMORY[0x24BE74FA8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "lastPathComponent");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine chunkWithLastChunkDate:withNow:]");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v70, v71, 1200);

                  PLLogCommon();
                  v72 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v90 = v67;
                    _os_log_debug_impl(&dword_21A62B000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v6 = v73;
                  v7 = 0x24BE74000;
                }
              }

            }
          }
          ++v15;
        }
        while (v78 != v15);
        v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
      }
      while (v78);
    }

  }
}

- (PLAccountingEngine)init
{
  PLAccountingEngine *v2;
  uint64_t v3;
  OS_dispatch_queue *workQueue;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OS_dispatch_queue *v9;
  uint64_t v10;
  PLAccountingEngine *v11;
  id v12;
  OS_dispatch_queue *v13;
  PLAccountingEngine *v14;
  uint64_t v15;
  PLEntryNotificationOperatorComposition *batteryListener;
  _QWORD v18[4];
  PLAccountingEngine *v19;
  _QWORD v20[4];
  PLAccountingEngine *v21;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)PLAccountingEngine;
  v2 = -[PLAccountingEngine init](&v22, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE74FF8], "workQueueForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    if ((objc_msgSend((id)objc_opt_class(), "accountingDebugEnabled") & 1) == 0)
    {
      -[PLAccountingEngine reload](v2, "reload");
      objc_msgSend(MEMORY[0x24BE74F98], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74F90];
      objc_msgSend((id)objc_opt_class(), "maxPowerEventChunkInterval");
      objc_msgSend(v6, "timeCriterionWithInterval:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v2->_workQueue;
      v10 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __26__PLAccountingEngine_init__block_invoke;
      v20[3] = &unk_24DCF9B38;
      v11 = v2;
      v21 = v11;
      objc_msgSend(v5, "scheduleActivityWithIdentifier:withCriteria:withMustRunCriterion:withQueue:withInterruptBlock:withActivityBlock:", CFSTR("com.apple.powerlogd.accounting.chunking"), v8, 0, v9, 0, v20);

      if ((objc_msgSend(MEMORY[0x24BE74FF8], "gasGaugeEnabled") & 1) == 0)
      {
        v11->_pluggedIn = 0;
        v12 = objc_alloc(MEMORY[0x24BE74FC8]);
        v13 = v2->_workQueue;
        v18[0] = v10;
        v18[1] = 3221225472;
        v18[2] = __26__PLAccountingEngine_init__block_invoke_2;
        v18[3] = &unk_24DCF9B60;
        v14 = v11;
        v19 = v14;
        v15 = objc_msgSend(v12, "initWithWorkQueue:forEntryKey:withBlock:", v13, CFSTR("PLBatteryAgent_EventBackward_Battery"), v18);
        batteryListener = v14->_batteryListener;
        v14->_batteryListener = (PLEntryNotificationOperatorComposition *)v15;

      }
    }
  }
  return v2;
}

void __26__PLAccountingEngine_init__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExternalConnected"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPluggedIn:", objc_msgSend(v3, "BOOLValue"));

}

void __36__PLAccountingEngine_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  if ((objc_msgSend((id)objc_opt_class(), "accountingDebugEnabled") & 1) == 0)
  {
    v0 = objc_alloc_init((Class)objc_opt_class());
    v1 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v0;

  }
}

+ (id)debugInstance
{
  void *v3;
  void *v4;
  char v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "storageLocked") & 1) != 0)
  {

    return 0;
  }
  v5 = objc_msgSend(MEMORY[0x24BE74FF8], "isPowerlogHelperd");

  if ((v5 & 1) != 0)
    return 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__PLAccountingEngine_debugInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (debugInstance_onceToken != -1)
    dispatch_once(&debugInstance_onceToken, block);
  return (id)debugInstance_debugInstance;
}

void __35__PLAccountingEngine_debugInstance__block_invoke()
{
  id v0;
  void *v1;

  if (objc_msgSend((id)objc_opt_class(), "accountingDebugEnabled"))
  {
    v0 = objc_alloc_init((Class)objc_opt_class());
    v1 = (void *)debugInstance_debugInstance;
    debugInstance_debugInstance = (uint64_t)v0;

  }
}

+ (BOOL)accountingDebugEnabled
{
  char v2;
  _QWORD v4[4];
  __CFString *v5;
  char v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[2] = __44__PLAccountingEngine_accountingDebugEnabled__block_invoke;
  v4[3] = &unk_24DCF9BA8;
  v4[1] = 3221225472;
  v5 = CFSTR("PLAccountingDebugService_Debug");
  v6 = 0;
  if (accountingDebugEnabled_defaultOnce != -1)
    dispatch_once(&accountingDebugEnabled_defaultOnce, v4);
  v2 = accountingDebugEnabled_objectForKey;

  return v2;
}

uint64_t __44__PLAccountingEngine_accountingDebugEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  accountingDebugEnabled_objectForKey = result;
  return result;
}

- (void)reset
{
  int v3;
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
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD block[5];

  v3 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v4 = MEMORY[0x24BDAC760];
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__PLAccountingEngine_reset__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (reset_defaultOnce != -1)
      dispatch_once(&reset_defaultOnce, block);
    if (reset_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("begin"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reset]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 115);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reset]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blockingFlushCachesWithReason:", v13);

  objc_msgSend(MEMORY[0x24BE74FE8], "sharedStorageCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastEntryCachePruneToDate:", v15);

  -[PLAccountingEngine workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __27__PLAccountingEngine_reset__block_invoke_32;
  v17[3] = &unk_24DCF9BD0;
  v17[4] = self;
  dispatch_async_and_wait(v16, v17);

}

uint64_t __27__PLAccountingEngine_reset__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reset_classDebugEnabled = result;
  return result;
}

void __27__PLAccountingEngine_reset__block_invoke_32(uint64_t a1)
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setDistributionManager:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCorrectionManager:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setQualificationManager:", 0);
  v2 = (void *)objc_opt_class();
  +[PLAccountingDistributionEventForwardEntry entryKey](PLAccountingDistributionEventForwardEntry, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearWithEntryKey:", v3);

  v4 = (void *)objc_opt_class();
  +[PLAccountingDistributionEventBackwardEntry entryKey](PLAccountingDistributionEventBackwardEntry, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearWithEntryKey:", v5);

  v6 = (void *)objc_opt_class();
  +[PLAccountingDistributionEventIntervalEntry entryKey](PLAccountingDistributionEventIntervalEntry, "entryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearWithEntryKey:", v7);

  v8 = (void *)objc_opt_class();
  +[PLAccountingDistributionEventPointEntry entryKey](PLAccountingDistributionEventPointEntry, "entryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearWithEntryKey:", v9);

  v10 = (void *)objc_opt_class();
  +[PLAccountingQualificationEventForwardEntry entryKey](PLAccountingQualificationEventForwardEntry, "entryKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearWithEntryKey:", v11);

  v12 = (void *)objc_opt_class();
  +[PLAccountingQualificationEventBackwardEntry entryKey](PLAccountingQualificationEventBackwardEntry, "entryKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clearWithEntryKey:", v13);

  v14 = (void *)objc_opt_class();
  +[PLAccountingQualificationEventIntervalEntry entryKey](PLAccountingQualificationEventIntervalEntry, "entryKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clearWithEntryKey:", v15);

  v16 = (void *)objc_opt_class();
  +[PLAccountingQualificationEventPointEntry entryKey](PLAccountingQualificationEventPointEntry, "entryKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clearWithEntryKey:", v17);

  v18 = (void *)objc_opt_class();
  +[PLAccountingPowerEventForwardEntry entryKey](PLAccountingPowerEventForwardEntry, "entryKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clearWithEntryKey:", v19);

  v20 = (void *)objc_opt_class();
  +[PLAccountingPowerEventBackwardEntry entryKey](PLAccountingPowerEventBackwardEntry, "entryKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "clearWithEntryKey:", v21);

  v22 = (void *)objc_opt_class();
  +[PLAccountingPowerEventIntervalEntry entryKey](PLAccountingPowerEventIntervalEntry, "entryKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "clearWithEntryKey:", v23);

  v24 = (void *)objc_opt_class();
  +[PLAccountingEnergyEstimateEventEntry entryKey](PLAccountingEnergyEstimateEventEntry, "entryKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "clearWithEntryKey:", v25);

  v26 = (void *)objc_opt_class();
  v27 = *MEMORY[0x24BE75200];
  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75200], *MEMORY[0x24BE75040]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "clearWithEntryKey:", v28);

  v29 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", v27, *MEMORY[0x24BE75018]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "clearWithEntryKey:", v30);

  v31 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "gasGaugeEntryKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "clearWithEntryKey:", v32);

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v33 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__PLAccountingEngine_reset__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v33;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("done"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reset]_block_invoke");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 154);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
}

uint64_t __27__PLAccountingEngine_reset__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __31__PLAccountingEngine_minEnergy__block_invoke()
{
  uint64_t result;
  double v1;

  result = objc_msgSend((id)objc_opt_class(), "accountingDebugEnabled");
  v1 = 0.001;
  if ((_DWORD)result)
    v1 = 1.0e-10;
  minEnergy_minEnergy = *(_QWORD *)&v1;
  return result;
}

uint64_t __43__PLAccountingEngine_minDistributionEnergy__block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", CFSTR("PLAccountingEngine_minDistributionEnergy"), 0.01);
  minDistributionEnergy_minDistributionEnergy = v1;
  return result;
}

+ (double)maxPowerEventChunkInterval
{
  if (maxPowerEventChunkInterval_onceToken != -1)
    dispatch_once(&maxPowerEventChunkInterval_onceToken, &__block_literal_global_50);
  return *(double *)&maxPowerEventChunkInterval_maxPowerEventChunkInterval;
}

uint64_t __48__PLAccountingEngine_maxPowerEventChunkInterval__block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", CFSTR("PLAccountingEngine_maxPowerEventChunkInterval"), 300.0);
  maxPowerEventChunkInterval_maxPowerEventChunkInterval = v1;
  return result;
}

void __39__PLAccountingEngine_deviceRootNodeIDs__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deviceRootNodeIDs_deviceRootNodeIDs;
  deviceRootNodeIDs_deviceRootNodeIDs = v0;

  v2 = 2;
  do
  {
    objc_msgSend((id)objc_opt_class(), "allSoCRootNodeIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "containsObject:", v4) & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "deviceSoCRootNodeIDs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "containsObject:", v6);

      if (!v7)
        goto LABEL_16;
    }
    else
    {

    }
    objc_msgSend((id)objc_opt_class(), "allBBRootNodeIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "containsObject:", v9) & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "deviceBBRootNodeIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11);

      if (!v12)
        goto LABEL_16;
    }
    else
    {

    }
    if ((_DWORD)v2 == 58)
    {
      if (!objc_msgSend(MEMORY[0x24BE74FD8], "isiPhone"))
        goto LABEL_16;
LABEL_15:
      v13 = (void *)deviceRootNodeIDs_deviceRootNodeIDs;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      goto LABEL_16;
    }
    if ((_DWORD)v2 != 56 || (objc_msgSend(MEMORY[0x24BE74FD8], "hasCapability:", 5) & 1) != 0)
      goto LABEL_15;
LABEL_16:
    v2 = (v2 + 1);
  }
  while ((_DWORD)v2 != 63);
}

+ (id)allSoCRootNodeIDs
{
  if (allSoCRootNodeIDs_onceToken != -1)
    dispatch_once(&allSoCRootNodeIDs_onceToken, &__block_literal_global_56);
  return (id)allSoCRootNodeIDs_allSoCRootNodeIDs;
}

void __39__PLAccountingEngine_allSoCRootNodeIDs__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DD030E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allSoCRootNodeIDs_allSoCRootNodeIDs;
  allSoCRootNodeIDs_allSoCRootNodeIDs = v0;

}

+ (id)deviceSoCRootNodeIDs
{
  if (deviceSoCRootNodeIDs_onceToken != -1)
    dispatch_once(&deviceSoCRootNodeIDs_onceToken, &__block_literal_global_69);
  return (id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs;
}

uint64_t __42__PLAccountingEngine_deviceSoCRootNodeIDs__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;
  void *v3;
  unsigned int v4;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs;
  deviceSoCRootNodeIDs_deviceSoCRootNodeIDs = v0;

  objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", &unk_24DD015A0);
  objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", &unk_24DD01630);
  result = objc_msgSend(MEMORY[0x24BE74FD8], "kPLSoCClassOfDevice");
  if ((result - 1001001) >= 2)
  {
    v4 = result;
    if ((int)result <= 1001002)
      return result;
    objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", &unk_24DD015D0);
    objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", &unk_24DD015E8);
    objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", &unk_24DD01600);
    objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", &unk_24DD01618);
    objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "removeObject:", &unk_24DD01630);
    objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", &unk_24DD01648);
    result = objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", &unk_24DD01660);
    if (v4 <= 0xF4637)
    {
      if (v4 <= 0xF462B)
        return result;
    }
    else
    {
      objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", &unk_24DD01678);
    }
    v3 = &unk_24DD01690;
  }
  else
  {
    v3 = &unk_24DD01618;
  }
  return objc_msgSend((id)deviceSoCRootNodeIDs_deviceSoCRootNodeIDs, "addObject:", v3);
}

+ (id)allBBRootNodeIDs
{
  if (allBBRootNodeIDs_onceToken != -1)
    dispatch_once(&allBBRootNodeIDs_onceToken, &__block_literal_global_70);
  return (id)allBBRootNodeIDs_allBBRootNodeIDs;
}

void __38__PLAccountingEngine_allBBRootNodeIDs__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DD03100);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allBBRootNodeIDs_allBBRootNodeIDs;
  allBBRootNodeIDs_allBBRootNodeIDs = v0;

}

+ (id)deviceBBRootNodeIDs
{
  if (deviceBBRootNodeIDs_onceToken != -1)
    dispatch_once(&deviceBBRootNodeIDs_onceToken, &__block_literal_global_102);
  return (id)deviceBBRootNodeIDs_deviceBBRootNodeIDs;
}

uint64_t __41__PLAccountingEngine_deviceBBRootNodeIDs__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deviceBBRootNodeIDs_deviceBBRootNodeIDs;
  deviceBBRootNodeIDs_deviceBBRootNodeIDs = v0;

  if ((objc_msgSend(MEMORY[0x24BE74FD8], "kPLBasebandClassIsOneOf:", 1003003, 1003004, 1003005, 1003007, 1003006, 1003008, 1003010, 1003011, 1003012, 1003013, 1003014, 1003015, 1003016, 1003017, 0) & 1) != 0)
  {
    v2 = &unk_24DD01840;
    v3 = &unk_24DD01918;
    v4 = &unk_24DD01828;
LABEL_6:
    objc_msgSend((id)deviceBBRootNodeIDs_deviceBBRootNodeIDs, "addObject:", v4);
    objc_msgSend((id)deviceBBRootNodeIDs_deviceBBRootNodeIDs, "addObject:", v3);
    return objc_msgSend((id)deviceBBRootNodeIDs_deviceBBRootNodeIDs, "addObject:", v2);
  }
  if ((objc_msgSend(MEMORY[0x24BE74FD8], "isBasebandClass:", 1003002) & 1) != 0
    || (result = objc_msgSend(MEMORY[0x24BE74FD8], "isBasebandClass:", 1003001), (_DWORD)result))
  {
    objc_msgSend((id)deviceBBRootNodeIDs_deviceBBRootNodeIDs, "addObject:", &unk_24DD016C0);
    v2 = &unk_24DD01900;
    v3 = &unk_24DD018E8;
    v4 = &unk_24DD016A8;
    goto LABEL_6;
  }
  return result;
}

void __40__PLAccountingEngine_allDistributionIDs__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allDistributionIDs_allDistributionIDs;
  allDistributionIDs_allDistributionIDs = v0;

  v2 = 1;
  do
  {
    v3 = (void *)allDistributionIDs_allDistributionIDs;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    v2 = (v2 + 1);
  }
  while ((_DWORD)v2 != 55);
}

+ (id)distributionIDForDistributionName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__PLAccountingEngine_distributionIDForDistributionName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = distributionIDForDistributionName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&distributionIDForDistributionName__onceToken, block);
  objc_msgSend((id)distributionIDForDistributionName__distributionNameToDistributionID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __56__PLAccountingEngine_distributionIDForDistributionName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)distributionIDForDistributionName__distributionNameToDistributionID;
  distributionIDForDistributionName__distributionNameToDistributionID = v2;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allDistributionIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = (void *)distributionIDForDistributionName__distributionNameToDistributionID;
        objc_msgSend(&unk_24DD03118, "objectAtIndexedSubscript:", (int)objc_msgSend(v9, "intValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __41__PLAccountingEngine_allQualificationIDs__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allQualificationIDs_allQualificationIDs;
  allQualificationIDs_allQualificationIDs = v0;

  v2 = 1;
  do
  {
    v3 = (void *)allQualificationIDs_allQualificationIDs;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    v2 = (v2 + 1);
  }
  while ((_DWORD)v2 != 18);
}

+ (id)qualificationIDForQualificationName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__PLAccountingEngine_qualificationIDForQualificationName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = qualificationIDForQualificationName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qualificationIDForQualificationName__onceToken, block);
  objc_msgSend((id)qualificationIDForQualificationName__qualificationNameToQualificationID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __58__PLAccountingEngine_qualificationIDForQualificationName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qualificationIDForQualificationName__qualificationNameToQualificationID;
  qualificationIDForQualificationName__qualificationNameToQualificationID = v2;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allQualificationIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = (void *)qualificationIDForQualificationName__qualificationNameToQualificationID;
        objc_msgSend(&unk_24DD03130, "objectAtIndexedSubscript:", (int)objc_msgSend(v9, "intValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

uint64_t __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled = result;
  return result;
}

void __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_251(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  double v27;
  PLAccountingEnergyEstimateEventEntry *v28;
  void *v29;
  void *v30;
  PLAccountingEnergyEstimateEventEntry *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  _QWORD v40[5];
  _QWORD block[5];

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
    objc_msgSend(MEMORY[0x24BE74F98], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastCompletedDateWithIdentifier:", CFSTR("com.apple.powerlogd.accounting.chunking"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "range");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "laterDate:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v15;
    }
    objc_msgSend(v7, "length");
    v17 = v16;
    objc_msgSend(v8, "power");
    v19 = v17 * v18 / 3600.0;
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v20 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_2_252;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v20;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce, block);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energy=%f"), *(_QWORD *)&v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createPowerEventForwardWithRootNodeID:withPower:withStartDate:]_block_invoke");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 433);

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    +[PLAccountingEngine minDistributionEnergy](PLAccountingEngine, "minDistributionEnergy");
    if (v19 >= v27)
    {
      v28 = [PLAccountingEnergyEstimateEventEntry alloc];
      objc_msgSend(v8, "rootNodeID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rootNodeID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[PLAccountingEnergyEstimateEventEntry initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:](v28, "initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:", v29, v30, 0, 0, v7, 0, v19);

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v32 = objc_opt_class();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_258;
        v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v40[4] = v32;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_256 != -1)
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_256, v40);
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_257)
        {
          v39 = a1;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootEnergyEstimate=%@"), v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "lastPathComponent");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createPowerEventForwardWithRootNodeID:withPower:withStartDate:]_block_invoke_2");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 448);

          PLLogCommon();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

          a1 = v39;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "didCreateChildEnergyEstimate:withParentEnergyEstimate:", v31, 0);

    }
  }

}

uint64_t __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_2_252(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled = result;
  return result;
}

uint64_t __84__PLAccountingEngine_createPowerEventForwardWithRootNodeID_withPower_withStartDate___block_invoke_258(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_257 = result;
  return result;
}

uint64_t __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled = result;
  return result;
}

void __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_264(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  PLAccountingEnergyEstimateEventEntry *v22;
  void *v23;
  void *v24;
  PLAccountingEnergyEstimateEventEntry *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _QWORD v33[5];
  _QWORD block[5];

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = v7;
    objc_msgSend(v8, "length");
    v11 = v10;
    objc_msgSend(v9, "power");
    v13 = v11 * v12 / 3600.0;
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_2_265;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v14;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce, block);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energy=%f"), *(_QWORD *)&v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createPowerEventBackwardWithRootNodeID:withPower:withEndDate:]_block_invoke");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 475);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    +[PLAccountingEngine minDistributionEnergy](PLAccountingEngine, "minDistributionEnergy");
    if (v13 >= v21)
    {
      v22 = [PLAccountingEnergyEstimateEventEntry alloc];
      objc_msgSend(v9, "rootNodeID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rootNodeID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PLAccountingEnergyEstimateEventEntry initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:](v22, "initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:", v23, v24, 0, 0, v8, 0, v13);

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v26 = objc_opt_class();
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_268;
        v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v33[4] = v26;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_266 != -1)
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_266, v33);
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_267)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootEnergyEstimate=%@"), v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "lastPathComponent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createPowerEventBackwardWithRootNodeID:withPower:withEndDate:]_block_invoke_2");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 489);

          PLLogCommon();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "didCreateChildEnergyEstimate:withParentEnergyEstimate:", v25, 0);

    }
  }

}

uint64_t __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_2_265(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled = result;
  return result;
}

uint64_t __83__PLAccountingEngine_createPowerEventBackwardWithRootNodeID_withPower_withEndDate___block_invoke_268(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_267 = result;
  return result;
}

uint64_t __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_6_classDebugEnabled = result;
  return result;
}

void __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_271(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  double v22;
  PLAccountingEnergyEstimateEventEntry *v23;
  void *v24;
  void *v25;
  void *v26;
  PLAccountingEnergyEstimateEventEntry *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _QWORD v35[5];
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_DWORD *)(a1 + 40) == 54)
    v8 = v5;
  else
    v8 = v6;
  v9 = v8;
  objc_msgSend(v9, "range");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "length");
  v12 = v11;
  objc_msgSend(v9, "power");
  v14 = v12 * v13 / 3600.0;

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v15 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_2_272;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v15;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_7_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_7_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_7_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energy=%f"), *(_QWORD *)&v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:]_block_invoke");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 522);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingEngine minDistributionEnergy](PLAccountingEngine, "minDistributionEnergy");
  if (v14 >= v22)
  {
    v23 = [PLAccountingEnergyEstimateEventEntry alloc];
    objc_msgSend(v9, "rootNodeID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rootNodeID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "range");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[PLAccountingEnergyEstimateEventEntry initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:](v23, "initWithNodeID:withRootNodeID:withParentEntryID:withNumAncestors:withEnergy:withRange:withEntryDate:", v24, v25, 0, 0, v26, 0, v14);

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v28 = objc_opt_class();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_275;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v28;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_7_defaultOnce_273 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_7_defaultOnce_273, v35);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_7_classDebugEnabled_274)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootEnergyEstimate=%@"), v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:]_block_invoke_2");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 536);

        PLLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "didCreateChildEnergyEstimate:withParentEnergyEstimate:", v27, 0);

  }
}

uint64_t __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_2_272(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_7_classDebugEnabled = result;
  return result;
}

uint64_t __97__PLAccountingEngine_createPowerEventIntervalWithRootNodeID_withPower_withStartDate_withEndDate___block_invoke_275(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_7_classDebugEnabled_274 = result;
  return result;
}

- (void)addPowerMeasurementEventIntervalWithPower:(double)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PLAccountingEngine *v16;
  double v17;

  v8 = a4;
  v9 = a5;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke;
  v13[3] = &unk_24DCF9D98;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v17 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[5];

  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_8_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_8_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_8_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("range=%@"), v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 551);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v2)
  {
    v10 = *(double *)(a1 + 56);
    objc_msgSend(v2, "length");
    v12 = v10 * v11 / 3600.0;
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v13 = objc_opt_class();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke_280;
      v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v20[4] = v13;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_8_defaultOnce_278 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_8_defaultOnce_278, v20);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_8_classDebugEnabled_279)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energy=%f"), *(_QWORD *)&v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:]_block_invoke_2");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 555);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    objc_msgSend(*(id *)(a1 + 48), "addEnergyMeasurementWithRootNodeID:withEnergy:withRange:", 1, v2, v12);
  }

}

uint64_t __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_8_classDebugEnabled = result;
  return result;
}

uint64_t __90__PLAccountingEngine_addPowerMeasurementEventIntervalWithPower_withStartDate_withEndDate___block_invoke_280(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_8_classDebugEnabled_279 = result;
  return result;
}

- (void)createDistributionEventForwardWithDistributionID:(int)a3 withAddingChildNodeName:(id)a4 withStartDate:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __109__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withAddingChildNodeName_withStartDate___block_invoke;
  v16[3] = &unk_24DCF9DC0;
  v16[4] = &v18;
  v17 = v6;
  dispatch_async_and_wait(v10, v16);

  v11 = (void *)v19[5];
  if (v11)
  {
    objc_msgSend(v11, "childNodeNameToWeight");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1B8];
  }
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_24DD031D8, v8);
    objc_msgSend((id)objc_opt_class(), "normalizeWeights:", v13);
    v15 = objc_claimAutoreleasedReturnValue();

    -[PLAccountingEngine createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:](self, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", v6, v15, v9);
    v13 = (void *)v15;
  }

  _Block_object_dispose(&v18, 8);
}

void __109__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withAddingChildNodeName_withStartDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAccountingDistributionEventForwardEntry entryKey](PLAccountingDistributionEventForwardEntry, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastEntryForKey:withSubEntryKey:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)createDistributionEventForwardWithDistributionID:(int)a3 withRemovingChildNodeName:(id)a4 withStartDate:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withRemovingChildNodeName_withStartDate___block_invoke;
  v16[3] = &unk_24DCF9DC0;
  v16[4] = &v18;
  v17 = v6;
  dispatch_async_and_wait(v10, v16);

  v11 = (void *)v19[5];
  if (v11)
  {
    objc_msgSend(v11, "childNodeNameToWeight");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v13, "removeObjectForKey:", v8);
      objc_msgSend((id)objc_opt_class(), "normalizeWeights:", v13);
      v15 = objc_claimAutoreleasedReturnValue();

      -[PLAccountingEngine createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:](self, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", v6, v15, v9);
      v13 = (void *)v15;
    }

  }
  _Block_object_dispose(&v18, 8);

}

void __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withRemovingChildNodeName_withStartDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAccountingDistributionEventForwardEntry entryKey](PLAccountingDistributionEventForwardEntry, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastEntryForKey:withSubEntryKey:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_9_classDebugEnabled = result;
  return result;
}

void __111__PLAccountingEngine_createDistributionEventForwardWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_284(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v6, "isEqualContentsWithEvent:", v5) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addDistributionEventIntervalWithLastDistributionEventForward:withDistributionEventForward:", v6, v5);

}

uint64_t __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_10_classDebugEnabled = result;
  return result;
}

uint64_t __110__PLAccountingEngine_createDistributionEventBackwardWithDistributionID_withChildNodeNameToWeight_withEndDate___block_invoke_287(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDistributionEventIntervalWithLastDistributionEventBackward:withDistributionEventBackward:", a2, a3);
}

- (void)createDistributionEventIntervalWithDistributionID:(int)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke;
  block[3] = &unk_24DCF9E10;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingDistributionEventIntervalEntry *v11;
  void *v12;
  PLAccountingDistributionEventIntervalEntry *v13;
  void *v14;
  _QWORD v15[5];
  int v16;
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_11_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_11_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_11_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionID=%i, childNodeNameToWeight=%@, startDate=%@, endDate=%@"), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 665);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingDistributionEventIntervalEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeNameToWeight:withRange:](v11, "initWithDistributionID:withChildNodeNameToWeight:withRange:", v12, *(_QWORD *)(a1 + 40), v10);

  v14 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke_290;
  v15[3] = &unk_24DCF9D48;
  v16 = *(_DWORD *)(a1 + 64);
  v15[4] = v14;
  objc_msgSend(v14, "createEventWithEvent:withActionBlock:", v13, v15);

}

uint64_t __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_11_classDebugEnabled = result;
  return result;
}

void __124__PLAccountingEngine_createDistributionEventIntervalWithDistributionID_withChildNodeNameToWeight_withStartDate_withEndDate___block_invoke_290(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (*(_DWORD *)(a1 + 40) == 22)
    v6 = v8;
  else
    v6 = v5;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "addDistributionEventInterval:", v7);

}

uint64_t __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_12_classDebugEnabled = result;
  return result;
}

uint64_t __109__PLAccountingEngine_createDistributionEventPointWithDistributionID_withChildNodeNameToWeight_withStartDate___block_invoke_291(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDistributionEventPoint:");
}

- (id)currentDistributionEventForwardWithDistributionID:(int)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[6];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke;
  block[3] = &unk_24DCF9E38;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_async_and_wait(v5, block);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_13_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_13_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_13_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionID=%i"), *(unsigned int *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine currentDistributionEventForwardWithDistributionID:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 711);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "distributionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastDependencyForDependencyID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "distributionEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "childNodeNameToWeight");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v23[0] = v3;
    v23[1] = 3221225472;
    v23[2] = __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke_296;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_13_defaultOnce_294 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_13_defaultOnce_294, v23);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_13_classDebugEnabled_295)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childNodeNameToWeight=%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine currentDistributionEventForwardWithDistributionID:]_block_invoke_2");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 714);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

uint64_t __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_13_classDebugEnabled = result;
  return result;
}

uint64_t __72__PLAccountingEngine_currentDistributionEventForwardWithDistributionID___block_invoke_296(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_13_classDebugEnabled_295 = result;
  return result;
}

- (void)createQualificationEventForwardWithQualificationID:(int)a3 withAddingChildNodeName:(id)a4 withStartDate:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __111__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withAddingChildNodeName_withStartDate___block_invoke;
  v15[3] = &unk_24DCF9DC0;
  v15[4] = &v17;
  v16 = v6;
  dispatch_async_and_wait(v10, v15);

  v11 = (void *)v18[5];
  if (v11)
    objc_msgSend(v11, "childNodeNames");
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  if ((objc_msgSend(v13, "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(v13, "addObject:", v8);
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingEngine createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:](self, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v6, v14, v9);

  }
  _Block_object_dispose(&v17, 8);

}

void __111__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withAddingChildNodeName_withStartDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAccountingQualificationEventForwardEntry entryKey](PLAccountingQualificationEventForwardEntry, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastEntryForKey:withSubEntryKey:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)createQualificationEventForwardWithQualificationID:(int)a3 withRemovingChildNodeName:(id)a4 withStartDate:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __113__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withRemovingChildNodeName_withStartDate___block_invoke;
  v15[3] = &unk_24DCF9DC0;
  v15[4] = &v17;
  v16 = v6;
  dispatch_async_and_wait(v10, v15);

  v11 = (void *)v18[5];
  if (v11)
  {
    objc_msgSend(v11, "childNodeNames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if ((objc_msgSend(v13, "containsObject:", v8) & 1) != 0)
    {
      objc_msgSend(v13, "removeObject:", v8);
      objc_msgSend(v13, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAccountingEngine createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:](self, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v6, v14, v9);

    }
  }
  _Block_object_dispose(&v17, 8);

}

void __113__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withRemovingChildNodeName_withStartDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAccountingQualificationEventForwardEntry entryKey](PLAccountingQualificationEventForwardEntry, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastEntryForKey:withSubEntryKey:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_14_classDebugEnabled = result;
  return result;
}

void __106__PLAccountingEngine_createQualificationEventForwardWithQualificationID_withChildNodeNames_withStartDate___block_invoke_302(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v6, "isEqualContentsWithEvent:", v5) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addQualificationEventIntervalWithLastQualificationEventForward:withQualificationEventForward:", v6, v5);

}

- (void)createQualificationEventBackwardWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withEndDate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke;
  v13[3] = &unk_24DCF9DE8;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingQualificationEventBackwardEntry *v11;
  void *v12;
  void *v13;
  PLAccountingQualificationEventBackwardEntry *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_15_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_15_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_15_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationID=%i, childNodeNames=%@, endDate=%@"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 796);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", 0, *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingQualificationEventBackwardEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLAccountingQualificationEventEntry initWithQualificationID:withChildNodeNames:withRange:](v11, "initWithQualificationID:withChildNodeNames:withRange:", v12, v13, v10);

  v15 = *(void **)(a1 + 32);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke_305;
  v16[3] = &unk_24DCF9CF8;
  v16[4] = v15;
  objc_msgSend(v15, "createEventWithEvent:withActionBlock:", v14, v16);

}

uint64_t __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_15_classDebugEnabled = result;
  return result;
}

uint64_t __105__PLAccountingEngine_createQualificationEventBackwardWithQualificationID_withChildNodeNames_withEndDate___block_invoke_305(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addQualificationEventIntervalWithLastQualificationEventBackward:withQualificationEventBackward:", a2, a3);
}

- (void)createQualificationEventIntervalWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke;
  block[3] = &unk_24DCF9E10;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingQualificationEventIntervalEntry *v11;
  void *v12;
  void *v13;
  PLAccountingQualificationEventIntervalEntry *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_16_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_16_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_16_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationID=%i, childNodeNames=%@, startDate=%@, endDate=%@"), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 821);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingQualificationEventIntervalEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLAccountingQualificationEventEntry initWithQualificationID:withChildNodeNames:withRange:](v11, "initWithQualificationID:withChildNodeNames:withRange:", v12, v13, v10);

  v15 = *(void **)(a1 + 32);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke_308;
  v16[3] = &unk_24DCF9CF8;
  v16[4] = v15;
  objc_msgSend(v15, "createEventWithEvent:withActionBlock:", v14, v16);

}

uint64_t __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_16_classDebugEnabled = result;
  return result;
}

uint64_t __119__PLAccountingEngine_createQualificationEventIntervalWithQualificationID_withChildNodeNames_withStartDate_withEndDate___block_invoke_308(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addQualificationEventInterval:");
}

- (void)createQualificationEventPointWithQualificationID:(int)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  -[PLAccountingEngine workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke;
  v13[3] = &unk_24DCF9DE8;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PLAccountingQualificationEventPointEntry *v11;
  void *v12;
  void *v13;
  PLAccountingQualificationEventPointEntry *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_17_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_17_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_17_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationID=%i, childNodeNames=%@, startDate=%@"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 843);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PLAccountingQualificationEventPointEntry alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLAccountingQualificationEventEntry initWithQualificationID:withChildNodeNames:withRange:](v11, "initWithQualificationID:withChildNodeNames:withRange:", v12, v13, v10);

  v15 = *(void **)(a1 + 32);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke_309;
  v16[3] = &unk_24DCF9CF8;
  v16[4] = v15;
  objc_msgSend(v15, "createEventWithEvent:withActionBlock:", v14, v16);

}

uint64_t __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_17_classDebugEnabled = result;
  return result;
}

uint64_t __104__PLAccountingEngine_createQualificationEventPointWithQualificationID_withChildNodeNames_withStartDate___block_invoke_309(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addQualificationEventPoint:");
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createEventWithEvent_withActionBlock__classDebugEnabled = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_314(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createEventWithEvent_withActionBlock__classDebugEnabled_313 = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_319(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createEventWithEvent_withActionBlock__classDebugEnabled_318 = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_324(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createEventWithEvent_withActionBlock__classDebugEnabled_323 = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_329(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createEventWithEvent_withActionBlock__classDebugEnabled_328 = result;
  return result;
}

uint64_t __59__PLAccountingEngine_createEventWithEvent_withActionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createEventWithEvent_withActionBlock__classDebugEnabled_335 = result;
  return result;
}

+ (id)gasGaugeEntryKey
{
  if (gasGaugeEntryKey_onceToken != -1)
    dispatch_once(&gasGaugeEntryKey_onceToken, &__block_literal_global_338);
  return (id)gasGaugeEntryKey_gasGaugeEntryKey;
}

void __38__PLAccountingEngine_gasGaugeEntryKey__block_invoke()
{
  void *v0;

  v0 = (void *)gasGaugeEntryKey_gasGaugeEntryKey;
  gasGaugeEntryKey_gasGaugeEntryKey = (uint64_t)CFSTR("PLBatteryAgent_EventInterval_GasGauge");

}

uint64_t __112__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__classDebugEnabled = result;
  return result;
}

uint64_t __112__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward___block_invoke_345(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDistributionEventIntervalWithLastDistributionEventForward_withDistributionEventForward__classDebugEnabled_344 = result;
  return result;
}

uint64_t __114__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__classDebugEnabled = result;
  return result;
}

uint64_t __114__PLAccountingEngine_addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward___block_invoke_352(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDistributionEventIntervalWithLastDistributionEventBackward_withDistributionEventBackward__classDebugEnabled_351 = result;
  return result;
}

- (void)addDistributionEventInterval:(id)a3
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
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __51__PLAccountingEngine_addDistributionEventInterval___block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v5;
    if (addDistributionEventInterval__defaultOnce != -1)
      dispatch_once(&addDistributionEventInterval__defaultOnce, &block);
    if (addDistributionEventInterval__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionEventInterval=%@"), v4, block, v14, v15, v16, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addDistributionEventInterval:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 948);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingEngine distributionManager](self, "distributionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addDistributionEvent:", v4);

}

uint64_t __51__PLAccountingEngine_addDistributionEventInterval___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDistributionEventInterval__classDebugEnabled = result;
  return result;
}

- (void)addDistributionEventPoint:(id)a3
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
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __48__PLAccountingEngine_addDistributionEventPoint___block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v5;
    if (addDistributionEventPoint__defaultOnce != -1)
      dispatch_once(&addDistributionEventPoint__defaultOnce, &block);
    if (addDistributionEventPoint__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionEventPoint=%@"), v4, block, v14, v15, v16, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addDistributionEventPoint:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 954);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingEngine distributionManager](self, "distributionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addDistributionEvent:", v4);

}

uint64_t __48__PLAccountingEngine_addDistributionEventPoint___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDistributionEventPoint__classDebugEnabled = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_362 = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_367(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_366 = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_372(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_371 = result;
  return result;
}

uint64_t __76__PLAccountingEngine_didCreateChildEnergyEstimate_withParentEnergyEstimate___block_invoke_377(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didCreateChildEnergyEstimate_withParentEnergyEstimate__classDebugEnabled_376 = result;
  return result;
}

uint64_t __50__PLAccountingEngine_didDistributeEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didDistributeEnergyEstimate__classDebugEnabled_0 = result;
  return result;
}

uint64_t __47__PLAccountingEngine_didCorrectEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didCorrectEnergyEstimate__classDebugEnabled = result;
  return result;
}

uint64_t __115__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__classDebugEnabled = result;
  return result;
}

uint64_t __115__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward___block_invoke_386(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualificationEventIntervalWithLastQualificationEventForward_withQualificationEventForward__classDebugEnabled_385 = result;
  return result;
}

- (void)addQualificationEventIntervalWithLastQualificationEventBackward:(id)a3 withQualificationEventBackward:(id)a4
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
  int v17;
  PLAccountingQualificationEventIntervalEntry *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PLAccountingQualificationEventIntervalEntry *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __117__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__defaultOnce != -1)
      dispatch_once(&addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__defaultOnce, block);
    if (addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastQualificationEventBackward=%@, qualificationEventBackward=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addQualificationEventIntervalWithLastQualificationEventBackward:withQualificationEventBackward:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 1053);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v6, "qualificationID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "qualificationID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (v17)
      {
        v18 = [PLAccountingQualificationEventIntervalEntry alloc];
        objc_msgSend(v7, "qualificationID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "childNodeIDs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "range");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "endDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "range");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "endDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[PLAccountingQualificationEventIntervalEntry initWithQualificationID:withChildNodeIDs:withStartDate:withEndDate:](v18, "initWithQualificationID:withChildNodeIDs:withStartDate:withEndDate:", v19, v20, v22, v24);

        -[PLEntry setWriteToDB:](v25, "setWriteToDB:", 0);
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v26 = objc_opt_class();
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __117__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward___block_invoke_393;
          v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v34[4] = v26;
          if (addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__defaultOnce_391 != -1)
            dispatch_once(&addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__defaultOnce_391, v34);
          if (addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__classDebugEnabled_392)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEventInterval=%@"), v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lastPathComponent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addQualificationEventIntervalWithLastQualificationEventBackward:withQualificationEventBackward:]");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 1062);

            PLLogCommon();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingEngine qualificationManager](self, "qualificationManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addQualificationEvent:", v25);

      }
    }
  }

}

uint64_t __117__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__classDebugEnabled = result;
  return result;
}

uint64_t __117__PLAccountingEngine_addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward___block_invoke_393(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualificationEventIntervalWithLastQualificationEventBackward_withQualificationEventBackward__classDebugEnabled_392 = result;
  return result;
}

- (void)addQualificationEventInterval:(id)a3
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
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __52__PLAccountingEngine_addQualificationEventInterval___block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v5;
    if (addQualificationEventInterval__defaultOnce != -1)
      dispatch_once(&addQualificationEventInterval__defaultOnce, &block);
    if (addQualificationEventInterval__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEventInterval=%@"), v4, block, v14, v15, v16, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addQualificationEventInterval:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1069);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingEngine qualificationManager](self, "qualificationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addQualificationEvent:", v4);

}

uint64_t __52__PLAccountingEngine_addQualificationEventInterval___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualificationEventInterval__classDebugEnabled = result;
  return result;
}

- (void)addQualificationEventPoint:(id)a3
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
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __49__PLAccountingEngine_addQualificationEventPoint___block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v5;
    if (addQualificationEventPoint__defaultOnce != -1)
      dispatch_once(&addQualificationEventPoint__defaultOnce, &block);
    if (addQualificationEventPoint__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEventPoint=%@"), v4, block, v14, v15, v16, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addQualificationEventPoint:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1075);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingEngine qualificationManager](self, "qualificationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addQualificationEvent:", v4);

}

uint64_t __49__PLAccountingEngine_addQualificationEventPoint___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualificationEventPoint__classDebugEnabled = result;
  return result;
}

uint64_t __79__PLAccountingEngine_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled_0 = result;
  return result;
}

uint64_t __79__PLAccountingEngine_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke_403(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled_402 = result;
  return result;
}

- (id)getLastQualifiedEnergyEventDate
{
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[PLAccountingEngine qualificationManager](self, "qualificationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__PLAccountingEngine_getLastQualifiedEnergyEventDate__block_invoke;
  v7[3] = &unk_24DCF9EC0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (void *)objc_msgSend((id)v9[5], "copy");
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __53__PLAccountingEngine_getLastQualifiedEnergyEventDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "qualificationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastQualifiedEnergyEventDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)workQueue
{
  return (id)objc_msgSend(MEMORY[0x24BE74FF8], "workQueueForClass:", objc_opt_class());
}

- (void)addEnergyMeasurementWithRootNodeID:(int)a3 withEnergy:(double)a4 withRange:(id)a5
{
  uint64_t v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  PLAccountingEnergyEventEntry *v16;
  void *v17;
  PLAccountingEnergyEventEntry *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD block[5];

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__PLAccountingEngine_addEnergyMeasurementWithRootNodeID_withEnergy_withRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (addEnergyMeasurementWithRootNodeID_withEnergy_withRange__defaultOnce != -1)
      dispatch_once(&addEnergyMeasurementWithRootNodeID_withEnergy_withRange__defaultOnce, block);
    if (addEnergyMeasurementWithRootNodeID_withEnergy_withRange__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootNodeID=%i, energy=%f, range=%@"), v6, *(_QWORD *)&a4, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addEnergyMeasurementWithRootNodeID:withEnergy:withRange:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1149);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (a4 >= 0.0)
  {
    v16 = [PLAccountingEnergyEventEntry alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PLAccountingEnergyEventEntry initWithNodeID:withEnergy:withRange:withEntryDate:](v16, "initWithNodeID:withEnergy:withRange:withEntryDate:", v17, v8, 0, a4);

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __78__PLAccountingEngine_addEnergyMeasurementWithRootNodeID_withEnergy_withRange___block_invoke_414;
      v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v27[4] = v19;
      if (addEnergyMeasurementWithRootNodeID_withEnergy_withRange__defaultOnce_412 != -1)
        dispatch_once(&addEnergyMeasurementWithRootNodeID_withEnergy_withRange__defaultOnce_412, v27);
      if (addEnergyMeasurementWithRootNodeID_withEnergy_withRange__classDebugEnabled_413)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("measurementEvent=%@"), v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine addEnergyMeasurementWithRootNodeID:withEnergy:withRange:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 1156);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    -[PLAccountingEngine correctionManager](self, "correctionManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addEnergyMeasurement:", v18);

  }
}

uint64_t __78__PLAccountingEngine_addEnergyMeasurementWithRootNodeID_withEnergy_withRange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addEnergyMeasurementWithRootNodeID_withEnergy_withRange__classDebugEnabled = result;
  return result;
}

uint64_t __78__PLAccountingEngine_addEnergyMeasurementWithRootNodeID_withEnergy_withRange___block_invoke_414(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addEnergyMeasurementWithRootNodeID_withEnergy_withRange__classDebugEnabled_413 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  chunkWithLastChunkDate_withNow__classDebugEnabled = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_421(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  chunkWithLastChunkDate_withNow__classDebugEnabled_420 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_430(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  chunkWithLastChunkDate_withNow__classDebugEnabled_429 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_435(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  chunkWithLastChunkDate_withNow__classDebugEnabled_434 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_438(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  chunkWithLastChunkDate_withNow__classDebugEnabled_437 = result;
  return result;
}

uint64_t __53__PLAccountingEngine_chunkWithLastChunkDate_withNow___block_invoke_441(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  chunkWithLastChunkDate_withNow__classDebugEnabled_440 = result;
  return result;
}

- (void)reload
{
  NSObject *v3;
  _QWORD block[5];

  -[PLAccountingEngine workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__PLAccountingEngine_reload__block_invoke;
  block[3] = &unk_24DCF9BD0;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

}

void __28__PLAccountingEngine_reload__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
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
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD block[5];

  v2 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__PLAccountingEngine_reload__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("begin"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reload]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1208);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x24BE74FF8], "deviceBootTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v24[0] = v3;
    v24[1] = 3221225472;
    v24[2] = __28__PLAccountingEngine_reload__block_invoke_446;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce_444 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce_444, v24);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled_445)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastDeviceBootDate=%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reload]_block_invoke_2");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1212);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "reloadLastPowerEventsWithLastDeviceBootDate:", v10);
  objc_msgSend(*(id *)(a1 + 32), "reloadLastDistributionEventsWithLastDeviceBootDate:", v10);
  objc_msgSend(*(id *)(a1 + 32), "reloadLastQualificationEventsWithLastDeviceBootDate:", v10);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v23[0] = v3;
    v23[1] = 3221225472;
    v23[2] = __28__PLAccountingEngine_reload__block_invoke_452;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce_450 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_18_defaultOnce_450, v23);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled_451)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("end"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reload]_block_invoke_2");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 1219);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

uint64_t __28__PLAccountingEngine_reload__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled = result;
  return result;
}

uint64_t __28__PLAccountingEngine_reload__block_invoke_446(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled_445 = result;
  return result;
}

uint64_t __28__PLAccountingEngine_reload__block_invoke_452(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_18_classDebugEnabled_451 = result;
  return result;
}

- (void)reloadLastPowerEventsWithLastDeviceBootDate:(id)a3
{
  unint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  PLAccountingEngine *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  _QWORD v43[5];
  _QWORD block[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = 0x24BE74000uLL;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled", a3))
  {
    v5 = objc_opt_class();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = v5;
    if (reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce != -1)
      dispatch_once(&reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce, v49);
    if (reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("begin"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastPowerEventsWithLastDeviceBootDate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1224);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "launchDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend((id)objc_opt_class(), "deviceRootNodeIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    v40 = *(_QWORD *)v46;
    do
    {
      v17 = 0;
      v41 = v15;
      do
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
        if (objc_msgSend(*(id *)(v4 + 4016), "debugEnabled"))
        {
          v19 = objc_opt_class();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke_457;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v19;
          if (reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce_455 != -1)
            dispatch_once(&reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce_455, block);
          if (reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled_456)
          {
            v20 = v13;
            v21 = self;
            v22 = v4;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootNodeIDNumber=%@"), v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "lastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastPowerEventsWithLastDeviceBootDate:]");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 1228);

            PLLogCommon();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v23;
              _os_log_debug_impl(&dword_21A62B000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v4 = v22;
            self = v21;
            v13 = v20;
            v16 = v40;
            v15 = v41;
          }
        }
        v29 = objc_msgSend(v18, "intValue");
        objc_msgSend(&unk_24DD03160, "objectAtIndexedSubscript:", (int)v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "intValue");

        switch(v31)
        {
          case 3:
            objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLAccountingEngine createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:](self, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v29, v32, v13, 0.0);

            break;
          case 2:
            -[PLAccountingEngine createPowerEventBackwardWithRootNodeID:withPower:withEndDate:](self, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v29, v13, 0.0);
            break;
          case 1:
            -[PLAccountingEngine createPowerEventForwardWithRootNodeID:withPower:withStartDate:](self, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v29, v13, 0.0);
            break;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v15);
  }

  if (objc_msgSend(*(id *)(v4 + 4016), "debugEnabled"))
  {
    v33 = objc_opt_class();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke_462;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v33;
    if (reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce_460 != -1)
      dispatch_once(&reloadLastPowerEventsWithLastDeviceBootDate__defaultOnce_460, v43);
    if (reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled_461)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("end"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastPowerEventsWithLastDeviceBootDate:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 1250);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

uint64_t __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled = result;
  return result;
}

uint64_t __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke_457(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled_456 = result;
  return result;
}

uint64_t __66__PLAccountingEngine_reloadLastPowerEventsWithLastDeviceBootDate___block_invoke_462(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastPowerEventsWithLastDeviceBootDate__classDebugEnabled_461 = result;
  return result;
}

- (void)reloadLastDistributionEventsWithLastDeviceBootDate:(id)a3
{
  PLAccountingEngine *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  __objc2_class **v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD block[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  void *v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v3 = self;
  v66 = *MEMORY[0x24BDAC8D0];
  v4 = 0x24BE74000uLL;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled", a3))
  {
    v5 = objc_opt_class();
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke;
    v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v61[4] = v5;
    if (reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce != -1)
      dispatch_once(&reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce, v61);
    if (reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("begin"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastDistributionEventsWithLastDeviceBootDate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1254);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v3 = self;
      v4 = 0x24BE74000uLL;
    }
  }
  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "launchDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v58 = 0u;
  v57 = 0u;
  objc_msgSend((id)objc_opt_class(), "allDistributionIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v52)
  {
    v50 = *MEMORY[0x24BE75138];
    v51 = *(_QWORD *)v58;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v58 != v51)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v13);
        if (objc_msgSend(*(id *)(v4 + 4016), "debugEnabled"))
        {
          v15 = objc_opt_class();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = 0x21A651000;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v15;
          if (reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_463 != -1)
            dispatch_once(&reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_463, block);
          if (reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_464)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionIDNumber=%@"), v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "lastPathComponent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastDistributionEventsWithLastDeviceBootDate:]");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 1258);

            PLLogCommon();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v16;
              _os_log_debug_impl(&dword_21A62B000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v4 = 0x24BE74000uLL;
          }
        }
        v22 = objc_msgSend(v14, "intValue");
        objc_msgSend(&unk_24DD03178, "objectAtIndexedSubscript:", (int)v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue");

        v25 = off_24DCF94B8;
        v53 = v22;
        if (v24 == 1)
          goto LABEL_23;
        if ((v24 - 2) <= 2)
        {
          v25 = off_24DCF9EE0[v24 - 2];
LABEL_23:
          -[__objc2_class entryKey](*v25, "entryKey");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        v26 = 0;
LABEL_25:
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE75000]), "initWithKey:withValue:withComparisonOperation:", v50, v14, 0);
        objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "storage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v27;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastEntryForKey:withComparisons:isSingleton:", v26, v30, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(v4 + 4016), "debugEnabled"))
        {
          v32 = objc_opt_class();
          v55[0] = MEMORY[0x24BDAC760];
          v55[1] = 3221225472;
          v55[2] = __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_473;
          v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v55[4] = v32;
          if (reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_471 != -1)
            dispatch_once(&reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_471, v55);
          if (reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_472)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastDistributionEvent=%@"), v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "lastPathComponent");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastDistributionEventsWithLastDeviceBootDate:]");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 1283);

            PLLogCommon();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v33;
              _os_log_debug_impl(&dword_21A62B000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v3 = self;
            v4 = 0x24BE74000uLL;
          }
        }
        if (v31)
        {
          if (v24 == 1)
            -[PLAccountingEngine addDistributionEventIntervalWithLastDistributionEventForward:withDistributionEventForward:](v3, "addDistributionEventIntervalWithLastDistributionEventForward:withDistributionEventForward:", 0, v31);
        }
        else
        {
          switch(v24)
          {
            case 1:
              -[PLAccountingEngine createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:](v3, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", v53, MEMORY[0x24BDBD1B8], v48);
              break;
            case 4:
              -[PLAccountingEngine createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:](v3, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", v53, MEMORY[0x24BDBD1B8], v48);
              break;
            case 3:
              objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLAccountingEngine createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:](v3, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", v53, MEMORY[0x24BDBD1B8], v39, v48);

              v4 = 0x24BE74000;
              break;
            case 2:
              -[PLAccountingEngine createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:](v3, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", v53, MEMORY[0x24BDBD1B8], v48);
              break;
          }
        }

        ++v13;
      }
      while (v52 != v13);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v52);
  }

  if (objc_msgSend(*(id *)(v4 + 4016), "debugEnabled"))
  {
    v40 = objc_opt_class();
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_478;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v40;
    if (reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_476 != -1)
      dispatch_once(&reloadLastDistributionEventsWithLastDeviceBootDate__defaultOnce_476, v54);
    if (reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_477)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("end"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastDistributionEventsWithLastDeviceBootDate:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v44, v45, 1315);

      PLLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

uint64_t __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled = result;
  return result;
}

uint64_t __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_465(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_464 = result;
  return result;
}

uint64_t __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_473(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_472 = result;
  return result;
}

uint64_t __73__PLAccountingEngine_reloadLastDistributionEventsWithLastDeviceBootDate___block_invoke_478(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastDistributionEventsWithLastDeviceBootDate__classDebugEnabled_477 = result;
  return result;
}

- (void)reloadLastQualificationEventsWithLastDeviceBootDate:(id)a3
{
  PLAccountingEngine *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  __objc2_class **v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD block[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  void *v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v3 = self;
  v66 = *MEMORY[0x24BDAC8D0];
  v4 = 0x24BE74000uLL;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled", a3))
  {
    v5 = objc_opt_class();
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke;
    v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v61[4] = v5;
    if (reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce != -1)
      dispatch_once(&reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce, v61);
    if (reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("begin"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastQualificationEventsWithLastDeviceBootDate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1319);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v3 = self;
      v4 = 0x24BE74000uLL;
    }
  }
  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "launchDate");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v58 = 0u;
  v57 = 0u;
  objc_msgSend((id)objc_opt_class(), "allQualificationIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v52)
  {
    v50 = *MEMORY[0x24BE75180];
    v51 = *(_QWORD *)v58;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v58 != v51)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v13);
        if (objc_msgSend(*(id *)(v4 + 4016), "debugEnabled"))
        {
          v15 = objc_opt_class();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_481;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v15;
          if (reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_479 != -1)
            dispatch_once(&reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_479, block);
          if (reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_480)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationIDNumber=%@"), v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "lastPathComponent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastQualificationEventsWithLastDeviceBootDate:]");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 1323);

            PLLogCommon();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v16;
              _os_log_debug_impl(&dword_21A62B000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v4 = 0x24BE74000uLL;
          }
        }
        v22 = objc_msgSend(v14, "intValue");
        objc_msgSend(&unk_24DD03190, "objectAtIndexedSubscript:", (int)v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue");

        v25 = off_24DCF9548;
        v53 = v22;
        if (v24 == 1)
          goto LABEL_23;
        if ((v24 - 2) <= 2)
        {
          v25 = off_24DCF9EF8[v24 - 2];
LABEL_23:
          -[__objc2_class entryKey](*v25, "entryKey");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        v26 = 0;
LABEL_25:
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE75000]), "initWithKey:withValue:withComparisonOperation:", v50, v14, 0);
        objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "storage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v27;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastEntryForKey:withComparisons:isSingleton:", v26, v30, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(v4 + 4016), "debugEnabled"))
        {
          v32 = objc_opt_class();
          v55[0] = MEMORY[0x24BDAC760];
          v55[1] = 3221225472;
          v55[2] = __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_488;
          v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v55[4] = v32;
          if (reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_486 != -1)
            dispatch_once(&reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_486, v55);
          if (reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_487)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastQualificationEvent=%@"), v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "lastPathComponent");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastQualificationEventsWithLastDeviceBootDate:]");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 1348);

            PLLogCommon();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v33;
              _os_log_debug_impl(&dword_21A62B000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v3 = self;
            v4 = 0x24BE74000uLL;
          }
        }
        if (v31)
        {
          if (v24 == 1)
            -[PLAccountingEngine addQualificationEventIntervalWithLastQualificationEventForward:withQualificationEventForward:](v3, "addQualificationEventIntervalWithLastQualificationEventForward:withQualificationEventForward:", 0, v31);
        }
        else
        {
          switch(v24)
          {
            case 1:
              -[PLAccountingEngine createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:](v3, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v53, MEMORY[0x24BDBD1A8], v48);
              break;
            case 4:
              -[PLAccountingEngine createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:](v3, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", v53, MEMORY[0x24BDBD1A8], v48);
              break;
            case 3:
              objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLAccountingEngine createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:](v3, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", v53, MEMORY[0x24BDBD1A8], v39, v48);

              v4 = 0x24BE74000;
              break;
            case 2:
              -[PLAccountingEngine createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:](v3, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", v53, MEMORY[0x24BDBD1A8], v48);
              break;
          }
        }

        ++v13;
      }
      while (v52 != v13);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v52);
  }

  if (objc_msgSend(*(id *)(v4 + 4016), "debugEnabled"))
  {
    v40 = objc_opt_class();
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_493;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v40;
    if (reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_491 != -1)
      dispatch_once(&reloadLastQualificationEventsWithLastDeviceBootDate__defaultOnce_491, v54);
    if (reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_492)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("end"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEngine reloadLastQualificationEventsWithLastDeviceBootDate:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v44, v45, 1380);

      PLLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

uint64_t __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_481(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_480 = result;
  return result;
}

uint64_t __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_488(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_487 = result;
  return result;
}

uint64_t __74__PLAccountingEngine_reloadLastQualificationEventsWithLastDeviceBootDate___block_invoke_493(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadLastQualificationEventsWithLastDeviceBootDate__classDebugEnabled_492 = result;
  return result;
}

uint64_t __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled = result;
  return result;
}

uint64_t __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke_496(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled_495 = result;
  return result;
}

uint64_t __75__PLAccountingEngine_createAggregateRootNodeEnergyEntryWithEnergyEstimate___block_invoke_501(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createAggregateRootNodeEnergyEntryWithEnergyEstimate__classDebugEnabled_500 = result;
  return result;
}

+ (void)clearWithEntryKey:(id)a3
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
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD block[5];

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__PLAccountingEngine_clearWithEntryKey___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (clearWithEntryKey__defaultOnce != -1)
      dispatch_once(&clearWithEntryKey__defaultOnce, block);
    if (clearWithEntryKey__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("entryKey=%@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingEngine.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PLAccountingEngine clearWithEntryKey:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1409);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM '%@';"), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "performQuery:", v11);

  if (objc_msgSend(MEMORY[0x24BE74FC0], "hasDynamicKeysForEntryKey:", v3))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DELETE FROM '%@_%@';"), v3, *MEMORY[0x24BE75208]);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "storage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "performQuery:", v16);

    v11 = (void *)v16;
  }

}

uint64_t __40__PLAccountingEngine_clearWithEntryKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  clearWithEntryKey__classDebugEnabled = result;
  return result;
}

+ (id)normalizeWeights:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "count"))
  {
    v25 = v4;
LABEL_25:
    v14 = v25;
    goto LABEL_26;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v6)
  {

LABEL_24:
    v25 = v5;
    goto LABEL_25;
  }
  v7 = v6;
  v8 = *(_QWORD *)v32;
  v9 = 0.0;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v32 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v9 = v9 + v12;

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v7);

  if (v9 <= 0.0 || v9 == 1.0)
    goto LABEL_24;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        v21 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v15, "objectForKeyedSubscript:", v20, (_QWORD)v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        objc_msgSend(v21, "numberWithDouble:", v23 / v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v17);
  }

LABEL_26:
  return v14;
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLActivity)chunkActivity
{
  return (PLActivity *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChunkActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PLEntryNotificationOperatorComposition)batteryListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)pluggedIn
{
  return self->_pluggedIn;
}

- (void)setPluggedIn:(BOOL)a3
{
  self->_pluggedIn = a3;
}

- (void)setDistributionManager:(id)a3
{
  objc_storeStrong((id *)&self->_distributionManager, a3);
}

- (void)setCorrectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_correctionManager, a3);
}

- (void)setQualificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_qualificationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualificationManager, 0);
  objc_storeStrong((id *)&self->_correctionManager, 0);
  objc_storeStrong((id *)&self->_distributionManager, 0);
  objc_storeStrong((id *)&self->_batteryListener, 0);
  objc_storeStrong((id *)&self->_chunkActivity, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
