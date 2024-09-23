@implementation PLBatteryUIResponseTypeBatteryBreakdownInternal

- (BOOL)shouldShowBreakdown:(id)a3
{
  return 1;
}

- (BOOL)filterFgBg:(id)a3 filterArray:(id)a4
{
  return 0;
}

- (void)populateInternalRootNodeEnergyKeys:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  PLBatteryUIResponseTypeBatteryBreakdownInternal *v43;
  id v44;
  uint64_t v45;
  _QWORD v46[5];
  _QWORD block[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v37 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v41)
  {
    v5 = 0x1E0D7F000uLL;
    v39 = *(_QWORD *)v54;
    v43 = self;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v54 != v39)
          objc_enumerationMutation(obj);
        v42 = v6;
        v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v6);
        if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
        {
          v8 = objc_opt_class();
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke;
          v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v52[4] = v8;
          if (populateInternalRootNodeEnergyKeys__defaultOnce != -1)
            dispatch_once(&populateInternalRootNodeEnergyKeys__defaultOnce, v52);
          if (populateInternalRootNodeEnergyKeys__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntry=%@"), v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdownInternal.m");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "lastPathComponent");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdownInternal populateInternalRootNodeEnergyKeys:]");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 29);

            PLLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v9;
              _os_log_debug_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v43;
          }
        }
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[PLBatteryUIResponseTypeBatteryBreakdown getRootNodeIDToRootNodeEnergyKeys](self, "getRootNodeIDToRootNodeEnergyKeys");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
        if (v15)
        {
          v16 = v15;
          v45 = *(_QWORD *)v49;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v49 != v45)
                objc_enumerationMutation(v44);
              v18 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v17);
              if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
              {
                v19 = objc_opt_class();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke_16;
                block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                block[4] = v19;
                if (populateInternalRootNodeEnergyKeys__defaultOnce_14 != -1)
                  dispatch_once(&populateInternalRootNodeEnergyKeys__defaultOnce_14, block);
                if (populateInternalRootNodeEnergyKeys__classDebugEnabled_15)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rootNodeName=%@"), v18);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdownInternal.m");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "lastPathComponent");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdownInternal populateInternalRootNodeEnergyKeys:]");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 32);

                  PLLogCommon();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v59 = v20;
                    _os_log_debug_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v5 = 0x1E0D7F000uLL;
                }
              }
              -[PLBatteryUIResponseTypeBatteryBreakdown getRootNodeIDToRootNodeEnergyKeys](self, "getRootNodeIDToRootNodeEnergyKeys");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", v18);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
              {
                v28 = objc_opt_class();
                v46[0] = MEMORY[0x1E0C809B0];
                v46[1] = 3221225472;
                v46[2] = __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke_21;
                v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v46[4] = v28;
                if (populateInternalRootNodeEnergyKeys__defaultOnce_19 != -1)
                  dispatch_once(&populateInternalRootNodeEnergyKeys__defaultOnce_19, v46);
                if (populateInternalRootNodeEnergyKeys__classDebugEnabled_20)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rootNodeEnergyKey=%@"), v27);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdownInternal.m");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "lastPathComponent");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdownInternal populateInternalRootNodeEnergyKeys:]");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 35);

                  PLLogCommon();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v59 = v29;
                    _os_log_debug_impl(&dword_1DA9D6000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  self = v43;
                  v5 = 0x1E0D7F000;
                }
              }
              objc_msgSend(v7, "objectForKeyedSubscript:", v18);
              v35 = objc_claimAutoreleasedReturnValue();
              if (v35)
                v36 = (void *)v35;
              else
                v36 = &unk_1EA1C2018;
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, v27);

              ++v17;
            }
            while (v16 != v17);
            v16 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          }
          while (v16);
        }

        objc_msgSend(v40, "addObject:", v7);
        v6 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v41);
  }

  objc_msgSend(v37, "setObject:forKeyedSubscript:", v40, CFSTR("PLBatteryUIAppArrayKey"));
}

uint64_t __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  populateInternalRootNodeEnergyKeys__classDebugEnabled = result;
  return result;
}

uint64_t __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke_16(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  populateInternalRootNodeEnergyKeys__classDebugEnabled_15 = result;
  return result;
}

uint64_t __86__PLBatteryUIResponseTypeBatteryBreakdownInternal_populateInternalRootNodeEnergyKeys___block_invoke_21(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  populateInternalRootNodeEnergyKeys__classDebugEnabled_20 = result;
  return result;
}

- (BOOL)showRootNodesInInternal
{
  BOOL result;

  if (showRootNodesInInternal_onceToken_0 != -1)
    dispatch_once(&showRootNodesInInternal_onceToken_0, &__block_literal_global_32);
  result = showRootNodesInInternal_val_0;
  if (showRootNodesInInternal_val_0)
    return objc_msgSend((id)showRootNodesInInternal_val_0, "BOOLValue");
  return result;
}

void __74__PLBatteryUIResponseTypeBatteryBreakdownInternal_showRootNodesInInternal__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v0 = _CFPreferencesCopyValueWithContainer();
  v1 = (void *)showRootNodesInInternal_val_0;
  showRootNodesInInternal_val_0 = v0;

}

- (void)filterEnergyEntries:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PLBatteryUIResponseTypeBatteryBreakdownInternal showRootNodesInInternal](self, "showRootNodesInInternal"))
  {
    v16 = v4;
    v17 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "intValue");

          if (v12 != 5)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBatteryUIResponseTypeBatteryBreakdown getIntermediateRootNodes](self, "getIntermediateRootNodes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "containsObject:", v13);

            if ((v15 & 1) == 0 && objc_msgSend(v13, "rangeOfString:", CFSTR("AssertionPID")) == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v17, "addObject:", v10);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    v4 = v16;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("PLBatteryUIAppArrayKey"));

  }
}

@end
