@implementation PLAccountingOwnerDependencyManager

void __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  int v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  unint64_t v57;
  void *v58;
  double v59;
  double v60;
  uint64_t v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  id obj;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  _QWORD v77[4];
  __CFString *v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD block[5];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_0 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_0, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency=%@"), *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 117);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      v90[0] = MEMORY[0x24BDAC760];
      v90[1] = 3221225472;
      v90[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_53;
      v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v90[4] = v9;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_51 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_51, v90);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_52)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 40), "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("dependency.ID=%@"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke_2");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 120);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "dependencyIDToDependencies");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v21 = objc_opt_class();
      v89[0] = MEMORY[0x24BDAC760];
      v89[1] = 3221225472;
      v89[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_59;
      v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v89[4] = v21;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_57 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_57, v89);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_58)
      {
        v22 = v20;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("before dependencies=%@"), v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke_2");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 124);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v20 = v22;
      }
    }
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dependencyIDToDependencies");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "ID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v20, v30);

    }
    objc_msgSend(v20, "addObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v31 = objc_opt_class();
      v88[0] = MEMORY[0x24BDAC760];
      v88[1] = 3221225472;
      v88[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_65;
      v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v88[4] = v31;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_63 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_63, v88);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_64)
      {
        v32 = v20;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("after dependencies=%@"), v20);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke_2");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 130);

        PLLogCommon();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v20 = v32;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "setManager:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "activate");
    v39 = *(void **)(a1 + 32);
    v40 = objc_msgSend(v39, "numDependencies");
    objc_msgSend(v39, "setNumDependencies:", (v40 + 1));
    if (v40 >= (int)objc_msgSend((id)objc_opt_class(), "maxDependencies"))
    {
      v69 = v20;
      objc_msgSend(*(id *)(a1 + 32), "dependencyIDToDependencies");
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
      v41 = 0;
      if (!v73)
        goto LABEL_55;
      v71 = *(_QWORD *)v85;
      v42 = 0x24BDBC000uLL;
      while (1)
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v85 != v71)
            objc_enumerationMutation(obj);
          v74 = v43;
          v44 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v43);
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          objc_msgSend(v72, "objectForKeyedSubscript:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v45, "copy");

          v76 = v46;
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v81;
            v75 = *(_QWORD *)v81;
            do
            {
              for (i = 0; i != v48; ++i)
              {
                if (*(_QWORD *)v81 != v49)
                  objc_enumerationMutation(v76);
                v51 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
                objc_msgSend(v51, "range");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "endDate");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v42 + 3680), "distantFuture");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v53, "isEqualToDate:", v54) & 1) != 0)
                {

                  goto LABEL_50;
                }
                if (!v41)
                {

LABEL_49:
                  v52 = v41;
                  v41 = v51;
LABEL_50:

                  continue;
                }
                objc_msgSend(v51, "activationDate");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "activationDate");
                v56 = v41;
                v57 = v42;
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "timeIntervalSinceDate:", v58);
                v60 = v59;

                v42 = v57;
                v41 = v56;

                v49 = v75;
                if (v60 < 0.0)
                  goto LABEL_49;
              }
              v48 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
            }
            while (v48);
          }

          v43 = v74 + 1;
        }
        while (v74 + 1 != v73);
        v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
        if (!v73)
        {
LABEL_55:

          if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
          {
            v61 = objc_opt_class();
            v77[0] = MEMORY[0x24BDAC760];
            v77[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_70;
            v77[3] = &unk_24DCF9AA0;
            v77[1] = 3221225472;
            v78 = CFSTR("free");
            v79 = v61;
            if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_68 != -1)
              dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce_68, v77);
            v62 = PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_69;

            if (v62)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("freeing dependency=%@"), v41);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "lastPathComponent");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addDependency:]_block_invoke_2");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "logMessage:fromFile:fromFunction:fromLineNumber:", v63, v66, v67, 148);

              PLLogCommon();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                -[PLAccountingDependency activate].cold.1();

            }
          }
          objc_msgSend(v41, "deactivate");

          v20 = v69;
          break;
        }
      }
    }

  }
}

- (void)setNumDependencies:(int)a3
{
  self->_numDependencies = a3;
}

- (int)numDependencies
{
  return self->_numDependencies;
}

- (void)startObservingOwnerID:(id)a3 forDependency:(id)a4
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
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__PLAccountingOwnerDependencyManager_startObservingOwnerID_forDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (startObservingOwnerID_forDependency__defaultOnce != -1)
      dispatch_once(&startObservingOwnerID_forDependency__defaultOnce, block);
    if (startObservingOwnerID_forDependency__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ownerID=%@, dependency=%@"), v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager startObservingOwnerID:forDependency:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 303);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwnerDependencyManager ownerIDToObservingDependencies](self, "ownerIDToObservingDependencies");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingOwnerDependencyManager ownerIDToObservingDependencies](self, "ownerIDToObservingDependencies");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v6);

  }
  objc_msgSend(v17, "addObject:", v7);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __74__PLAccountingOwnerDependencyManager_startObservingOwnerID_forDependency___block_invoke_127;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = objc_opt_class();
    if (startObservingOwnerID_forDependency__defaultOnce_125 != -1)
      dispatch_once(&startObservingOwnerID_forDependency__defaultOnce_125, v27);
    if (startObservingOwnerID_forDependency__classDebugEnabled_126)
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwnerDependencyManager ownerIDToObservingDependencies](self, "ownerIDToObservingDependencies");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("ownerIDToObservingDependencies=%@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager startObservingOwnerID:forDependency:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 311);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

- (NSMutableDictionary)ownerIDToObservingDependencies
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (id)lastOwnerForOwnerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAccountingOwnerDependencyManager ownerIDToLastOwner](self, "ownerIDToLastOwner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)ownerIDToLastOwner
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

+ (int)maxDependencies
{
  return 200;
}

- (void)canFreeDependency:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD block[5];

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__PLAccountingOwnerDependencyManager_canFreeDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (canFreeDependency__defaultOnce != -1)
      dispatch_once(&canFreeDependency__defaultOnce, block);
    if (canFreeDependency__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency=%@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager canFreeDependency:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 325);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwnerDependencyManager dependencyIDToDependencies](self, "dependencyIDToDependencies");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObject:", v4);

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __56__PLAccountingOwnerDependencyManager_canFreeDependency___block_invoke_133;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = objc_opt_class();
    if (canFreeDependency__defaultOnce_131 != -1)
      dispatch_once(&canFreeDependency__defaultOnce_131, v24);
    if (canFreeDependency__classDebugEnabled_132)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwnerDependencyManager dependencyIDToDependencies](self, "dependencyIDToDependencies");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("dependencyIDToDependencies=%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager canFreeDependency:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 328);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwnerDependencyManager setNumDependencies:](self, "setNumDependencies:", -[PLAccountingOwnerDependencyManager numDependencies](self, "numDependencies") - 1);

}

- (id)dependenciesWithDependencyID:(id)a3 withRange:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  id v57;
  id v58;
  void *v59;
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD block[6];

  v6 = a3;
  v7 = a4;
  v8 = 0x24BE74000uLL;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (dependenciesWithDependencyID_withRange__defaultOnce != -1)
      dispatch_once(&dependenciesWithDependencyID_withRange__defaultOnce, block);
    if (dependenciesWithDependencyID_withRange__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependencyID=%@, range=%@"), v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager dependenciesWithDependencyID:withRange:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 217);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v8 = 0x24BE74000uLL;
    }
  }
  -[PLAccountingOwnerDependencyManager dependencyIDToDependencies](self, "dependencyIDToDependencies");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v18 = objc_opt_class();
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_101;
    v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v62[4] = v18;
    if (dependenciesWithDependencyID_withRange__defaultOnce_99 != -1)
      dispatch_once(&dependenciesWithDependencyID_withRange__defaultOnce_99, v62);
    if (dependenciesWithDependencyID_withRange__classDebugEnabled_100)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependencies=%@"), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager dependenciesWithDependencyID:withRange:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 220);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v8 = 0x24BE74000uLL;
    }
  }
  if (v17)
  {
    objc_msgSend(v7, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 && objc_msgSend(v17, "count"))
    {
      v26 = 0;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "range");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceDate:", v25);
        v31 = v30;

        if (v31 >= 1.0)
          break;
        ++v26;
      }
      while (objc_msgSend(v17, "count") > v26);
      v8 = 0x24BE74000;
    }
    else
    {
      v26 = 0;
    }
    v59 = v7;
    if (objc_msgSend(*(id *)(v8 + 4016), "debugEnabled"))
    {
      v32 = objc_opt_class();
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_104;
      v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v61[4] = v32;
      if (dependenciesWithDependencyID_withRange__defaultOnce_102 != -1)
        dispatch_once(&dependenciesWithDependencyID_withRange__defaultOnce_102, v61);
      if (dependenciesWithDependencyID_withRange__classDebugEnabled_103)
      {
        v33 = v6;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("startIndex=%i"), v26);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "lastPathComponent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager dependenciesWithDependencyID:withRange:]");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 237);

        PLLogCommon();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v6 = v33;
        v8 = 0x24BE74000;
      }
    }
    LODWORD(v40) = objc_msgSend(v17, "count");
    v41 = (v40 - 1);
    objc_msgSend(v59, "endDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42 && (int)v26 < (int)v40)
    {
      v57 = v6;
      v40 = (int)v40;
      while (1)
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", --v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "range");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "startDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "timeIntervalSinceDate:", v45);
        v47 = v46;

        if (v47 >= 1.0)
          break;
        v41 = (v41 - 1);
        if (v40 <= (int)v26)
        {
          v41 = (v26 - 1);
          break;
        }
      }
      v6 = v57;
      v8 = 0x24BE74000uLL;
    }
    if (objc_msgSend(*(id *)(v8 + 4016), "debugEnabled"))
    {
      v48 = objc_opt_class();
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_109;
      v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v60[4] = v48;
      if (dependenciesWithDependencyID_withRange__defaultOnce_107 != -1)
        dispatch_once(&dependenciesWithDependencyID_withRange__defaultOnce_107, v60);
      if (dependenciesWithDependencyID_withRange__classDebugEnabled_108)
      {
        v58 = v6;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("endIndex=%i"), v41);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "lastPathComponent");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager dependenciesWithDependencyID:withRange:]");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "logMessage:fromFile:fromFunction:fromLineNumber:", v49, v52, v53, 251);

        PLLogCommon();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v6 = v58;
      }
    }
    if ((int)v41 >= (int)v26)
    {
      objc_msgSend(v17, "subarrayWithRange:", v26, (int)v41 - (int)v26 + 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = 0;
    }
    v7 = v59;

  }
  else
  {
    v55 = 0;
  }

  return v55;
}

- (id)_lastDependencyForDependencyID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PLAccountingOwnerDependencyManager dependencyIDToDependencies](self, "dependencyIDToDependencies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableDictionary)dependencyIDToDependencies
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)startObservingDependencyID:(id)a3 forOwner:(id)a4
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
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__PLAccountingOwnerDependencyManager_startObservingDependencyID_forOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (startObservingDependencyID_forOwner__defaultOnce != -1)
      dispatch_once(&startObservingDependencyID_forOwner__defaultOnce, block);
    if (startObservingDependencyID_forOwner__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependencyID=%@, owner=%@"), v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager startObservingDependencyID:forOwner:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 259);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwnerDependencyManager dependencyIDToObservingOwners](self, "dependencyIDToObservingOwners");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingOwnerDependencyManager dependencyIDToObservingOwners](self, "dependencyIDToObservingOwners");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v6);

  }
  objc_msgSend(v17, "addObject:", v7);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __74__PLAccountingOwnerDependencyManager_startObservingDependencyID_forOwner___block_invoke_116;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = objc_opt_class();
    if (startObservingDependencyID_forOwner__defaultOnce_114 != -1)
      dispatch_once(&startObservingDependencyID_forOwner__defaultOnce_114, v27);
    if (startObservingDependencyID_forOwner__classDebugEnabled_115)
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwnerDependencyManager dependencyIDToObservingOwners](self, "dependencyIDToObservingOwners");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("dependencyIDToObservingOwners=%@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager startObservingDependencyID:forOwner:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 267);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

- (NSMutableDictionary)dependencyIDToObservingOwners
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)stopObservingOwnerID:(id)a3 forDependency:(id)a4
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
  void *v23;
  void *v24;
  NSObject *v25;
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
    block[2] = __73__PLAccountingOwnerDependencyManager_stopObservingOwnerID_forDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (stopObservingOwnerID_forDependency__defaultOnce != -1)
      dispatch_once(&stopObservingOwnerID_forDependency__defaultOnce, block);
    if (stopObservingOwnerID_forDependency__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ownerID=%@, dependency=%@"), v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager stopObservingOwnerID:forDependency:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 317);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwnerDependencyManager ownerIDToObservingDependencies](self, "ownerIDToObservingDependencies");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObject:", v7);

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __73__PLAccountingOwnerDependencyManager_stopObservingOwnerID_forDependency___block_invoke_130;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = objc_opt_class();
    if (stopObservingOwnerID_forDependency__defaultOnce_128 != -1)
      dispatch_once(&stopObservingOwnerID_forDependency__defaultOnce_128, v26);
    if (stopObservingOwnerID_forDependency__classDebugEnabled_129)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwnerDependencyManager ownerIDToObservingDependencies](self, "ownerIDToObservingDependencies");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("ownerIDToObservingDependencies=%@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager stopObservingOwnerID:forDependency:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 320);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

- (void)stopObservingDependencyID:(id)a3 forOwner:(id)a4
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
  void *v23;
  void *v24;
  NSObject *v25;
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
    block[2] = __73__PLAccountingOwnerDependencyManager_stopObservingDependencyID_forOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (stopObservingDependencyID_forOwner__defaultOnce != -1)
      dispatch_once(&stopObservingDependencyID_forOwner__defaultOnce, block);
    if (stopObservingDependencyID_forOwner__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependencyID=%@, owner=%@"), v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager stopObservingDependencyID:forOwner:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 273);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwnerDependencyManager dependencyIDToObservingOwners](self, "dependencyIDToObservingOwners");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "removeObject:", v7);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __73__PLAccountingOwnerDependencyManager_stopObservingDependencyID_forOwner___block_invoke_119;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = objc_opt_class();
    if (stopObservingDependencyID_forOwner__defaultOnce_117 != -1)
      dispatch_once(&stopObservingDependencyID_forOwner__defaultOnce_117, v26);
    if (stopObservingDependencyID_forOwner__classDebugEnabled_118)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwnerDependencyManager dependencyIDToObservingOwners](self, "dependencyIDToObservingOwners");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("dependencyIDToObservingOwners=%@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager stopObservingDependencyID:forOwner:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 277);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

- (void)addOwner:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[PLAccountingOwnerDependencyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke;
  block[3] = &unk_24DCF9B10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

}

- (void)updateLastDependencyID:(id)a3 withEndDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PLAccountingOwnerDependencyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke;
  block[3] = &unk_24DCF9AE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async_and_wait(v8, block);

}

- (void)addDependency:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[PLAccountingOwnerDependencyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke;
  block[3] = &unk_24DCF9B10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

}

- (void)notifyOwnersWithDependency:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[PLAccountingOwnerDependencyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke;
  block[3] = &unk_24DCF9B10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

}

- (void)notifyDependenciesWithOwner:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[PLAccountingOwnerDependencyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke;
  block[3] = &unk_24DCF9B10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)canFreeOwner:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  _QWORD block[5];

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__PLAccountingOwnerDependencyManager_canFreeOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (canFreeOwner__defaultOnce != -1)
      dispatch_once(&canFreeOwner__defaultOnce, block);
    if (canFreeOwner__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("owner=%@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager canFreeOwner:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 282);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwnerDependencyManager ownersRepository](self, "ownersRepository");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObject:", v4);

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __51__PLAccountingOwnerDependencyManager_canFreeOwner___block_invoke_122;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = objc_opt_class();
    if (canFreeOwner__defaultOnce_120 != -1)
      dispatch_once(&canFreeOwner__defaultOnce_120, v22);
    if (canFreeOwner__classDebugEnabled_121)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwnerDependencyManager ownersRepository](self, "ownersRepository");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("ownersRepository=%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager canFreeOwner:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 285);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

void __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
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
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  unint64_t v41;
  int v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  id v54;
  uint64_t v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  _QWORD v63[4];
  __CFString *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD block[5];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("owner=%@"), *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 71);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      v72[0] = MEMORY[0x24BDAC760];
      v72[1] = 3221225472;
      v72[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_24;
      v72[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v72[4] = v9;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_22 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_22, v72);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_23)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 40), "ID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("owner.ID=%@"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke_2");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 74);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "ownersRepository");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", *(_QWORD *)(a1 + 40));

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      v71[0] = MEMORY[0x24BDAC760];
      v71[1] = 3221225472;
      v71[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_30;
      v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v71[4] = v19;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_28 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_28, v71);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_29)
      {
        v20 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 32), "ownersRepository");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("ownersRepository=%@"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke_2");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 78);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    v28 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "ownerIDToLastOwner");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v31 = objc_opt_class();
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_35;
      v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v70[4] = v31;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_33 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_33, v70);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_34)
      {
        v32 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 32), "ownerIDToLastOwner");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("ownerIDToLastOwner=%@"), v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "lastPathComponent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke_2");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 82);

        PLLogCommon();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "setManager:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "activate");
    objc_msgSend(*(id *)(a1 + 32), "ownersRepository");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");
    v42 = objc_msgSend((id)objc_opt_class(), "maxOwners");

    if (v41 > v42)
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "ownersRepository");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (v44)
      {
        v45 = v44;
        v46 = 0;
        v47 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v67 != v47)
              objc_enumerationMutation(v43);
            v49 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            if (!v46)
              goto LABEL_38;
            objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "activationDate");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "activationDate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "timeIntervalSinceDate:", v51);
            v53 = v52;

            if (v53 < 0.0)
            {
LABEL_38:
              v54 = v49;

              v46 = v54;
            }
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        }
        while (v45);
      }
      else
      {
        v46 = 0;
      }

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v55 = objc_opt_class();
        v63[0] = MEMORY[0x24BDAC760];
        v63[2] = __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_40;
        v63[3] = &unk_24DCF9AA0;
        v63[1] = 3221225472;
        v64 = CFSTR("free");
        v65 = v55;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_38 != -1)
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_38, v63);
        v56 = PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_39;

        if (v56)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("freeing owner=%@"), v46);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "lastPathComponent");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager addOwner:]_block_invoke_2");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "logMessage:fromFile:fromFunction:fromLineNumber:", v57, v60, v61, 96);

          PLLogCommon();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }
      objc_msgSend(v46, "deactivate");

    }
  }
}

- (NSMutableSet)ownersRepository
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

+ (int)maxOwners
{
  return 200;
}

void __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD block[5];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce_0 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce_0, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency=%@"), *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager notifyOwnersWithDependency:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 156);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke_75;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v9;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce_73 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_4_defaultOnce_73, v30);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled_74)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 32), "dependencyIDToObservingOwners");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("dependencyIDToObservingOwners=%@"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager notifyOwnersWithDependency:]_block_invoke_2");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 160);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "dependencyIDToObservingOwners");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "didReceiveDependency:", *(_QWORD *)(a1 + 40));
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v23);
    }

  }
}

void __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD block[5];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_0 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_0, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("owner=%@"), *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager notifyDependenciesWithOwner:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 104);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke_45;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v9;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_43 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_43, v30);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_44)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 32), "ownerIDToObservingDependencies");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("ownerIDToObservingDependencies=%@"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager notifyDependenciesWithOwner:]_block_invoke_2");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 108);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "ownerIDToObservingDependencies");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "ID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "didReceiveOwner:", *(_QWORD *)(a1 + 40));
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v23);
    }

  }
}

void __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
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
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD block[6];

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_0 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_0, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependencyID=%@, endDate=%@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager updateLastDependencyID:withEndDate:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 170);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if ((int)objc_msgSend(*(id *)(a1 + 40), "intValue") >= 1 && *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "dependencyIDToDependencies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
    v12 = MEMORY[0x24BDAC760];
    if (v11)
    {
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_83;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = objc_opt_class();
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_81 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_81, v41);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_82)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependencies=%@"), v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager updateLastDependencyID:withEndDate:]_block_invoke_2");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 175);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v12 = MEMORY[0x24BDAC760];
      }
    }
    if (v10)
    {
      objc_msgSend(v10, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v19;
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v40[0] = v12;
        v40[1] = 3221225472;
        v40[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_89;
        v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v40[4] = objc_opt_class();
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_87 != -1)
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_87, v40);
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_88)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastDependency=%@"), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager updateLastDependencyID:withEndDate:]_block_invoke_2");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 180);

          PLLogCommon();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

          v12 = MEMORY[0x24BDAC760];
          v19 = v38;
        }
      }
      v26 = v12;
      objc_msgSend(v19, "range");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "endDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToDate:", v29);

      v31 = v38;
      if (v30)
        objc_msgSend(v38, "updateWithEndDate:", *(_QWORD *)(a1 + 48));
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v39[0] = v26;
        v39[1] = 3221225472;
        v39[2] = __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_94;
        v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v39[4] = objc_opt_class();
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_92 != -1)
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_5_defaultOnce_92, v39);
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_93)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("after update: lastDependency=%@"), v38);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lastPathComponent");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager updateLastDependencyID:withEndDate:]_block_invoke_2");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 186);

          PLLogCommon();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

          v31 = v38;
        }
      }

    }
  }
}

- (void)freeExpiredDependenciesAtNow:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id obj;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  PLAccountingOwnerDependencyManager *v44;
  uint64_t v45;
  id v46;
  _QWORD block[4];
  __CFString *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  __CFString *v59;
  uint64_t v60;
  uint8_t buf[4];
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = 0x24BE74000uLL;
  v44 = self;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __67__PLAccountingOwnerDependencyManager_freeExpiredDependenciesAtNow___block_invoke;
    v58[3] = &unk_24DCF9AA0;
    v59 = CFSTR("free");
    v60 = v6;
    if (freeExpiredDependenciesAtNow__defaultOnce != -1)
      dispatch_once(&freeExpiredDependenciesAtNow__defaultOnce, v58);
    v7 = freeExpiredDependenciesAtNow__classDebugEnabled;

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("now=%@"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager freeExpiredDependenciesAtNow:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 368);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      self = v44;
      v5 = 0x24BE74000uLL;
    }
  }
  -[PLAccountingOwnerDependencyManager dependencyIDToDependencies](self, "dependencyIDToDependencies");
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v55;
    v43 = v4;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v55 != v39)
          objc_enumerationMutation(obj);
        v42 = v14;
        v15 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v14);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend(v40, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "copy");

        v46 = v17;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v51;
          do
          {
            v21 = 0;
            v45 = v19;
            do
            {
              if (*(_QWORD *)v51 != v20)
                objc_enumerationMutation(v46);
              v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v21);
              objc_msgSend(v22, "range");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "endDate");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "activationDate");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                objc_msgSend(v24, "laterDate:", v25);
                v26 = objc_claimAutoreleasedReturnValue();

                v25 = (void *)v26;
              }
              objc_msgSend(v4, "timeIntervalSinceDate:", v25);
              v28 = v27;
              objc_msgSend((id)objc_opt_class(), "freeTimerInterval");
              if (v28 > v29)
              {
                if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
                {
                  v30 = objc_opt_class();
                  block[0] = MEMORY[0x24BDAC760];
                  block[1] = 3221225472;
                  block[2] = __67__PLAccountingOwnerDependencyManager_freeExpiredDependenciesAtNow___block_invoke_157;
                  block[3] = &unk_24DCF9AA0;
                  v48 = CFSTR("free");
                  v49 = v30;
                  if (freeExpiredDependenciesAtNow__defaultOnce_155 != -1)
                    dispatch_once(&freeExpiredDependenciesAtNow__defaultOnce_155, block);
                  v31 = freeExpiredDependenciesAtNow__classDebugEnabled_156;

                  if (v31)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("freeing dependency=%@"), v22);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = (void *)MEMORY[0x24BE74FA8];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "lastPathComponent");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager freeExpiredDependenciesAtNow:]");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 378);

                    PLLogCommon();
                    v37 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v62 = v32;
                      _os_log_debug_impl(&dword_21A62B000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    v4 = v43;
                    v5 = 0x24BE74000;
                  }
                }
                objc_msgSend(v22, "deactivate");
                v19 = v45;
              }

              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
          }
          while (v19);
        }

        v14 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v41);
  }

}

void __42__PLAccountingOwnerDependencyManager_init__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "freeExpiredOwnersAtNow:", v2);
  objc_msgSend(*(id *)(a1 + 32), "freeExpiredDependenciesAtNow:", v2);

}

- (void)freeExpiredOwnersAtNow:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  id obj;
  uint64_t v59;
  _QWORD v60[4];
  __CFString *v61;
  uint64_t v62;
  _QWORD block[4];
  __CFString *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  __CFString *v71;
  uint64_t v72;
  _QWORD v73[4];
  __CFString *v74;
  uint64_t v75;
  uint8_t buf[4];
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = 0x24BE74000uLL;
  v56 = v4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke;
    v73[3] = &unk_24DCF9AA0;
    v74 = CFSTR("free");
    v75 = v6;
    if (freeExpiredOwnersAtNow__defaultOnce != -1)
      dispatch_once(&freeExpiredOwnersAtNow__defaultOnce, v73);
    v7 = freeExpiredOwnersAtNow__classDebugEnabled;

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("now=%@, class=%@"), v4, objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager freeExpiredOwnersAtNow:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 350);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v4 = v56;
      v5 = 0x24BE74000uLL;
    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    v70[0] = MEMORY[0x24BDAC760];
    v70[1] = 3221225472;
    v70[2] = __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_140;
    v70[3] = &unk_24DCF9AA0;
    v71 = CFSTR("free");
    v72 = v14;
    if (freeExpiredOwnersAtNow__defaultOnce_138 != -1)
      dispatch_once(&freeExpiredOwnersAtNow__defaultOnce_138, v70);
    v15 = freeExpiredOwnersAtNow__classDebugEnabled_139;

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwnerDependencyManager ownersRepository](self, "ownersRepository");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v16, "stringWithFormat:", CFSTR("ownersRepositoryCopy=%@, class=%@"), v18, objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager freeExpiredOwnersAtNow:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 352);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v4 = v56;
      v5 = 0x24BE74000uLL;
    }
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[PLAccountingOwnerDependencyManager ownersRepository](self, "ownersRepository");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");

  obj = v26;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  if (v27)
  {
    v28 = v27;
    v59 = *(_QWORD *)v67;
    do
    {
      v29 = 0;
      v57 = v28;
      do
      {
        if (*(_QWORD *)v67 != v59)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v29);
        objc_msgSend(v30, "range");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "endDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "activationDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          objc_msgSend(v32, "laterDate:", v33);
          v34 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v34;
        }
        if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
        {
          v35 = objc_opt_class();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_145;
          block[3] = &unk_24DCF9AA0;
          v64 = CFSTR("free");
          v65 = v35;
          if (freeExpiredOwnersAtNow__defaultOnce_143 != -1)
            dispatch_once(&freeExpiredOwnersAtNow__defaultOnce_143, block);
          v36 = freeExpiredOwnersAtNow__classDebugEnabled_144;

          if (v36)
          {
            v37 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v30, "activationDate");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("lastValidDate=%@, endDate=%@, activationDate=%@, class=%@"), v33, v32, v38, objc_opt_class());
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "lastPathComponent");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager freeExpiredOwnersAtNow:]");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 356);

            PLLogCommon();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v77 = v39;
              _os_log_debug_impl(&dword_21A62B000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v4 = v56;
            v28 = v57;
            v5 = 0x24BE74000uLL;
          }
        }
        objc_msgSend(v4, "timeIntervalSinceDate:", v33);
        v46 = v45;
        objc_msgSend((id)objc_opt_class(), "freeTimerInterval");
        if (v46 > v47)
        {
          if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
          {
            v48 = objc_opt_class();
            v60[0] = MEMORY[0x24BDAC760];
            v60[1] = 3221225472;
            v60[2] = __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_150;
            v60[3] = &unk_24DCF9AA0;
            v61 = CFSTR("free");
            v62 = v48;
            if (freeExpiredOwnersAtNow__defaultOnce_148 != -1)
              dispatch_once(&freeExpiredOwnersAtNow__defaultOnce_148, v60);
            v49 = freeExpiredOwnersAtNow__classDebugEnabled_149;

            if (v49)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("freeing owner=%@, class=%@"), v30, objc_opt_class());
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwnerDependencyManager.m");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "lastPathComponent");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwnerDependencyManager freeExpiredOwnersAtNow:]");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "logMessage:fromFile:fromFunction:fromLineNumber:", v50, v53, v54, 360);

              PLLogCommon();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v77 = v50;
                _os_log_debug_impl(&dword_21A62B000, v55, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v4 = v56;
              v28 = v57;
              v5 = 0x24BE74000;
            }
          }
          objc_msgSend(v30, "deactivate");
        }

        ++v29;
      }
      while (v28 != v29);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    }
    while (v28);
  }

}

- (PLAccountingOwnerDependencyManager)init
{
  PLAccountingOwnerDependencyManager *v2;
  uint64_t v3;
  OS_dispatch_queue *workQueue;
  uint64_t v5;
  NSMutableDictionary *dependencyIDToObservingOwners;
  uint64_t v7;
  NSMutableDictionary *dependencyIDToDependencies;
  uint64_t v9;
  NSMutableDictionary *ownerIDToObservingDependencies;
  uint64_t v11;
  NSMutableDictionary *ownerIDToLastOwner;
  uint64_t v13;
  NSMutableSet *ownersRepository;
  id v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  PLAccountingOwnerDependencyManager *v23;
  uint64_t v24;
  PLTimer *freeTimer;
  int v26;
  void *v27;
  objc_class *v28;
  void *v29;
  __CFString *v30;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t block;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  __CFString *v37;
  uint64_t v38;
  _QWORD v39[4];
  PLAccountingOwnerDependencyManager *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)PLAccountingOwnerDependencyManager;
  v2 = -[PLAccountingOwnerDependencyManager init](&v41, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE74FF8], "workQueueForClass:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    dependencyIDToObservingOwners = v2->_dependencyIDToObservingOwners;
    v2->_dependencyIDToObservingOwners = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    dependencyIDToDependencies = v2->_dependencyIDToDependencies;
    v2->_dependencyIDToDependencies = (NSMutableDictionary *)v7;

    v2->_numDependencies = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    ownerIDToObservingDependencies = v2->_ownerIDToObservingDependencies;
    v2->_ownerIDToObservingDependencies = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    ownerIDToLastOwner = v2->_ownerIDToLastOwner;
    v2->_ownerIDToLastOwner = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    ownersRepository = v2->_ownersRepository;
    v2->_ownersRepository = (NSMutableSet *)v13;

    v15 = objc_alloc(MEMORY[0x24BE74FF0]);
    v16 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend((id)objc_opt_class(), "freeTimerInterval");
    objc_msgSend(v16, "dateWithTimeIntervalSinceNow:", v17 * 0.25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "freeTimerInterval");
    v20 = v19 * 0.25;
    -[PLAccountingOwnerDependencyManager workQueue](v2, "workQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __42__PLAccountingOwnerDependencyManager_init__block_invoke;
    v39[3] = &unk_24DCFA038;
    v23 = v2;
    v40 = v23;
    v24 = objc_msgSend(v15, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v18, 1, 0, v21, v39, v20, 0.0);
    freeTimer = v23->_freeTimer;
    v23->_freeTimer = (PLTimer *)v24;

    block = v22;
    v34 = 3221225472;
    v35 = __42__PLAccountingOwnerDependencyManager_init__block_invoke_2;
    v36 = &unk_24DCF9AA0;
    v37 = CFSTR("free");
    v38 = objc_opt_class();
    if (init_defaultOnce != -1)
      dispatch_once(&init_defaultOnce, &block);
    v26 = init_classDebugEnabled;

    if (v26)
    {
      v27 = (void *)MEMORY[0x24BDD17C8];
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("com.apple.powerlogd.%@.testFree"), v29, block, v34, v35, v36);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v23, (CFNotificationCallback)testFree, v30, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    }
  }
  return v2;
}

uint64_t __42__PLAccountingOwnerDependencyManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  init_classDebugEnabled = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0 = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_23 = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_29 = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_34 = result;
  return result;
}

uint64_t __47__PLAccountingOwnerDependencyManager_addOwner___block_invoke_40(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_39 = result;
  return result;
}

uint64_t __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_0 = result;
  return result;
}

uint64_t __66__PLAccountingOwnerDependencyManager_notifyDependenciesWithOwner___block_invoke_45(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_44 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_0 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_53(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_52 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_59(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_58 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_65(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_64 = result;
  return result;
}

uint64_t __52__PLAccountingOwnerDependencyManager_addDependency___block_invoke_70(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_classDebugEnabled_69 = result;
  return result;
}

uint64_t __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled_0 = result;
  return result;
}

uint64_t __65__PLAccountingOwnerDependencyManager_notifyOwnersWithDependency___block_invoke_75(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_4_classDebugEnabled_74 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_0 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_83(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_82 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_89(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_88 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_updateLastDependencyID_withEndDate___block_invoke_94(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_5_classDebugEnabled_93 = result;
  return result;
}

- (id)dependencyIDsForOwner:(id)a3
{
  return 0;
}

- (id)lastDependencyForDependencyID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[PLAccountingOwnerDependencyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__PLAccountingOwnerDependencyManager_lastDependencyForDependencyID___block_invoke;
  block[3] = &unk_24DCFA060;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_async_and_wait(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __68__PLAccountingOwnerDependencyManager_lastDependencyForDependencyID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_lastDependencyForDependencyID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependenciesWithDependencyID_withRange__classDebugEnabled = result;
  return result;
}

uint64_t __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_101(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependenciesWithDependencyID_withRange__classDebugEnabled_100 = result;
  return result;
}

uint64_t __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_104(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependenciesWithDependencyID_withRange__classDebugEnabled_103 = result;
  return result;
}

uint64_t __77__PLAccountingOwnerDependencyManager_dependenciesWithDependencyID_withRange___block_invoke_109(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependenciesWithDependencyID_withRange__classDebugEnabled_108 = result;
  return result;
}

uint64_t __74__PLAccountingOwnerDependencyManager_startObservingDependencyID_forOwner___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startObservingDependencyID_forOwner__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLAccountingOwnerDependencyManager_startObservingDependencyID_forOwner___block_invoke_116(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startObservingDependencyID_forOwner__classDebugEnabled_115 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_stopObservingDependencyID_forOwner___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopObservingDependencyID_forOwner__classDebugEnabled = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_stopObservingDependencyID_forOwner___block_invoke_119(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopObservingDependencyID_forOwner__classDebugEnabled_118 = result;
  return result;
}

uint64_t __51__PLAccountingOwnerDependencyManager_canFreeOwner___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  canFreeOwner__classDebugEnabled = result;
  return result;
}

uint64_t __51__PLAccountingOwnerDependencyManager_canFreeOwner___block_invoke_122(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  canFreeOwner__classDebugEnabled_121 = result;
  return result;
}

- (id)ownerIDsForDependency:(id)a3
{
  return 0;
}

uint64_t __74__PLAccountingOwnerDependencyManager_startObservingOwnerID_forDependency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startObservingOwnerID_forDependency__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLAccountingOwnerDependencyManager_startObservingOwnerID_forDependency___block_invoke_127(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startObservingOwnerID_forDependency__classDebugEnabled_126 = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_stopObservingOwnerID_forDependency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopObservingOwnerID_forDependency__classDebugEnabled = result;
  return result;
}

uint64_t __73__PLAccountingOwnerDependencyManager_stopObservingOwnerID_forDependency___block_invoke_130(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopObservingOwnerID_forDependency__classDebugEnabled_129 = result;
  return result;
}

uint64_t __56__PLAccountingOwnerDependencyManager_canFreeDependency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  canFreeDependency__classDebugEnabled = result;
  return result;
}

uint64_t __56__PLAccountingOwnerDependencyManager_canFreeDependency___block_invoke_133(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  canFreeDependency__classDebugEnabled_132 = result;
  return result;
}

+ (double)freeTimerInterval
{
  return 0.0;
}

uint64_t __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  freeExpiredOwnersAtNow__classDebugEnabled = result;
  return result;
}

uint64_t __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_140(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  freeExpiredOwnersAtNow__classDebugEnabled_139 = result;
  return result;
}

uint64_t __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_145(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  freeExpiredOwnersAtNow__classDebugEnabled_144 = result;
  return result;
}

uint64_t __61__PLAccountingOwnerDependencyManager_freeExpiredOwnersAtNow___block_invoke_150(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  freeExpiredOwnersAtNow__classDebugEnabled_149 = result;
  return result;
}

uint64_t __67__PLAccountingOwnerDependencyManager_freeExpiredDependenciesAtNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  freeExpiredDependenciesAtNow__classDebugEnabled = result;
  return result;
}

uint64_t __67__PLAccountingOwnerDependencyManager_freeExpiredDependenciesAtNow___block_invoke_157(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  freeExpiredDependenciesAtNow__classDebugEnabled_156 = result;
  return result;
}

- (void)setDependencyIDToObservingOwners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setDependencyIDToDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setOwnerIDToObservingDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setOwnerIDToLastOwner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setOwnersRepository:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLTimer)freeTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFreeTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeTimer, 0);
  objc_storeStrong((id *)&self->_ownersRepository, 0);
  objc_storeStrong((id *)&self->_ownerIDToLastOwner, 0);
  objc_storeStrong((id *)&self->_ownerIDToObservingDependencies, 0);
  objc_storeStrong((id *)&self->_dependencyIDToDependencies, 0);
  objc_storeStrong((id *)&self->_dependencyIDToObservingOwners, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
