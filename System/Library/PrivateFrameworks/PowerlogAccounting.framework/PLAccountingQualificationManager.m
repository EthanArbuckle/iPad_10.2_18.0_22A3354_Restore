@implementation PLAccountingQualificationManager

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
  PLAccountingQualificationOwner *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__PLAccountingQualificationManager_addEnergyEstimate_withNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addEnergyEstimate_withNow__defaultOnce != -1)
      dispatch_once(&addEnergyEstimate_withNow__defaultOnce, block);
    if (addEnergyEstimate_withNow__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energyEstimate=%@, now=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager addEnergyEstimate:withNow:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 19);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v6 && v7)
  {
    v15 = -[PLAccountingQualificationOwner initWithEnergyEstimate:]([PLAccountingQualificationOwner alloc], "initWithEnergyEstimate:", v6);
    objc_msgSend(v6, "qualificationRuleIDSum");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "longLongValue"))
    {
      objc_msgSend(v6, "terminationRatio");
      v18 = v17;
      objc_msgSend(v6, "energy");
      v20 = v19;
      objc_msgSend(v6, "correctionEnergy");
      v22 = v18 * (v20 + v21);
      +[PLAccountingEngine minEnergy](PLAccountingEngine, "minEnergy");
      v24 = v23;

      if (v22 > v24)
      {
        -[PLAccountingOwnerDependencyManager addOwner:](self, "addOwner:", v15);
LABEL_16:
        -[PLAccountingOwnerDependencyManager notifyDependenciesWithOwner:](self, "notifyDependenciesWithOwner:", v15);

        goto LABEL_17;
      }
    }
    else
    {

    }
    if (objc_msgSend(v6, "writeToDB"))
    {
      objc_msgSend(v6, "setQualificationDate:", v7);
      -[PLAccountingQualificationManager delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "didQualifyEnergyEvent:withRootNodeID:withQualificationID:", v6, &unk_24DD014B0, &unk_24DD014B0);

    }
    goto LABEL_16;
  }
LABEL_17:

}

- (PLAccountingQualificationManagerDelegate)delegate
{
  return (PLAccountingQualificationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)addQualificationEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLAccountingQualificationDependency *v12;
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
    block[2] = __58__PLAccountingQualificationManager_addQualificationEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (addQualificationEvent__defaultOnce != -1)
      dispatch_once(&addQualificationEvent__defaultOnce, block);
    if (addQualificationEvent__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEvent=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager addQualificationEvent:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 39);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v4)
  {
    v12 = -[PLAccountingQualificationDependency initWithQualificationEvent:]([PLAccountingQualificationDependency alloc], "initWithQualificationEvent:", v4);
    +[PLAccountingQualificationRuleManager sharedInstance](PLAccountingQualificationRuleManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "qualificationID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "qualificationRulesForQualificationID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __58__PLAccountingQualificationManager_addQualificationEvent___block_invoke_20;
      v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v23[4] = v16;
      if (addQualificationEvent__defaultOnce_18 != -1)
        dispatch_once(&addQualificationEvent__defaultOnce_18, v23);
      if (addQualificationEvent__classDebugEnabled_19)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationRules=%@"), v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager addQualificationEvent:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 46);

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

- (void)closeLastQualificationEventForwardWithQualificationID:(id)a3 withEndDate:(id)a4
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
    block[2] = __102__PLAccountingQualificationManager_closeLastQualificationEventForwardWithQualificationID_withEndDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (closeLastQualificationEventForwardWithQualificationID_withEndDate__defaultOnce != -1)
      dispatch_once(&closeLastQualificationEventForwardWithQualificationID_withEndDate__defaultOnce, block);
    if (closeLastQualificationEventForwardWithQualificationID_withEndDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationID=%@, endDate=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager closeLastQualificationEventForwardWithQualificationID:withEndDate:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 58);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  v15 = objc_msgSend(v6, "intValue");
  if (v7 && v15 >= 1)
  {
    objc_msgSend(&unk_24DD03058, "objectAtIndexedSubscript:", (int)objc_msgSend(v6, "intValue"));
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
      v25[2] = __102__PLAccountingQualificationManager_closeLastQualificationEventForwardWithQualificationID_withEndDate___block_invoke_31;
      v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v25[4] = v18;
      if (closeLastQualificationEventForwardWithQualificationID_withEndDate__defaultOnce_29 != -1)
        dispatch_once(&closeLastQualificationEventForwardWithQualificationID_withEndDate__defaultOnce_29, v25);
      if (closeLastQualificationEventForwardWithQualificationID_withEndDate__classDebugEnabled_30)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("directionality=%i not allowed for closing"), v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager closeLastQualificationEventForwardWithQualificationID:withEndDate:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 63);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
  }

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
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __58__PLAccountingQualificationManager_ownerIDsForDependency___block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v4;
    if (ownerIDsForDependency__defaultOnce != -1)
      dispatch_once(&ownerIDsForDependency__defaultOnce, &block);
    if (ownerIDsForDependency__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency=%@"), v3, block, v14, v15, v16, v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager ownerIDsForDependency:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 188);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", &unk_24DD014C8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __62__PLAccountingQualificationManager_addEnergyEstimate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addEnergyEstimate_withNow__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_addQualificationEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualificationEvent__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_addQualificationEvent___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualificationEvent__classDebugEnabled_19 = result;
  return result;
}

uint64_t __102__PLAccountingQualificationManager_closeLastQualificationEventForwardWithQualificationID_withEndDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  closeLastQualificationEventForwardWithQualificationID_withEndDate__classDebugEnabled = result;
  return result;
}

uint64_t __102__PLAccountingQualificationManager_closeLastQualificationEventForwardWithQualificationID_withEndDate___block_invoke_31(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  closeLastQualificationEventForwardWithQualificationID_withEndDate__classDebugEnabled_30 = result;
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
  v4[2] = __53__PLAccountingQualificationManager_freeTimerInterval__block_invoke;
  v4[3] = &unk_24DCF9A50;
  v5 = CFSTR("PLAccountingQualificationManager_freeTimerInterval");
  v6 = 0x40A5180000000000;
  if (freeTimerInterval_defaultOnce != -1)
    dispatch_once(&freeTimerInterval_defaultOnce, v4);
  v2 = *(double *)&freeTimerInterval_objectForKey;

  return v2;
}

uint64_t __53__PLAccountingQualificationManager_freeTimerInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  freeTimerInterval_objectForKey = v2;
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
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  PLAccountingQualificationManager *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id obj;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
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
  _QWORD v114[5];
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[5];
  uint8_t v120[128];
  uint8_t buf[4];
  void *v122;
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v93 = a3;
  v5 = 0x24BE74000uLL;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v119[0] = MEMORY[0x24BDAC760];
    v119[1] = 3221225472;
    v119[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke;
    v119[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v119[4] = v6;
    if (reloadDependenciesNewerThanDate__defaultOnce != -1)
      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce, v119);
    if (reloadDependenciesNewerThanDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("date=%@"), v93);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v3, 77);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v5 = 0x24BE74000uLL;
    }
  }
  v12 = v93;
  if (v93)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v93, "isEqualToDate:", v13);

    v12 = v93;
    if ((v14 & 1) == 0)
    {
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      +[PLAccountingEngine allQualificationIDs](PLAccountingEngine, "allQualificationIDs");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
      if (v95)
      {
        v94 = *(_QWORD *)v116;
        v15 = 0x24BDD1000uLL;
        v90 = *MEMORY[0x24BE75178];
        v91 = *MEMORY[0x24BE75188];
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v116 != v94)
            {
              v17 = v16;
              objc_enumerationMutation(obj);
              v16 = v17;
            }
            v97 = v16;
            v18 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v16);
            if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
            {
              v19 = objc_opt_class();
              v114[0] = MEMORY[0x24BDAC760];
              v114[1] = 3221225472;
              v114[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_41;
              v114[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v114[4] = v19;
              if (reloadDependenciesNewerThanDate__defaultOnce_39 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_39, v114);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_40)
              {
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("qualificationID=%@"), v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "lastPathComponent");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 82);

                PLLogCommon();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v20;
                  _os_log_debug_impl(&dword_21A62B000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
            {
              v26 = objc_opt_class();
              v113[0] = MEMORY[0x24BDAC760];
              v113[1] = 3221225472;
              v113[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_46;
              v113[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v113[4] = v26;
              if (reloadDependenciesNewerThanDate__defaultOnce_44 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_44, v113);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_45)
              {
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("PLAccountingQualificationIDDirectionalities=%@"), &unk_24DD03070);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "lastPathComponent");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 85);

                PLLogCommon();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v27;
                  _os_log_debug_impl(&dword_21A62B000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            objc_msgSend(&unk_24DD03088, "objectAtIndexedSubscript:", (int)objc_msgSend(v18, "intValue"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "intValue");

            if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
            {
              v35 = objc_opt_class();
              v112[0] = MEMORY[0x24BDAC760];
              v112[1] = 3221225472;
              v112[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_55;
              v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v112[4] = v35;
              if (reloadDependenciesNewerThanDate__defaultOnce_53 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_53, v112);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_54)
              {
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("directionality=%i"), v34);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "lastPathComponent");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 87);

                PLLogCommon();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v36;
                  _os_log_debug_impl(&dword_21A62B000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            v42 = (v34 - 1);
            switch((int)v34)
            {
              case 1:
                +[PLAccountingQualificationEventForwardEntry entryKey](PLAccountingQualificationEventForwardEntry, "entryKey");
                v43 = objc_claimAutoreleasedReturnValue();
                v44 = *(void **)(v15 + 1992);
                objc_msgSend(v93, "timeIntervalSince1970");
                v89 = v45;
                v46 = v91;
                goto LABEL_39;
              case 2:
                +[PLAccountingQualificationEventBackwardEntry entryKey](PLAccountingQualificationEventBackwardEntry, "entryKey");
                v43 = objc_claimAutoreleasedReturnValue();
                v44 = *(void **)(v15 + 1992);
                objc_msgSend(v93, "timeIntervalSince1970");
                v89 = v47;
                v46 = v90;
LABEL_39:
                objc_msgSend(v44, "stringWithFormat:", CFSTR("ID >= (SELECT MIN(ID)-1 FROM '%@' WHERE (timestamp+%@) >= %f)"), v43, v46, v89);
                goto LABEL_42;
              case 3:
                +[PLAccountingQualificationEventIntervalEntry entryKey](PLAccountingQualificationEventIntervalEntry, "entryKey");
                v43 = objc_claimAutoreleasedReturnValue();
                v48 = *(void **)(v15 + 1992);
                objc_msgSend(v93, "timeIntervalSince1970");
                objc_msgSend(v48, "stringWithFormat:", CFSTR("(timestamp+%@) >= %f"), v90, v49, v88);
                goto LABEL_42;
              case 4:
                +[PLAccountingQualificationEventPointEntry entryKey](PLAccountingQualificationEventPointEntry, "entryKey");
                v43 = objc_claimAutoreleasedReturnValue();
                v50 = *(void **)(v15 + 1992);
                objc_msgSend(v93, "timeIntervalSince1970");
                objc_msgSend(v50, "stringWithFormat:", CFSTR("(timestamp+%@) >= %f"), v91, v51, v88);
LABEL_42:
                v52 = objc_claimAutoreleasedReturnValue();
                break;
              default:
                v52 = 0;
                v43 = 0;
                break;
            }
            v96 = (void *)v52;
            v98 = (void *)v43;
            objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("SELECT * FROM '%@' WHERE (%@);"), v43, v52);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
            {
              v53 = objc_opt_class();
              v111[0] = MEMORY[0x24BDAC760];
              v111[1] = 3221225472;
              v111[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_70;
              v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v111[4] = v53;
              if (reloadDependenciesNewerThanDate__defaultOnce_68 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_68, v111);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_69)
              {
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("qualificationQuery=%@"), v99);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "lastPathComponent");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v57, v58, 116);

                PLLogCommon();
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v54;
                  _os_log_debug_impl(&dword_21A62B000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "storage");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "entriesForKey:withQuery:", v98, v99);
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
            {
              v63 = objc_opt_class();
              v110[0] = MEMORY[0x24BDAC760];
              v110[1] = 3221225472;
              v110[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_76;
              v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v110[4] = v63;
              if (reloadDependenciesNewerThanDate__defaultOnce_74 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_74, v110);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_75)
              {
                v103 = v42;
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("qualificationEvents=%@"), v62);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "lastPathComponent");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v67, v68, 120);

                PLLogCommon();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = v64;
                  _os_log_debug_impl(&dword_21A62B000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v42 = v103;
              }
            }
            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            v102 = v62;
            v70 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
            if (v70)
            {
              v71 = v70;
              v104 = 0;
              v72 = *(_QWORD *)v107;
              v100 = *(_QWORD *)v107;
              do
              {
                v73 = 0;
                v101 = v71;
                do
                {
                  if (*(_QWORD *)v107 != v72)
                    objc_enumerationMutation(v102);
                  v74 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v73);
                  if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
                  {
                    v75 = objc_opt_class();
                    block[0] = MEMORY[0x24BDAC760];
                    block[1] = 3221225472;
                    block[2] = __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_81;
                    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                    block[4] = v75;
                    if (reloadDependenciesNewerThanDate__defaultOnce_79 != -1)
                      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_79, block);
                    if (reloadDependenciesNewerThanDate__classDebugEnabled_80)
                    {
                      v76 = v42;
                      v77 = v3;
                      v78 = self;
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEvent=%@, lastQualificationEvent=%@"), v74, v104);
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      v80 = (void *)MEMORY[0x24BE74FA8];
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v81, "lastPathComponent");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager reloadDependenciesNewerThanDate:]");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v80, "logMessage:fromFile:fromFunction:fromLineNumber:", v79, v82, v83, 125);

                      PLLogCommon();
                      v84 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v122 = v79;
                        _os_log_debug_impl(&dword_21A62B000, v84, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      self = v78;
                      v5 = 0x24BE74000;
                      v3 = v77;
                      v42 = v76;
                      v72 = v100;
                      v71 = v101;
                    }
                  }
                  switch((int)v42)
                  {
                    case 0:
                      -[PLAccountingQualificationManager delegate](self, "delegate");
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      v86 = v104;
                      objc_msgSend(v85, "addQualificationEventIntervalWithLastQualificationEventForward:withQualificationEventForward:", v104, v74);
                      goto LABEL_74;
                    case 1:
                      -[PLAccountingQualificationManager delegate](self, "delegate");
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      v86 = v104;
                      objc_msgSend(v85, "addQualificationEventIntervalWithLastQualificationEventBackward:withQualificationEventBackward:", v104, v74);
LABEL_74:

                      v104 = v74;
                      goto LABEL_75;
                    case 2:
                      -[PLAccountingQualificationManager delegate](self, "delegate");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v86, "addQualificationEventInterval:", v74);
                      goto LABEL_75;
                    case 3:
                      -[PLAccountingQualificationManager delegate](self, "delegate");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v86, "addQualificationEventPoint:", v74);
LABEL_75:

                      break;
                    default:
                      break;
                  }
                  ++v73;
                }
                while (v71 != v73);
                v71 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
              }
              while (v71);
            }
            else
            {
              v104 = 0;
            }

            v16 = v97 + 1;
            v15 = 0x24BDD1000;
          }
          while (v97 + 1 != v95);
          v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
          v95 = v87;
        }
        while (v87);
      }

      v12 = v93;
    }
  }

}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_41(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_40 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_45 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_55(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_54 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_70(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_69 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_76(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_75 = result;
  return result;
}

uint64_t __68__PLAccountingQualificationManager_reloadDependenciesNewerThanDate___block_invoke_81(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_80 = result;
  return result;
}

- (void)didQualifyEnergyEvent:(id)a3 withRootNodeID:(id)a4 withQualificationID:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v12 = MEMORY[0x24BDAC760];
  if (v11)
  {
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __93__PLAccountingQualificationManager_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke;
    v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v32[4] = objc_opt_class();
    if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce != -1)
      dispatch_once(&didQualifyEnergyEvent_withRootNodeID_withQualificationID__defaultOnce, v32);
    if (didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationEnergyEvent=%@, rootNodeID=%@, qualificationID=%@"), v8, v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager didQualifyEnergyEvent:withRootNodeID:withQualificationID:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 158);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  PLLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[PLAccountingQualificationManager didQualifyEnergyEvent:withRootNodeID:withQualificationID:].cold.1();

  objc_msgSend(v8, "range");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[PLAccountingQualificationManager setLastQualifiedEnergyEventDate:](self, "setLastQualifiedEnergyEventDate:", v22);

  -[PLAccountingQualificationManager delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "workQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __93__PLAccountingQualificationManager_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke_86;
  block[3] = &unk_24DCF9A78;
  block[4] = self;
  v29 = v8;
  v30 = v9;
  v31 = v10;
  v25 = v10;
  v26 = v9;
  v27 = v8;
  dispatch_async(v24, block);

}

uint64_t __93__PLAccountingQualificationManager_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didQualifyEnergyEvent_withRootNodeID_withQualificationID__classDebugEnabled = result;
  return result;
}

void __93__PLAccountingQualificationManager_didQualifyEnergyEvent_withRootNodeID_withQualificationID___block_invoke_86(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didQualifyEnergyEvent:withRootNodeID:withQualificationID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

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
    block[2] = __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (dependencyIDsForOwner__defaultOnce != -1)
      dispatch_once(&dependencyIDsForOwner__defaultOnce, block);
    if (dependencyIDsForOwner__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("owner=%@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager dependencyIDsForOwner:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 170);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v3)
  {
    +[PLAccountingQualificationRuleManager sharedInstance](PLAccountingQualificationRuleManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "qualificationRulesForRootNodeID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke_91;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v14;
      if (dependencyIDsForOwner__defaultOnce_89 != -1)
        dispatch_once(&dependencyIDsForOwner__defaultOnce_89, v45);
      if (dependencyIDsForOwner__classDebugEnabled_90)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationRules=%@"), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager dependencyIDsForOwner:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 175);

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
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "qualificationID");
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
        v38 = __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke_95;
        v39 = &__block_descriptor_40_e5_v8__0lu32l8;
        v40 = v28;
        if (dependencyIDsForOwner__defaultOnce_93 != -1)
          dispatch_once(&dependencyIDsForOwner__defaultOnce_93, &v36);
        if (dependencyIDsForOwner__classDebugEnabled_94)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationIDs=%@"), v21, v36, v37, v38, v39, v40, (_QWORD)v41);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Qualification/PLAccountingQualificationManager.m");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "lastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationManager dependencyIDsForOwner:]");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 182);

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

uint64_t __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependencyIDsForOwner__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke_91(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependencyIDsForOwner__classDebugEnabled_90 = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_dependencyIDsForOwner___block_invoke_95(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependencyIDsForOwner__classDebugEnabled_94 = result;
  return result;
}

uint64_t __58__PLAccountingQualificationManager_ownerIDsForDependency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ownerIDsForDependency__classDebugEnabled = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)lastQualifiedEnergyEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastQualifiedEnergyEventDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQualifiedEnergyEventDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didQualifyEnergyEvent:withRootNodeID:withQualificationID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21A62B000, v0, v1, "didQualifyEnergyEvent=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
