@implementation PLBatteryUIResponseTypeUtilities

+ (void)applyStaticNameTransformation:(id)a3 withResponderService:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  NSObject *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  NSObject *v49;
  double v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  double v70;
  __int16 v71;
  double v72;
  __int16 v73;
  uint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PLBatteryUIResponseTypeUtilities getBundleIDToReplacementBundleIDMap](PLBatteryUIResponseTypeUtilities, "getBundleIDToReplacementBundleIDMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:](PLBatteryUIResponseTypeUtilities, "getBundleIDToDisplayNameMapWithResponderService:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v7)
  {
    PLLogCommon();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:].cold.1();
    goto LABEL_43;
  }
  if (!v8)
  {
    PLLogCommon();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:].cold.2();
LABEL_43:

    goto LABEL_44;
  }
  v60 = (void *)v8;
  v61 = v6;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v62 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (!v11)
    goto LABEL_38;
  v12 = v11;
  v13 = *(_QWORD *)v66;
  v64 = *MEMORY[0x1E0D22C78];
  v14 = 0x1E0CB3000uLL;
  v63 = v10;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v66 != v13)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.springboard.lockscreen.navigation")))
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(v14 + 2024);
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(v19, "numberWithDouble:", -v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

LABEL_10:
        goto LABEL_34;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.PassbookUIService")))
      {
        objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1EA1DA5C8, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
      }
      else if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v64, CFSTR("aod"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v17, "isEqualToString:", v22);

        if (v23)
        {
          PLLogCommon();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v70 = *(double *)&v17;
            v71 = 2112;
            v72 = *(double *)&v16;
            _os_log_debug_impl(&dword_1DA9D6000, v24, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: processing aod entry with bundleID=%@, energyEntry=%@", buf, 0x16u);
          }

          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));

          v26 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doubleValue");
          objc_msgSend(v26, "numberWithDouble:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, CFSTR("PLBatteryUIAppAlwaysOnRuntimeOriginalKey"));

          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          objc_msgSend(v29, "numberWithDouble:");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v31, CFSTR("AlwaysOnEnergyBeforeClamp"));

          objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1EA1DA5C8, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          PLLogCommon();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v70 = *(double *)&v55;
            v71 = 2112;
            v72 = *(double *)&v56;
            v73 = 2112;
            v74 = (uint64_t)v17;
            _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: Subtracting foregroundPluggedInTime=%@ from alwaysOnRuntime=%@ for bundleID=%@", buf, 0x20u);

          }
          v33 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "doubleValue");
          v36 = v35;
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "doubleValue");
          v39 = v36 - v38;

          if (v39 >= 0.0)
            v40 = v39;
          else
            v40 = 0.0;
          objc_msgSend(v33, "numberWithDouble:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v41, CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));

          PLLogCommon();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeOriginalKey"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v70 = *(double *)&v57;
            v71 = 2112;
            v72 = *(double *)&v58;
            _os_log_debug_impl(&dword_1DA9D6000, v42, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: After subtracting plugged in time, alwaysOnRuntime=%@, alwaysOnRuntimeOriginal=%@", buf, 0x16u);

          }
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "doubleValue");
          v45 = v44;

          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "doubleValue");
          v48 = v47 / 3600.0;

          PLLogCommon();
          v49 = objc_claimAutoreleasedReturnValue();
          v10 = v63;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218496;
            v70 = v45;
            v71 = 2048;
            v72 = v48;
            v73 = 2048;
            v74 = 0x4075E00000000000;
            _os_log_debug_impl(&dword_1DA9D6000, v49, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: AODEnergy=%f, AODUnpluggedTime=%f, kAODModeledPowerUpperBound=%f", buf, 0x20u);
          }

          if (v48 > 0.0)
          {
            v50 = v45 / v48;
            if (v45 / v48 > 350.0)
            {
              PLLogCommon();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:].cold.4();

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48 * 350.0);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v52, CFSTR("PLBatteryUIAppEnergyValueKey"));

              PLLogCommon();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:].cold.3();

            }
          }
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"), v50);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("AlwaysOnEnergy"));
          goto LABEL_10;
        }
      }
LABEL_34:
      objc_msgSend(v7, "objectForKeyedSubscript:", v17);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (v54)
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v54, CFSTR("PLBatteryUIAppBundleIDKey"));

      v14 = 0x1E0CB3000;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  }
  while (v12);
LABEL_38:

  v5 = v62;
  +[PLBatteryUIResponseTypeUtilities collapseEnergyEntries:](PLBatteryUIResponseTypeUtilities, "collapseEnergyEntries:", v62);
  v9 = v60;
  v6 = v61;
LABEL_44:

}

+ (void)applyDynamicNameTransformation:(id)a3 withResponderService:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = a3;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities transformDeletedApps:withResponderService:](PLBatteryUIResponseTypeUtilities, "transformDeletedApps:withResponderService:", v6, v5);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities transformPlugins:withResponderService:](PLBatteryUIResponseTypeUtilities, "transformPlugins:withResponderService:", v7, v5);

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities reaccountBackupRestore:](PLBatteryUIResponseTypeUtilities, "reaccountBackupRestore:", v8);

  +[PLBatteryUIResponseTypeUtilities collapseEnergyEntries:](PLBatteryUIResponseTypeUtilities, "collapseEnergyEntries:", v9);
}

+ (void)transformDeletedApps:(id)a3 withResponderService:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  id obj;
  const __CFString *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PLBatteryUIResponseTypeUtilities getDeletedAppBundleIDsWithResponderService:](PLBatteryUIResponseTypeUtilities, "getDeletedAppBundleIDsWithResponderService:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities getDeletedAppClipBundleIDsWithResponderService:](PLBatteryUIResponseTypeUtilities, "getDeletedAppClipBundleIDsWithResponderService:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
  {
    v23 = v6;
    v25 = v8;
    if (objc_msgSend(v8, "count") && objc_msgSend(v7, "count"))
    {
      v9 = CFSTR("DeletedAppAndAppClip");
    }
    else if (objc_msgSend(v7, "count"))
    {
      v9 = CFSTR("DeletedApp");
    }
    else
    {
      v10 = objc_msgSend(v8, "count");
      v9 = CFSTR("DeletedAppClip");
      if (!v10)
        v9 = 0;
    }
    v27 = v9;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v5;
    obj = v5;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      v14 = CFSTR("Unspecified");
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "containsObject:", v17))
          {

          }
          else
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v18 = v14;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v25, "containsObject:", v19);

            v14 = v18;
            if (!v20)
              goto LABEL_19;
          }
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, CFSTR("PLBatteryUIAppBundleIDKey"));
LABEL_19:
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "containsString:", v14);

          if (v22)
            objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("DeletedApp"), CFSTR("PLBatteryUIAppBundleIDKey"));
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v12);
    }

    v6 = v23;
    v5 = v24;
    v8 = v25;
  }

}

+ (void)transformPlugins:(id)a3 withResponderService:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
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
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  double v48;
  double v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  NSObject *obj;
  uint64_t v64;
  void *v65;
  _QWORD v66[5];
  _QWORD block[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:](PLBatteryUIResponseTypeUtilities, "getPluginBundleIDToEntryMapWithResponderService:", a4);
  v6 = objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities getBundleIDToReplacementBundleIDMap](PLBatteryUIResponseTypeUtilities, "getBundleIDToReplacementBundleIDMap");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)v6;
  if (v6)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v5;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    if (v7)
    {
      v8 = v7;
      v58 = v5;
      v64 = *(_QWORD *)v69;
      v61 = *MEMORY[0x1E0D22C78];
      while (1)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v69 != v64)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v9);
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v11 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __74__PLBatteryUIResponseTypeUtilities_transformPlugins_withResponderService___block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v11;
            if (transformPlugins_withResponderService__defaultOnce != -1)
              dispatch_once(&transformPlugins_withResponderService__defaultOnce, block);
            if (transformPlugins_withResponderService__classDebugEnabled)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntry=%@"), v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "lastPathComponent");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBatteryUIResponseTypeUtilities transformPlugins:withResponderService:]");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 184);

              PLLogCommon();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v73 = v12;
                _os_log_debug_impl(&dword_1DA9D6000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

            }
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v20 = objc_opt_class();
              v66[0] = MEMORY[0x1E0C809B0];
              v66[1] = 3221225472;
              v66[2] = __74__PLBatteryUIResponseTypeUtilities_transformPlugins_withResponderService___block_invoke_53;
              v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v66[4] = v20;
              if (transformPlugins_withResponderService__defaultOnce_51 != -1)
                dispatch_once(&transformPlugins_withResponderService__defaultOnce_51, v66);
              if (transformPlugins_withResponderService__classDebugEnabled_52)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this is a plugin"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "lastPathComponent");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBatteryUIResponseTypeUtilities transformPlugins:withResponderService:]");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 189);

                PLLogCommon();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v73 = v21;
                  _os_log_debug_impl(&dword_1DA9D6000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PluginId"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.AppStore.ProductPageExtension"));

            if ((v28 & 1) == 0)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PluginParentApp"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.sidecar.extension.capture")))
              {
                +[PLBatteryUIResponseTypeUtilities getEnergyEntry:forBundleID:](PLBatteryUIResponseTypeUtilities, "getEnergyEntry:forBundleID:", obj, v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v31 = 0;
              }
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("PLBatteryUIAppBundleIDKey"));
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PluginType"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.watchkit"));

              if (v33)
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                v34 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v34, CFSTR("WatchEnergy"));
                goto LABEL_39;
              }
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PluginType"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.widgetkit-extension"));

              if (v36)
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v37, CFSTR("ChronoWidgetEnergy"));

                PLLogCommon();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "doubleValue");
                  *(_DWORD *)buf = 138412546;
                  v73 = v38;
                  v74 = 2048;
                  v75 = v40;
                  _os_log_debug_impl(&dword_1DA9D6000, v34, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: Widget Energy for %@ : %f", buf, 0x16u);

                  goto LABEL_53;
                }
                goto LABEL_39;
              }
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PluginType"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.posterkit.provider"));

              if (v42)
              {
                if (!v30)
                {
                  objc_msgSend(v62, "objectForKeyedSubscript:", v61);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", v43, CFSTR("PLBatteryUIAppBundleIDKey"));

                }
                v44 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));
                PLLogCommon();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v73) = v44;
                  _os_log_debug_impl(&dword_1DA9D6000, v45, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: isPhotosPoster=%d", buf, 8u);
                }

                if (v44)
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobileslideshow"), CFSTR("PLBatteryUIAppBundleIDKey"));
                PLLogCommon();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "doubleValue");
                  v52 = v51;
                  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "doubleValue");
                  v54 = v53;
                  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "doubleValue");
                  *(_DWORD *)buf = 138413314;
                  v73 = v29;
                  v74 = 2112;
                  v75 = v38;
                  v76 = 2048;
                  v77 = v52;
                  v78 = 2048;
                  v79 = v54;
                  v80 = 2048;
                  v81 = v56;
                  _os_log_debug_impl(&dword_1DA9D6000, v34, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: Mapping Poster %@ to %@ – energy:%f, foregroundRunTime:%f, bgRunTime:%f", buf, 0x34u);

LABEL_53:
                }
LABEL_39:

              }
              if (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.sidecar.extension.capture")))
              {
                objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("ContinuityCamera"), CFSTR("PLBatteryUIAppBundleIDKey"));
                PLLogCommon();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v73 = v31;
                  v74 = 2112;
                  v75 = v10;
                  _os_log_debug_impl(&dword_1DA9D6000, v46, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: continuityParentAppEnergyEntry=%@, energyEntry=%@", buf, 0x16u);
                }

                if (v31)
                {
                  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "doubleValue");
                  v49 = v48;

                  if (v49 > 0.0)
                  {
                    objc_msgSend(v31, "setObject:forKeyedSubscript:", CFSTR("ContinuityCamera"), CFSTR("PLBatteryUIAppBundleIDKey"));
                    objc_msgSend(v31, "setObject:forKeyedSubscript:", &unk_1EA1BFB10, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
                  }
                }
                PLLogCommon();
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v73 = v10;
                  _os_log_debug_impl(&dword_1DA9D6000, v50, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: After adjusting Continuity Camera extension energyEntry=%@", buf, 0xCu);
                }

              }
            }
          }

          ++v9;
        }
        while (v8 != v9);
        v57 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
        v8 = v57;
        if (!v57)
        {
          v5 = v58;
          break;
        }
      }
    }
  }
  else
  {
    PLLogCommon();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      +[PLBatteryUIResponseTypeUtilities transformPlugins:withResponderService:].cold.1();
  }

}

uint64_t __74__PLBatteryUIResponseTypeUtilities_transformPlugins_withResponderService___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  transformPlugins_withResponderService__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLBatteryUIResponseTypeUtilities_transformPlugins_withResponderService___block_invoke_53(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  transformPlugins_withResponderService__classDebugEnabled_52 = result;
  return result;
}

+ (void)reaccountExchangeEntries:(id)a3 withExchangeBundleIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  double v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v44 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v58 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      }
      while (v11);
    }

    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("com.apple.activesync"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      if (v21 != 0.0)
      {
        v42 = v18;
        v55 = 0u;
        v56 = 0u;
        v54 = 0u;
        v53 = 0u;
        v22 = v44;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        v43 = v5;
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v54;
          v26 = 0.0;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v54 != v25)
                objc_enumerationMutation(v22);
              -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j), v42);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (v28)
              {
                objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "doubleValue");
                v32 = v31;

                if (v32 >= 0.0)
                  v33 = v32;
                else
                  v33 = 0.0;
                v26 = v26 + v33;
              }

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          }
          while (v24);
        }
        else
        {
          v26 = 0.0;
        }

        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v34 = v22;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v50;
          v38 = MEMORY[0x1E0C809B0];
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v50 != v37)
                objc_enumerationMutation(v34);
              -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k), v42);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v40;
              if (v40)
              {
                v45[0] = v38;
                v45[1] = 3221225472;
                v45[2] = __83__PLBatteryUIResponseTypeUtilities_reaccountExchangeEntries_withExchangeBundleIDs___block_invoke;
                v45[3] = &unk_1EA16D510;
                v46 = v40;
                v47 = v21;
                v48 = v26;
                objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v45);

              }
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
          }
          while (v36);
        }

        v18 = v42;
        objc_msgSend(v9, "removeObject:", v42);
        v5 = v43;
      }
    }

    v7 = v44;
  }
  else
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[PLBatteryUIResponseTypeUtilities reaccountExchangeEntries:withExchangeBundleIDs:].cold.1();
  }

}

void __83__PLBatteryUIResponseTypeUtilities_reaccountExchangeEntries_withExchangeBundleIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v9, "rangeOfString:", CFSTR("AppTypeKey")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v9, "rangeOfString:", CFSTR("time")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v6, "numberWithDouble:", v7 * (*(double *)(a1 + 40) / *(double *)(a1 + 48) + 1.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

+ (void)reaccountBackupRestore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Backup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Restore"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14 && v15)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Backup & Restore"), CFSTR("PLBatteryUIAppBundleIDKey"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Backup & Restore"), CFSTR("PLBatteryUIAppNameKey"));
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __59__PLBatteryUIResponseTypeUtilities_reaccountBackupRestore___block_invoke;
      v21 = &unk_1EA16D538;
      v22 = v14;
      v17 = v16;
      v23 = v17;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", &v18);
      objc_msgSend(v6, "removeObject:", v17, v18, v19, v20, v21);

    }
  }

}

void __59__PLBatteryUIResponseTypeUtilities_reaccountBackupRestore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v12, "rangeOfString:", CFSTR("AppTypeKey")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v12, "rangeOfString:", CFSTR("time")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v6, "numberWithDouble:", v8 + v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v12);

  }
}

+ (void)collapseEnergyEntries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v16[0] = MEMORY[0x1E0C809B0];
            v16[1] = 3221225472;
            v16[2] = __58__PLBatteryUIResponseTypeUtilities_collapseEnergyEntries___block_invoke;
            v16[3] = &unk_1EA16D560;
            v17 = v4;
            v18 = v11;
            objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v16);

          }
          else
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIAppArrayKey"));

}

void __58__PLBatteryUIResponseTypeUtilities_collapseEnergyEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("NotificationInfo")))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NotificationInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v5;
    if (!v8 || v7)
    {
      objc_msgSend(v7, "combineWith:", v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("NotificationInfo"));

    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v16, "rangeOfString:", CFSTR("AppTypeKey")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "doubleValue");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v10, "numberWithDouble:", v12 + v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

LABEL_9:
  }

}

+ (id)getEnergyEntry:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PLBatteryUIResponseTypeUtilities_getEnergyEntry_forBundleID___block_invoke;
  v10[3] = &unk_1EA16D588;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __63__PLBatteryUIResponseTypeUtilities_getEnergyEntry_forBundleID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (void)replaceBundleIDsWithDisplayNamesForEnergyEntryInBucket:(id)a3 withResponderService:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:](PLBatteryUIResponseTypeUtilities, "getBundleIDToDisplayNameMapWithResponderService:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIAppNameKey"));

        }
        else
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("PLBatteryUIAppNameKey"));
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

+ (void)addEntryTypesToEnergyEntriesInBucket:(id)a3 withResponderService:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[PLBatteryUIResponseTypeUtilities getRootNodeBundleIDs](PLBatteryUIResponseTypeUtilities, "getRootNodeBundleIDs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities getNonAppBundleIDs](PLBatteryUIResponseTypeUtilities, "getNonAppBundleIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities getWebAppBundleIDsWithResponderService:](PLBatteryUIResponseTypeUtilities, "getWebAppBundleIDsWithResponderService:", v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v6;
  +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:](PLBatteryUIResponseTypeUtilities, "getBundleIDToDisplayNameMapWithResponderService:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA1BFB10, CFSTR("PLBatteryUITotalAccountedEnergyKey"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalAccountedEnergyKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        objc_msgSend(v12, "numberWithDouble:", v15 + v17);
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("PLBatteryUITotalAccountedEnergyKey"));

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v18) = objc_msgSend(v32, "containsObject:", v19);

        v20 = &unk_1EA1BFB28;
        if ((v18 & 1) == 0)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v30, "containsObject:", v21);

          v20 = &unk_1EA1BFB40;
          if ((v22 & 1) == 0)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v29, "containsObject:", v23);

            v20 = &unk_1EA1BFB58;
            if ((v24 & 1) == 0)
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
                v20 = &unk_1EA1BFB10;
              else
                v20 = &unk_1EA1BFB70;
            }
          }
        }
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("PLBatteryUIAppTypeKey"));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v8);
  }

}

+ (id)getRootNodeBundleIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA1DB080);
}

+ (id)getNonAppBundleIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA1DB098);
}

+ (void)filterEnergyEntriesByAppTypeFromBucket:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        if (v12 != 2 && v12 != 5)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PLBatteryUIAppArrayKey"));
}

+ (void)filterEnergyEntriesWithRuntimes:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  const __CFString *v16;
  void *v17;
  double v18;
  double v19;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  BOOL v28;
  void *v29;
  double v30;
  double v31;
  BOOL v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v40 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v43;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v8);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "intValue") == 1)
        {

LABEL_9:
          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HLS")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("Siri")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("DeletedApp")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("DeletedAppClip")) & 1) != 0
            || objc_msgSend(v10, "isEqualToString:", CFSTR("DeletedAppAndAppClip")))
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "doubleValue");
            v15 = v14;

            if (v15 < 60.0)
            {
              v16 = CFSTR("PLBatteryUIAppForegroundRuntimeKey");
              if (v15 > 0.0)
                goto LABEL_16;
            }
          }
          else
          {
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("Flashlight")))
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "doubleValue");
              v31 = v30;

              if (v31 >= 60.0)
                goto LABEL_17;
              v32 = v31 <= 0.0;
            }
            else
            {
              if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp")))
                goto LABEL_17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "doubleValue");
              v35 = v34;

              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "doubleValue");
              v38 = v37;

              if (v35 >= 60.0)
                goto LABEL_17;
              v32 = v38 <= 2.0;
            }
            v16 = CFSTR("PLBatteryUIAppBackgroundRuntimeKey");
            if (!v32)
              goto LABEL_16;
          }
LABEL_17:
          objc_msgSend(v4, "addObject:", v9, v16);
          goto LABEL_18;
        }
        v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp"));

        if ((v12 & 1) != 0)
          goto LABEL_9;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        if (!+[PLBatteryUIResponseTypeUtilities energyEntryHasNegligibleEnergyDrain:filterArray:](PLBatteryUIResponseTypeUtilities, "energyEntryHasNegligibleEnergyDrain:filterArray:", v9, v4))
        {
          if (v19 > 0.0 && v19 < 60.0)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doubleValue");
            v23 = v22;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 60.0 / v19 * v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));

            objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA1BFB88, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v27 = v26;

          v28 = v27 > 0.0 && v27 < 60.0;
          v16 = CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey");
          if (!v28)
            goto LABEL_17;
LABEL_16:
          objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA1BFB88);
          goto LABEL_17;
        }
LABEL_18:

        ++v8;
      }
      while (v6 != v8);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v6 = v39;
    }
    while (v39);
  }

  objc_msgSend(v40, "setObject:forKeyedSubscript:", v4, CFSTR("PLBatteryUIAppArrayKey"));
}

+ (BOOL)energyEntryHasNegligibleEnergyDrain:(id)a3 filterArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  BOOL v25;
  NSObject *v26;
  int v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  if (v16 <= 0.0)
  {
    if (v10 == 0.0 && v13 < 60.0)
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.findmy")))
      {
        objc_msgSend(&unk_1EA1DB0B0, "objectAtIndexedSubscript:", 59);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19;

        if (v20 > 0.0)
        {
          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            +[PLBatteryUIResponseTypeUtilities energyEntryHasNegligibleEnergyDrain:filterArray:].cold.1(v21);

          objc_msgSend(v6, "addObject:", v5);
        }
      }
LABEL_15:
      v25 = 1;
      goto LABEL_16;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PowerOutAccessories")))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      if (v24 < 33.3)
      {
        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412546;
          v29 = v7;
          v30 = 2048;
          v31 = v24;
          _os_log_impl(&dword_1DA9D6000, v26, OS_LOG_TYPE_DEFAULT, "removing %@ due to energy: %.2f", (uint8_t *)&v28, 0x16u);
        }

        goto LABEL_15;
      }
    }
  }
  v25 = 0;
LABEL_16:

  return v25;
}

+ (id)getDeletedAppBundleIDsWithResponderService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  int v44;
  _BYTE v45[128];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sharedUtilityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DeletedAppBundleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      +[PLBatteryUIResponseTypeUtilities getDeletedAppBundleIDsWithResponderService:].cold.2();

    objc_msgSend(v3, "sharedUtilityCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("DeletedAppBundleIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
      +[PLBatteryUIResponseTypeUtilities getDeletedAppBundleIDsWithResponderService:].cold.1();

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v12, OS_LOG_TYPE_DEFAULT, "Searching for deleted app names", buf, 2u);
    }

    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppDeletedDate"), &unk_1EA1BFB10, 1);
    v35 = v3;
    objc_msgSend(v3, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v14;
    v46[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v13;
    objc_msgSend(v15, "entriesForKey:withComparisons:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v17;
      _os_log_impl(&dword_1DA9D6000, v18, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppIsClip"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = objc_msgSend(v26, "intValue");
            *(_DWORD *)buf = 138412546;
            v42 = v25;
            v43 = 1024;
            v44 = v28;
            _os_log_impl(&dword_1DA9D6000, v27, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
          }

          if (v25 && (objc_msgSend(v26, "BOOLValue") & 1) == 0)
            objc_msgSend(v36, "addObject:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v21);
    }

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v36;
      _os_log_impl(&dword_1DA9D6000, v29, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
    }

    v3 = v35;
    objc_msgSend(v35, "sharedUtilityCache");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v36, CFSTR("DeletedAppBundleIDs"));

    v11 = (void *)objc_msgSend(v36, "copy");
    v10 = v33;
    v9 = v34;
  }

  return v11;
}

+ (id)getDeletedAppClipBundleIDsWithResponderService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  int v44;
  _BYTE v45[128];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sharedUtilityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("DeletedAppClipBundleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      +[PLBatteryUIResponseTypeUtilities getDeletedAppClipBundleIDsWithResponderService:].cold.2();

    objc_msgSend(v3, "sharedUtilityCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("DeletedAppClipBundleIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
      +[PLBatteryUIResponseTypeUtilities getDeletedAppClipBundleIDsWithResponderService:].cold.1();

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v12, OS_LOG_TYPE_DEFAULT, "Battery UI Response Type Utilities: Searching for deleted app clip names", buf, 2u);
    }

    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppDeletedDate"), &unk_1EA1BFB10, 1);
    v35 = v3;
    objc_msgSend(v3, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v14;
    v46[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v13;
    objc_msgSend(v15, "entriesForKey:withComparisons:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v17;
      _os_log_impl(&dword_1DA9D6000, v18, OS_LOG_TYPE_DEFAULT, "Battery UI Response Type Utilities: DeletedAppEntries = %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppIsClip"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = objc_msgSend(v26, "intValue");
            *(_DWORD *)buf = 138412546;
            v42 = v25;
            v43 = 1024;
            v44 = v28;
            _os_log_impl(&dword_1DA9D6000, v27, OS_LOG_TYPE_DEFAULT, "Battery UI Response Type Utilities: bundleID=%@, appIsClip=%d", buf, 0x12u);
          }

          if (v25 && objc_msgSend(v26, "BOOLValue"))
            objc_msgSend(v36, "addObject:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v21);
    }

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v36;
      _os_log_impl(&dword_1DA9D6000, v29, OS_LOG_TYPE_DEFAULT, "Battery UI Response Type Utilities: DeletedAppNames = %@", buf, 0xCu);
    }

    v3 = v35;
    objc_msgSend(v35, "sharedUtilityCache");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v36, CFSTR("DeletedAppClipBundleIDs"));

    v11 = (void *)objc_msgSend(v36, "copy");
    v10 = v33;
    v9 = v34;
  }

  return v11;
}

+ (id)getWebAppBundleIDsWithResponderService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sharedUtilityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WebAppBundleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      +[PLBatteryUIResponseTypeUtilities getWebAppBundleIDsWithResponderService:].cold.2();

    objc_msgSend(v3, "sharedUtilityCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("WebAppBundleIDs"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
      +[PLBatteryUIResponseTypeUtilities getWebAppBundleIDsWithResponderService:].cold.1();

    objc_msgSend(MEMORY[0x1E0D7FFC0], "entryKeyForOperatorName:withType:withName:", CFSTR("PLXPCAgent"), *MEMORY[0x1E0D80378], CFSTR("WebApp"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v3, "storage", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entriesForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("identifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("identifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "sharedUtilityCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v10, CFSTR("WebAppBundleIDs"));

    v11 = objc_msgSend(v10, "copy");
  }
  v23 = (void *)v11;

  return v23;
}

+ (id)getPluginBundleIDToEntryMapWithResponderService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id obj;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[5];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD block[5];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[5];
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  _BYTE v83[128];
  _QWORD v84[4];

  v84[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sharedUtilityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("PluginBundleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      +[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:].cold.3();

    objc_msgSend(v3, "sharedUtilityCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("PluginBundleIDs"));
    v65 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
      +[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:].cold.2();

    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllPlugins"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("PluginDeletedDate"), &unk_1EA1BFB10, 0);
    objc_msgSend(v3, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)v12;
    v84[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v11;
    objc_msgSend(v13, "entriesForKey:withComparisons:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0x1E0D7F000uLL;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v17 = objc_opt_class();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke;
      v79[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v79[4] = v17;
      if (getPluginBundleIDToEntryMapWithResponderService__defaultOnce != -1)
        dispatch_once(&getPluginBundleIDToEntryMapWithResponderService__defaultOnce, v79);
      if (getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("installedPluginEntries=%@"), v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 683);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          +[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:].cold.1((uint64_t)v18, v23);

        v16 = 0x1E0D7F000uLL;
      }
    }
    v63 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v15;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    v65 = v24;
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v76;
      do
      {
        v28 = 0;
        v67 = v26;
        do
        {
          if (*(_QWORD *)v76 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v28);
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("PluginId"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v31 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke_301;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v31;
            if (getPluginBundleIDToEntryMapWithResponderService__defaultOnce_299 != -1)
              dispatch_once(&getPluginBundleIDToEntryMapWithResponderService__defaultOnce_299, block);
            if (getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled_300)
            {
              v32 = v27;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pluginBundleID=%@"), v30);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "lastPathComponent");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:]");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 688);

              PLLogCommon();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v82 = v33;
                _os_log_debug_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v24 = v65;
              v16 = 0x1E0D7F000uLL;
              v27 = v32;
              v26 = v67;
            }
          }
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, v30);

          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v26);
    }

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    +[PLBatteryUIResponseTypeUtilities getInstalledPluginEntries](PLBatteryUIResponseTypeUtilities, "getInstalledPluginEntries");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    if (v40)
    {
      v41 = v40;
      v68 = *(_QWORD *)v71;
      v64 = v39;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v71 != v68)
            objc_enumerationMutation(v39);
          v43 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v42);
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PluginId"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PluginParentApp"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v46)
          {
            if (objc_msgSend(*(id *)(v16 + 4000), "debugEnabled"))
            {
              v47 = objc_opt_class();
              v69[0] = MEMORY[0x1E0C809B0];
              v69[1] = 3221225472;
              v69[2] = __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke_306;
              v69[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v69[4] = v47;
              if (getPluginBundleIDToEntryMapWithResponderService__defaultOnce_304 != -1)
                dispatch_once(&getPluginBundleIDToEntryMapWithResponderService__defaultOnce_304, v69);
              if (getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled_305)
              {
                v48 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PluginExecutableName"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PluginType"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "stringWithFormat:", CFSTR("pluginExecutableName=%@, pluginBundleID=%@, pluginParentApp=%@, pluginType=%@"), v49, v44, v45, v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();

                v52 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "lastPathComponent");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:]");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v54, v55, 699);

                PLLogCommon();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v82 = v51;
                  _os_log_debug_impl(&dword_1DA9D6000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v24 = v65;
                v16 = 0x1E0D7F000;
                v39 = v64;
              }
            }
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v43, v44);
          }

          ++v42;
        }
        while (v41 != v42);
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      }
      while (v41);
    }

    v57 = v24;
    v3 = v63;
    objc_msgSend(v63, "sharedUtilityCache");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setObject:forKeyedSubscript:", v57, CFSTR("PluginBundleIDs"));

    v10 = v61;
    v9 = v62;
  }

  return v65;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled = result;
  return result;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke_301(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled_300 = result;
  return result;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke_306(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled_305 = result;
  return result;
}

+ (id)getBundleIDToDisplayNameMapWithResponderService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD block[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  _QWORD v80[4];

  v80[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sharedUtilityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("BundleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!v6)
  {
    if (v8)
      +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:].cold.4();

    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppDeletedDate"), &unk_1EA1BFB10, 0);
    v62 = v3;
    objc_msgSend(v3, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)v13;
    v80[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)v12;
    objc_msgSend(v14, "entriesForKey:withComparisons:", v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:].cold.3((uint64_t)v16, v17);

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    v20 = 0x1E0D7F000uLL;
    v64 = v18;
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v73;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v73 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v23);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppType"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "intValue");

          if (v26 == 101
            || (objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppBundleId")),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp")),
                v27,
                v28))
          {
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppName"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*(id *)(v20 + 4000), "debugEnabled"))
            {
              v31 = objc_opt_class();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __84__PLBatteryUIResponseTypeUtilities_getBundleIDToDisplayNameMapWithResponderService___block_invoke;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v31;
              if (getBundleIDToDisplayNameMapWithResponderService__defaultOnce != -1)
                dispatch_once(&getBundleIDToDisplayNameMapWithResponderService__defaultOnce, block);
              if (getBundleIDToDisplayNameMapWithResponderService__classDebugEnabled)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@, displayName=%@"), v29, v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "lastPathComponent");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:]");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 733);

                PLLogCommon();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v32;
                  _os_log_debug_impl(&dword_1DA9D6000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v18 = v64;
                v20 = 0x1E0D7F000;
              }
            }
            objc_msgSend(v65, "setObject:forKeyedSubscript:", v30, v29);

          }
          else
          {
            PLLogCommon();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:].cold.2();
          }

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    v40 = 0x1EA16B000uLL;
    if (!v39)
    {
LABEL_51:
      objc_msgSend(v65, "setObject:forKeyedSubscript:", CFSTR("Apple Watch"), CFSTR("com.apple.Bridge"));
      v11 = (void *)objc_msgSend(v65, "copy");

      v9 = v61;
      v3 = v62;
      v10 = v60;
      goto LABEL_52;
    }
    v41 = v39;
    v42 = *(_QWORD *)v68;
    v63 = v38;
LABEL_30:
    v43 = 0;
    while (1)
    {
      if (*(_QWORD *)v68 != v42)
        objc_enumerationMutation(v38);
      v44 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v43);
      if ((objc_msgSend(v44, "mayBeBUIVisible") & 1) != 0
        || (objc_msgSend(v44, "bundleIdentifier"),
            v45 = (void *)objc_claimAutoreleasedReturnValue(),
            v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp")),
            v45,
            v46))
      {
        if ((objc_msgSend(*(id *)(v40 + 2320), "hasScreenPresence:", v44) & 1) == 0)
        {
          objc_msgSend(v44, "bundleIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp"));

          if (!v48)
            goto LABEL_49;
        }
        objc_msgSend(v44, "bundleIdentifier");
        v49 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v50)
        {
          objc_msgSend(v44, "localizedName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v52 = objc_opt_class();
            v66[0] = MEMORY[0x1E0C809B0];
            v66[1] = 3221225472;
            v66[2] = __84__PLBatteryUIResponseTypeUtilities_getBundleIDToDisplayNameMapWithResponderService___block_invoke_322;
            v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v66[4] = v52;
            if (getBundleIDToDisplayNameMapWithResponderService__defaultOnce_320 != -1)
              dispatch_once(&getBundleIDToDisplayNameMapWithResponderService__defaultOnce_320, v66);
            if (getBundleIDToDisplayNameMapWithResponderService__classDebugEnabled_321)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@, displayName=%@"), v49, v51);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "lastPathComponent");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:]");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "logMessage:fromFile:fromFunction:fromLineNumber:", v53, v56, v57, 751);

              PLLogCommon();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v53;
                _os_log_debug_impl(&dword_1DA9D6000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v40 = 0x1EA16B000;
              v38 = v63;
            }
          }
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v51, v49);

        }
      }
      else
      {
        PLLogCommon();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:].cold.1();
      }

LABEL_49:
      if (v41 == ++v43)
      {
        v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        if (!v41)
          goto LABEL_51;
        goto LABEL_30;
      }
    }
  }
  if (v8)
    +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:].cold.5();

  objc_msgSend(v3, "sharedUtilityCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BatteryBreakdown"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("BundleIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:

  return v11;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getBundleIDToDisplayNameMapWithResponderService___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getBundleIDToDisplayNameMapWithResponderService__classDebugEnabled = result;
  return result;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getBundleIDToDisplayNameMapWithResponderService___block_invoke_322(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getBundleIDToDisplayNameMapWithResponderService__classDebugEnabled_321 = result;
  return result;
}

+ (id)getInstalledPluginEntries
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v35;
    v30 = *MEMORY[0x1E0D80388];
    do
    {
      v6 = 0;
      v31 = v4;
      do
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v6);
        objc_msgSend(v7, "bundleIdentifier");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_20;
        v9 = (void *)v8;
        objc_msgSend(v7, "executableURL");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_19;
        v11 = (void *)v10;
        objc_msgSend(v7, "containingBundleRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_12;
        objc_msgSend(v7, "containingBundleRecord");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v32 = 0;
LABEL_12:
          v15 = v5;
          v16 = v2;
          objc_msgSend(v7, "extensionPointRecord");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.posterkit.provider"));

          if (!v12)
          {

            v2 = v16;
            v5 = v15;
            v4 = v31;
            if (!v14)
              goto LABEL_20;
LABEL_17:
            v19 = objc_alloc(MEMORY[0x1E0D7FFB0]);
            +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v30, CFSTR("AllPlugins"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)objc_msgSend(v19, "initWithEntryKey:", v20);

            objc_msgSend(v7, "bundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("PluginId"));

            objc_msgSend(v7, "containingBundleRecord");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "bundleIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("PluginParentApp"));

            objc_msgSend(v7, "extensionPointRecord");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("PluginType"));

            objc_msgSend(v7, "executableURL");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "path");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("PluginExecutableName"));

            objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA1BFB10, CFSTR("PluginDeletedDate"));
            if (!v9)
              goto LABEL_20;
            objc_msgSend(v29, "addObject:", v9);
LABEL_19:

            goto LABEL_20;
          }
          v2 = v16;
          v5 = v15;
          v4 = v31;
          v13 = v32;
          goto LABEL_14;
        }
        LOBYTE(v14) = 1;
LABEL_14:
        v32 = v13;

        if ((v14 & 1) != 0)
          goto LABEL_17;
LABEL_20:
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v4);
  }

  return v29;
}

+ (id)getBundleIDToReplacementBundleIDMap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[29];
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  const __CFString *v101;
  const __CFString *v102;
  const __CFString *v103;
  const __CFString *v104;
  const __CFString *v105;
  const __CFString *v106;
  const __CFString *v107;
  const __CFString *v108;
  const __CFString *v109;
  const __CFString *v110;
  const __CFString *v111;
  const __CFString *v112;
  const __CFString *v113;
  const __CFString *v114;
  const __CFString *v115;
  const __CFString *v116;
  const __CFString *v117;
  const __CFString *v118;
  const __CFString *v119;
  const __CFString *v120;
  const __CFString *v121;
  const __CFString *v122;
  const __CFString *v123;
  const __CFString *v124;
  const __CFString *v125;
  const __CFString *v126;
  const __CFString *v127;
  const __CFString *v128;
  const __CFString *v129;
  const __CFString *v130;
  const __CFString *v131;
  const __CFString *v132;
  const __CFString *v133;
  const __CFString *v134;
  const __CFString *v135;
  const __CFString *v136;
  const __CFString *v137;
  const __CFString *v138;
  const __CFString *v139;
  const __CFString *v140;
  const __CFString *v141;
  const __CFString *v142;
  const __CFString *v143;
  const __CFString *v144;
  const __CFString *v145;
  const __CFString *v146;
  const __CFString *v147;
  const __CFString *v148;
  const __CFString *v149;
  _QWORD v150[171];

  v150[169] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("IMRemoteURLConn");
  v10[1] = CFSTR("IMRemoteURLConne");
  v150[0] = CFSTR("com.apple.MobileSMS");
  v150[1] = CFSTR("com.apple.MobileSMS");
  v10[2] = CFSTR("com.apple.mobilesms.notification");
  v10[3] = CFSTR("GenerativePlaygroundApp.MessagesExtension");
  v150[2] = CFSTR("com.apple.MobileSMS");
  v150[3] = CFSTR("com.apple.MobileSMS");
  v10[4] = CFSTR("com.apple.GenerativePlaygroundApp.MessagesExtension");
  v10[5] = CFSTR("mstreamd");
  v150[4] = CFSTR("com.apple.MobileSMS");
  v150[5] = CFSTR("com.apple.mobileslideshow");
  v10[6] = CFSTR("mediastream.mstreamd");
  v10[7] = CFSTR("assetsd");
  v150[6] = CFSTR("com.apple.mobileslideshow");
  v150[7] = CFSTR("com.apple.mobileslideshow");
  v10[8] = CFSTR("cloudphotod");
  v10[9] = CFSTR("com.apple.mobileslideshow.Discretionary");
  v150[8] = CFSTR("com.apple.mobileslideshow");
  v150[9] = CFSTR("com.apple.mobileslideshow");
  v10[10] = CFSTR("com.apple.icloud-container.com.apple.photos.cloud");
  v10[11] = CFSTR("com.apple.photoanalysisd");
  v150[10] = CFSTR("com.apple.mobileslideshow");
  v150[11] = CFSTR("com.apple.mobileslideshow");
  v10[12] = CFSTR("com.apple.photoanalysisd.backgroundanalysis");
  v10[13] = CFSTR("com.apple.photos.cloud");
  v150[12] = CFSTR("com.apple.mobileslideshow");
  v150[13] = CFSTR("com.apple.mobileslideshow");
  v10[14] = CFSTR("WirelessRadioManager");
  v10[15] = CFSTR("WirelessRadioManagerd");
  v150[14] = CFSTR("com.apple.mobilephone");
  v150[15] = CFSTR("com.apple.mobilephone");
  v10[16] = CFSTR("WirelessRadioMa");
  v10[17] = CFSTR("vmd");
  v150[16] = CFSTR("com.apple.mobilephone");
  v150[17] = CFSTR("com.apple.mobilephone");
  v10[18] = CFSTR("ipTelephony");
  v10[19] = CFSTR("ContactsUI.MonogramPosterExtension");
  v150[18] = CFSTR("com.apple.mobilephone");
  v150[19] = CFSTR("com.apple.mobilephone");
  v10[20] = CFSTR("com.apple.ContactsUI.MonogramPosterExtension");
  v10[21] = CFSTR("com.apple.MailCompositionService");
  v150[20] = CFSTR("com.apple.mobilephone");
  v150[21] = CFSTR("com.apple.mobilemail");
  v10[22] = CFSTR("MailCompositionService");
  v10[23] = CFSTR("suggestd");
  v150[22] = CFSTR("com.apple.mobilemail");
  v150[23] = CFSTR("com.apple.mobilemail");
  v10[24] = CFSTR("email.maild");
  v10[25] = CFSTR("com.apple.email.maild");
  v150[24] = CFSTR("com.apple.mobilemail");
  v150[25] = CFSTR("com.apple.mobilemail");
  v10[26] = CFSTR("maild");
  v10[27] = CFSTR("com.apple.springboard.lockscreen.navigation");
  v150[26] = CFSTR("com.apple.mobilemail");
  v150[27] = CFSTR("com.apple.Maps");
  v2 = *MEMORY[0x1E0D22C88];
  v10[28] = CFSTR("com.apple.Siri");
  v11 = v2;
  v150[28] = CFSTR("Siri");
  v150[29] = CFSTR("Siri");
  v12 = CFSTR("assistantd");
  v13 = CFSTR("com.apple.WebKit.Networking");
  v150[30] = CFSTR("Siri");
  v150[31] = CFSTR("com.apple.mobilesafari");
  v14 = CFSTR("com.apple.WebKit.WebContent");
  v15 = CFSTR("com.apple.WebKit");
  v150[32] = CFSTR("com.apple.mobilesafari");
  v150[33] = CFSTR("com.apple.mobilesafari");
  v16 = CFSTR("com.apple.WebKi");
  v17 = CFSTR("com.apple.SafariViewService");
  v150[34] = CFSTR("com.apple.mobilesafari");
  v150[35] = CFSTR("com.apple.mobilesafari");
  v18 = CFSTR("safarifetcherd");
  v19 = CFSTR("com.apple.WebKit.WebContent.CaptivePortal");
  v150[36] = CFSTR("com.apple.mobilesafari");
  v150[37] = CFSTR("com.apple.mobilesafari");
  v20 = CFSTR("com.apple.WebKit.WebContent.Development");
  v21 = CFSTR("com.apple.WebKit.GPU");
  v150[38] = CFSTR("com.apple.mobilesafari");
  v150[39] = CFSTR("com.apple.mobilesafari");
  v22 = CFSTR("com.apple.WebKit.GPU.Development");
  v23 = CFSTR("com.apple.PassKitCore");
  v150[40] = CFSTR("com.apple.mobilesafari");
  v150[41] = CFSTR("com.apple.Passbook");
  v24 = CFSTR("passd");
  v25 = CFSTR("PassbookUIService");
  v150[42] = CFSTR("com.apple.Passbook");
  v150[43] = CFSTR("com.apple.Passbook");
  v26 = CFSTR("com.apple.PassbookUIService");
  v27 = CFSTR("com.apple.calendar");
  v150[44] = CFSTR("com.apple.Passbook");
  v150[45] = CFSTR("com.apple.mobilecal");
  v3 = *MEMORY[0x1E0DAB668];
  v28 = CFSTR("calaccessd");
  v29 = v3;
  v150[46] = CFSTR("com.apple.mobilecal");
  v150[47] = CFSTR("HLS");
  v4 = *MEMORY[0x1E0DAB658];
  v30 = *MEMORY[0x1E0DAB690];
  v31 = v4;
  v150[48] = CFSTR("HLS");
  v150[49] = CFSTR("HLS");
  v5 = *MEMORY[0x1E0D22C78];
  v32 = *MEMORY[0x1E0DAB6A0];
  v150[50] = CFSTR("HLS");
  v150[51] = CFSTR("HLS");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v5, CFSTR("aod"), CFSTR("IMRemoteURLConn"), CFSTR("IMRemoteURLConne"), CFSTR("com.apple.mobilesms.notification"), CFSTR("GenerativePlaygroundApp.MessagesExtension"), CFSTR("com.apple.GenerativePlaygroundApp.MessagesExtension"), CFSTR("mstreamd"), CFSTR("mediastream.mstreamd"), CFSTR("assetsd"), CFSTR("cloudphotod"), CFSTR("com.apple.mobileslideshow.Discretionary"), CFSTR("com.apple.icloud-container.com.apple.photos.cloud"), CFSTR("com.apple.photoanalysisd"), CFSTR("com.apple.photoanalysisd.backgroundanalysis"), CFSTR("com.apple.photos.cloud"),
    CFSTR("WirelessRadioManager"),
    CFSTR("WirelessRadioManagerd"),
    CFSTR("WirelessRadioMa"),
    CFSTR("vmd"),
    CFSTR("ipTelephony"),
    CFSTR("ContactsUI.MonogramPosterExtension"),
    CFSTR("com.apple.ContactsUI.MonogramPosterExtension"),
    CFSTR("com.apple.MailCompositionService"),
    CFSTR("MailCompositionService"),
    CFSTR("suggestd"),
    CFSTR("email.maild"),
    CFSTR("com.apple.email.maild"),
    CFSTR("maild"),
    CFSTR("com.apple.springboard.lockscreen.navigation"),
    CFSTR("com.apple.Siri"),
    v11,
    CFSTR("assistantd"),
    CFSTR("com.apple.WebKit.Networking"),
    CFSTR("com.apple.WebKit.WebContent"),
    CFSTR("com.apple.WebKit"),
    CFSTR("com.apple.WebKi"),
    CFSTR("com.apple.SafariViewService"),
    CFSTR("safarifetcherd"),
    CFSTR("com.apple.WebKit.WebContent.CaptivePortal"),
    CFSTR("com.apple.WebKit.WebContent.Development"),
    CFSTR("com.apple.WebKit.GPU"),
    CFSTR("com.apple.WebKit.GPU.Development"),
    CFSTR("com.apple.PassKitCore"),
    CFSTR("passd"),
    CFSTR("PassbookUIService"),
    CFSTR("com.apple.PassbookUIService"),
    CFSTR("com.apple.calendar"),
    CFSTR("calaccessd"),
    v29,
    v30,
    v31,
    v32,
    v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D22C70];
  v33 = v6;
  v34 = v7;
  v150[52] = CFSTR("HLS");
  v150[53] = CFSTR("HLS");
  v35 = *MEMORY[0x1E0D22C80];
  v36 = CFSTR("LockScreen");
  v150[54] = CFSTR("HLS");
  v150[55] = CFSTR("HLS");
  v37 = CFSTR("com.apple.PosterBoard");
  v38 = CFSTR("PosterBoard");
  v150[56] = CFSTR("HLS");
  v150[57] = CFSTR("HLS");
  v39 = CFSTR("com.apple.MobileBackup.framework");
  v40 = CFSTR("backupd");
  v150[58] = CFSTR("Backup");
  v150[59] = CFSTR("Backup");
  v41 = CFSTR("com.apple.backupd");
  v42 = CFSTR("softwareupdateservicesd");
  v150[60] = CFSTR("Backup");
  v150[61] = CFSTR("Backup");
  v43 = CFSTR("mobile.softwareupdated");
  v44 = CFSTR("com.apple.Restore");
  v150[62] = CFSTR("Backup");
  v150[63] = CFSTR("com.apple.AppStore");
  v45 = CFSTR("com.apple.atc");
  v150[64] = CFSTR("com.apple.AppStore");
  v46 = CFSTR("installd");
  v150[65] = CFSTR("com.apple.AppStore");
  v47 = CFSTR("com.apple.StreamingUnzipService");
  v150[66] = CFSTR("com.apple.AppStore");
  v48 = CFSTR("containermanagerd");
  v150[67] = CFSTR("com.apple.AppStore");
  v49 = CFSTR("appstored");
  v150[68] = CFSTR("com.apple.AppStore");
  v50 = CFSTR("OOS");
  v150[69] = CFSTR("PoorCellCondition");
  v51 = CFSTR("healthd");
  v150[70] = CFSTR("com.apple.Health");
  v52 = CFSTR("com.apple.healthappd");
  v150[71] = CFSTR("com.apple.Health");
  v53 = CFSTR("misd");
  v150[72] = CFSTR("Hotspot");
  v54 = CFSTR("RadarComposeUIService");
  v150[73] = CFSTR("com.apple.ist.radar");
  v55 = CFSTR("remindd");
  v150[74] = CFSTR("com.apple.reminders");
  v56 = CFSTR("homed");
  v150[75] = CFSTR("HomeKit");
  v57 = CFSTR("com.apple.private.alloy.willow");
  v150[76] = CFSTR("HomeKit");
  v58 = CFSTR("atc");
  v150[77] = CFSTR("com.apple.Music");
  v59 = CFSTR("siriactionsd");
  v150[78] = CFSTR("com.apple.shortcuts");
  v60 = CFSTR("com.apple.WorkflowKit.BackgroundShortcutRunner");
  v150[79] = CFSTR("com.apple.shortcuts");
  v61 = CFSTR("weatherd");
  v150[80] = CFSTR("com.apple.weather");
  v62 = CFSTR("synapse.contentlinkingd");
  v150[81] = CFSTR("com.apple.mobilenotes");
  v63 = CFSTR("com.apple.sportsd");
  v150[82] = CFSTR("com.apple.tv");
  v64 = CFSTR("sportsd");
  v150[83] = CFSTR("com.apple.tv");
  v65 = CFSTR("com.apple.continuitycaptured");
  v150[84] = CFSTR("com.apple.sidecar.extension.capture");
  v66 = CFSTR("com.apple.ContinuityCaptureShieldUI");
  v150[85] = CFSTR("com.apple.sidecar.extension.capture");
  v67 = CFSTR("GenerativePlaygroundApp");
  v150[86] = CFSTR("com.apple.GenerativePlaygroundApp");
  v68 = CFSTR("eventkitsyncd");
  v150[87] = CFSTR("com.apple.mobilecal");
  v69 = CFSTR("companioncamerad");
  v150[88] = CFSTR("com.apple.camera");
  v70 = CFSTR("nanomailbootstrapd");
  v150[89] = CFSTR("com.apple.mobilemail");
  v71 = CFSTR("nanomapscd");
  v150[90] = CFSTR("com.apple.Maps");
  v72 = CFSTR("companionmessagesd");
  v150[91] = CFSTR("com.apple.MobileSMS");
  v73 = CFSTR("NPKCompanionAgent");
  v150[92] = CFSTR("com.apple.Passbook");
  v74 = CFSTR("tursd");
  v150[93] = CFSTR("com.apple.mobilephone");
  v75 = CFSTR("nptocompaniond");
  v150[94] = CFSTR("com.apple.mobileslideshow");
  v76 = CFSTR("remotemediaservicesd");
  v150[95] = CFSTR("com.apple.RemoteMediaServices");
  v77 = CFSTR("companionfindlocallyd");
  v150[96] = CFSTR("com.apple.companionfindlocallyd");
  v78 = CFSTR("pairedunlockd");
  v150[97] = CFSTR("com.apple.pairedunlockd");
  v79 = CFSTR("nanoweatherprefsd");
  v150[98] = CFSTR("com.apple.weather");
  v80 = CFSTR("com.apple.ess");
  v150[99] = CFSTR("com.apple.mobilephone");
  v81 = CFSTR("com.apple.madrid");
  v150[100] = CFSTR("com.apple.MobileSMS");
  v82 = CFSTR("com.apple.private.alloy.accountssync");
  v150[101] = CFSTR("accountsd");
  v83 = CFSTR("com.apple.private.alloy.addressbooksync");
  v150[102] = CFSTR("addressbooksyncd");
  v84 = CFSTR("com.apple.private.alloy.appregistrysync");
  v150[103] = CFSTR("nanoappregistryd");
  v85 = CFSTR("com.apple.private.alloy.audiocontrol.bridge");
  v150[104] = CFSTR("com.apple.Bridge");
  v86 = CFSTR("com.apple.private.alloy.audiocontrol.music");
  v150[105] = CFSTR("com.apple.Music");
  v87 = CFSTR("com.apple.private.alloy.bluetoothregistry");
  v150[106] = CFSTR("nanoregistryd");
  v88 = CFSTR("com.apple.private.alloy.bulletindistributor.settings");
  v150[107] = CFSTR("bulletindistributord");
  v89 = CFSTR("com.apple.private.alloy.bulletindistributor");
  v150[108] = CFSTR("bulletindistributord");
  v90 = CFSTR("com.apple.private.alloy.callhistorysync");
  v150[109] = CFSTR("CallHistorySyncHelper");
  v91 = CFSTR("com.apple.private.alloy.camera.proxy");
  v150[110] = CFSTR("com.apple.camera");
  v92 = CFSTR("com.apple.private.alloy.continuity.activity");
  v150[111] = CFSTR("sharingd");
  v93 = CFSTR("com.apple.private.alloy.continuity.auth");
  v150[112] = CFSTR("sharingd");
  v94 = CFSTR("com.apple.private.alloy.continuity.encryption");
  v150[113] = CFSTR("sharingd");
  v95 = CFSTR("com.apple.private.alloy.continuity.tethering");
  v150[114] = CFSTR("sharingd");
  v96 = CFSTR("com.apple.private.alloy.coreduet");
  v150[115] = CFSTR("coreduetd");
  v97 = CFSTR("com.apple.private.alloy.eventkitsync");
  v150[116] = CFSTR("com.apple.mobilecal");
  v98 = CFSTR("com.apple.private.alloy.fignero");
  v150[117] = CFSTR("mediaserverd");
  v99 = CFSTR("com.apple.private.alloy.findmylocaldevice");
  v150[118] = CFSTR("com.apple.companionfindlocallyd");
  v100 = CFSTR("com.apple.private.alloy.fmf");
  v150[119] = CFSTR("fmfd");
  v101 = CFSTR("com.apple.private.alloy.health.general");
  v150[120] = CFSTR("com.apple.Health");
  v102 = CFSTR("com.apple.private.alloy.health.sync");
  v150[121] = CFSTR("com.apple.Health");
  v103 = CFSTR("com.apple.private.alloy.icloudpairing");
  v150[122] = CFSTR("bluetoothd");
  v104 = CFSTR("com.apple.private.alloy.idscredentials");
  v150[123] = CFSTR("IDSCredentialsAgent");
  v105 = CFSTR("com.apple.private.alloy.idsremoteurlconnection");
  v150[124] = CFSTR("IDSRemoteURLConnectionAgent");
  v106 = CFSTR("com.apple.private.alloy.idstransfers");
  v150[125] = CFSTR("IMTransferAgent");
  v107 = CFSTR("com.apple.private.alloy.iosdiagnostics");
  v150[126] = CFSTR("Diagnostics");
  v108 = CFSTR("com.apple.private.alloy.location.auth");
  v150[127] = CFSTR("locationd");
  v109 = CFSTR("com.apple.private.alloy.location.motion");
  v150[128] = CFSTR("locationd");
  v110 = CFSTR("com.apple.private.alloy.location.usage");
  v150[129] = CFSTR("locationd");
  v111 = CFSTR("com.apple.private.alloy.location.wifitilesync");
  v150[130] = CFSTR("locationd");
  v112 = CFSTR("com.apple.private.alloy.mail.fetches");
  v150[131] = CFSTR("com.apple.mobilemail");
  v113 = CFSTR("com.apple.private.alloy.mail.sync.accounts");
  v150[132] = CFSTR("com.apple.mobilemail");
  v114 = CFSTR("com.apple.private.alloy.mail.sync.content");
  v150[133] = CFSTR("com.apple.mobilemail");
  v115 = CFSTR("com.apple.private.alloy.mail.sync.messages");
  v150[134] = CFSTR("com.apple.mobilemail");
  v116 = CFSTR("com.apple.private.alloy.maps.proxy");
  v150[135] = CFSTR("com.apple.Maps");
  v117 = CFSTR("com.apple.private.alloy.maps.sync");
  v150[136] = CFSTR("com.apple.Maps");
  v118 = CFSTR("com.apple.private.alloy.maps");
  v150[137] = CFSTR("com.apple.Maps");
  v119 = CFSTR("com.apple.private.alloy.messages");
  v150[138] = CFSTR("com.apple.MobileSMS");
  v120 = CFSTR("com.apple.private.alloy.nsurlsessionproxy");
  v150[139] = CFSTR("sharingd");
  v121 = CFSTR("com.apple.private.alloy.otaupdate");
  v150[140] = CFSTR("Restore");
  v122 = CFSTR("com.apple.private.alloy.pairedunlock");
  v150[141] = CFSTR("com.apple.pairedunlockd");
  v123 = CFSTR("com.apple.private.alloy.passbook.general");
  v150[142] = CFSTR("com.apple.Passbook");
  v124 = CFSTR("com.apple.private.alloy.passbook.maintenance");
  v150[143] = CFSTR("com.apple.Passbook");
  v125 = CFSTR("com.apple.private.alloy.passbook.provisioning");
  v150[144] = CFSTR("com.apple.Passbook");
  v126 = CFSTR("com.apple.private.alloy.passbook.relevancy");
  v150[145] = CFSTR("com.apple.Passbook");
  v127 = CFSTR("com.apple.private.alloy.passbook.remoteadmin");
  v150[146] = CFSTR("com.apple.Passbook");
  v128 = CFSTR("com.apple.private.alloy.pbbridge");
  v150[147] = CFSTR("com.apple.Bridge");
  v129 = CFSTR("com.apple.private.alloy.phonecontinuity");
  v150[148] = CFSTR("com.apple.mobilephone");
  v130 = CFSTR("com.apple.private.alloy.photos.proxy");
  v150[149] = CFSTR("com.apple.mobileslideshow");
  v131 = CFSTR("com.apple.private.alloy.photostream");
  v150[150] = CFSTR("com.apple.mobileslideshow");
  v132 = CFSTR("com.apple.private.alloy.preferencessync");
  v150[151] = CFSTR("nanoprefsyncd");
  v133 = CFSTR("com.apple.private.alloy.proxiedcrashcopier");
  v150[152] = CFSTR("ProxiedCrashCopier");
  v134 = CFSTR("com.apple.private.alloy.pushproxy");
  v150[153] = CFSTR("apsd");
  v135 = CFSTR("com.apple.private.alloy.remotemediaservices");
  v150[154] = CFSTR("com.apple.RemoteMediaServices");
  v136 = CFSTR("com.apple.private.alloy.resourcegrabber");
  v150[155] = CFSTR("resourcegrabberd");
  v137 = CFSTR("com.apple.private.alloy.screenshotter");
  v150[156] = CFSTR("screenshotsyncd");
  v138 = CFSTR("com.apple.private.alloy.siri.device");
  v150[157] = CFSTR("Siri");
  v139 = CFSTR("com.apple.private.alloy.siri.location");
  v150[158] = CFSTR("Siri");
  v140 = CFSTR("com.apple.private.alloy.siri.proxy");
  v150[159] = CFSTR("Siri");
  v141 = CFSTR("com.apple.private.alloy.sms");
  v150[160] = CFSTR("com.apple.MobileSMS");
  v142 = CFSTR("com.apple.private.alloy.sockpuppet");
  v150[161] = CFSTR("companionappd");
  v143 = CFSTR("com.apple.private.alloy.systemsettings");
  v150[162] = CFSTR("nanosystemsettingsd");
  v144 = CFSTR("com.apple.private.alloy.telephonyutilitiestemporary");
  v150[163] = CFSTR("com.apple.mobilephone");
  v145 = CFSTR("com.apple.private.alloy.timesync");
  v150[164] = CFSTR("timed");
  v146 = CFSTR("com.apple.private.alloy.timezonesync");
  v150[165] = CFSTR("tzd");
  v147 = CFSTR("com.apple.private.alloy.utilitybelt");
  v150[166] = CFSTR("com.apple.Bridge");
  v148 = CFSTR("com.apple.private.alloy.voicemailsync");
  v150[167] = CFSTR("com.apple.mobilephone");
  v149 = CFSTR("com.apple.private.alloy.wifi.networksync");
  v150[168] = CFSTR("wifid");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, v10, 169);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)applyStaticNameTransformation:withResponderService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery UI Response Type Utilities: bundleIDsToReplacementBundleIDs is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)applyStaticNameTransformation:withResponderService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery UI Response Type Utilities: bundleIDsToDisplayNames is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)applyStaticNameTransformation:withResponderService:.cold.3()
{
  _QWORD *v0;
  _DWORD *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  *v1 = 134217984;
  *v0 = v4;
  OUTLINED_FUNCTION_9(&dword_1DA9D6000, v5, v6, "Battery UI Response Type Utilities: After clamping: energyEntry[PLBatteryUIAppEnergyValueKey]=%f");

  OUTLINED_FUNCTION_14();
}

+ (void)applyStaticNameTransformation:withResponderService:.cold.4()
{
  _QWORD *v0;
  _DWORD *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  *v1 = 134217984;
  *v0 = v4;
  OUTLINED_FUNCTION_9(&dword_1DA9D6000, v5, v6, "Battery UI Response Type Utilities: Before clamping: energyEntry[PLBatteryUIAppEnergyValueKey]=%f");

  OUTLINED_FUNCTION_14();
}

+ (void)transformPlugins:withResponderService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery UI Response Type Utilities: pluginBundleIDsToEntries is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)reaccountExchangeEntries:withExchangeBundleIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery UI Response Type Utilities: bundleIDsToReplacementBundleIDs is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)energyEntryHasNegligibleEnergyDrain:(NSObject *)a1 filterArray:.cold.1(NSObject *a1)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = CFSTR("com.apple.findmy");
  OUTLINED_FUNCTION_5_0(&dword_1DA9D6000, a1, OS_LOG_TYPE_DEBUG, "skipping runtime filter for %@", (uint8_t *)&v1);
  OUTLINED_FUNCTION_1();
}

+ (void)getDeletedAppBundleIDsWithResponderService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for DeletedAppBundleIDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)getDeletedAppBundleIDsWithResponderService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for DeletedAppBundleIDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)getDeletedAppClipBundleIDsWithResponderService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for DeletedAppClipBundleID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)getDeletedAppClipBundleIDsWithResponderService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for DeletedAppClipBundleID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)getWebAppBundleIDsWithResponderService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for WebAppBundleIDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)getWebAppBundleIDsWithResponderService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for WebAppBundleIDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)getPluginBundleIDToEntryMapWithResponderService:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  OUTLINED_FUNCTION_5_0(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

+ (void)getPluginBundleIDToEntryMapWithResponderService:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for PluginBundleIDToEntryMap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)getPluginBundleIDToEntryMapWithResponderService:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for PluginBundleIDToEntryMap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:.cold.1()
{
  _QWORD *v0;
  _DWORD *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *v1 = 138412290;
  *v0 = v3;
  OUTLINED_FUNCTION_9(&dword_1DA9D6000, v4, v5, "Battery UI Response Type Utilities: LSApplicationRecord Skipping non system / non user bundleID=%@");

  OUTLINED_FUNCTION_14();
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:.cold.2()
{
  _QWORD *v0;
  _DWORD *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *v1 = 138412290;
  *v0 = v3;
  OUTLINED_FUNCTION_9(&dword_1DA9D6000, v4, v5, "Battery UI Response Type Utilities: Skipping non system / non user bundleID=%@");

  OUTLINED_FUNCTION_14();
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  OUTLINED_FUNCTION_5_0(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "installedAppEntries=%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for BundleIDToDisplayNameMap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for BundleIDToDisplayNameMap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
