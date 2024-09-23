@implementation PLAccountingCorrectionManager

- (void)addRootEnergyEstimate:(id)a3 withNow:(id)a4
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
  _BOOL4 v16;
  PLAccountingCorrectionOwner *v17;
  double v18;
  double v19;
  double v20;
  void *v22;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__PLAccountingCorrectionManager_addRootEnergyEstimate_withNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addRootEnergyEstimate_withNow__defaultOnce != -1)
      dispatch_once(&addRootEnergyEstimate_withNow__defaultOnce, block);
    if (addRootEnergyEstimate_withNow__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootEnergyEstimate=%@, now=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager addRootEnergyEstimate:withNow:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 24);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v6 && v7)
  {
    if (objc_msgSend(MEMORY[0x24BE74FF8], "gasGaugeEnabled"))
    {
      objc_msgSend((id)objc_opt_class(), "disableCorrection");
      v16 = v15 == 0.0;
    }
    else
    {
      v16 = 0;
    }
    v17 = -[PLAccountingCorrectionOwner initWithRootEnergyEstimate:]([PLAccountingCorrectionOwner alloc], "initWithRootEnergyEstimate:", v6);
    objc_msgSend(v6, "energy");
    v19 = v18;
    +[PLAccountingEngine minEnergy](PLAccountingEngine, "minEnergy");
    if (v19 <= v20 || !v16)
    {
      if (objc_msgSend(v6, "writeToDB"))
      {
        objc_msgSend(v6, "setCorrectionDate:", v7);
        -[PLAccountingCorrectionManager delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "didCorrectEnergyEstimate:", v6);

      }
    }
    else
    {
      -[PLAccountingOwnerDependencyManager addOwner:](self, "addOwner:", v17);
    }
    if (v16)
    {
      -[PLAccountingCorrectionManager addEnergyMeasurement:](self, "addEnergyMeasurement:", v6);
      -[PLAccountingOwnerDependencyManager notifyDependenciesWithOwner:](self, "notifyDependenciesWithOwner:", v17);
    }

  }
}

- (void)addEnergyMeasurement:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLAccountingCorrectionDependency *v12;
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
    v15 = __54__PLAccountingCorrectionManager_addEnergyMeasurement___block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v5;
    if (addEnergyMeasurement__defaultOnce != -1)
      dispatch_once(&addEnergyMeasurement__defaultOnce, &block);
    if (addEnergyMeasurement__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energyMeasurement=%@"), v4, block, v14, v15, v16, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager addEnergyMeasurement:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 49);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  v12 = -[PLAccountingCorrectionDependency initWithEnergyEvent:]([PLAccountingCorrectionDependency alloc], "initWithEnergyEvent:", v4);
  -[PLAccountingOwnerDependencyManager addDependency:](self, "addDependency:", v12);
  -[PLAccountingOwnerDependencyManager notifyOwnersWithDependency:](self, "notifyOwnersWithDependency:", v12);

}

+ (double)disableCorrection
{
  int v2;
  double result;
  _QWORD v4[4];
  __CFString *v5;
  char v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[2] = __50__PLAccountingCorrectionManager_disableCorrection__block_invoke;
  v4[3] = &unk_24DCF9BA8;
  v4[1] = 3221225472;
  v5 = CFSTR("PLAccountingCorrectionManager_disableCorrection");
  v6 = 0;
  if (disableCorrection_defaultOnce != -1)
    dispatch_once(&disableCorrection_defaultOnce, v4);
  v2 = disableCorrection_objectForKey;

  result = 0.0;
  if (v2)
    return 1.0;
  return result;
}

- (void)correctChildEnergyEstimate:(id)a3 withParentEnergyEstimate:(id)a4 withNow:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  _QWORD v63[5];
  _QWORD block[5];
  id v65;
  id v66;
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[6];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    v70[0] = MEMORY[0x24BDAC760];
    v70[1] = 3221225472;
    v70[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke;
    v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v70[4] = v11;
    if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce != -1)
      dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce, v70);
    if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childEnergyEstimate=%@, parentEnergyEstimate=%@"), v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 59);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v9 && objc_msgSend(v8, "writeToDB"))
  {
    objc_msgSend(v9, "correctionDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
    if (v18)
    {
      v20 = MEMORY[0x24BDAC760];
      if (v19)
      {
        v69[0] = MEMORY[0x24BDAC760];
        v69[1] = 3221225472;
        v69[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_21;
        v69[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v69[4] = objc_opt_class();
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_19 != -1)
          dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_19, v69);
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_20)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("parent has already been corrected"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 66);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

          v20 = MEMORY[0x24BDAC760];
        }
      }
      objc_msgSend(v9, "energy");
      v28 = v27;
      v29 = 0.0;
      if (v28 > 0.0)
      {
        objc_msgSend(v8, "energy", 0.0);
        v31 = v30;
        objc_msgSend(v9, "correctionEnergy");
        v33 = v32;
        objc_msgSend(v9, "energy");
        v29 = v31 * (v33 / v34);
      }
      objc_msgSend(v8, "setCorrectionEnergy:", v29);
      objc_msgSend(v8, "setCorrectionDate:", v10);
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v68[0] = v20;
        v68[1] = 3221225472;
        v68[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_26;
        v68[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v68[4] = objc_opt_class();
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_24 != -1)
          dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_24, v68);
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_25)
        {
          v35 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v8, "correctionEnergy");
          v37 = v36;
          objc_msgSend(v8, "correctionDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("childEnergyEstimate.correctionEnergy=%f, childEnergyEstimate.correctionDate=%@"), v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "lastPathComponent");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 69);

          PLLogCommon();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }
      -[PLAccountingCorrectionManager delegate](self, "delegate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "didCorrectEnergyEstimate:", v8);

    }
    else
    {
      if (v19)
      {
        v46 = objc_opt_class();
        v67[0] = MEMORY[0x24BDAC760];
        v67[1] = 3221225472;
        v67[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_31;
        v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v67[4] = v46;
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_29 != -1)
          dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_29, v67);
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_30)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("parent has not yet been corrected"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "lastPathComponent");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v50, v51, 73);

          PLLogCommon();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }
      -[PLAccountingOwnerDependencyManager workQueue](self, "workQueue");
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_34;
      block[3] = &unk_24DCF9AE8;
      block[4] = self;
      v65 = v9;
      v66 = v8;
      dispatch_async(v53, block);

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v63[0] = v54;
        v63[1] = 3221225472;
        v63[2] = __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_2;
        v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v63[4] = objc_opt_class();
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_37 != -1)
          dispatch_once(&correctChildEnergyEstimate_withParentEnergyEstimate_withNow__defaultOnce_37, v63);
        if (correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_38)
        {
          v55 = (void *)MEMORY[0x24BDD17C8];
          -[PLAccountingCorrectionManager parentEntryIDToChildEnergyEstimates](self, "parentEntryIDToChildEnergyEstimates");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringWithFormat:", CFSTR("parentEntryIDToChildEnergyEstimates=%@"), v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "lastPathComponent");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager correctChildEnergyEstimate:withParentEnergyEstimate:withNow:]");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "logMessage:fromFile:fromFunction:fromLineNumber:", v57, v60, v61, 83);

          PLLogCommon();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }

    }
  }

}

- (NSMutableDictionary)parentEntryIDToChildEnergyEstimates
{
  NSMutableDictionary *parentEntryIDToChildEnergyEstimates;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  parentEntryIDToChildEnergyEstimates = self->_parentEntryIDToChildEnergyEstimates;
  if (!parentEntryIDToChildEnergyEstimates)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_parentEntryIDToChildEnergyEstimates;
    self->_parentEntryIDToChildEnergyEstimates = v4;

    parentEntryIDToChildEnergyEstimates = self->_parentEntryIDToChildEnergyEstimates;
  }
  return parentEntryIDToChildEnergyEstimates;
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
  _QWORD v22[5];
  _QWORD block[5];

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__PLAccountingCorrectionManager_dependencyIDsForOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (dependencyIDsForOwner__defaultOnce_1 != -1)
      dispatch_once(&dependencyIDsForOwner__defaultOnce_1, block);
    if (dependencyIDsForOwner__classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("owner=%@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager dependencyIDsForOwner:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 144);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v3)
  {
    +[PLAccountingEngine deviceRootNodeIDs](PLAccountingEngine, "deviceRootNodeIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v3, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v13);

    objc_msgSend(v12, "addObject:", &unk_24DD019D8);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __55__PLAccountingCorrectionManager_dependencyIDsForOwner___block_invoke_87;
      v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v22[4] = v14;
      if (dependencyIDsForOwner__defaultOnce_85 != -1)
        dispatch_once(&dependencyIDsForOwner__defaultOnce_85, v22);
      if (dependencyIDsForOwner__classDebugEnabled_86)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("deviceRootNodeIDs=%@"), v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager dependencyIDsForOwner:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 150);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  _QWORD v22[5];
  _QWORD block[5];

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__PLAccountingCorrectionManager_ownerIDsForDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (ownerIDsForDependency__defaultOnce_1 != -1)
      dispatch_once(&ownerIDsForDependency__defaultOnce_1, block);
    if (ownerIDsForDependency__classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency=%@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager ownerIDsForDependency:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 156);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v3)
  {
    +[PLAccountingEngine deviceRootNodeIDs](PLAccountingEngine, "deviceRootNodeIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v3, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v13);

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __55__PLAccountingCorrectionManager_ownerIDsForDependency___block_invoke_94;
      v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v22[4] = v14;
      if (ownerIDsForDependency__defaultOnce_92 != -1)
        dispatch_once(&ownerIDsForDependency__defaultOnce_92, v22);
      if (ownerIDsForDependency__classDebugEnabled_93)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("deviceRootNodeIDs=%@"), v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager ownerIDsForDependency:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 162);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)didCorrectEnergyEstimate:(id)a3
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
    v18[2] = __58__PLAccountingCorrectionManager_didCorrectEnergyEstimate___block_invoke;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = objc_opt_class();
    if (didCorrectEnergyEstimate__defaultOnce_0 != -1)
      dispatch_once(&didCorrectEnergyEstimate__defaultOnce_0, v18);
    if (didCorrectEnergyEstimate__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energyEstimate=%@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager didCorrectEnergyEstimate:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 136);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingCorrectionManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __58__PLAccountingCorrectionManager_didCorrectEnergyEstimate___block_invoke_81;
  block[3] = &unk_24DCF9B10;
  block[4] = self;
  v17 = v4;
  v15 = v4;
  dispatch_async(v14, block);

}

- (PLAccountingCorrectionManagerDelegate)delegate
{
  return (PLAccountingCorrectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)childEnergyEstimatesForParentEntryID:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  uint64_t v39;
  _QWORD v40[5];
  _QWORD block[5];

  v3 = *(_QWORD *)&a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (childEnergyEstimatesForParentEntryID__defaultOnce != -1)
      dispatch_once(&childEnergyEstimatesForParentEntryID__defaultOnce, block);
    if (childEnergyEstimatesForParentEntryID__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("parentEntryID=%i"), v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager childEnergyEstimatesForParentEntryID:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 122);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingCorrectionManager parentEntryIDToChildEnergyEstimates](self, "parentEntryIDToChildEnergyEstimates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v15 = objc_opt_class();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke_73;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v15;
    if (childEnergyEstimatesForParentEntryID__defaultOnce_71 != -1)
      dispatch_once(&childEnergyEstimatesForParentEntryID__defaultOnce_71, v40);
    if (childEnergyEstimatesForParentEntryID__classDebugEnabled_72)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childEnergyEstimates=%@"), v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager childEnergyEstimatesForParentEntryID:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 125);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v14)
  {
    -[PLAccountingCorrectionManager parentEntryIDToChildEnergyEstimates](self, "parentEntryIDToChildEnergyEstimates");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObjectForKey:", v23);

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v24 = objc_opt_class();
      v35 = MEMORY[0x24BDAC760];
      v36 = 3221225472;
      v37 = __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke_78;
      v38 = &__block_descriptor_40_e5_v8__0lu32l8;
      v39 = v24;
      if (childEnergyEstimatesForParentEntryID__defaultOnce_76 != -1)
        dispatch_once(&childEnergyEstimatesForParentEntryID__defaultOnce_76, &v35);
      if (childEnergyEstimatesForParentEntryID__classDebugEnabled_77)
      {
        v25 = (void *)MEMORY[0x24BDD17C8];
        -[PLAccountingCorrectionManager parentEntryIDToChildEnergyEstimates](self, "parentEntryIDToChildEnergyEstimates");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("parentEntryIDToChildEnergyEstimates=%@"), v26, v35, v36, v37, v38, v39);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager childEnergyEstimatesForParentEntryID:]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 130);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    v33 = v14;
  }

  return v14;
}

uint64_t __63__PLAccountingCorrectionManager_addRootEnergyEstimate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addRootEnergyEstimate_withNow__classDebugEnabled = result;
  return result;
}

uint64_t __54__PLAccountingCorrectionManager_addEnergyMeasurement___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addEnergyMeasurement__classDebugEnabled = result;
  return result;
}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled = result;
  return result;
}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_21(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_20 = result;
  return result;
}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_26(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_25 = result;
  return result;
}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_31(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_30 = result;
  return result;
}

void __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_34(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "parentEntryIDToChildEnergyEstimates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "entryID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parentEntryIDToChildEnergyEstimates");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "entryID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  }
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 48));

}

uint64_t __93__PLAccountingCorrectionManager_correctChildEnergyEstimate_withParentEnergyEstimate_withNow___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  correctChildEnergyEstimate_withParentEnergyEstimate_withNow__classDebugEnabled_38 = result;
  return result;
}

uint64_t __50__PLAccountingCorrectionManager_disableCorrection__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  disableCorrection_objectForKey = result;
  return result;
}

+ (double)freeTimerInterval
{
  double v2;
  _QWORD v4[4];
  __CFString *v5;
  uint64_t v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__PLAccountingCorrectionManager_freeTimerInterval__block_invoke;
  v4[3] = &unk_24DCF9A50;
  v5 = CFSTR("PLAccountingCorrectionManager_freeTimerInterval");
  v6 = 0x409C200000000000;
  if (freeTimerInterval_defaultOnce_1 != -1)
    dispatch_once(&freeTimerInterval_defaultOnce_1, v4);
  v2 = *(double *)&freeTimerInterval_objectForKey_1;

  return v2;
}

uint64_t __50__PLAccountingCorrectionManager_freeTimerInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  freeTimerInterval_objectForKey_1 = v2;
  return result;
}

- (void)reloadDependenciesNewerThanDate:(id)a3
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
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  PLAccountingCorrectionManager *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id obj;
  _QWORD block[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  _QWORD v64[5];
  uint8_t buf[4];
  void *v66;
  _BYTE v67[128];
  _QWORD v68[3];

  v68[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke;
    v64[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v64[4] = v5;
    if (reloadDependenciesNewerThanDate__defaultOnce_1 != -1)
      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_1, v64);
    if (reloadDependenciesNewerThanDate__classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("date=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager reloadDependenciesNewerThanDate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 97);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "isEqualToDate:", v12);

    if ((v13 & 1) == 0)
    {
      v14 = objc_alloc(MEMORY[0x24BE75000]);
      v15 = (void *)MEMORY[0x24BDD16E0];
      v55 = v4;
      objc_msgSend(v4, "timeIntervalSince1970");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestampEnd"), v16, 3);

      objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "storage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)v17;
      v68[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "entriesForKey:withComparisons:", CFSTR("PLBatteryAgent_EventInterval_GasGauge"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0x24BE74000uLL;
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v23 = objc_opt_class();
        v63[0] = MEMORY[0x24BDAC760];
        v63[1] = 3221225472;
        v63[2] = __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke_57;
        v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v63[4] = v23;
        if (reloadDependenciesNewerThanDate__defaultOnce_55 != -1)
          dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_55, v63);
        if (reloadDependenciesNewerThanDate__classDebugEnabled_56)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gasGaugeEntries=%@"), v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager reloadDependenciesNewerThanDate:]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 105);

          PLLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

          v22 = 0x24BE74000uLL;
        }
      }
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v21;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v60;
        v33 = CFSTR("Readings");
        do
        {
          v34 = 0;
          v56 = v31;
          do
          {
            if (*(_QWORD *)v60 != v32)
              objc_enumerationMutation(obj);
            v35 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v34);
            if (objc_msgSend(*(id *)(v22 + 4016), "debugEnabled"))
            {
              v36 = objc_opt_class();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke_62;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v36;
              if (reloadDependenciesNewerThanDate__defaultOnce_60 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_60, block);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_61)
              {
                v37 = v32;
                v38 = self;
                v39 = v33;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gasGaugeEntry=%@"), v35);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Correction/PLAccountingCorrectionManager.m");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "lastPathComponent");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingCorrectionManager reloadDependenciesNewerThanDate:]");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 108);

                PLLogCommon();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v66 = v40;
                  _os_log_debug_impl(&dword_21A62B000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v22 = 0x24BE74000;
                v33 = v39;
                self = v38;
                v32 = v37;
                v31 = v56;
              }
            }
            objc_msgSend(v35, "objectForKeyedSubscript:", v33);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "intValue");

            if (v47 < 1)
            {
              v50 = 0.0;
            }
            else
            {
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("TotalPower"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "doubleValue");
              v50 = v49 / (double)v47;

            }
            -[PLAccountingCorrectionManager delegate](self, "delegate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "entryDate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v52, v53, v50);

            ++v34;
          }
          while (v31 != v34);
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v31);
      }

      v4 = v55;
    }
  }

}

uint64_t __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_1 = result;
  return result;
}

uint64_t __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke_57(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_56 = result;
  return result;
}

uint64_t __65__PLAccountingCorrectionManager_reloadDependenciesNewerThanDate___block_invoke_62(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_61 = result;
  return result;
}

uint64_t __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  childEnergyEstimatesForParentEntryID__classDebugEnabled = result;
  return result;
}

uint64_t __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke_73(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  childEnergyEstimatesForParentEntryID__classDebugEnabled_72 = result;
  return result;
}

uint64_t __70__PLAccountingCorrectionManager_childEnergyEstimatesForParentEntryID___block_invoke_78(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  childEnergyEstimatesForParentEntryID__classDebugEnabled_77 = result;
  return result;
}

uint64_t __58__PLAccountingCorrectionManager_didCorrectEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didCorrectEnergyEstimate__classDebugEnabled_0 = result;
  return result;
}

void __58__PLAccountingCorrectionManager_didCorrectEnergyEstimate___block_invoke_81(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCorrectEnergyEstimate:", *(_QWORD *)(a1 + 40));

}

uint64_t __55__PLAccountingCorrectionManager_dependencyIDsForOwner___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependencyIDsForOwner__classDebugEnabled_1 = result;
  return result;
}

uint64_t __55__PLAccountingCorrectionManager_dependencyIDsForOwner___block_invoke_87(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependencyIDsForOwner__classDebugEnabled_86 = result;
  return result;
}

uint64_t __55__PLAccountingCorrectionManager_ownerIDsForDependency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ownerIDsForDependency__classDebugEnabled_1 = result;
  return result;
}

uint64_t __55__PLAccountingCorrectionManager_ownerIDsForDependency___block_invoke_94(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ownerIDsForDependency__classDebugEnabled_93 = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setParentEntryIDToChildEnergyEstimates:(id)a3
{
  objc_storeStrong((id *)&self->_parentEntryIDToChildEnergyEstimates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentEntryIDToChildEnergyEstimates, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
