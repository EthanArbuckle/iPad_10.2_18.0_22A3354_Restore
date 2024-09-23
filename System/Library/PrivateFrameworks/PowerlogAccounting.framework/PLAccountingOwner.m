@implementation PLAccountingOwner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencyIDToDependenciesInRange, 0);
  objc_storeStrong((id *)&self->_observingDependencyIDs, 0);
  objc_storeStrong((id *)&self->_runDate, 0);
  objc_storeStrong((id *)&self->_activationDate, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)activate
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  id obj;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[5];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD block[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[5];
  _QWORD v106[5];
  _BYTE v107[128];
  uint8_t v108[128];
  uint8_t buf[4];
  void *v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    v106[0] = MEMORY[0x24BDAC760];
    v106[1] = 3221225472;
    v106[2] = __29__PLAccountingOwner_activate__block_invoke;
    v106[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v106[4] = v3;
    if (activate_defaultOnce_0 != -1)
      dispatch_once(&activate_defaultOnce_0, v106);
    if (activate_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self=%@"), self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner activate]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 39);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwner manager](self, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dependencyIDsForOwner:", self);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    v105[0] = MEMORY[0x24BDAC760];
    v105[1] = 3221225472;
    v105[2] = __29__PLAccountingOwner_activate__block_invoke_14;
    v105[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v105[4] = v11;
    if (activate_defaultOnce_12_0 != -1)
      dispatch_once(&activate_defaultOnce_12_0, v105);
    if (activate_classDebugEnabled_13_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("initialObservingDependencyIDs=%@"), v84);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner activate]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 43);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = (id)objc_msgSend(v84, "copy");
  v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
  if (v87)
  {
    v86 = *(_QWORD *)v102;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v102 != v86)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v18);
        -[PLAccountingOwner manager](self, "manager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingOwner range](self, "range");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dependenciesWithDependencyID:withRange:", v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v23 = objc_opt_class();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __29__PLAccountingOwner_activate__block_invoke_19;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v23;
          if (activate_defaultOnce_17_0 != -1)
            dispatch_once(&activate_defaultOnce_17_0, block);
          if (activate_classDebugEnabled_18_0)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependencyID=%@, dependencies=%@"), v19, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "lastPathComponent");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner activate]");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 48);

            PLLogCommon();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v110 = v24;
              _os_log_debug_impl(&dword_21A62B000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v30 = v22;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v97;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v97 != v33)
                objc_enumerationMutation(v30);
              -[PLAccountingOwner addDependency:](self, "addDependency:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i));
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
          }
          while (v32);
        }

        -[PLAccountingOwner manager](self, "manager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "_lastDependencyForDependencyID:", v19);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v37 = objc_opt_class();
          v95[0] = MEMORY[0x24BDAC760];
          v95[1] = 3221225472;
          v95[2] = __29__PLAccountingOwner_activate__block_invoke_24;
          v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v95[4] = v37;
          if (activate_defaultOnce_22_0 != -1)
            dispatch_once(&activate_defaultOnce_22_0, v95);
          if (activate_classDebugEnabled_23_0)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("lastDependency=%@"), v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "lastPathComponent");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner activate]");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 57);

            PLLogCommon();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v110 = v38;
              _os_log_debug_impl(&dword_21A62B000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        if (v36)
        {
          objc_msgSend(v36, "range");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "endDate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAccountingOwner range](self, "range");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "endDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "timeIntervalSinceDate:", v47);
          v49 = v48;

          if (v49 >= -1.0)
          {
            if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
            {
              v50 = objc_opt_class();
              v94[0] = MEMORY[0x24BDAC760];
              v94[1] = 3221225472;
              v94[2] = __29__PLAccountingOwner_activate__block_invoke_29;
              v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v94[4] = v50;
              if (activate_defaultOnce_27_0 != -1)
                dispatch_once(&activate_defaultOnce_27_0, v94);
              if (activate_classDebugEnabled_28_0)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency's range has surpassed the range of this owner"));
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "lastPathComponent");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner activate]");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v54, v55, 59);

                PLLogCommon();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v110 = v51;
                  _os_log_debug_impl(&dword_21A62B000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            objc_msgSend(v84, "removeObject:", v19);
          }
        }

        ++v18;
      }
      while (v18 != v87);
      v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    }
    while (v87);
  }

  -[PLAccountingOwner setObservingDependencyIDs:](self, "setObservingDependencyIDs:", v84);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v57 = objc_opt_class();
    v93[0] = MEMORY[0x24BDAC760];
    v93[1] = 3221225472;
    v93[2] = __29__PLAccountingOwner_activate__block_invoke_34;
    v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v93[4] = v57;
    if (activate_defaultOnce_32 != -1)
      dispatch_once(&activate_defaultOnce_32, v93);
    if (activate_classDebugEnabled_33)
    {
      v58 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("observingDependencyIDs=%@"), v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "lastPathComponent");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner activate]");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "logMessage:fromFile:fromFunction:fromLineNumber:", v60, v63, v64, 66);

      PLLogCommon();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v68; ++j)
      {
        if (*(_QWORD *)v90 != v69)
          objc_enumerationMutation(v66);
        v71 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j);
        -[PLAccountingOwner manager](self, "manager");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "startObservingDependencyID:forOwner:", v71, self);

      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
    }
    while (v68);
  }

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v73 = objc_opt_class();
    v88[0] = MEMORY[0x24BDAC760];
    v88[1] = 3221225472;
    v88[2] = __29__PLAccountingOwner_activate__block_invoke_39;
    v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v88[4] = v73;
    if (activate_defaultOnce_37 != -1)
      dispatch_once(&activate_defaultOnce_37, v88);
    if (activate_classDebugEnabled_38)
    {
      v74 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "stringWithFormat:", CFSTR("observingDependencyIDs.count=%i"), objc_msgSend(v75, "count"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "lastPathComponent");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner activate]");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "logMessage:fromFile:fromFunction:fromLineNumber:", v76, v79, v80, 74);

      PLLogCommon();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "count");

  if (!v83)
    -[PLAccountingOwner allRun](self, "allRun");

}

- (PLAccountingOwnerManager)manager
{
  return (PLAccountingOwnerManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)addDependency:(id)a3
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
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  _QWORD block[5];

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__PLAccountingOwner_addDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (addDependency__defaultOnce != -1)
      dispatch_once(&addDependency__defaultOnce, block);
    if (addDependency__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self=%@, dependencyInRange=%@"), self, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner addDependency:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 139);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwner dependencyIDToDependenciesInRange](self, "dependencyIDToDependenciesInRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingOwner dependencyIDToDependenciesInRange](self, "dependencyIDToDependenciesInRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

  }
  objc_msgSend(v15, "addObject:", v4);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v27 = v6;
    v28 = 3221225472;
    v29 = __35__PLAccountingOwner_addDependency___block_invoke_72;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    v31 = objc_opt_class();
    if (addDependency__defaultOnce_70 != -1)
      dispatch_once(&addDependency__defaultOnce_70, &v27);
    if (addDependency__classDebugEnabled_71)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "ID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAccountingOwner dependencyIDToDependenciesInRange](self, "dependencyIDToDependenciesInRange");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("dependencyInRange.ID=%@, dependencyIDToDependenciesInRange=%@"), v19, v20, v27, v28, v29, v30, v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner addDependency:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 147);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

- (NSMutableDictionary)dependencyIDToDependenciesInRange
{
  NSMutableDictionary *dependencyIDToDependenciesInRange;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  dependencyIDToDependenciesInRange = self->_dependencyIDToDependenciesInRange;
  if (!dependencyIDToDependenciesInRange)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dependencyIDToDependenciesInRange;
    self->_dependencyIDToDependenciesInRange = v4;

    dependencyIDToDependenciesInRange = self->_dependencyIDToDependenciesInRange;
  }
  return dependencyIDToDependenciesInRange;
}

- (void)didReceiveDependency:(id)a3
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
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[5];
  _QWORD block[6];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveDependency__defaultOnce != -1)
      dispatch_once(&didReceiveDependency__defaultOnce, block);
    if (didReceiveDependency__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency=%@, self=%@"), v4, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner didReceiveDependency:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 81);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v4 && !-[PLAccountingOwner hasRun](self, "hasRun"))
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      v76[0] = MEMORY[0x24BDAC760];
      v76[1] = 3221225472;
      v76[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_46;
      v76[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v76[4] = v12;
      if (didReceiveDependency__defaultOnce_44 != -1)
        dispatch_once(&didReceiveDependency__defaultOnce_44, v76);
      if (didReceiveDependency__classDebugEnabled_45)
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v4, "range");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingOwner range](self, "range");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("dependency.range=%@, self.range=%@"), v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner didReceiveDependency:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 87);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v22 = objc_opt_class();
      v75[0] = MEMORY[0x24BDAC760];
      v75[1] = 3221225472;
      v75[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_51;
      v75[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v75[4] = v22;
      if (didReceiveDependency__defaultOnce_49 != -1)
        dispatch_once(&didReceiveDependency__defaultOnce_49, v75);
      if (didReceiveDependency__classDebugEnabled_50)
      {
        v23 = (void *)MEMORY[0x24BDD17C8];
        -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("observingDependencyIDs=%@"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "lastPathComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner didReceiveDependency:]");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 90);

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "containsObject:", v32);

    if (v33)
    {
      objc_msgSend(v4, "range");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAccountingOwner range](self, "range");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "overlaps:", v35);

      if (v36)
      {
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v37 = objc_opt_class();
          v74[0] = MEMORY[0x24BDAC760];
          v74[1] = 3221225472;
          v74[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_54;
          v74[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v74[4] = v37;
          if (didReceiveDependency__defaultOnce_52 != -1)
            dispatch_once(&didReceiveDependency__defaultOnce_52, v74);
          if (didReceiveDependency__classDebugEnabled_53)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency overlaps owner's range"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "lastPathComponent");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner didReceiveDependency:]");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 95);

            PLLogCommon();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingOwner addDependency:](self, "addDependency:", v4);
      }
      objc_msgSend(v4, "range");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "endDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAccountingOwner range](self, "range");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "endDate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeIntervalSinceDate:", v47);
      v49 = v48;

      if (v49 >= -1.0)
      {
        v50 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
        v51 = MEMORY[0x24BDAC760];
        if (v50)
        {
          v73[0] = MEMORY[0x24BDAC760];
          v73[1] = 3221225472;
          v73[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_59;
          v73[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v73[4] = objc_opt_class();
          if (didReceiveDependency__defaultOnce_57 != -1)
            dispatch_once(&didReceiveDependency__defaultOnce_57, v73);
          if (didReceiveDependency__classDebugEnabled_58)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency exceeds owner's range"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "lastPathComponent");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner didReceiveDependency:]");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "logMessage:fromFile:fromFunction:fromLineNumber:", v52, v55, v56, 101);

            PLLogCommon();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "removeObject:", v59);

        -[PLAccountingOwner manager](self, "manager");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "stopObservingDependencyID:forOwner:", v61, self);

        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v72[0] = v51;
          v72[1] = 3221225472;
          v72[2] = __42__PLAccountingOwner_didReceiveDependency___block_invoke_64;
          v72[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v72[4] = objc_opt_class();
          if (didReceiveDependency__defaultOnce_62 != -1)
            dispatch_once(&didReceiveDependency__defaultOnce_62, v72);
          if (didReceiveDependency__classDebugEnabled_63)
          {
            v62 = (void *)MEMORY[0x24BDD17C8];
            -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "stringWithFormat:", CFSTR("observingDependencyIDs.count=%i"), objc_msgSend(v63, "count"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            v65 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "lastPathComponent");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner didReceiveDependency:]");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v67, v68, 108);

            PLLogCommon();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "count");

        if (!v71)
          -[PLAccountingOwner allRun](self, "allRun");
      }
    }
  }

}

- (NSMutableSet)observingDependencyIDs
{
  NSMutableSet *observingDependencyIDs;
  NSMutableSet *v4;
  NSMutableSet *v5;

  observingDependencyIDs = self->_observingDependencyIDs;
  if (!observingDependencyIDs)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_observingDependencyIDs;
    self->_observingDependencyIDs = v4;

    observingDependencyIDs = self->_observingDependencyIDs;
  }
  return observingDependencyIDs;
}

- (BOOL)hasRun
{
  void *v2;
  BOOL v3;

  -[PLAccountingOwner runDate](self, "runDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSDate)runDate
{
  return self->_runDate;
}

- (void)setObservingDependencyIDs:(id)a3
{
  objc_storeStrong((id *)&self->_observingDependencyIDs, a3);
}

- (void)deactivate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __31__PLAccountingOwner_deactivate__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (deactivate_defaultOnce_0 != -1)
      dispatch_once(&deactivate_defaultOnce_0, &block);
    if (deactivate_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self=%@"), self, block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner deactivate]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 116);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingOwner allRun](self, "allRun");
}

- (void)allRun
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSDate *v10;
  NSDate *runDate;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[5];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__PLAccountingOwner_allRun__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (allRun_defaultOnce != -1)
      dispatch_once(&allRun_defaultOnce, block);
    if (allRun_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self=%@"), self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/General Owner Dependency/PLAccountingOwner.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingOwner allRun]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 151);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (!-[PLAccountingOwner hasRun](self, "hasRun"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    runDate = self->_runDate;
    self->_runDate = v10;

    -[PLAccountingOwner setRunDate:](self, "setRunDate:", self->_runDate);
    -[PLAccountingOwner run](self, "run");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[PLAccountingOwner observingDependencyIDs](self, "observingDependencyIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[PLAccountingOwner manager](self, "manager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stopObservingDependencyID:forOwner:", v17, self);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v14);
    }

    -[PLAccountingOwner setDependencyIDToDependenciesInRange:](self, "setDependencyIDToDependenciesInRange:", 0);
    -[PLAccountingOwner manager](self, "manager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "canFreeOwner:", self);

  }
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (void)setDependencyIDToDependenciesInRange:(id)a3
{
  objc_storeStrong((id *)&self->_dependencyIDToDependenciesInRange, a3);
}

- (NSNumber)ID
{
  return (NSNumber *)&unk_24DD019C0;
}

- (PLAccountingRange)range
{
  return 0;
}

- (NSDate)activationDate
{
  return 0;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_13_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_18_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_23_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_29(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_28_0 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_34(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_33 = result;
  return result;
}

uint64_t __29__PLAccountingOwner_activate__block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  activate_classDebugEnabled_38 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDependency__classDebugEnabled = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDependency__classDebugEnabled_45 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_51(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDependency__classDebugEnabled_50 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_54(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDependency__classDebugEnabled_53 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_59(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDependency__classDebugEnabled_58 = result;
  return result;
}

uint64_t __42__PLAccountingOwner_didReceiveDependency___block_invoke_64(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDependency__classDebugEnabled_63 = result;
  return result;
}

uint64_t __31__PLAccountingOwner_deactivate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  deactivate_classDebugEnabled_0 = result;
  return result;
}

uint64_t __35__PLAccountingOwner_addDependency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDependency__classDebugEnabled = result;
  return result;
}

uint64_t __35__PLAccountingOwner_addDependency___block_invoke_72(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDependency__classDebugEnabled_71 = result;
  return result;
}

uint64_t __27__PLAccountingOwner_allRun__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  allRun_classDebugEnabled = result;
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PLAccountingOwner ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingOwner range](self, "range");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(ID=%@, range=%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setID:(id)a3
{
  objc_storeStrong((id *)&self->_ID, a3);
}

- (void)setRange:(id)a3
{
  objc_storeStrong((id *)&self->_range, a3);
}

- (void)setActivationDate:(id)a3
{
  objc_storeStrong((id *)&self->_activationDate, a3);
}

- (void)setRunDate:(id)a3
{
  objc_storeStrong((id *)&self->_runDate, a3);
}

@end
