@implementation PLBatteryBreakdownService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryBreakdownService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)clearState
{
  -[PLBatteryBreakdownService setRootNodeNames:](self, "setRootNodeNames:", 0);
  -[PLBatteryBreakdownService setNonAppNames:](self, "setNonAppNames:", 0);
  -[PLBatteryBreakdownService setDeletedAppNames:](self, "setDeletedAppNames:", 0);
  -[PLBatteryBreakdownService setDeletedAppClipNames:](self, "setDeletedAppClipNames:", 0);
  -[PLBatteryBreakdownService setWebAppNames:](self, "setWebAppNames:", 0);
  -[PLBatteryBreakdownService setNodeIDToNodeName:](self, "setNodeIDToNodeName:", 0);
  -[PLBatteryBreakdownService setInstalledBundleIDToDisplayName:](self, "setInstalledBundleIDToDisplayName:", 0);
  -[PLBatteryBreakdownService setInstalledPluginBundleIDToPluginEntry:](self, "setInstalledPluginBundleIDToPluginEntry:", 0);
  -[PLBatteryBreakdownService setRootNodeNameToRootNodeEnergyKey:](self, "setRootNodeNameToRootNodeEnergyKey:", 0);
  -[PLBatteryBreakdownService setGivenNameToMappedName:](self, "setGivenNameToMappedName:", 0);
  -[PLBatteryBreakdownService setGizmoDaemonToAppBundleID:](self, "setGizmoDaemonToAppBundleID:", 0);
  -[PLBatteryBreakdownService setGizmoIDSTopicToAppBundleID:](self, "setGizmoIDSTopicToAppBundleID:", 0);
  -[PLBatteryBreakdownService setHasHomeKitActivity:](self, "setHasHomeKitActivity:", 0);
}

- (NSSet)rootNodeNames
{
  NSSet *rootNodeNames;
  NSSet *v4;
  NSSet *v5;

  rootNodeNames = self->_rootNodeNames;
  if (!rootNodeNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E86513B0);
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rootNodeNames;
    self->_rootNodeNames = v4;

    rootNodeNames = self->_rootNodeNames;
  }
  return rootNodeNames;
}

- (NSSet)nonAppNames
{
  NSSet *nonAppNames;
  NSSet *v4;
  NSSet *v5;

  nonAppNames = self->_nonAppNames;
  if (!nonAppNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E86513C8);
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_nonAppNames;
    self->_nonAppNames = v4;

    nonAppNames = self->_nonAppNames;
  }
  return nonAppNames;
}

- (NSSet)intermediateRootNodes
{
  NSSet *intermediateRootNodes;
  NSSet *v4;
  NSSet *v5;

  intermediateRootNodes = self->_intermediateRootNodes;
  if (!intermediateRootNodes)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E86513E0);
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_intermediateRootNodes;
    self->_intermediateRootNodes = v4;

    intermediateRootNodes = self->_intermediateRootNodes;
  }
  return intermediateRootNodes;
}

- (NSSet)deletedAppNames
{
  PLBatteryBreakdownService *v2;
  NSSet **p_deletedAppNames;
  NSSet *deletedAppNames;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  PLBatteryBreakdownService *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  int v36;
  NSObject *v37;
  id v38;
  void *v40;
  void *v41;
  id *location;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id obj;
  _QWORD block[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  uint8_t buf[4];
  id v54;
  __int16 v55;
  int v56;
  _BYTE v57[128];
  _QWORD v58[4];

  v2 = self;
  v58[1] = *MEMORY[0x1E0C80C00];
  p_deletedAppNames = &self->_deletedAppNames;
  deletedAppNames = self->_deletedAppNames;
  if (!deletedAppNames)
  {
    location = (id *)p_deletedAppNames;
    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppDeletedDate"), &unk_1E86347B8, 1);
    -[PLOperator storage](v2, "storage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v6;
    v58[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)v5;
    objc_msgSend(v7, "entriesForKey:withComparisons:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v9;
      _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
    }

    v11 = 0x1E0D7F000uLL;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __44__PLBatteryBreakdownService_deletedAppNames__block_invoke;
      v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v52[4] = v12;
      if (qword_1ED884DA0 != -1)
        dispatch_once(&qword_1ED884DA0, v52);
      if (_MergedGlobals_1_54)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deletedAppEntries=%@"), v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService deletedAppNames]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 241);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v13;
          _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v9;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v49;
      v43 = *(_QWORD *)v49;
      do
      {
        v22 = 0;
        v45 = v20;
        do
        {
          if (*(_QWORD *)v49 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v22);
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("AppIsClip"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(v11 + 4000), "debugEnabled"))
          {
            v26 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __44__PLBatteryBreakdownService_deletedAppNames__block_invoke_201;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v26;
            if (qword_1ED884DA8 != -1)
              dispatch_once(&qword_1ED884DA8, block);
            if (byte_1ED884D59)
            {
              v27 = v11;
              v28 = v2;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@"), v24);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "lastPathComponent");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService deletedAppNames]");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 247);

              PLLogCommon();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v54 = v29;
                _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v2 = v28;
              v11 = v27;
              v20 = v45;
              v21 = v43;
            }
          }
          PLLogCommon();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = objc_msgSend(v25, "intValue");
            *(_DWORD *)buf = 138412546;
            v54 = v24;
            v55 = 1024;
            v56 = v36;
            _os_log_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
          }

          if (v24 && (objc_msgSend(v25, "BOOLValue") & 1) == 0)
            objc_msgSend(v44, "addObject:", v24);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v20);
    }

    objc_storeStrong(location, v44);
    PLLogCommon();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = *location;
      *(_DWORD *)buf = 138412290;
      v54 = v38;
      _os_log_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
    }

    deletedAppNames = (NSSet *)*location;
  }
  return deletedAppNames;
}

uint64_t __44__PLBatteryBreakdownService_deletedAppNames__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_54 = result;
  return result;
}

uint64_t __44__PLBatteryBreakdownService_deletedAppNames__block_invoke_201(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D59 = result;
  return result;
}

- (NSSet)deletedAppClipNames
{
  PLBatteryBreakdownService *v2;
  NSSet **p_deletedAppClipNames;
  NSSet *deletedAppClipNames;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSSet *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  PLBatteryBreakdownService *v22;
  NSSet *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  NSObject *v31;
  NSSet *deletedAppNames;
  void *v34;
  void *v35;
  id *location;
  uint64_t v37;
  id v38;
  uint64_t v39;
  NSSet *obj;
  _QWORD block[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  NSSet *v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v2 = self;
  v51[1] = *MEMORY[0x1E0C80C00];
  p_deletedAppClipNames = &self->_deletedAppClipNames;
  deletedAppClipNames = self->_deletedAppClipNames;
  if (!deletedAppClipNames)
  {
    location = (id *)p_deletedAppClipNames;
    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppDeletedDate"), &unk_1E86347B8, 1);
    -[PLOperator storage](v2, "storage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v6;
    v51[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v5;
    objc_msgSend(v7, "entriesForKey:withComparisons:", v5, v8);
    v9 = (NSSet *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v9;
      _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v9;
    v11 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v11)
    {
      v12 = v11;
      v13 = CFSTR("AppBundleId");
      v14 = 0x1E0D7F000uLL;
      v15 = *(_QWORD *)v43;
      v37 = *(_QWORD *)v43;
      do
      {
        v16 = 0;
        v39 = v12;
        do
        {
          if (*(_QWORD *)v43 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v16);
          objc_msgSend(v17, "objectForKeyedSubscript:", v13);
          v18 = (NSSet *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AppIsClip"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(v14 + 4000), "debugEnabled"))
          {
            v20 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __48__PLBatteryBreakdownService_deletedAppClipNames__block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v20;
            if (qword_1ED884DB0 != -1)
              dispatch_once(&qword_1ED884DB0, block);
            if (byte_1ED884D5A)
            {
              v21 = v13;
              v22 = v2;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@"), v18);
              v23 = (NSSet *)objc_claimAutoreleasedReturnValue();
              v24 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "lastPathComponent");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService deletedAppClipNames]");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 274);

              PLLogCommon();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v47 = v23;
                _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v2 = v22;
              v13 = v21;
              v12 = v39;
              v14 = 0x1E0D7F000;
              v15 = v37;
            }
          }
          PLLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = objc_msgSend(v19, "intValue");
            *(_DWORD *)buf = 138412546;
            v47 = v18;
            v48 = 1024;
            v49 = v30;
            _os_log_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
          }

          if (v18 && objc_msgSend(v19, "BOOLValue"))
            objc_msgSend(v38, "addObject:", v18);

          ++v16;
        }
        while (v12 != v16);
        v12 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v12);
    }

    objc_storeStrong(location, v38);
    PLLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      deletedAppNames = v2->_deletedAppNames;
      *(_DWORD *)buf = 138412290;
      v47 = deletedAppNames;
      _os_log_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
    }

    deletedAppClipNames = (NSSet *)*location;
  }
  return deletedAppClipNames;
}

uint64_t __48__PLBatteryBreakdownService_deletedAppClipNames__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D5A = result;
  return result;
}

- (NSSet)webAppNames
{
  NSSet *webAppNames;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSSet *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  webAppNames = self->_webAppNames;
  if (!webAppNames)
  {
    objc_msgSend(MEMORY[0x1E0D7FFC0], "entryKeyForOperatorName:withType:withName:", CFSTR("PLXPCAgent"), *MEMORY[0x1E0D80378], CFSTR("WebApp"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entriesForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "objectForKeyedSubscript:", CFSTR("identifier"), (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            -[NSSet addObject:](v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v14 = self->_webAppNames;
    self->_webAppNames = v7;

    webAppNames = self->_webAppNames;
  }
  return webAppNames;
}

- (NSDictionary)nodeIDToNodeName
{
  NSDictionary *nodeIDToNodeName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  void *v26;
  const __CFString *v27;
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  nodeIDToNodeName = self->_nodeIDToNodeName;
  if (!nodeIDToNodeName)
  {
    -[PLOperator storage](self, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("where");
    objc_msgSend((id)objc_opt_class(), "whereValidName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entriesForKey:withProperties:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "entryID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    v19 = self->_nodeIDToNodeName;
    self->_nodeIDToNodeName = v10;

    nodeIDToNodeName = self->_nodeIDToNodeName;
  }
  return nodeIDToNodeName;
}

- (NSDictionary)installedBundleIDToDisplayName
{
  PLBatteryBreakdownService *v2;
  NSDictionary *installedBundleIDToDisplayName;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  NSObject *v28;
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
  uint64_t v39;
  _UNKNOWN **v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSDictionary *v56;
  void *v58;
  void *v59;
  void *v60;
  PLBatteryBreakdownService *v61;
  uint64_t v62;
  void *v63;
  NSDictionary *v64;
  _QWORD v65[5];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD block[5];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[5];
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  _QWORD v80[4];

  v2 = self;
  v80[1] = *MEMORY[0x1E0C80C00];
  installedBundleIDToDisplayName = self->_installedBundleIDToDisplayName;
  if (!installedBundleIDToDisplayName)
  {
    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppDeletedDate"), &unk_1E86347B8, 0);
    -[PLOperator storage](v2, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)v5;
    v80[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)v4;
    objc_msgSend(v6, "entriesForKey:withComparisons:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0x1E0D7F000uLL;
    v61 = v2;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke;
      v75[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v75[4] = v10;
      if (qword_1ED884DB8 != -1)
        dispatch_once(&qword_1ED884DB8, v75);
      if (byte_1ED884D5B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("installedAppEntries=%@"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService installedBundleIDToDisplayName]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 324);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v79 = v11;
          _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v2 = v61;
      }
    }
    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v8;
      _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "installedAppEntries=%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v64 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    v60 = v18;
    if (v19)
    {
      v20 = v19;
      v21 = CFSTR("AppType");
      v22 = *(_QWORD *)v72;
      do
      {
        v23 = 0;
        v62 = v20;
        do
        {
          if (*(_QWORD *)v72 != v22)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v23);
          objc_msgSend(v24, "objectForKeyedSubscript:", v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "intValue");

          if (v26 == 101)
          {
            v27 = v21;
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
            v28 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppName"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*(id *)(v9 + 4000), "debugEnabled"))
            {
              v30 = objc_opt_class();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke_225;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v30;
              if (qword_1ED884DC0 != -1)
                dispatch_once(&qword_1ED884DC0, block);
              if (byte_1ED884D5C)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@, displayName=%@"), v28, v29);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "lastPathComponent");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService installedBundleIDToDisplayName]");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 334);

                PLLogCommon();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v79 = v31;
                  _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v18 = v60;
                v2 = v61;
                v9 = 0x1E0D7F000;
              }
            }
            -[NSDictionary setObject:forKeyedSubscript:](v64, "setObject:forKeyedSubscript:", v29, v28);

            v21 = v27;
            v20 = v62;
          }
          else
          {
            PLLogCommon();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v79 = v37;
              _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "Skipping non system / non user bundleID=%@", buf, 0xCu);

            }
          }

          ++v23;
        }
        while (v20 != v23);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
      }
      while (v20);
    }

    objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    v40 = &off_1E8575000;
    if (v39)
    {
      v41 = v39;
      v42 = *(_QWORD *)v67;
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v67 != v42)
            objc_enumerationMutation(v38);
          v44 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v43);
          if (objc_msgSend(v44, "mayBeBUIVisible"))
          {
            if (!objc_msgSend(v40[306], "hasScreenPresence:", v44))
              goto LABEL_48;
            objc_msgSend(v44, "bundleIdentifier");
            v45 = objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](v64, "objectForKeyedSubscript:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v46)
            {
              objc_msgSend(v44, "localizedName");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
              {
                v48 = objc_opt_class();
                v65[0] = MEMORY[0x1E0C809B0];
                v65[1] = 3221225472;
                v65[2] = __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke_231;
                v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v65[4] = v48;
                if (qword_1ED884DC8 != -1)
                  dispatch_once(&qword_1ED884DC8, v65);
                if (byte_1ED884D5D)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@, displayName=%@"), v45, v47);
                  v49 = objc_claimAutoreleasedReturnValue();
                  v63 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "lastPathComponent");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService installedBundleIDToDisplayName]");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v63, "logMessage:fromFile:fromFunction:fromLineNumber:", v49, v51, v52, 352);

                  v53 = (void *)v49;
                  PLLogCommon();
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v79 = v53;
                    _os_log_debug_impl(&dword_1CAF47000, v54, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v2 = v61;
                  v40 = &off_1E8575000;
                }
              }
              -[NSDictionary setObject:forKeyedSubscript:](v64, "setObject:forKeyedSubscript:", v47, v45);

            }
          }
          else
          {
            PLLogCommon();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v44, "bundleIdentifier");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v79 = v55;
              _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "LSApplicationRecord Skipping non system / non user bundleID=%@", buf, 0xCu);

            }
          }

LABEL_48:
          ++v43;
        }
        while (v41 != v43);
        v41 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      }
      while (v41);
    }
    v56 = v2->_installedBundleIDToDisplayName;
    v2->_installedBundleIDToDisplayName = v64;

    installedBundleIDToDisplayName = v2->_installedBundleIDToDisplayName;
  }
  return installedBundleIDToDisplayName;
}

uint64_t __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D5B = result;
  return result;
}

uint64_t __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke_225(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D5C = result;
  return result;
}

uint64_t __59__PLBatteryBreakdownService_installedBundleIDToDisplayName__block_invoke_231(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D5D = result;
  return result;
}

- (NSDictionary)installedPluginBundleIDToPluginEntry
{
  PLBatteryBreakdownService *v2;
  NSDictionary *installedPluginBundleIDToPluginEntry;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSDictionary *v50;
  void *v52;
  void *v53;
  void *v54;
  NSDictionary *v55;
  PLBatteryBreakdownService *v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[5];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD block[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  _QWORD v76[4];

  v2 = self;
  v76[1] = *MEMORY[0x1E0C80C00];
  installedPluginBundleIDToPluginEntry = self->_installedPluginBundleIDToPluginEntry;
  if (!installedPluginBundleIDToPluginEntry)
  {
    +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllPlugins"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("PluginDeletedDate"), &unk_1E86347B8, 0);
    -[PLOperator storage](v2, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)v5;
    v76[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v4;
    objc_msgSend(v6, "entriesForKey:withComparisons:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0x1E0D7F000uLL;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke;
      v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v71[4] = v10;
      if (qword_1ED884DD0 != -1)
        dispatch_once(&qword_1ED884DD0, v71);
      if (byte_1ED884D5E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("installedPluginEntries=%@"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService installedPluginBundleIDToPluginEntry]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 374);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v75 = v11;
          _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v9 = 0x1E0D7F000uLL;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v8;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    v55 = v17;
    v56 = v2;
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v68;
      v21 = CFSTR("PluginId");
      do
      {
        v22 = 0;
        v59 = v19;
        do
        {
          if (*(_QWORD *)v68 != v20)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v22);
          objc_msgSend(v23, "objectForKeyedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v25 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke_240;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v25;
            if (qword_1ED884DD8 != -1)
              dispatch_once(&qword_1ED884DD8, block);
            if (byte_1ED884D5F)
            {
              v26 = v20;
              v27 = v21;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pluginBundleID=%@"), v24);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "lastPathComponent");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService installedPluginBundleIDToPluginEntry]");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 379);

              PLLogCommon();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v75 = v28;
                _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v17 = v55;
              v2 = v56;
              v9 = 0x1E0D7F000uLL;
              v21 = v27;
              v20 = v26;
              v19 = v59;
            }
          }
          -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v23, v24);

          ++v22;
        }
        while (v19 != v22);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      }
      while (v19);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    +[PLBatteryBreakdownService installedPlugins](PLBatteryBreakdownService, "installedPlugins");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v60)
    {
      v58 = *(_QWORD *)v63;
      v54 = v34;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v63 != v58)
            objc_enumerationMutation(v34);
          v36 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v35);
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("PluginId"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("PluginParentApp"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v39)
          {
            if (objc_msgSend(*(id *)(v9 + 4000), "debugEnabled"))
            {
              v40 = objc_opt_class();
              v61[0] = MEMORY[0x1E0C809B0];
              v61[1] = 3221225472;
              v61[2] = __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke_248;
              v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v61[4] = v40;
              if (qword_1ED884DE0 != -1)
                dispatch_once(&qword_1ED884DE0, v61);
              if (byte_1ED884D60)
              {
                v41 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("PluginExecutableName"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("PluginType"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "stringWithFormat:", CFSTR("pluginExecutableName=%@, pluginBundleID=%@, pluginParentApp=%@, pluginType=%@"), v42, v37, v38, v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                v45 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "lastPathComponent");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService installedPluginBundleIDToPluginEntry]");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 390);

                PLLogCommon();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v75 = v44;
                  _os_log_debug_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v17 = v55;
                v2 = v56;
                v9 = 0x1E0D7F000;
                v34 = v54;
              }
            }
            -[NSDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v36, v37);
          }

          ++v35;
        }
        while (v60 != v35);
        v60 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      }
      while (v60);
    }

    v50 = v2->_installedPluginBundleIDToPluginEntry;
    v2->_installedPluginBundleIDToPluginEntry = v17;

    installedPluginBundleIDToPluginEntry = v2->_installedPluginBundleIDToPluginEntry;
  }
  return installedPluginBundleIDToPluginEntry;
}

uint64_t __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D5E = result;
  return result;
}

uint64_t __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke_240(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D5F = result;
  return result;
}

uint64_t __65__PLBatteryBreakdownService_installedPluginBundleIDToPluginEntry__block_invoke_248(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D60 = result;
  return result;
}

- (id)pluginBundleIDsforBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PLBatteryBreakdownService installedPluginBundleIDToPluginEntry](self, "installedPluginBundleIDToPluginEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PLBatteryBreakdownService_pluginBundleIDsforBundleID___block_invoke;
  v10[3] = &unk_1E85800F0;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "keysOfEntriesPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __56__PLBatteryBreakdownService_pluginBundleIDsforBundleID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PluginParentApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

+ (id)appNameForBundleID:(id)a3
{
  return (id)SBSCopyLocalizedApplicationNameForDisplayIdentifier();
}

+ (id)installedPlugins
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D179C2E0](a1, a2);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithOptions:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        +[PLBatteryBreakdownService pluginEntryFromRecord:](PLBatteryBreakdownService, "pluginEntryFromRecord:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(v2);
  return v3;
}

+ (id)pluginEntryFromRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllPlugins"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "containingBundleRecord");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v3, "containingBundleRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v3, "executableURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v4);
          objc_msgSend(v3, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("PluginId"));

          objc_msgSend(v3, "containingBundleRecord");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("PluginParentApp"));

          objc_msgSend(v3, "extensionPointRecord");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("PluginType"));

          objc_msgSend(v3, "executableURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("PluginExecutableName"));

          objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E86347B8, CFSTR("PluginDeletedDate"));
          goto LABEL_9;
        }
LABEL_8:
        v5 = 0;
        goto LABEL_9;
      }

    }
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (NSDictionary)gizmoDaemonToAppBundleID
{
  NSDictionary *gizmoDaemonToAppBundleID;

  gizmoDaemonToAppBundleID = self->_gizmoDaemonToAppBundleID;
  if (!gizmoDaemonToAppBundleID)
  {
    self->_gizmoDaemonToAppBundleID = (NSDictionary *)&unk_1E864D390;
    gizmoDaemonToAppBundleID = self->_gizmoDaemonToAppBundleID;
  }
  return gizmoDaemonToAppBundleID;
}

- (NSDictionary)gizmoIDSTopicToAppBundleID
{
  NSDictionary *gizmoIDSTopicToAppBundleID;

  gizmoIDSTopicToAppBundleID = self->_gizmoIDSTopicToAppBundleID;
  if (!gizmoIDSTopicToAppBundleID)
  {
    self->_gizmoIDSTopicToAppBundleID = (NSDictionary *)&unk_1E864D3B8;
    gizmoIDSTopicToAppBundleID = self->_gizmoIDSTopicToAppBundleID;
  }
  return gizmoIDSTopicToAppBundleID;
}

- (NSDictionary)rootNodeNameToRootNodeEnergyKey
{
  NSDictionary *rootNodeNameToRootNodeEnergyKey;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[17];
  _QWORD v25[19];

  v25[17] = *MEMORY[0x1E0C80C00];
  rootNodeNameToRootNodeEnergyKey = self->_rootNodeNameToRootNodeEnergyKey;
  if (!rootNodeNameToRootNodeEnergyKey)
  {
    objc_msgSend(&unk_1E86513F8, "objectAtIndexedSubscript:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v23;
    v25[0] = CFSTR("PLBatteryUIAppCPUEnergyKey");
    objc_msgSend(&unk_1E8651410, "objectAtIndexedSubscript:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v22;
    v25[1] = CFSTR("PLBatteryUIAppVENCEnergyKey");
    objc_msgSend(&unk_1E8651428, "objectAtIndexedSubscript:", 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v21;
    v25[2] = CFSTR("PLBatteryUIAppVDECEnergyKey");
    objc_msgSend(&unk_1E8651440, "objectAtIndexedSubscript:", 6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v20;
    v25[3] = CFSTR("PLBatteryUIAppISPEnergyKey");
    objc_msgSend(&unk_1E8651458, "objectAtIndexedSubscript:", 7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[4] = v19;
    v25[4] = CFSTR("PLBatteryUIAppRestOfSOCEnergyKey");
    objc_msgSend(&unk_1E8651470, "objectAtIndexedSubscript:", 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = v18;
    v25[5] = CFSTR("PLBatteryUIAppGPUEnergyKey");
    objc_msgSend(&unk_1E8651488, "objectAtIndexedSubscript:", 9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[6] = v17;
    v25[6] = CFSTR("PLBatteryUIAppDRAMEnergyKey");
    objc_msgSend(&unk_1E86514A0, "objectAtIndexedSubscript:", 10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[7] = v16;
    v25[7] = CFSTR("PLBatteryUIAppDisplayEnergyKey");
    objc_msgSend(&unk_1E86514B8, "objectAtIndexedSubscript:", 11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[8] = v15;
    v25[8] = CFSTR("PLBatteryUIAppWIFIEnergyKey");
    objc_msgSend(&unk_1E86514D0, "objectAtIndexedSubscript:", 15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24[9] = v4;
    v25[9] = CFSTR("PLBatteryUIAppAUDIOEnergyKey");
    objc_msgSend(&unk_1E86514E8, "objectAtIndexedSubscript:", 37);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v24[10] = v5;
    v25[10] = CFSTR("PLBatteryUIAppBBEnergyKey");
    objc_msgSend(&unk_1E8651500, "objectAtIndexedSubscript:", 48);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[11] = v6;
    v25[11] = CFSTR("BLMEnergyGPS");
    objc_msgSend(&unk_1E8651518, "objectAtIndexedSubscript:", 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[12] = v7;
    v25[12] = CFSTR("PLBatteryUIAppWifiLocationEnergyKey");
    objc_msgSend(&unk_1E8651530, "objectAtIndexedSubscript:", 13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[13] = v8;
    v25[13] = CFSTR("PLBatteryUIAppWifiPipelineEnergyKey");
    objc_msgSend(&unk_1E8651548, "objectAtIndexedSubscript:", 50);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[14] = v9;
    v25[14] = CFSTR("PLBatteryUIAppBluetoothEnergyKey");
    objc_msgSend(&unk_1E8651560, "objectAtIndexedSubscript:", 20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[15] = v10;
    v25[15] = CFSTR("PLBatteryUIAppAccessoryEnergyKey");
    objc_msgSend(&unk_1E8651578, "objectAtIndexedSubscript:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[16] = v11;
    v25[16] = CFSTR("PLBatteryUIAppNfcEnergyKey");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 17);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = self->_rootNodeNameToRootNodeEnergyKey;
    self->_rootNodeNameToRootNodeEnergyKey = v12;

    rootNodeNameToRootNodeEnergyKey = self->_rootNodeNameToRootNodeEnergyKey;
  }
  return rootNodeNameToRootNodeEnergyKey;
}

- (NSDictionary)givenNameToMappedName
{
  NSDictionary *givenNameToMappedName;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSDictionary *v7;
  NSDictionary *v8;
  _QWORD v10[73];
  _QWORD v11[74];

  v11[73] = *MEMORY[0x1E0C80C00];
  givenNameToMappedName = self->_givenNameToMappedName;
  if (!givenNameToMappedName)
  {
    v10[0] = CFSTR("IMRemoteURLConn");
    v10[1] = CFSTR("IMRemoteURLConne");
    v11[0] = CFSTR("com.apple.MobileSMS");
    v11[1] = CFSTR("com.apple.MobileSMS");
    v10[2] = CFSTR("com.apple.mobilesms.notification");
    v10[3] = CFSTR("mstreamd");
    v11[2] = CFSTR("com.apple.MobileSMS");
    v11[3] = CFSTR("com.apple.mobileslideshow");
    v10[4] = CFSTR("mediastream.mstreamd");
    v10[5] = CFSTR("assetsd");
    v11[4] = CFSTR("com.apple.mobileslideshow");
    v11[5] = CFSTR("com.apple.mobileslideshow");
    v10[6] = CFSTR("cloudphotod");
    v10[7] = CFSTR("com.apple.mobileslideshow.Discretionary");
    v11[6] = CFSTR("com.apple.mobileslideshow");
    v11[7] = CFSTR("com.apple.mobileslideshow");
    v10[8] = CFSTR("com.apple.icloud-container.com.apple.photos.cloud");
    v10[9] = CFSTR("com.apple.photoanalysisd");
    v11[8] = CFSTR("com.apple.mobileslideshow");
    v11[9] = CFSTR("com.apple.mobileslideshow");
    v10[10] = CFSTR("com.apple.photoanalysisd.backgroundanalysis");
    v10[11] = CFSTR("com.apple.mediaanalysisd");
    v11[10] = CFSTR("com.apple.mobileslideshow");
    v11[11] = CFSTR("com.apple.mobileslideshow");
    v10[12] = CFSTR("com.apple.mediaanalysisd.fullanalysis");
    v10[13] = CFSTR("com.apple.photos.cloud");
    v11[12] = CFSTR("com.apple.mobileslideshow");
    v11[13] = CFSTR("com.apple.mobileslideshow");
    v10[14] = CFSTR("WirelessRadioManager");
    v10[15] = CFSTR("WirelessRadioManagerd");
    v11[14] = CFSTR("com.apple.mobilephone");
    v11[15] = CFSTR("com.apple.mobilephone");
    v10[16] = CFSTR("WirelessRadioMa");
    v10[17] = CFSTR("vmd");
    v11[16] = CFSTR("com.apple.mobilephone");
    v11[17] = CFSTR("com.apple.mobilephone");
    v10[18] = CFSTR("ipTelephony");
    v10[19] = CFSTR("com.apple.MailCompositionService");
    v11[18] = CFSTR("com.apple.mobilephone");
    v11[19] = CFSTR("com.apple.mobilemail");
    v10[20] = CFSTR("MailCompositionService");
    v10[21] = CFSTR("suggestd");
    v11[20] = CFSTR("com.apple.mobilemail");
    v11[21] = CFSTR("com.apple.mobilemail");
    v10[22] = CFSTR("email.maild");
    v10[23] = CFSTR("com.apple.email.maild");
    v11[22] = CFSTR("com.apple.mobilemail");
    v11[23] = CFSTR("com.apple.mobilemail");
    v10[24] = CFSTR("com.apple.springboard.lockscreen.navigation");
    v10[25] = CFSTR("com.apple.Siri");
    v11[24] = CFSTR("com.apple.Maps");
    v11[25] = CFSTR("Siri");
    v10[26] = *MEMORY[0x1E0D22C88];
    v10[27] = CFSTR("assistantd");
    v11[26] = CFSTR("Siri");
    v11[27] = CFSTR("Siri");
    v10[28] = CFSTR("com.apple.WebKit.Networking");
    v10[29] = CFSTR("com.apple.WebKit.WebContent");
    v11[28] = CFSTR("com.apple.mobilesafari");
    v11[29] = CFSTR("com.apple.mobilesafari");
    v10[30] = CFSTR("com.apple.WebKit");
    v10[31] = CFSTR("com.apple.WebKi");
    v11[30] = CFSTR("com.apple.mobilesafari");
    v11[31] = CFSTR("com.apple.mobilesafari");
    v10[32] = CFSTR("com.apple.SafariViewService");
    v10[33] = CFSTR("safarifetcherd");
    v11[32] = CFSTR("com.apple.mobilesafari");
    v11[33] = CFSTR("com.apple.mobilesafari");
    v10[34] = CFSTR("com.apple.WebKit.WebContent.CaptivePortal");
    v10[35] = CFSTR("com.apple.WebKit.WebContent.Development");
    v11[34] = CFSTR("com.apple.mobilesafari");
    v11[35] = CFSTR("com.apple.mobilesafari");
    v10[36] = CFSTR("com.apple.WebKit.GPU");
    v10[37] = CFSTR("com.apple.WebKit.GPU.Development");
    v11[36] = CFSTR("com.apple.mobilesafari");
    v11[37] = CFSTR("com.apple.mobilesafari");
    v10[38] = CFSTR("com.apple.PassKitCore");
    v10[39] = CFSTR("passd");
    v11[38] = CFSTR("com.apple.Passbook");
    v11[39] = CFSTR("com.apple.Passbook");
    v10[40] = CFSTR("PassbookUIService");
    v10[41] = CFSTR("com.apple.PassbookUIService");
    v11[40] = CFSTR("com.apple.Passbook");
    v11[41] = CFSTR("com.apple.Passbook");
    v10[42] = CFSTR("com.apple.calendar");
    v10[43] = CFSTR("calaccessd");
    v11[42] = CFSTR("com.apple.mobilecal");
    v11[43] = CFSTR("com.apple.mobilecal");
    v4 = *MEMORY[0x1E0DAB690];
    v10[44] = *MEMORY[0x1E0DAB668];
    v10[45] = v4;
    v11[44] = CFSTR("HLS");
    v11[45] = CFSTR("HLS");
    v5 = *MEMORY[0x1E0DAB6A0];
    v10[46] = *MEMORY[0x1E0DAB658];
    v10[47] = v5;
    v11[46] = CFSTR("HLS");
    v11[47] = CFSTR("HLS");
    v6 = *MEMORY[0x1E0D22C70];
    v10[48] = *MEMORY[0x1E0D22C78];
    v10[49] = v6;
    v11[48] = CFSTR("HLS");
    v11[49] = CFSTR("HLS");
    v10[50] = *MEMORY[0x1E0D22C80];
    v10[51] = CFSTR("LockScreen");
    v11[50] = CFSTR("HLS");
    v11[51] = CFSTR("HLS");
    v10[52] = CFSTR("com.apple.MobileBackup.framework");
    v10[53] = CFSTR("backupd");
    v11[52] = CFSTR("Backup");
    v11[53] = CFSTR("Backup");
    v10[54] = CFSTR("com.apple.Restore");
    v10[55] = CFSTR("com.apple.atc");
    v11[54] = CFSTR("com.apple.AppStore");
    v11[55] = CFSTR("com.apple.AppStore");
    v10[56] = CFSTR("installd");
    v10[57] = CFSTR("com.apple.StreamingUnzipService");
    v11[56] = CFSTR("com.apple.AppStore");
    v11[57] = CFSTR("com.apple.AppStore");
    v10[58] = CFSTR("containermanagerd");
    v10[59] = CFSTR("appstored");
    v11[58] = CFSTR("com.apple.AppStore");
    v11[59] = CFSTR("com.apple.AppStore");
    v10[60] = CFSTR("OOS");
    v10[61] = CFSTR("healthd");
    v11[60] = CFSTR("PoorCellCondition");
    v11[61] = CFSTR("com.apple.Health");
    v10[62] = CFSTR("com.apple.healthappd");
    v10[63] = CFSTR("misd");
    v11[62] = CFSTR("com.apple.Health");
    v11[63] = CFSTR("Hotspot");
    v10[64] = CFSTR("RadarComposeUIService");
    v11[64] = CFSTR("com.apple.ist.radar");
    v10[65] = CFSTR("remindd");
    v11[65] = CFSTR("com.apple.reminders");
    v10[66] = CFSTR("homed");
    v11[66] = CFSTR("HomeKit");
    v10[67] = CFSTR("com.apple.private.alloy.willow");
    v11[67] = CFSTR("HomeKit");
    v10[68] = CFSTR("atc");
    v11[68] = CFSTR("com.apple.Music");
    v10[69] = CFSTR("siriactionsd");
    v11[69] = CFSTR("com.apple.shortcuts");
    v10[70] = CFSTR("com.apple.WorkflowKit.BackgroundShortcutRunner");
    v11[70] = CFSTR("com.apple.shortcuts");
    v10[71] = CFSTR("weatherd");
    v11[71] = CFSTR("com.apple.weather");
    v10[72] = CFSTR("synapse.contentlinkingd");
    v11[72] = CFSTR("com.apple.mobilenotes");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 73);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_givenNameToMappedName;
    self->_givenNameToMappedName = v7;

    givenNameToMappedName = self->_givenNameToMappedName;
  }
  return givenNameToMappedName;
}

+ (id)whereValidName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')"), *MEMORY[0x1E0D801E8], *MEMORY[0x1E0D801E8], CFSTR("null"), *MEMORY[0x1E0D801E8], CFSTR("unknown"));
}

- (BOOL)inDemoMode
{
  if (qword_1ED884DE8 != -1)
    dispatch_once(&qword_1ED884DE8, &__block_literal_global_42);
  return byte_1ED884D61;
}

void __39__PLBatteryBreakdownService_inDemoMode__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("BUI_DEMO_MODE"), CFSTR("com.apple.powerlogd"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ED884D61 = v0 != 0;

}

- (id)batteryBreakdownWithTimeRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4 withEntryTimeInterval:(double)a5 withQueryType:(int)a6
{
  uint64_t v6;
  double var1;
  double var0;
  double v10;
  double v11;
  double v13;

  v6 = *(_QWORD *)&a6;
  var1 = a4.var1;
  var0 = a4.var0;
  v10 = a3.var1;
  v11 = a3.var0;
  -[PLBatteryBreakdownService totalSumEnergyRatioCutOff](self, "totalSumEnergyRatioCutOff");
  return -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:", v6, v11, v10, var0, var1, a5, v13);
}

- (id)batteryBreakdownWithTimeRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4 withEntryTimeInterval:(double)a5 withQueryType:(int)a6 withTotalSumEnergyRatioCutOff:(double)a7
{
  uint64_t v8;
  double var1;
  double var0;
  double v12;
  double v13;
  NSObject *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  NSObject *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  double v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  _QWORD *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  _QWORD *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  _QWORD *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  uint64_t v80;
  _QWORD *v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  _QWORD *v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  uint64_t v99;
  _QWORD *v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  uint64_t i;
  void *v115;
  double v116;
  uint64_t v117;
  _QWORD *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  uint64_t v124;
  _QWORD *v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t j;
  void *v138;
  void *v139;
  void *v140;
  double v141;
  double v142;
  void *v143;
  unsigned int v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  double v149;
  double v150;
  void *v151;
  unsigned int v152;
  uint64_t v153;
  _QWORD *v154;
  double v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  NSObject *v160;
  void *v161;
  void *v162;
  double v163;
  void *v164;
  double v165;
  double v166;
  double v167;
  double v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  double v173;
  void *v174;
  BOOL v175;
  uint64_t v176;
  _QWORD *v177;
  double v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  NSObject *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  _QWORD *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  _QWORD *v193;
  double v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  NSObject *v199;
  id v200;
  double v202;
  void *context;
  unsigned int v204;
  id obj;
  PLBatteryBreakdownService *v206;
  _QWORD v207[5];
  _QWORD v208[5];
  _QWORD v209[5];
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  _QWORD v214[5];
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  _QWORD v219[5];
  _QWORD v220[5];
  _QWORD v221[5];
  _QWORD v222[5];
  _QWORD v223[5];
  _QWORD v224[5];
  _QWORD v225[5];
  _QWORD v226[5];
  _QWORD v227[5];
  _QWORD v228[5];
  _BYTE v229[128];
  uint8_t v230[128];
  uint8_t buf[4];
  double v232;
  __int16 v233;
  double v234;
  __int16 v235;
  double v236;
  __int16 v237;
  double v238;
  uint64_t v239;

  v8 = *(_QWORD *)&a6;
  var1 = a4.var1;
  var0 = a4.var0;
  v12 = a3.var1;
  v13 = a3.var0;
  v239 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0](self, a2);
  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v232 = a5;
    v233 = 1024;
    LODWORD(v234) = v8;
    _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "entryTimeInterval=%f, queryType=%i", buf, 0x12u);
  }

  v202 = a7;
  if (var0 == 0.0 && var1 == 0.0)
  {
    v16 = v12;
    v17 = v12;
    v18 = v13;
    goto LABEL_60;
  }
  PLLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v13 + v12;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    v232 = v13;
    v233 = 2048;
    v234 = v13 + v12;
    v235 = 2048;
    v236 = var0;
    v237 = 2048;
    v238 = var0 + var1;
    _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "range=(%f, %f), dataRange=(%f, %f)", buf, 0x2Au);
  }

  if (v13 >= var0 || v20 <= var0)
  {
    v21 = var0 + var1;
    if (var0 >= v13 || v21 <= v13)
    {
      v18 = 0.0;
      if (v13 != var0 || v12 <= 0.0)
      {
        v17 = 0.0;
        goto LABEL_22;
      }
      v17 = 0.0;
      if (var1 <= 0.0)
        goto LABEL_22;
    }
  }
  else
  {
    v21 = var0 + var1;
  }
  if (v13 >= var0)
    v18 = v13;
  else
    v18 = var0;
  if (v20 < v21)
    v21 = v13 + v12;
  v17 = v21 - v18;
LABEL_22:
  v22 = v13 + -1800.0;
  v23 = v13 + -1800.0 < var0;
  v24 = v12 + v13 + -1800.0;
  if (v24 <= var0)
    v23 = 0;
  if ((_DWORD)v8 != 4)
  {
    if (v23)
    {
      v26 = var0 + var1;
    }
    else
    {
      v26 = var0 + var1;
      if (var0 >= v22 || v26 <= v22)
      {
        v13 = 0.0;
        if (v22 != var0 || v12 <= 0.0)
          goto LABEL_207;
        v27 = var1 <= 0.0;
        v16 = 0.0;
        if (v27)
          goto LABEL_57;
      }
    }
    if (v22 >= var0)
      v13 = v22;
    else
      v13 = var0;
    if (v24 >= v26)
      v24 = v26;
    goto LABEL_56;
  }
  if (v23)
  {
    v25 = var0 + var1;
    goto LABEL_37;
  }
  v25 = var0 + var1;
  v27 = var0 >= v22 || v25 <= v22;
  if (!v27)
  {
LABEL_37:
    if (v22 >= var0)
      v13 = var0;
    else
      v13 = v22;
    if (v24 < v25)
      v24 = v25;
LABEL_56:
    v16 = v24 - v13;
    goto LABEL_57;
  }
  v13 = 0.0;
  if (v22 != var0 || v12 <= 0.0)
  {
LABEL_207:
    v16 = 0.0;
    goto LABEL_57;
  }
  v27 = var1 <= 0.0;
  v16 = 0.0;
  if (!v27)
    goto LABEL_37;
LABEL_57:
  PLLogCommon();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v232 = v13;
    v233 = 2048;
    v234 = v13 + v16;
    _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "aggregateQueryRange=(%f, %f)", buf, 0x16u);
  }

LABEL_60:
  -[PLBatteryBreakdownService setShowGizmoQualifier:](self, "setShowGizmoQualifier:", -[PLBatteryBreakdownService wasGizmoConnectedInRange:](self, "wasGizmoConnectedInRange:", v18, v17));
  -[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:](self, "energyEntriesWithRange:withEntryTimeInterval:withQueryType:", v8, v13, v16, a5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0x1E0D7F000uLL;
  v204 = v8;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v32 = objc_opt_class();
    v228[0] = MEMORY[0x1E0C809B0];
    v228[1] = 3221225472;
    v228[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke;
    v228[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v228[4] = v32;
    v33 = v228;
    if (qword_1ED884DF0 != -1)
      dispatch_once(&qword_1ED884DF0, v33);

    if (byte_1ED884D62)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntries=%@"), v30);
      v34 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v35 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v34, v37, v38, 755);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v34;
        _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v8 = v8;
      v31 = 0x1E0D7F000uLL;
    }
  }
  -[PLBatteryBreakdownService addForegroundAndBackgroundDurations:withRange:withQueryType:](self, "addForegroundAndBackgroundDurations:withRange:withQueryType:", v30, v8, v13, v16);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryBreakdownService addNotificationValues:withRange:withQueryType:](self, "addNotificationValues:withRange:withQueryType:", v40, v8, v13, v16);
  v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  if ((_DWORD)v8 == 4)
  {
    -[PLBatteryBreakdownService populateEnergyBucketKeysWithEntries:](self, "populateEnergyBucketKeysWithEntries:", *(_QWORD *)&v41);
    v42 = objc_claimAutoreleasedReturnValue();
LABEL_69:

LABEL_70:
    v41 = *(double *)&v42;
    goto LABEL_71;
  }
  if (v8 < 2)
  {
    if ((_DWORD)v8 != 1)
      goto LABEL_71;
    -[PLBatteryBreakdownService populateBLDKeysWithEnergyEntries:](self, "populateBLDKeysWithEnergyEntries:", *(_QWORD *)&v41);
    v42 = objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_70;
    v186 = objc_opt_class();
    v226[0] = MEMORY[0x1E0C809B0];
    v226[1] = 3221225472;
    v226[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_739;
    v226[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v226[4] = v186;
    v187 = v226;
    if (qword_1ED884E00 != -1)
      dispatch_once(&qword_1ED884E00, v187);

    if (byte_1ED884D64)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("after populating BLD keys: energyEntries=%@"), v42);
      v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v188 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v189, "lastPathComponent");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v41, v190, v191, 789);

      PLLogCommon();
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v41;
        goto LABEL_209;
      }
LABEL_195:

      v8 = v8;
      v31 = 0x1E0D7F000;
      goto LABEL_69;
    }
  }
  else
  {
    -[PLBatteryBreakdownService populateRootNodeEnergyKeysWithEnergyEntries:](self, "populateRootNodeEnergyKeysWithEnergyEntries:", *(_QWORD *)&v41);
    v42 = objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_70;
    v117 = objc_opt_class();
    v227[0] = MEMORY[0x1E0C809B0];
    v227[1] = 3221225472;
    v227[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_734;
    v227[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v227[4] = v117;
    v118 = v227;
    if (qword_1ED884DF8 != -1)
      dispatch_once(&qword_1ED884DF8, v118);

    if (byte_1ED884D63)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("after populating root node energy keys: energyEntries=%@"), v42);
      v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v119 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "lastPathComponent");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v41, v121, v122, 785);

      PLLogCommon();
      v123 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v41;
LABEL_209:
        _os_log_debug_impl(&dword_1CAF47000, v123, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        goto LABEL_195;
      }
      goto LABEL_195;
    }
  }
  v41 = *(double *)&v42;
  v8 = v8;
LABEL_71:
  -[PLBatteryBreakdownService applyStaticNameTransformationsWithEnergyEntries:](self, "applyStaticNameTransformationsWithEnergyEntries:", *(_QWORD *)&v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v44 = objc_opt_class();
    v225[0] = MEMORY[0x1E0C809B0];
    v225[1] = 3221225472;
    v225[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_744;
    v225[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v225[4] = v44;
    v45 = v225;
    if (qword_1ED884E08 != -1)
      dispatch_once(&qword_1ED884E08, v45);

    if (byte_1ED884D65)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("after static transformations: energyEntries=%@"), v43);
      v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v47 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "lastPathComponent");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v46, v49, v50, 794);

      PLLogCommon();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v46;
        _os_log_debug_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v8 = v8;
      v31 = 0x1E0D7F000uLL;
    }
  }
  -[PLBatteryBreakdownService combineDuplicatesWithEnergyEntries:](self, "combineDuplicatesWithEnergyEntries:", v43);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v53 = objc_opt_class();
    v224[0] = MEMORY[0x1E0C809B0];
    v224[1] = 3221225472;
    v224[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_749;
    v224[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v224[4] = v53;
    v54 = v224;
    if (qword_1ED884E10 != -1)
      dispatch_once(&qword_1ED884E10, v54);

    if (byte_1ED884D66)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("after combining duplicates: energyEntries=%@"), v52);
      v55 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v56 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "lastPathComponent");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v55, v58, v59, 798);

      PLLogCommon();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v55;
        _os_log_debug_impl(&dword_1CAF47000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v8 = v8;
      v31 = 0x1E0D7F000uLL;
    }
  }
  -[PLBatteryBreakdownService adjustExtensionBackgroundTimeWithEnergyEntries:](self, "adjustExtensionBackgroundTimeWithEnergyEntries:", v52);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v62 = objc_opt_class();
    v223[0] = MEMORY[0x1E0C809B0];
    v223[1] = 3221225472;
    v223[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_754;
    v223[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v223[4] = v62;
    v63 = v223;
    if (qword_1ED884E18 != -1)
      dispatch_once(&qword_1ED884E18, v63);

    if (byte_1ED884D67)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("After background time adjustment to extensions: energyEntries=%@"), v61);
      v64 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v65 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "lastPathComponent");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v64, v67, v68, 802);

      PLLogCommon();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v64;
        _os_log_debug_impl(&dword_1CAF47000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v8 = v8;
      v31 = 0x1E0D7F000uLL;
    }
  }
  -[PLBatteryBreakdownService applyDynamicNameTransformationsWithEnergyEntries:](self, "applyDynamicNameTransformationsWithEnergyEntries:", v61);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v71 = objc_opt_class();
    v222[0] = MEMORY[0x1E0C809B0];
    v222[1] = 3221225472;
    v222[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_759;
    v222[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v222[4] = v71;
    v72 = v222;
    if (qword_1ED884E20 != -1)
      dispatch_once(&qword_1ED884E20, v72);

    if (byte_1ED884D68)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("after dynamic transformations: energyEntries=%@"), v70);
      v73 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v74 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "lastPathComponent");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v73, v76, v77, 807);

      PLLogCommon();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v73;
        _os_log_debug_impl(&dword_1CAF47000, v78, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v8 = v8;
      v31 = 0x1E0D7F000uLL;
    }
  }
  -[PLBatteryBreakdownService combineDuplicatesWithEnergyEntries:](self, "combineDuplicatesWithEnergyEntries:", v70);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v80 = objc_opt_class();
    v221[0] = MEMORY[0x1E0C809B0];
    v221[1] = 3221225472;
    v221[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_764;
    v221[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v221[4] = v80;
    v81 = v221;
    if (qword_1ED884E28 != -1)
      dispatch_once(&qword_1ED884E28, v81);

    if (byte_1ED884D69)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("after combining duplicates: energyEntries=%@"), v79);
      v82 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v83 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "lastPathComponent");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v82, v85, v86, 811);

      PLLogCommon();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v82;
        _os_log_debug_impl(&dword_1CAF47000, v87, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v8 = v8;
      v31 = 0x1E0D7F000uLL;
    }
  }
  if ((_DWORD)v8 != 4)
  {
    -[PLBatteryBreakdownService adjustForegroundTimesWithEnergyEntries:](self, "adjustForegroundTimesWithEnergyEntries:", v79);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBatteryBreakdownService adjustBackgroundTimesWithEnergyEntries:](self, "adjustBackgroundTimesWithEnergyEntries:", v88);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PLBatteryBreakdownService determineDisplayNamesWithEnergyEntries:](self, "determineDisplayNamesWithEnergyEntries:", v79);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v90 = objc_opt_class();
    v220[0] = MEMORY[0x1E0C809B0];
    v220[1] = 3221225472;
    v220[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_767;
    v220[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v220[4] = v90;
    v91 = v220;
    if (qword_1ED884E30 != -1)
      dispatch_once(&qword_1ED884E30, v91);

    if (byte_1ED884D6A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("after determining display names: energyEntries=%@"), v89);
      v92 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v93 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "lastPathComponent");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v92, v95, v96, 821);

      PLLogCommon();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v92;
        _os_log_debug_impl(&dword_1CAF47000, v97, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v8 = v8;
      v31 = 0x1E0D7F000uLL;
    }
  }
  -[PLBatteryBreakdownService filterWithEnergyEntries:withQueryType:](self, "filterWithEnergyEntries:withQueryType:", v89, v8);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v99 = objc_opt_class();
    v219[0] = MEMORY[0x1E0C809B0];
    v219[1] = 3221225472;
    v219[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_772;
    v219[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v219[4] = v99;
    v100 = v219;
    if (qword_1ED884E38 != -1)
      dispatch_once(&qword_1ED884E38, v100);

    if (byte_1ED884D6B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("after filtering based on query type: energyEntries=%@"), v98);
      v101 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v102 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "lastPathComponent");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v101, v104, v105, 826);

      PLLogCommon();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v101;
        _os_log_debug_impl(&dword_1CAF47000, v106, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v8 = v8;
      v31 = 0x1E0D7F000uLL;
    }
  }
  -[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:](self, "filterEnergyEntriesBasedOnTime:withQueryType:", v98, v8);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryBreakdownService removeNodesNotToShowInInternalUI:withQueryType:](self, "removeNodesNotToShowInInternalUI:withQueryType:", v107, v8);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v217 = 0u;
  v218 = 0u;
  v215 = 0u;
  v216 = 0u;
  v109 = v108;
  v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v215, v230, 16);
  if (v110)
  {
    v111 = v110;
    v112 = *(_QWORD *)v216;
    v113 = 0.0;
    do
    {
      for (i = 0; i != v111; ++i)
      {
        if (*(_QWORD *)v216 != v112)
          objc_enumerationMutation(v109);
        objc_msgSend(*(id *)(*((_QWORD *)&v215 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "doubleValue");
        v113 = v113 + v116;

      }
      v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v215, v230, 16);
    }
    while (v111);
  }
  else
  {
    v113 = 0.0;
  }

  if (objc_msgSend(*(id *)(v31 + 4000), "debugEnabled"))
  {
    v124 = objc_opt_class();
    v214[0] = MEMORY[0x1E0C809B0];
    v214[1] = 3221225472;
    v214[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_779;
    v214[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v214[4] = v124;
    v125 = v214;
    if (qword_1ED884E40 != -1)
      dispatch_once(&qword_1ED884E40, v125);

    if (byte_1ED884D6C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("totalEnergySum=%f"), *(_QWORD *)&v113);
      v126 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v127 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "lastPathComponent");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v126, v129, v130, 838);

      PLLogCommon();
      v131 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v126;
        _os_log_debug_impl(&dword_1CAF47000, v131, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v17 == 86400.0)
  {
    -[PLBatteryBreakdownService setTotalEnergyDay:](self, "setTotalEnergyDay:", v113);
  }
  else if (v17 == 604800.0)
  {
    -[PLBatteryBreakdownService setTotalEnergyWeek:](self, "setTotalEnergyWeek:", v113);
  }
  v206 = self;
  v212 = 0u;
  v213 = 0u;
  v211 = 0u;
  v210 = 0u;
  obj = v109;
  v132 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v210, v229, 16);
  if (v132)
  {
    v133 = v132;
    v134 = 0;
    LODWORD(v135) = 0;
    v136 = *(_QWORD *)v211;
    do
    {
      for (j = 0; j != v133; ++j)
      {
        if (*(_QWORD *)v211 != v136)
          objc_enumerationMutation(obj);
        v138 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * j);
        -[PLBatteryBreakdownService qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:](v206, "qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:", v138, v12, v113);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setObject:forKeyedSubscript:", v139, CFSTR("PLBatteryUIAppQualifiersKey"));

        objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "doubleValue");
        v142 = v141;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setObject:forKeyedSubscript:", v143, CFSTR("PLBatteryUIAppEnergyUsedKey"));

        v144 = llround(v142 * 100.0 / v113);
        if (v142 >= 2.0)
          v145 = v144;
        else
          v145 = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setObject:forKeyedSubscript:", v146, CFSTR("PLBatteryUIAppEnergyValueKey"));

        v147 = v134;
        if (!v134
          || (objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyUsedKey")),
              v148 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v148, "doubleValue"),
              v150 = v149,
              v148,
              v142 > v150))
        {
          v134 = v138;

        }
        v135 = (v145 + v135);
      }
      v133 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v210, v229, 16);
    }
    while (v133);
  }
  else
  {
    v134 = 0;
    v135 = 0;
  }
  v151 = obj;

  v152 = v204;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v153 = objc_opt_class();
    v209[0] = MEMORY[0x1E0C809B0];
    v209[1] = 3221225472;
    v209[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_788;
    v209[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v209[4] = v153;
    v154 = v209;
    if (qword_1ED884E48 != -1)
      dispatch_once(&qword_1ED884E48, v154);

    if (byte_1ED884D6D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("totalEnergyPercentSum=%i"), v135);
      v155 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v156 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "lastPathComponent");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v155, v158, v159, 870);

      PLLogCommon();
      v160 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v232 = v155;
        _os_log_debug_impl(&dword_1CAF47000, v160, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v152 = v204;
      v151 = obj;
    }
  }
  if ((_DWORD)v135 != 100 && (int)v135 >= 1)
  {
    v161 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "doubleValue");
    objc_msgSend(v161, "numberWithDouble:", v163 + 100.0 - (double)(int)v135);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "setObject:forKeyedSubscript:", v164, CFSTR("PLBatteryUIAppEnergyValueKey"));

  }
  -[PLBatteryBreakdownService computeTotalForegroundDuration:](v206, "computeTotalForegroundDuration:", v151);
  v166 = v165;
  -[PLBatteryBreakdownService computeTotalBackgroundDuration:](v206, "computeTotalBackgroundDuration:", v151);
  v168 = v167;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v166);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "setObject:forKeyedSubscript:", v170, CFSTR("PLBatteryUIForegroundTimeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v168);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "setObject:forKeyedSubscript:", v171, CFSTR("PLBatteryUIBackgroundTimeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v113);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "setObject:forKeyedSubscript:", v172, CFSTR("PLBatteryUITotalEnergyKey"));

  if (v152)
  {
    objc_msgSend(MEMORY[0x1E0D80078], "defaultBatteryEnergyCapacity");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.00f%% of Battery"), v113 * 100.0 / v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setObject:forKeyedSubscript:", v174, CFSTR("PLBatteryUIBatteryCyclesKey"));

  }
  objc_msgSend(v151, "enumerateObjectsUsingBlock:", &__block_literal_global_804);
  v175 = -[PLBatteryBreakdownService shouldShowBatteryBreakdownWithTotalSumEnergy:withtotalSumEnergyRatioCutOff:](v206, "shouldShowBatteryBreakdownWithTotalSumEnergy:withtotalSumEnergyRatioCutOff:", v113, v202);
  if (v152 > 1 || v175 || v166 >= 60.0 || v168 >= 60.0 || -[PLOperator isDebugEnabled](v206, "isDebugEnabled"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v176 = objc_opt_class();
      v208[0] = MEMORY[0x1E0C809B0];
      v208[1] = 3221225472;
      v208[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_2;
      v208[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v208[4] = v176;
      v177 = v208;
      if (qword_1ED884E50 != -1)
        dispatch_once(&qword_1ED884E50, v177);

      if (byte_1ED884D6E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displaying battery breakdown"));
        v178 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v179 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "lastPathComponent");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v178, v181, v182, 905);

        PLLogCommon();
        v183 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v183, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v232 = v178;
          _os_log_debug_impl(&dword_1CAF47000, v183, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v151 = obj;
      }
    }
    objc_msgSend(v169, "setObject:forKeyedSubscript:", &unk_1E86347B8, CFSTR("PLBatteryUIErrorCodeKey"));
    v184 = v169;
    v185 = v151;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v192 = objc_opt_class();
      v207[0] = MEMORY[0x1E0C809B0];
      v207[1] = 3221225472;
      v207[2] = __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_817;
      v207[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v207[4] = v192;
      v193 = v207;
      if (qword_1ED884E58 != -1)
        dispatch_once(&qword_1ED884E58, v193);

      if (byte_1ED884D6F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not enough energy consumed"));
        v194 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v195 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "lastPathComponent");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:]");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v195, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v194, v197, v198, 910);

        PLLogCommon();
        v199 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v232 = v194;
          _os_log_debug_impl(&dword_1CAF47000, v199, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v151 = obj;
      }
    }
    objc_msgSend(v169, "setObject:forKeyedSubscript:", &unk_1E86347D0, CFSTR("PLBatteryUIErrorCodeKey"));
    v185 = (void *)MEMORY[0x1E0C9AA60];
    v184 = v169;
  }
  objc_msgSend(v184, "setObject:forKeyedSubscript:", v185, CFSTR("PLBatteryUIAppArrayKey"));
  v200 = v169;

  objc_autoreleasePoolPop(context);
  return v200;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D62 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_734(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D63 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_739(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D64 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_744(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D65 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_749(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D66 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_754(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D67 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_759(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D68 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_764(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D69 = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_767(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D6A = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_772(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D6B = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_779(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D6C = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_788(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D6D = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_802(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObjectForKey:", CFSTR("NotificationInfo"));
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D6E = result;
  return result;
}

uint64_t __139__PLBatteryBreakdownService_batteryBreakdownWithTimeRange_withDataRange_withEntryTimeInterval_withQueryType_withTotalSumEnergyRatioCutOff___block_invoke_817(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D6F = result;
  return result;
}

- (id)nonNullValue:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E8587D00;
  }

  return v8;
}

- (id)suggestionsWithEnergyEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v46;
  _QWORD v47[9];
  id v48;
  _QWORD v49[9];
  id v50;
  _QWORD v51[9];
  id v52;
  _QWORD v53[9];
  id v54;
  _QWORD block[5];
  double v56;
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v56 = 0.0;
  v7 = -[PLBatteryBreakdownService shouldSuggestAutoLockWithEnergyEntries:andSavedEnergyPercent:](self, "shouldSuggestAutoLockWithEnergyEntries:andSavedEnergyPercent:", v4, &v56);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (qword_1ED884E60 != -1)
        dispatch_once(&qword_1ED884E60, block);
      if (byte_1ED884D70)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suggesting autolock"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 935);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v9;
          _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v61[0] = CFSTR("PLBatteryUISuggestionTypeKey");
    v61[1] = CFSTR("PLBatteryUISuggestionEnergyPercentKey");
    v62[0] = &unk_1E86347D0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    ADClientSetValueForScalarKey();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("suggestion"), CFSTR("category"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("autoLock"), CFSTR("type"));
    v53[5] = v8;
    v53[6] = 3221225472;
    v53[7] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_841;
    v53[8] = &unk_1E8578178;
    v54 = v6;
    AnalyticsSendEventLazy();

  }
  if (-[PLBatteryBreakdownService shouldSuggestAutoBrightnessWithEnergyEntries:andSavedEnergyPercent:](self, "shouldSuggestAutoBrightnessWithEnergyEntries:andSavedEnergyPercent:", v4, &v56))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v53[0] = v8;
      v53[1] = 3221225472;
      v53[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2;
      v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v53[4] = objc_opt_class();
      if (qword_1ED884E68 != -1)
        dispatch_once(&qword_1ED884E68, v53);
      if (byte_1ED884D71)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suggesting autobrightness"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 948);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v17;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v8 = MEMORY[0x1E0C809B0];
      }
    }
    v59[0] = CFSTR("PLBatteryUISuggestionTypeKey");
    v59[1] = CFSTR("PLBatteryUISuggestionEnergyPercentKey");
    v60[0] = &unk_1E86347B8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

    ADClientSetValueForScalarKey();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("suggestion"), CFSTR("category"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("autoBrightness"), CFSTR("type"));
    v51[5] = v8;
    v51[6] = 3221225472;
    v51[7] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_851;
    v51[8] = &unk_1E8578178;
    v52 = v6;
    AnalyticsSendEventLazy();

  }
  if (-[PLBatteryBreakdownService shouldSuggestReduceBrightnessWithEnergyEntries:andSavedEnergyPercent:](self, "shouldSuggestReduceBrightnessWithEnergyEntries:andSavedEnergyPercent:", v4, &v56))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v51[0] = v8;
      v51[1] = 3221225472;
      v51[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2_854;
      v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v51[4] = objc_opt_class();
      if (qword_1ED884E70 != -1)
        dispatch_once(&qword_1ED884E70, v51);
      if (byte_1ED884D72)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suggesting reduce brightness"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "lastPathComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 961);

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v25;
          _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v8 = MEMORY[0x1E0C809B0];
      }
    }
    v57[0] = CFSTR("PLBatteryUISuggestionTypeKey");
    v57[1] = CFSTR("PLBatteryUISuggestionEnergyPercentKey");
    v58[0] = &unk_1E86347E8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v32);

    ADClientSetValueForScalarKey();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("suggestion"), CFSTR("category"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("reduceBrightness"), CFSTR("type"));
    v49[5] = v8;
    v49[6] = 3221225472;
    v49[7] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_862;
    v49[8] = &unk_1E8578178;
    v50 = v6;
    AnalyticsSendEventLazy();

  }
  if (-[PLBatteryBreakdownService shouldShowOngoingRestoreInsight](self, "shouldShowOngoingRestoreInsight"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v49[0] = v8;
      v49[1] = 3221225472;
      v49[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2_865;
      v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v49[4] = objc_opt_class();
      if (qword_1ED884E78 != -1)
        dispatch_once(&qword_1ED884E78, v49);
      if (byte_1ED884D73)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("showing restore in progress"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 974);

        PLLogCommon();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v33;
          _os_log_debug_impl(&dword_1CAF47000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v8 = MEMORY[0x1E0C809B0];
      }
    }
    ADClientSetValueForScalarKey();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("insight"), CFSTR("category"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("ongoingRestore"), CFSTR("type"));
    v47[5] = v8;
    v47[6] = 3221225472;
    v47[7] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_874;
    v47[8] = &unk_1E8578178;
    v48 = v6;
    AnalyticsSendEventLazy();
    objc_msgSend(v5, "addObject:", &unk_1E864D3E0);

  }
  if (-[PLBatteryBreakdownService shouldShowUpgradeInsightWithQueryType:](self, "shouldShowUpgradeInsightWithQueryType:", 0))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v47[0] = v8;
      v47[1] = 3221225472;
      v47[2] = __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_881;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = objc_opt_class();
      if (qword_1ED884E80 != -1)
        dispatch_once(&qword_1ED884E80, v47);
      if (byte_1ED884D74)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suggesting high activity after upgrade"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "lastPathComponent");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService suggestionsWithEnergyEntries:]");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 1050);

        PLLogCommon();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v39;
          _os_log_debug_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    ADClientSetValueForScalarKey();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("insight"), CFSTR("category"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("upgradeUsage"), CFSTR("type"));
    v46 = v6;
    AnalyticsSendEventLazy();
    objc_msgSend(v5, "addObject:", &unk_1E864D408);

  }
  return v5;
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D70 = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_841(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D71 = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_851(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2_854(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D72 = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_862(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_2_865(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D73 = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_874(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_881(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D74 = result;
  return result;
}

id __58__PLBatteryBreakdownService_suggestionsWithEnergyEntries___block_invoke_888(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)shouldShowOngoingRestoreInsight
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char v10;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
  v2 = (void *)_CFPreferencesCopyValueWithContainer();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __60__PLBatteryBreakdownService_shouldShowOngoingRestoreInsight__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (qword_1ED884E88 != -1)
      dispatch_once(&qword_1ED884E88, &block);
    if (byte_1ED884D75)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shouldShowOngoingRestoreInsight = %@"), v2, block, v13, v14, v15, v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService shouldShowOngoingRestoreInsight]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1073);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v2)
    v10 = objc_msgSend(v2, "BOOLValue");
  else
    v10 = 0;

  return v10;
}

uint64_t __60__PLBatteryBreakdownService_shouldShowOngoingRestoreInsight__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D75 = result;
  return result;
}

- (BOOL)isBackgroundRefreshEnabled:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLowPowerModeEnabled");

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("KeepAppsUpToDateAppList"), CFSTR("com.apple.mt"));
    objc_msgSend(v7, "objectForKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v6 = objc_msgSend(v8, "BOOLValue");
    else
      v6 = 1;

  }
  return v6;
}

- (BOOL)isBackgroundLocationUsageAlwaysEnabled:(id)a3 withLocationDict:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x1E0C9E3C8], "entityAuthorizationForLocationDictionary:", v4) == 4;

  return v5;
}

- (id)shouldSuggestBackgroundCPUWithEnergyEntries:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  PLBatteryBreakdownService *v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 160;
  if (self->_totalEnergyDay == 0.0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(&unk_1E8651590, "objectAtIndexedSubscript:", 14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E86515A8, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v10;
    v34 = v4;
    v35 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(&unk_1E86515C0, "objectAtIndexedSubscript:", 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v21 = v20;

          if (v21 != 0.0)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v11);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "doubleValue");
            v24 = v23;

            if (v24 / v21 * 100.0 > 5.0)
            {
              v25 = v24 / *(double *)((char *)&self->super.super.super.isa + v5) * 100.0;
              if (v25 > 5.0)
              {
                v41[0] = CFSTR("PLBatteryUISuggestionEnergyKey");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v41[1] = CFSTR("PLBatteryUISuggestionPercentKey");
                v42[0] = v36;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v42[1] = v26;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
                v27 = v12;
                v28 = v11;
                v29 = v5;
                v30 = self;
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "setObject:forKeyedSubscript:", v31, v32);

                self = v30;
                v5 = v29;
                v11 = v28;
                v12 = v27;

              }
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v35, "count"))
      v6 = v35;
    else
      v6 = 0;

    v4 = v34;
  }

  return v6;
}

- (id)shouldSuggestBackgroundLocationWithEnergyEntries:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PLBatteryBreakdownService *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  void *v51;
  PLBatteryBreakdownService *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_totalEnergyDay == 0.0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(&unk_1E86515D8, "objectAtIndexedSubscript:", 2);
    v52 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E86515F0, "objectAtIndexedSubscript:", 48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v7, v8);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = self;
    v10 = (void *)objc_opt_class();
    objc_msgSend(&unk_1E8651608, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E8651620, "objectAtIndexedSubscript:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v11, v12);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_opt_class();
    objc_msgSend(&unk_1E8651638, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E8651650, "objectAtIndexedSubscript:", 13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v14, v15);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = v4;
    v51 = (void *)objc_opt_new();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(&unk_1E8651668, "objectAtIndexedSubscript:", 48);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          v25 = v24;

          objc_msgSend(&unk_1E8651680, "objectAtIndexedSubscript:", 12);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doubleValue");
          v29 = v25 + v28;

          objc_msgSend(&unk_1E8651698, "objectAtIndexedSubscript:", 13);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v33 = v29 + v32;

          if (v33 != 0.0)
          {
            objc_msgSend(v21, "objectForKeyedSubscript:", v55);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "doubleValue");
            v36 = v35;

            objc_msgSend(v21, "objectForKeyedSubscript:", v54);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "doubleValue");
            v39 = v36 + v38;

            objc_msgSend(v21, "objectForKeyedSubscript:", v53);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "doubleValue");
            v42 = v39 + v41;

            v43 = v33 - v42;
            if (v33 - v42 < 0.0)
              v43 = 0.0;
            if (v43 / v33 * 100.0 > 33.0)
            {
              v44 = v43 / v9->_totalEnergyDay * 100.0;
              if (v44 > 5.0)
              {
                v60[0] = CFSTR("PLBatteryUISuggestionEnergyKey");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v60[1] = CFSTR("PLBatteryUISuggestionPercentKey");
                v61[0] = v45;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v61[1] = v46;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setObject:forKeyedSubscript:", v47, v48);

                v9 = v52;
              }
            }
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v18);
    }

    if (objc_msgSend(v51, "count"))
      v5 = v51;
    else
      v5 = 0;
    v4 = v50;

  }
  return v5;
}

- (BOOL)shouldSuggestAutoLockWithEnergyEntries:(id)a3 andSavedEnergyPercent:(double *)a4
{
  id v5;
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  double *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveValueForSetting:", *MEMORY[0x1E0D46F68]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "intValue") == 0x7FFFFFFF)
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(&unk_1E86516B0, "objectAtIndexedSubscript:", 9);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E86516C8, "objectAtIndexedSubscript:", 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_class();
    objc_msgSend(&unk_1E86516E0, "objectAtIndexedSubscript:", 9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E86516F8, "objectAtIndexedSubscript:", 56);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v32 = a4;
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      v20 = 0.0;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", v11);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          v25 = v24;
          objc_msgSend(v22, "objectForKeyedSubscript:", v15);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          v20 = v20 + v25 + v27;

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v18);
    }
    else
    {
      v20 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0D80078], "defaultBatteryEnergyCapacity");
    *v32 = v20 * 100.0 / v29;
    objc_msgSend(MEMORY[0x1E0D80078], "defaultBatteryEnergyCapacity");
    v28 = v20 > v30 * 0.01;

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)shouldSuggestAutoBrightnessWithEnergyEntries:(id)a3 andSavedEnergyPercent:(double *)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v38;
  double *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (+[PLDisplayAgent shouldLogALSPowerSaved](PLDisplayAgent, "shouldLogALSPowerSaved", a3))
  {
    objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("BKEnableALS"), CFSTR("com.apple.backboardd"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6 || (objc_msgSend(v6, "BOOLValue") & 1) != 0)
    {
      v8 = 0;
LABEL_21:

      return v8;
    }
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ALSPowerSaved"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entriesForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v13)
    {
      v14 = v13;
      v38 = v9;
      v39 = a4;
      v15 = 0;
      v16 = *(_QWORD *)v41;
      v17 = 0.0;
      do
      {
        v18 = 0;
        v19 = v15;
        do
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(v12);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v18);
          if (v19)
          {
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Power"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doubleValue");
            v23 = v22;

            objc_msgSend(v20, "entryDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "entryDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "timeIntervalSinceDate:", v25);
            v27 = v26;

            v17 = v17 + v23 * (v27 / 3600.0);
          }
          v15 = v20;

          ++v18;
          v19 = v15;
        }
        while (v14 != v18);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v14);

      if (!v15)
      {
        v9 = v38;
        a4 = v39;
        goto LABEL_20;
      }
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Power"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;

      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "entryDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "timeIntervalSinceDate:", v32);
      v34 = v33;

      v17 = v17 + v30 * (v34 / 3600.0);
      v9 = v38;
      a4 = v39;
    }
    else
    {
      v17 = 0.0;
      v15 = v12;
    }

LABEL_20:
    objc_msgSend(MEMORY[0x1E0D80078], "defaultBatteryEnergyCapacity", v38, v39, (_QWORD)v40);
    *a4 = v17 * 100.0 / v35;
    objc_msgSend(MEMORY[0x1E0D80078], "defaultBatteryEnergyCapacity");
    v8 = v17 > v36 * 0.01;

    goto LABEL_21;
  }
  return 0;
}

- (BOOL)shouldSuggestReduceBrightnessWithEnergyEntries:(id)a3 andSavedEnergyPercent:(double *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  BOOL v17;
  double v18;
  double v19;
  double *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80078], "isALSCurveHigherThanDefault"))
  {
    v21 = a4;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(&unk_1E8651710, "objectAtIndexedSubscript:", 6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v10 = v10 + v15;

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0D80078], "defaultBatteryEnergyCapacity");
    *v21 = v10 * 100.0 / v18;
    objc_msgSend(MEMORY[0x1E0D80078], "defaultBatteryEnergyCapacity");
    v17 = v10 > v19 * 0.05;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (double)getLastUpgradeTimestamp
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastUpgradeTimestamp"), CFSTR("com.apple.powerlogd"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)getfirstEntryTimestampFromDb
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;

  v3 = *MEMORY[0x1E0D80368];
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AppRunTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v3, *MEMORY[0x1E0D80190]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v3, *MEMORY[0x1E0D80168]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entryForKey:withID:", v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entryForKey:withID:", v5, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entryForKey:withID:", v6, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v13 = v10 == 0;
  else
    v13 = 1;
  if (v13 || v12 == 0)
  {
    v23 = 9.22337204e18;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = fmax(v17, v19);
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = fmax(v20, v22);

  }
  return v23;
}

- (id)getUsageDataWithStartTime:(double)a3 withMidTime:(double)a4 withEndTime:(id)a5
{
  id v8;
  double v9;
  double v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  BOOL v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v53;
  double v54;
  uint8_t buf[4];
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  double v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = COERCE_DOUBLE(objc_alloc_init(MEMORY[0x1E0C99E08]));
  objc_msgSend(v8, "timeIntervalSince1970");
  v53 = v10;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "timeIntervalSince1970");
  v14 = v13 - a4;
  objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
  v15 = (void *)_CFPreferencesCopyValueWithContainer();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    v18 = v17;
  }
  else
  {
    v18 = 86400.0;
  }

  v54 = a4;
  if (v14 <= v18)
  {
    objc_msgSend(v8, "timeIntervalSince1970");
    v36 = v35;
    v37 = a4 + -86400.0;
    v19 = 0.0;
    v38 = a3;
    v39 = v37 <= a3;
    v28 = 0.0;
    v25 = 0.0;
    v34 = 0.0;
    v31 = 0.0;
    if (!v39)
    {
      v40 = v38;
      do
      {
        v36 = v36 + -86400.0;
        -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, v37, v36 - v37, 0.0, 0.0, 3600.0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyKey"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "doubleValue");
        v31 = v31 + v43;

        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("PLBatteryUIForegroundTimeKey"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        v34 = v34 + v45;

        v19 = v19 + v36 - v37;
        v37 = v37 + -86400.0;
      }
      while (v37 > v40);
      v25 = 0.0;
      v28 = 0.0;
    }
  }
  else
  {
    v19 = a4 - a3;
    objc_msgSend(v8, "timeIntervalSince1970");
    -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, a4, v20 - a4, 0.0, 0.0, 3600.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, a3, a4 - a3, 0.0, 0.0, 3600.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PLBatteryUIForegroundTimeKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;

    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PLBatteryUIForegroundTimeKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v33;

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v56 = v25;
    v57 = 2048;
    v58 = v28;
    v59 = 2048;
    v60 = v31;
    v61 = 2048;
    v62 = v34;
    _os_log_impl(&dword_1CAF47000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "afterUpgradeTotalEnergy: %f afterUpgradeDataTotalForeGroundTime: %f beforeUpgradeDataTotalEnergy: %f beforeUpgradeDataTotalForeGroundTime: %f", buf, 0x2Au);
  }
  v46 = v28;
  v47 = v53 - v54;
  if (v19 == 0.0)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("AvgPower"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("AvgForegroundTime"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31 / v19);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v48, CFSTR("AvgPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34 / v19);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v49, CFSTR("AvgForegroundTime"));

  }
  if (v47 == 0.0)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("AvgPower"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("AvgForegroundTime"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25 / v47);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v50, CFSTR("AvgPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46 / v47);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v51, CFSTR("AvgForegroundTime"));

  }
  objc_msgSend(*(id *)&v9, "setObject:forKeyedSubscript:", v11, CFSTR("beforeUpgradeData"));
  objc_msgSend(*(id *)&v9, "setObject:forKeyedSubscript:", v12, CFSTR("afterUpgradeData"));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v9;
    _os_log_impl(&dword_1CAF47000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "-----Usage data--- %@", buf, 0xCu);
  }

  return *(id *)&v9;
}

- (id)getUpgradeDataWithLastUpgradeTimestamp:(double)a3 withFirstEntryTimestampFromDB:(double)a4 withNow:(id)a5 withBeforeUpgrade:(BOOL)a6 withRange:(_PLTimeIntervalRange)a7
{
  double var1;
  double var0;
  _BOOL4 v9;
  id v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;

  var1 = a7.var1;
  var0 = a7.var0;
  v9 = a6;
  v13 = a5;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v9)
    goto LABEL_6;
  objc_msgSend(v13, "timeIntervalSince1970");
  v16 = v15 - a3;
  objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
  v17 = (void *)_CFPreferencesCopyValueWithContainer();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "doubleValue");
    v20 = v19;
  }
  else
  {
    v20 = 86400.0;
  }

  if (v16 <= v20)
  {
    objc_msgSend(v13, "timeIntervalSince1970");
    v32 = a3 + -86400.0;
    v27 = 0.0;
    v24 = 0.0;
    if (v32 > a4)
    {
      v33 = v31;
      do
      {
        v33 = v33 + -86400.0;
        -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, v32, v33 - v32, 0.0, 0.0, 3600.0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyKey"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v37 = v24 + v36;

        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("PLBatteryUIForegroundTimeKey"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        v24 = v37 + v39;

        v32 = v32 + -86400.0;
      }
      while (v32 > a4);
    }
  }
  else
  {
LABEL_6:
    -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 0, var0, var1, 0.0, 0.0, 3600.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PLBatteryUIForegroundTimeKey"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v28, CFSTR("TotalEnergy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v29, CFSTR("TotalForeGroundTime"));

  return v14;
}

- (BOOL)shouldShowUpgradeInsightWithQueryType:(int)a3
{
  double v4;
  BOOL v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  int v66;
  double v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  -[PLBatteryBreakdownService getLastUpgradeTimestamp](self, "getLastUpgradeTimestamp", *(_QWORD *)&a3);
  if (v4 != 0.0)
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8 - v6;
    objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
    v10 = (void *)_CFPreferencesCopyValueWithContainer();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      v13 = v12;
    }
    else
    {
      v13 = 864000.0;
    }

    if (v9 >= v13
      || ((objc_msgSend(MEMORY[0x1E0D80078], "containerPath"),
           v14 = (void *)_CFPreferencesCopyValueWithContainer(),
           (v15 = v14) == 0)
        ? (v17 = 86400.0)
        : (objc_msgSend(v14, "doubleValue"), v17 = v16),
          v15,
          v9 <= v17))
    {
      v5 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v66) = 0;
        v25 = MEMORY[0x1E0C81028];
        v26 = "After upgrade time criteria not satisfied";
LABEL_16:
        _os_log_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v66, 2u);
        v5 = 0;
      }
    }
    else
    {
      -[PLBatteryBreakdownService getfirstEntryTimestampFromDb](self, "getfirstEntryTimestampFromDb");
      v19 = v18;
      v20 = v6 - v18;
      objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
      v21 = (void *)_CFPreferencesCopyValueWithContainer();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "doubleValue");
        v24 = v23;
      }
      else
      {
        v24 = 259200.0;
      }

      if (v20 > v24)
      {
        objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
        v27 = (void *)_CFPreferencesCopyValueWithContainer();
        v28 = v27;
        if (v27)
        {
          objc_msgSend(v27, "doubleValue");
          v30 = v29;
        }
        else
        {
          v30 = 864000.0;
        }

        if (v20 >= v30)
        {
          objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
          v31 = (void *)_CFPreferencesCopyValueWithContainer();
          v32 = v31;
          if (v31)
          {
            objc_msgSend(v31, "doubleValue");
            v34 = v33;
          }
          else
          {
            v34 = 864000.0;
          }

          v19 = v6 - v34;
        }
        -[PLBatteryBreakdownService getUsageDataWithStartTime:withMidTime:withEndTime:](self, "getUsageDataWithStartTime:withMidTime:withEndTime:", v7, v19, v6);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("beforeUpgradeData"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("afterUpgradeData"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("AvgPower"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        v40 = v39;

        objc_msgSend(MEMORY[0x1E0D7FFF8], "defaultBatteryEnergyCapacity");
        v42 = v40 * 86400.0 / v41;
        objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
        v43 = (void *)_CFPreferencesCopyValueWithContainer();
        v44 = v43;
        if (v43)
        {
          objc_msgSend(v43, "doubleValue");
          v46 = v45;
        }
        else
        {
          v46 = 0.3;
        }

        if (v42 >= v46)
        {
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("AvgPower"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "doubleValue");
          v49 = v48;

          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("AvgForegroundTime"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "doubleValue");
          v52 = v51;

          objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
          v53 = (void *)_CFPreferencesCopyValueWithContainer();
          v54 = v53;
          v55 = 1.3;
          v56 = 1.3;
          if (v53)
          {
            objc_msgSend(v53, "doubleValue");
            v56 = v57;
          }

          v58 = v40 * v56;
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("AvgForegroundTime"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "doubleValue");
          v61 = v60;
          objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
          v62 = (void *)_CFPreferencesCopyValueWithContainer();
          v63 = v62;
          if (v62)
          {
            objc_msgSend(v62, "doubleValue");
            v55 = v64;
          }

          v5 = v52 >= v61 * v55 && v49 >= v58;
        }
        else
        {
          v5 = 0;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v66 = 134217984;
            v67 = v42 * 100.0;
            _os_log_impl(&dword_1CAF47000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Drain prior to upgrade: %f", (uint8_t *)&v66, 0xCu);
            v5 = 0;
          }
        }

        goto LABEL_43;
      }
      v5 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v66) = 0;
        v25 = MEMORY[0x1E0C81028];
        v26 = "There is not enough data pre-upgrade";
        goto LABEL_16;
      }
    }
LABEL_43:

    return v5;
  }
  v5 = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v66) = 0;
    _os_log_impl(&dword_1CAF47000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Last upgrade timestamp not available", (uint8_t *)&v66, 2u);
    return 0;
  }
  return v5;
}

+ (id)defaults
{
  return &unk_1E864D430;
}

- (id)energyEntriesWithRange:(_PLTimeIntervalRange)a3 withEntryTimeInterval:(double)a4 withQueryType:(int)a5
{
  double var1;
  double var0;
  PLBatteryBreakdownService *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  NSObject *v80;
  unint64_t v81;
  void *v82;
  double v83;
  void *v84;
  NSObject *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  int v108;
  void *v109;
  void *v110;
  unint64_t v111;
  NSObject *v112;
  void *v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  int v131;
  int v132;
  void *v133;
  int v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  int v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *context;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  id obj;
  void *v159;
  void *v161;
  void *v162;
  PLBatteryBreakdownService *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  _QWORD block[5];
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _QWORD v173[5];
  _QWORD v174[5];
  _QWORD v175[5];
  _QWORD v176[5];
  _QWORD v177[5];
  uint8_t buf[4];
  _BYTE v179[14];
  _BYTE v180[128];
  uint64_t v181;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = self;
  v181 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    v177[0] = MEMORY[0x1E0C809B0];
    v177[1] = 3221225472;
    v177[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke;
    v177[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v177[4] = v9;
    if (qword_1ED884E90 != -1)
      dispatch_once(&qword_1ED884E90, v177);
    if (byte_1ED884D76)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entryTimeInterval=%f"), *(_QWORD *)&a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1504);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v179 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v16 = *MEMORY[0x1E0D80368];
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80368], *MEMORY[0x1E0D80190]);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v16, *MEMORY[0x1E0D80168]);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3940];
  v20 = *MEMORY[0x1E0D80178];
  objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "whereValidName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ IN (SELECT ID FROM '%@' WHERE %@)"), v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();

  v24 = var0 + var1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timestamp>%f AND timestamp<%f AND timeInterval=%f AND (%@)"), *(_QWORD *)&var0, *(_QWORD *)&v24, *(_QWORD *)&a4, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = (void *)v17;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM '%@' WHERE (%@);"), v17, v25);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v26 = objc_opt_class();
    v176[0] = MEMORY[0x1E0C809B0];
    v176[1] = 3221225472;
    v176[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1066;
    v176[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v176[4] = v26;
    if (qword_1ED884E98 != -1)
      dispatch_once(&qword_1ED884E98, v176);
    if (byte_1ED884D77)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateRootNodeEnergyQuery=%@"), v150);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 1517);

      PLLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v179 = v27;
        _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator storage](v8, "storage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "entriesForKey:withQuery:", v161, v150);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v34 = objc_opt_class();
    v175[0] = MEMORY[0x1E0C809B0];
    v175[1] = 3221225472;
    v175[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1071;
    v175[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v175[4] = v34;
    if (qword_1ED884EA0 != -1)
      dispatch_once(&qword_1ED884EA0, v175);
    if (byte_1ED884D78)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateRootNodeEnergyEntries=%@"), v149);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 1521);

      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v179 = v35;
        _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timestamp>%f AND timestamp<%f AND timeInterval=%f AND (%@)"), *(_QWORD *)&var0, *(_QWORD *)&v24, *(_QWORD *)&a4, v23);
  v41 = objc_claimAutoreleasedReturnValue();

  v144 = (void *)v41;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM '%@' WHERE (%@);"), v18, v41);
  v42 = objc_claimAutoreleasedReturnValue();
  v148 = (void *)v42;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v43 = objc_opt_class();
    v174[0] = MEMORY[0x1E0C809B0];
    v174[1] = 3221225472;
    v174[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1076;
    v174[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v174[4] = v43;
    if (qword_1ED884EA8 != -1)
      dispatch_once(&qword_1ED884EA8, v174);
    if (byte_1ED884D79)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateQualificationEnergyQuery=%@"), v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "lastPathComponent");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 1526);

      PLLogCommon();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v179 = v44;
        _os_log_debug_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v42 = (uint64_t)v148;
    }
  }
  v145 = (void *)v23;
  -[PLOperator storage](v8, "storage");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "entriesForKey:withQuery:", v18, v42);
  v51 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v52 = objc_opt_class();
    v173[0] = MEMORY[0x1E0C809B0];
    v173[1] = 3221225472;
    v173[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1081;
    v173[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v173[4] = v52;
    if (qword_1ED884EB0 != -1)
      dispatch_once(&qword_1ED884EB0, v173);
    if (byte_1ED884D7A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateQualificationEnergyEntries=%@"), v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "lastPathComponent");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "logMessage:fromFile:fromFunction:fromLineNumber:", v53, v56, v57, 1530);

      PLLogCommon();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v179 = v53;
        _os_log_debug_impl(&dword_1CAF47000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v146 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v143 = (void *)v51;
  objc_msgSend(v149, "arrayByAddingObjectsFromArray:", v51);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v180, 16);
  if (v166)
  {
    v164 = *MEMORY[0x1E0D801A0];
    v165 = *(_QWORD *)v170;
    v157 = *MEMORY[0x1E0D80188];
    v155 = *MEMORY[0x1E0D80170];
    v156 = *MEMORY[0x1E0D80180];
    v153 = *MEMORY[0x1E0D80198];
    v154 = *MEMORY[0x1E0D801A8];
    v159 = v59;
    v163 = v8;
    do
    {
      v60 = 0;
      v61 = 0x1E0D7F000uLL;
      do
      {
        if (*(_QWORD *)v170 != v165)
          objc_enumerationMutation(obj);
        v62 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * v60);
        if (objc_msgSend(*(id *)(v61 + 4000), "debugEnabled"))
        {
          v63 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1086;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v63;
          if (qword_1ED884EB8 != -1)
            dispatch_once(&qword_1ED884EB8, block);
          if (byte_1ED884D7B)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateEnergyEntry=%@"), v62);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "lastPathComponent");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService energyEntriesWithRange:withEntryTimeInterval:withQueryType:]");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v67, v68, 1535);

            PLLogCommon();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v179 = v64;
              _os_log_debug_impl(&dword_1CAF47000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(v62, "objectForKeyedSubscript:", v164);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v70)
        {
          objc_msgSend(v59, "objectForKeyedSubscript:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (v71)
            goto LABEL_52;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setObject:forKeyedSubscript:", v72, v70);

          objc_msgSend(v59, "objectForKeyedSubscript:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBatteryBreakdownService nodeIDToNodeName](v8, "nodeIDToNodeName");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectForKeyedSubscript:", v70);
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          if (v74)
          {
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v74, CFSTR("PLBatteryUIAppBundleIDKey"));

LABEL_52:
            objc_msgSend(v62, "entryKey");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "isEqualToString:", v161);

            if (!v76)
            {
              objc_msgSend(v62, "objectForKeyedSubscript:", v157);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(&unk_1E8651740, "objectAtIndexedSubscript:", (int)objc_msgSend(v162, "intValue"));
              v86 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "objectForKeyedSubscript:", v156);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(&unk_1E8651758, "objectAtIndexedSubscript:", (int)objc_msgSend(v79, "intValue"));
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v167 = (void *)v86;
              objc_msgSend((id)objc_opt_class(), "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v87, v86);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "objectForKeyedSubscript:", v155);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v71, "objectForKeyedSubscript:", v88);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "doubleValue");
              v93 = v92;
              objc_msgSend(v89, "doubleValue");
              objc_msgSend(v90, "numberWithDouble:", v93 + v94 / 1000.0);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "setObject:forKeyedSubscript:", v95, v88);

              v96 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v71, "objectForKeyedSubscript:", v87);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "doubleValue");
              v99 = v98;
              objc_msgSend(v89, "doubleValue");
              objc_msgSend(v96, "numberWithDouble:", v99 + v100 / 1000.0);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "setObject:forKeyedSubscript:", v101, v87);

              if (a5 == 4 && objc_msgSend(v79, "intValue") == 2)
              {
                v102 = -[PLBatteryBreakdownService energyMetricBucketForRootNodeID:](v163, "energyMetricBucketForRootNodeID:", v162);
                v103 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v102);
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "stringWithFormat:", CFSTR("%@"), v104);
                v105 = (void *)objc_claimAutoreleasedReturnValue();

                if (v105)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("fg"), v105);
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  v107 = objc_msgSend(v89, "intValue");
                  if (v107 >= 1)
                  {
                    v108 = v107;
                    v151 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v71, "objectForKeyedSubscript:", v106);
                    v152 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v151, "numberWithInt:", objc_msgSend(v152, "intValue") + v108);
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "setObject:forKeyedSubscript:", v109, v106);

                  }
                }

              }
              v8 = v163;
              v77 = 0x1E0D7F000;
LABEL_66:

              v110 = v162;
              goto LABEL_79;
            }
            v77 = v61;
            objc_msgSend(v62, "objectForKeyedSubscript:", v154);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&unk_1E8651728, "objectAtIndexedSubscript:", (int)objc_msgSend(v78, "intValue"));
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectForKeyedSubscript:", v153);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v78, "intValue") == 58)
            {
              PLLogCommon();
              v80 = objc_claimAutoreleasedReturnValue();
              v81 = 0x1E0CB3000uLL;
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
              {
                v134 = objc_msgSend(v78, "intValue");
                objc_msgSend(v79, "doubleValue");
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v179 = v134;
                v81 = 0x1E0CB3000;
                *(_WORD *)&v179[4] = 2048;
                *(_QWORD *)&v179[6] = v135;
                _os_log_debug_impl(&dword_1CAF47000, v80, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
              }

              v82 = *(void **)(v81 + 2024);
              objc_msgSend(v79, "doubleValue");
              objc_msgSend(v82, "numberWithDouble:", fmin(v83, 9000.0));
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              PLLogCommon();
              v85 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                goto LABEL_84;
              goto LABEL_71;
            }
            v111 = 0x1E0CB3000uLL;
            if (objc_msgSend(v78, "intValue") == 59)
            {
              PLLogCommon();
              v112 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
              {
                v136 = objc_msgSend(v78, "intValue");
                objc_msgSend(v79, "doubleValue");
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v179 = v136;
                *(_WORD *)&v179[4] = 2048;
                *(_QWORD *)&v179[6] = v137;
                _os_log_debug_impl(&dword_1CAF47000, v112, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
              }

              v113 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v79, "doubleValue");
              objc_msgSend(v113, "numberWithDouble:", fmin(v114, 5500.0));
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              PLLogCommon();
              v85 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
              {
LABEL_84:
                v138 = objc_msgSend(v78, "intValue");
                objc_msgSend(v84, "doubleValue");
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v179 = v138;
                *(_WORD *)&v179[4] = 2048;
                *(_QWORD *)&v179[6] = v139;
                _os_log_debug_impl(&dword_1CAF47000, v85, OS_LOG_TYPE_DEBUG, "after clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
              }
LABEL_71:
              v115 = v78;

              v79 = v84;
              v111 = 0x1E0CB3000;
            }
            else
            {
              v115 = v78;
            }
            v116 = *(void **)(v111 + 2024);
            objc_msgSend(v71, "objectForKeyedSubscript:", v167);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "doubleValue");
            v119 = v118;
            objc_msgSend(v79, "doubleValue");
            objc_msgSend(v116, "numberWithDouble:", v119 + v120 / 1000.0);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v121, v167);

            v122 = *(void **)(v111 + 2024);
            objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "doubleValue");
            v125 = v124;
            objc_msgSend(v79, "doubleValue");
            objc_msgSend(v122, "numberWithDouble:", v125 + v126 / 1000.0);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v127, CFSTR("PLBatteryUIAppEnergyValueKey"));

            if (a5 == 4)
            {
              v110 = v115;
              v128 = -[PLBatteryBreakdownService energyMetricBucketForRootNodeID:](v163, "energyMetricBucketForRootNodeID:", v115);
              v129 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(v111 + 2024), "numberWithShort:", v128);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "stringWithFormat:", CFSTR("%@"), v130);
              v87 = (void *)objc_claimAutoreleasedReturnValue();

              if (v87)
              {
                v131 = objc_msgSend(v79, "intValue");
                if (v131 >= 1)
                {
                  v132 = v131;
                  v162 = v110;
                  v133 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v71, "objectForKeyedSubscript:", v87);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  v77 = 0x1E0D7F000;
                  objc_msgSend(v133, "numberWithInt:", objc_msgSend(v88, "intValue") + v132);
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "setObject:forKeyedSubscript:", v89, v87);
                  v8 = v163;
                  goto LABEL_66;
                }
              }
              v8 = v163;
LABEL_79:

            }
            else
            {
              v8 = v163;
              v110 = v115;
            }
            v59 = v159;

            v61 = v77;
          }

        }
        ++v60;
      }
      while (v166 != v60);
      v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v180, 16);
      v166 = v140;
    }
    while (v140);
  }

  objc_msgSend(v59, "allValues");
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v141;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D76 = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1066(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D77 = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1071(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D78 = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1076(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D79 = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1081(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D7A = result;
  return result;
}

uint64_t __88__PLBatteryBreakdownService_energyEntriesWithRange_withEntryTimeInterval_withQueryType___block_invoke_1086(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D7B = result;
  return result;
}

- (BOOL)isForegroundOnlyBucket:(signed __int16)a3
{
  return (a3 < 9) & (0x10Au >> a3);
}

- (signed)energyMetricBucketForRootNodeID:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "intValue") - 2;
  if (v3 > 0x3C)
    return 0;
  else
    return word_1CB389300[v3];
}

- (id)populateEnergyBucketKeysWithEntries:(id)a3
{
  uint64_t v3;
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unsigned int v27;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = a3;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v36;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(obj);
        v32 = v3;
        v4 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v3);
        v5 = 1;
        do
        {
          v6 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("fg"), v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("bg"), v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "intValue");

          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "intValue");

          if (-[PLBatteryBreakdownService isForegroundOnlyBucket:](self, "isForegroundOnlyBucket:", v5))
          {
            v14 = v12;
            if ((int)v12 >= 1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v9);

              v14 = v12;
            }
          }
          v16 = (v12 - v14);
          if ((int)v16 >= 1)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            v19 = v18;

            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "doubleValue");
            v22 = v21;

            v23 = v19 + v22;
            if (v19 + v22 <= 0.0
              || ((v23 = v19 / v23 * (double)(int)v12, (int)v16 >= (int)v23)
                ? (v16 = (int)v23)
                : (v16 = v16),
                  (int)v16 >= 1))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v10);

              v14 = v12 - v16;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v12 - v16));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, v9);

            }
          }
          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v40 = v33;
            v41 = 2112;
            v42 = v8;
            v43 = 1024;
            v44 = v12;
            v45 = 1024;
            v46 = v14;
            v47 = 1024;
            v48 = v16;
            _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@: %@ total:%d fg:%d bg:%d", buf, 0x28u);

          }
          v27 = (unsigned __int16)v5++;
        }
        while (v27 < 0x11);
        v3 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v31);
  }
  return obj;
}

- (id)populateRootNodeEnergyKeysWithEnergyEntries:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  PLBatteryBreakdownService *v42;
  uint64_t v43;
  _QWORD v44[5];
  _QWORD block[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = a3;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v39)
  {
    v4 = 0x1E0D7F000uLL;
    v38 = *(_QWORD *)v52;
    v42 = self;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v52 != v38)
          objc_enumerationMutation(obj);
        v40 = v5;
        v6 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v5);
        if (objc_msgSend(*(id *)(v4 + 4000), "debugEnabled"))
        {
          v7 = objc_opt_class();
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke;
          v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v50[4] = v7;
          if (qword_1ED884EC0 != -1)
            dispatch_once(&qword_1ED884EC0, v50);
          if (byte_1ED884D7C)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntry=%@"), v6);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "lastPathComponent");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService populateRootNodeEnergyKeysWithEnergyEntries:]");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1753);

            PLLogCommon();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v8;
              _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        -[PLBatteryBreakdownService rootNodeNameToRootNodeEnergyKey](self, "rootNodeNameToRootNodeEnergyKey");
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        if (v14)
        {
          v15 = v14;
          v43 = *(_QWORD *)v47;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v47 != v43)
                objc_enumerationMutation(v41);
              v17 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v16);
              if (objc_msgSend(*(id *)(v4 + 4000), "debugEnabled"))
              {
                v18 = objc_opt_class();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke_1109;
                block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                block[4] = v18;
                if (qword_1ED884EC8 != -1)
                  dispatch_once(&qword_1ED884EC8, block);
                if (byte_1ED884D7D)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rootNodeName=%@"), v17);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "lastPathComponent");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService populateRootNodeEnergyKeysWithEnergyEntries:]");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 1755);

                  PLLogCommon();
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v57 = v19;
                    _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  self = v42;
                  v4 = 0x1E0D7F000uLL;
                }
              }
              -[PLBatteryBreakdownService rootNodeNameToRootNodeEnergyKey](self, "rootNodeNameToRootNodeEnergyKey");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v17);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(*(id *)(v4 + 4000), "debugEnabled"))
              {
                v27 = objc_opt_class();
                v44[0] = MEMORY[0x1E0C809B0];
                v44[1] = 3221225472;
                v44[2] = __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke_1114;
                v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v44[4] = v27;
                if (qword_1ED884ED0 != -1)
                  dispatch_once(&qword_1ED884ED0, v44);
                if (byte_1ED884D7E)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rootNodeEnergyKey=%@"), v26);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "lastPathComponent");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService populateRootNodeEnergyKeysWithEnergyEntries:]");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 1758);

                  PLLogCommon();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v57 = v28;
                    _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  self = v42;
                  v4 = 0x1E0D7F000;
                }
              }
              objc_msgSend(v6, "objectForKeyedSubscript:", v17);
              v34 = objc_claimAutoreleasedReturnValue();
              if (v34)
                v35 = (void *)v34;
              else
                v35 = &unk_1E86347B8;
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, v26);

              ++v16;
            }
            while (v15 != v16);
            v15 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v15);
        }

        v5 = v40 + 1;
      }
      while (v40 + 1 != v39);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v39);
  }
  return obj;
}

uint64_t __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D7C = result;
  return result;
}

uint64_t __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke_1109(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D7D = result;
  return result;
}

uint64_t __73__PLBatteryBreakdownService_populateRootNodeEnergyKeysWithEnergyEntries___block_invoke_1114(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D7E = result;
  return result;
}

- (id)populateBLDKeysWithEnergyEntries:(id)a3
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  id obj;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = a3;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (v62)
  {
    v61 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v71 != v61)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(&unk_1E8651770, "objectAtIndexedSubscript:", 15);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
          v7 = v6;
        else
          v7 = &unk_1E86347B8;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("BLDEnergyAudio"));
        objc_msgSend(&unk_1E8651788, "objectAtIndexedSubscript:", 50);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v8);
        v9 = objc_claimAutoreleasedReturnValue();

        v69 = (void *)v9;
        if (v9)
          v10 = (void *)v9;
        else
          v10 = &unk_1E86347B8;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("BLDEnergyBluetooth"));
        objc_msgSend(&unk_1E86517A0, "objectAtIndexedSubscript:", 37);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v68 = (void *)v12;
        if (v12)
          v13 = (void *)v12;
        else
          v13 = &unk_1E86347B8;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("BLDEnergyCellData"));
        objc_msgSend(&unk_1E86517B8, "objectAtIndexedSubscript:", 10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v67 = (void *)v15;
        if (v15)
          v16 = (void *)v15;
        else
          v16 = &unk_1E86347B8;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("BLDEnergyDisplay"));
        objc_msgSend(&unk_1E86517D0, "objectAtIndexedSubscript:", 38);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v66 = (void *)v18;
        if (v18)
          v19 = (void *)v18;
        else
          v19 = &unk_1E86347B8;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("BLDEnergyVoice"));
        objc_msgSend(&unk_1E86517E8, "objectAtIndexedSubscript:", 11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v65 = (void *)v21;
        if (v21)
          v22 = (void *)v21;
        else
          v22 = &unk_1E86347B8;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("BLDEnergyWiFi"));
        objc_msgSend(&unk_1E8651800, "objectAtIndexedSubscript:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v64 = (void *)v24;
        if (v24)
          v25 = (void *)v24;
        else
          v25 = &unk_1E86347B8;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("BBCondition"));
        v26 = (void *)objc_opt_class();
        objc_msgSend(&unk_1E8651818, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E8651830, "objectAtIndexedSubscript:", 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v27, v28);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v63);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        if (v29)
          v31 = (void *)v29;
        else
          v31 = &unk_1E86347B8;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("BLDEnergyFGCPU"));
        objc_msgSend(&unk_1E8651848, "objectAtIndexedSubscript:", 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          v34 = v33;
        else
          v34 = &unk_1E86347B8;
        v35 = v34;

        v36 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v35, "doubleValue");
        v38 = v37;
        objc_msgSend(v30, "doubleValue");
        v40 = v38 - v39;
        if (v40 < 0.0)
          v40 = 0.0;
        objc_msgSend(v36, "numberWithDouble:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("BLDEnergyBGCPU"));
        v42 = (void *)objc_opt_class();
        objc_msgSend(&unk_1E8651860, "objectAtIndexedSubscript:", 2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E8651878, "objectAtIndexedSubscript:", 48);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v45);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v46;
        if (v46)
          v48 = (void *)v46;
        else
          v48 = &unk_1E86347B8;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("BLDEnergyFGLocation"));
        objc_msgSend(&unk_1E8651890, "objectAtIndexedSubscript:", 48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
          v51 = v50;
        else
          v51 = &unk_1E86347B8;
        v52 = v51;

        v53 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v52, "doubleValue");
        v55 = v54;
        objc_msgSend(v47, "doubleValue");
        v57 = v55 - v56;
        if (v57 < 0.0)
          v57 = 0.0;
        objc_msgSend(v53, "numberWithDouble:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, CFSTR("BLDEnergyBGLocation"));

      }
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    }
    while (v62);
  }
  return obj;
}

- (id)addForegroundAndBackgroundDurations:(id)a3 withRange:(_PLTimeIntervalRange)a4 withQueryType:(int)a5
{
  double var1;
  double var0;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  void *v56;
  int v57;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t n;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  PLBatteryBreakdownService *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  id obj;
  id v127;
  id v128;
  id v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  uint64_t v167;

  var1 = a4.var1;
  var0 = a4.var0;
  v167 = *MEMORY[0x1E0C80C00];
  v122 = a3;
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AppRunTime"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = a5;
  if (a5 == 4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v135 = 0;
    v136 = 0;
  }
  v121 = self;
  -[PLOperator storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (void *)v9;
  objc_msgSend(v10, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v9, 3600.0, var0, var1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v158, v166, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v159;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v159 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * i);
        objc_msgSend(v18, "entryDate");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = v19;
          objc_msgSend(v19, "timeIntervalSince1970");
          v22 = v21;

          if (var0 <= v22 && v22 < var0 + var1)
            objc_msgSend(v12, "addObject:", v18);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v158, v166, 16);
    }
    while (v15);
  }
  v123 = v13;

  v124 = v12;
  objc_msgSend(MEMORY[0x1E0D7FFB0], "summarizeAggregateEntries:", v12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  obj = v24;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v165, 16);
  if (v26)
  {
    v27 = v26;
    v128 = *(id *)v155;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(id *)v155 != v128)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * j);
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v30);
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ScreenOnTime"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "setObject:forKeyedSubscript:", v31, v30);

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BackgroundTime"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setObject:forKeyedSubscript:", v32, v30);

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("ScreenOnPluggedInTime"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "setObject:forKeyedSubscript:", v33, v30);

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BackgroundPluggedInTime"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "setObject:forKeyedSubscript:", v34, v30);

        if (v137 == 4)
        {
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BackgroundLocationTime"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "setObject:forKeyedSubscript:", v35, v30);

          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BackgroundLocationPluggedInTime"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "setObject:forKeyedSubscript:", v36, v30);

          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BackgroundAudioPlayingTime"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "setObject:forKeyedSubscript:", v37, v30);

          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BackgroundAudioPlayingTimePluggedIn"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v38, v30);

          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BackgroundLocationAudioTime"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "setObject:forKeyedSubscript:", v39, v30);

          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BackgroundLocationAudioPluggedInTime"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "setObject:forKeyedSubscript:", v40, v30);

        }
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v165, 16);
    }
    while (v27);
  }

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  -[PLBatteryBreakdownService nonAppsRuntimesWithRange:](v121, "nonAppsRuntimesWithRange:", var0, var1);
  v129 = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v150, v164, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v151;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v151 != v43)
          objc_enumerationMutation(v129);
        v45 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * k);
        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v46);

        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("ScreenOnTime"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "setObject:forKeyedSubscript:", v47, v48);

        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("BackgroundTime"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "setObject:forKeyedSubscript:", v49, v50);

      }
      v42 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v150, v164, 16);
    }
    while (v42);
  }

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v130 = v122;
  v51 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v146, v163, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v147;
    do
    {
      for (m = 0; m != v52; ++m)
      {
        if (*(_QWORD *)v147 != v53)
          objc_enumerationMutation(v130);
        v55 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * m);
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v25, "containsObject:", v56);

        if (v57)
        {
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeObject:", v58);

        }
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v141, "objectForKeyedSubscript:", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "doubleValue");
        objc_msgSend(v60, "numberWithDouble:");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v62, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));

        v63 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v140, "objectForKeyedSubscript:", v59);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "doubleValue");
        objc_msgSend(v63, "numberWithDouble:");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v65, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

        v66 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v139, "objectForKeyedSubscript:", v59);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "doubleValue");
        objc_msgSend(v66, "numberWithDouble:");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v68, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));

        v69 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v138, "objectForKeyedSubscript:", v59);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "doubleValue");
        objc_msgSend(v69, "numberWithDouble:");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v71, CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));

        if (v137 == 4)
        {
          v72 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v136, "objectForKeyedSubscript:", v59);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "doubleValue");
          objc_msgSend(v72, "numberWithDouble:");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v74, CFSTR("PLBatteryUIAppBackgroundLocationRuntimeKey"));

          v75 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v135, "objectForKeyedSubscript:", v59);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "doubleValue");
          objc_msgSend(v75, "numberWithDouble:");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v77, CFSTR("PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"));

          v78 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v134, "objectForKeyedSubscript:", v59);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "doubleValue");
          objc_msgSend(v78, "numberWithDouble:");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v80, CFSTR("PLBatteryUIAppBackgroundAudioRuntimeKey"));

          v81 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v133, "objectForKeyedSubscript:", v59);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "doubleValue");
          objc_msgSend(v81, "numberWithDouble:");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v83, CFSTR("PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"));

          v84 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v132, "objectForKeyedSubscript:", v59);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "doubleValue");
          objc_msgSend(v84, "numberWithDouble:");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v86, CFSTR("PLBatteryUIAppBackgroundLocationAudioRuntimeKey"));

          v87 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v131, "objectForKeyedSubscript:", v59);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "doubleValue");
          objc_msgSend(v87, "numberWithDouble:");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v89, CFSTR("PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"));

        }
      }
      v52 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v146, v163, 16);
    }
    while (v52);
  }

  v90 = (void *)objc_msgSend(v130, "mutableCopy");
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v127 = v25;
  v91 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v142, v162, 16);
  v92 = 0x1E0C99000uLL;
  if (v91)
  {
    v93 = v91;
    v94 = *(_QWORD *)v143;
    do
    {
      for (n = 0; n != v93; ++n)
      {
        if (*(_QWORD *)v143 != v94)
          objc_enumerationMutation(v127);
        v96 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * n);
        objc_msgSend(*(id *)(v92 + 3592), "dictionary");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setObject:forKeyedSubscript:", v96, CFSTR("PLBatteryUIAppBundleIDKey"));
        objc_msgSend(v97, "setObject:forKeyedSubscript:", &unk_1E86347B8, CFSTR("PLBatteryUIAppTypeKey"));
        objc_msgSend(v141, "objectForKeyedSubscript:", v96);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setObject:forKeyedSubscript:", v98, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));

        objc_msgSend(v140, "objectForKeyedSubscript:", v96);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setObject:forKeyedSubscript:", v99, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

        objc_msgSend(v139, "objectForKeyedSubscript:", v96);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setObject:forKeyedSubscript:", v100, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));

        objc_msgSend(v138, "objectForKeyedSubscript:", v96);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "setObject:forKeyedSubscript:", v101, CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));

        if (v137 == 4)
        {
          v102 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v136, "objectForKeyedSubscript:", v96);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "doubleValue");
          objc_msgSend(v102, "numberWithDouble:");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setObject:forKeyedSubscript:", v104, CFSTR("PLBatteryUIAppBackgroundLocationRuntimeKey"));

          v105 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v135, "objectForKeyedSubscript:", v96);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "doubleValue");
          objc_msgSend(v105, "numberWithDouble:");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setObject:forKeyedSubscript:", v107, CFSTR("PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"));

          v108 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v134, "objectForKeyedSubscript:", v96);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "doubleValue");
          objc_msgSend(v108, "numberWithDouble:");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setObject:forKeyedSubscript:", v110, CFSTR("PLBatteryUIAppBackgroundAudioRuntimeKey"));

          v111 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v133, "objectForKeyedSubscript:", v96);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "doubleValue");
          objc_msgSend(v111, "numberWithDouble:");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setObject:forKeyedSubscript:", v113, CFSTR("PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"));

          v114 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v132, "objectForKeyedSubscript:", v96);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "doubleValue");
          objc_msgSend(v114, "numberWithDouble:");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setObject:forKeyedSubscript:", v116, CFSTR("PLBatteryUIAppBackgroundLocationAudioRuntimeKey"));

          v92 = 0x1E0C99000;
          v117 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v131, "objectForKeyedSubscript:", v96);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "doubleValue");
          objc_msgSend(v117, "numberWithDouble:");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setObject:forKeyedSubscript:", v119, CFSTR("PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"));

        }
        objc_msgSend(v97, "setObject:forKeyedSubscript:", &unk_1E86347B8, CFSTR("PLBatteryUIAppEnergyValueKey"));
        objc_msgSend(v90, "addObject:", v97);

      }
      v93 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v142, v162, 16);
    }
    while (v93);
  }

  return v90;
}

- (id)addNotificationValues:(id)a3 withRange:(_PLTimeIntervalRange)a4 withQueryType:(int)a5
{
  double var1;
  double var0;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  double v24;
  double v25;

  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3;
  -[PLOperator storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", CFSTR("PLSpringBoardAgent_Aggregate_SBNotifications_Aggregate"), 3600.0, var0, var1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke;
  v22[3] = &unk_1E8580178;
  v24 = var0;
  v25 = var1;
  v23 = v11;
  v13 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v22);
  objc_msgSend(MEMORY[0x1E0D7FFB0], "summarizeAggregateEntries:withPrimaryKeys:", v13, &unk_1E86518A8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke_2;
  v20[3] = &unk_1E85801A0;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke_1193;
  v18[3] = &unk_1E85801C8;
  v19 = v15;
  v16 = v15;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);

  return v8;
}

void __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v6 = v3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "timeIntervalSince1970");
    v9 = v8;
    v10 = v4 + v5;

    if (v4 <= v9 && v9 < v10)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
  }

}

void __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke_2(uint64_t a1, void *a2)
{
  PLBatteryBreakdownNotificationInfo *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PLBatteryBreakdownNotificationInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  int v17;
  void *v18;
  __int16 v19;
  PLBatteryBreakdownNotificationInfo *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("NotificationType"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("NotificationType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "intValue"))
    {
LABEL_5:

      goto LABEL_6;
    }
    -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("NotificationType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "intValue") == 3)
    {

      goto LABEL_5;
    }
    -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("NotificationType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    if (v14 == -1)
    {
LABEL_6:
      -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("NotificationBundleID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_17:

        goto LABEL_18;
      }
      v9 = -[PLBatteryBreakdownNotificationInfo initWithEntry:]([PLBatteryBreakdownNotificationInfo alloc], "initWithEntry:", v3);
      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = *(void **)(a1 + 32);
        if (v10)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "combineWith:", v9);

        }
        else
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v8);
        }
        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          goto LABEL_16;
        v17 = 138412546;
        v18 = v8;
        v19 = 2112;
        v20 = v9;
        v16 = "notification: %@ -> %@";
      }
      else
      {
        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
LABEL_16:

          goto LABEL_17;
        }
        v17 = 138412546;
        v18 = v8;
        v19 = 2112;
        v20 = v3;
        v16 = "failed to init notification info for %@ %@";
      }
      _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v17, 0x16u);
      goto LABEL_16;
    }
  }
LABEL_18:

}

void __75__PLBatteryBreakdownService_addNotificationValues_withRange_withQueryType___block_invoke_1193(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    *a4 = 1;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("NotificationInfo"));
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v6);
  }

}

- (id)nonAppsRuntimesWithRange:(_PLTimeIntervalRange)a3
{
  double var1;
  double var0;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  var1 = a3.var1;
  var0 = a3.var0;
  v12[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLCameraAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Torch"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryBreakdownService nonAppRuntimeWithEventForwardTableName:withRange:andIdentificationKey:](self, "nonAppRuntimeWithEventForwardTableName:withRange:andIdentificationKey:", v7, CFSTR("Level"), var0, var1);
  v11[0] = CFSTR("BundleID");
  v11[1] = CFSTR("ScreenOnTime");
  v12[0] = CFSTR("Flashlight");
  v12[1] = &unk_1E86347B8;
  v11[2] = CFSTR("BackgroundTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v9);
  return v6;
}

- (double)nonAppRuntimeWithEventForwardTableName:(id)a3 withRange:(_PLTimeIntervalRange)a4 andIdentificationKey:(id)a5
{
  double var1;
  double var0;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[3];

  var1 = a4.var1;
  var0 = a4.var0;
  v45[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0D80080]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v12, 5);

  -[PLOperator storage](self, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v13;
  v45[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastEntryForKey:withComparisons:isSingleton:", v9, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
      v19 = var0;
    else
      v19 = -1.0;
  }
  else
  {
    v19 = -1.0;
  }
  -[PLOperator storage](self, "storage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v9;
  objc_msgSend(v20, "entriesForKey:inTimeRange:withFilters:", v9, 0, var0, var1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v21, "reverseObjectEnumerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v41;
    v26 = 0.0;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v28, "objectForKeyedSubscript:", v10);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "BOOLValue");

        if (v30)
        {
          if (v19 == -1.0)
          {
            objc_msgSend(v28, "entryDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "timeIntervalSince1970");
            v19 = v32;

          }
        }
        else
        {
          if (v19 != -1.0)
          {
            objc_msgSend(v28, "entryDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "timeIntervalSince1970");
            v35 = v34 - v19;

            v26 = v26 + v35;
          }
          v19 = -1.0;
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v24);
  }
  else
  {
    v26 = 0.0;
  }

  if (v19 == -1.0)
    v36 = -0.0;
  else
    v36 = var0 + var1 - v19;

  return v26 + v36;
}

- (id)removeNodesNotToShowInInternalUI:(id)a3 withQueryType:(int)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 2 && !-[PLBatteryBreakdownService showRootNodesInInternal](self, "showRootNodesInInternal"))
  {
    v19 = v6;
    v20 = (id)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"), v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "intValue");

          if (v14 != 5)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBatteryBreakdownService intermediateRootNodes](self, "intermediateRootNodes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "containsObject:", v15);

            if ((v17 & 1) == 0 && objc_msgSend(v15, "rangeOfString:", CFSTR("AssertionPID")) == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v20, "addObject:", v12);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v6 = v19;
  }
  else
  {
    v20 = v6;
  }

  return v20;
}

- (id)filterEnergyEntriesBasedOnTime:(id)a3 withQueryType:(int)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  BOOL v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  NSObject *v41;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v66;
  id v67;
  unsigned int v68;
  id obj;
  uint64_t v70;
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD block[5];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  const __CFString *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v68 = a4;
  if (a4 != 4)
  {
    v8 = (id)objc_opt_new();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v66 = v7;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    if (!v9)
      goto LABEL_61;
    v10 = v9;
    v11 = 0x1E0D7F000uLL;
    v70 = *(_QWORD *)v77;
    v67 = v8;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v77 != v70)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v12);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(v11 + 4000), "debugEnabled"))
        {
          v15 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v15;
          if (qword_1ED884ED8 != -1)
            dispatch_once(&qword_1ED884ED8, block);
          if (byte_1ED884D7F)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entry: %@ ========= %@"), v14, v13);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "lastPathComponent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 2102);

            PLLogCommon();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v81 = v16;
              _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v8 = v67;
            v11 = 0x1E0D7F000uLL;
          }
        }
        if (-[PLBatteryBreakdownService appTypeForName:](self, "appTypeForName:", v14) == 1)
        {
          -[PLBatteryBreakdownService adjustFGBGTimeForNonAppEnergyEntry:](self, "adjustFGBGTimeForNonAppEnergyEntry:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v22);

          if (objc_msgSend(*(id *)(v11 + 4000), "debugEnabled"))
          {
            v23 = objc_opt_class();
            v74[0] = MEMORY[0x1E0C809B0];
            v74[1] = 3221225472;
            v74[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1201;
            v74[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v74[4] = v23;
            if (qword_1ED884EE0 != -1)
              dispatch_once(&qword_1ED884EE0, v74);
            if (byte_1ED884D80)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adding: NON APP"));
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "lastPathComponent");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 2108);

              PLLogCommon();
              v29 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
LABEL_48:

                v11 = 0x1E0D7F000;
                goto LABEL_56;
              }
LABEL_58:
              *(_DWORD *)buf = 138412290;
              v81 = v24;
              _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              goto LABEL_48;
            }
          }
        }
        else
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          v32 = v31;

          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v35 = v34;

          if (v68 > 1 || (v32 == 0.0 ? (v36 = v35 < 60.0) : (v36 = 0), !v36))
          {
            if (v32 > 0.0 && v32 < 60.0)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "doubleValue");
              v57 = v56;

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 60.0 / v32 * v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v58, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));

              objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E8634878, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
              if (objc_msgSend(*(id *)(v11 + 4000), "debugEnabled"))
              {
                v59 = objc_opt_class();
                v72[0] = MEMORY[0x1E0C809B0];
                v72[1] = 3221225472;
                v72[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1216;
                v72[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v72[4] = v59;
                if (qword_1ED884EF0 != -1)
                  dispatch_once(&qword_1ED884EF0, v72);
                if (byte_1ED884D82)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adding with Corrected FGTime"));
                  v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v60 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v61, "lastPathComponent");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v62, v63, 2140);

                  PLLogCommon();
                  v49 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                    goto LABEL_59;
                  goto LABEL_54;
                }
              }
            }
            else if (objc_msgSend(*(id *)(v11 + 4000), "debugEnabled"))
            {
              v43 = objc_opt_class();
              v71[0] = MEMORY[0x1E0C809B0];
              v71[1] = 3221225472;
              v71[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1221;
              v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v71[4] = v43;
              if (qword_1ED884EF8 != -1)
                dispatch_once(&qword_1ED884EF8, v71);
              if (byte_1ED884D83)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adding without any changes"));
                v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v45 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "lastPathComponent");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 2142);

                PLLogCommon();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
LABEL_59:
                  *(_DWORD *)buf = 138412290;
                  v81 = v44;
                  _os_log_debug_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
LABEL_54:
                v11 = 0x1E0D7F000;

                v8 = v67;
              }
            }
            objc_msgSend(v8, "addObject:", v13);
            goto LABEL_56;
          }
          if (!objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.findmy")))
            goto LABEL_46;
          objc_msgSend(&unk_1E86518C0, "objectAtIndexedSubscript:", 59);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "doubleValue");
          v40 = v39;

          if (v40 > 0.0)
          {
            objc_msgSend(v8, "addObject:", v13);
            PLLogCommon();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v81 = CFSTR("com.apple.findmy");
              _os_log_debug_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_DEBUG, "skipping runtime filter for %@", buf, 0xCu);
            }

          }
          else
          {
LABEL_46:
            if (objc_msgSend(*(id *)(v11 + 4000), "debugEnabled"))
            {
              v50 = objc_opt_class();
              v73[0] = MEMORY[0x1E0C809B0];
              v73[1] = 3221225472;
              v73[2] = __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1210;
              v73[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v73[4] = v50;
              if (qword_1ED884EE8 != -1)
                dispatch_once(&qword_1ED884EE8, v73);
              if (byte_1ED884D81)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dropping: Low FG BG Time"));
                v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v51 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "lastPathComponent");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService filterEnergyEntriesBasedOnTime:withQueryType:]");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v53, v54, 2124);

                PLLogCommon();
                v29 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  goto LABEL_48;
                goto LABEL_58;
              }
            }
          }
        }
LABEL_56:

        ++v12;
      }
      while (v10 != v12);
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
      v10 = v64;
      if (!v64)
      {
LABEL_61:

        v7 = v66;
        goto LABEL_62;
      }
    }
  }
  v8 = v6;
LABEL_62:

  return v8;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D7F = result;
  return result;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1201(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D80 = result;
  return result;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1210(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D81 = result;
  return result;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1216(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D82 = result;
  return result;
}

uint64_t __74__PLBatteryBreakdownService_filterEnergyEntriesBasedOnTime_withQueryType___block_invoke_1221(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D83 = result;
  return result;
}

- (id)adjustFGBGTimeForNonAppEnergyEntry:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  double v7;
  double v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HLS")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("Siri")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("DeletedApp")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("DeletedAppClip")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("DeletedAppAndAppClip")))
  {
    v5 = CFSTR("PLBatteryUIAppForegroundRuntimeKey");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Flashlight")))
      goto LABEL_10;
    v5 = CFSTR("PLBatteryUIAppBackgroundRuntimeKey");
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 < 60.0 && v8 > 0.0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E8634878, v5);
LABEL_10:

  return v3;
}

- (double)computeTotalForegroundDuration:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v7 = v7 + v10;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (double)computeTotalBackgroundDuration:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v7 = v7 + v10;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (BOOL)checkHomeKitEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7FFC0], "entryKeyForOperatorName:withType:withName:", CFSTR("PLHomeKitAgent"), *MEMORY[0x1E0D80390], CFSTR("HomeKitEvents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countOfEntriesForKey:", v3);

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "Count of HomeKit events: %ld", (uint8_t *)&v8, 0xCu);
  }

  return v5 > 0;
}

- (id)applyStaticNameTransformationsWithEnergyEntries:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
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
  int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id obj;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD block[5];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PLBatteryBreakdownService hasHomeKitActivity](self, "hasHomeKitActivity"))
    -[PLBatteryBreakdownService setHasHomeKitActivity:](self, "setHasHomeKitActivity:", -[PLBatteryBreakdownService checkHomeKitEvents](self, "checkHomeKitEvents"));
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v5 = v4;
  v55 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v55)
  {
    v6 = 0x1E0D7F000uLL;
    v54 = *(_QWORD *)v61;
    obj = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v61 != v54)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v7);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
        {
          v10 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v10;
          if (qword_1ED884F00 != -1)
            dispatch_once(&qword_1ED884F00, block);
          if (byte_1ED884D84)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("givenName=%@"), v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "lastPathComponent");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService applyStaticNameTransformationsWithEnergyEntries:]");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 2211);

            PLLogCommon();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v11;
              _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v6 = 0x1E0D7F000uLL;
          }
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.springboard.lockscreen.navigation")))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
            {
              v18 = objc_opt_class();
              v58[0] = MEMORY[0x1E0C809B0];
              v58[1] = 3221225472;
              v58[2] = __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1232;
              v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v58[4] = v18;
              if (qword_1ED884F08 != -1)
                dispatch_once(&qword_1ED884F08, v58);
              if (byte_1ED884D85)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error lockscreen-navigation background time not zero"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "lastPathComponent");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService applyStaticNameTransformationsWithEnergyEntries:]");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 2215);

                PLLogCommon();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v65 = v19;
                  _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v6 = 0x1E0D7F000uLL;
              }
            }
            if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
            {
              v25 = objc_opt_class();
              v57[0] = MEMORY[0x1E0C809B0];
              v57[1] = 3221225472;
              v57[2] = __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1237;
              v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v57[4] = v25;
              if (qword_1ED884F10 != -1)
                dispatch_once(&qword_1ED884F10, v57);
              if (byte_1ED884D86)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lockscreen-navigation energyEntry = %@"), v8);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "lastPathComponent");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService applyStaticNameTransformationsWithEnergyEntries:]");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 2216);

                PLLogCommon();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v65 = v26;
                  _os_log_debug_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v6 = 0x1E0D7F000;
              }
            }
          }
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v32, "doubleValue");
          objc_msgSend(v33, "numberWithDouble:", -v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v35, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.PassbookUIService")))
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E8653630, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
        }
        -[PLBatteryBreakdownService givenNameToMappedName](self, "givenNameToMappedName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v9);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
        {
          v38 = objc_opt_class();
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1243;
          v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v56[4] = v38;
          if (qword_1ED884F18 != -1)
            dispatch_once(&qword_1ED884F18, v56);
          if (byte_1ED884D87)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mappedName=%@"), v37);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "lastPathComponent");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService applyStaticNameTransformationsWithEnergyEntries:]");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 2226);

            PLLogCommon();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v39;
              _os_log_debug_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v6 = 0x1E0D7F000;
          }
        }
        if (v37)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, CFSTR("PLBatteryUIAppBundleIDKey"));
        if (-[PLBatteryBreakdownService hasHomeKitActivity](self, "hasHomeKitActivity"))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("HomeKit"));

          if (v46)
          {
            PLLogCommon();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v8;
              _os_log_debug_impl(&dword_1CAF47000, v47, OS_LOG_TYPE_DEBUG, "Energy Entry before mapping: %@", buf, 0xCu);
            }

            -[PLBatteryBreakdownService installedBundleIDToDisplayName](self, "installedBundleIDToDisplayName");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("com.apple.Home"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
              objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("com.apple.Home"), CFSTR("PLBatteryUIAppBundleIDKey"));
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v50, CFSTR("HomeKitEnergy"));

            PLLogCommon();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v8;
              _os_log_debug_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_DEBUG, "Energy Entry after mapping: %@", buf, 0xCu);
            }

          }
        }

        ++v7;
      }
      while (v55 != v7);
      v5 = obj;
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    }
    while (v55);
  }

  return v5;
}

uint64_t __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D84 = result;
  return result;
}

uint64_t __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1232(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D85 = result;
  return result;
}

uint64_t __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1237(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D86 = result;
  return result;
}

uint64_t __77__PLBatteryBreakdownService_applyStaticNameTransformationsWithEnergyEntries___block_invoke_1243(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D87 = result;
  return result;
}

- (id)bundleIDsForMappedName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PLBatteryBreakdownService givenNameToMappedName](self, "givenNameToMappedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PLBatteryBreakdownService_bundleIDsForMappedName___block_invoke;
  v10[3] = &unk_1E85801F0;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "keysOfEntriesPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __52__PLBatteryBreakdownService_bundleIDsForMappedName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (id)adjustExtensionBackgroundTimeWithEnergyEntries:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.store.Jolly.spotlightindex")) & 1) != 0
          || objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilemail.DiagnosticExtension")))
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E86347B8, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
          objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E86347B8, CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)applyDynamicNameTransformationsWithEnergyEntries:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PLBatteryBreakdownService mapDeletedAppsWithEnergyEntries:](self, "mapDeletedAppsWithEnergyEntries:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryBreakdownService mapPluginsToAppsWithEnergyEntries:](self, "mapPluginsToAppsWithEnergyEntries:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryBreakdownService mapGizmoToAppsWithEnergyEntries:](self, "mapGizmoToAppsWithEnergyEntries:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryBreakdownService reaccountExchangeEntriesWithEnergyEntries:](self, "reaccountExchangeEntriesWithEnergyEntries:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryBreakdownService reaccountBackupRestoreWithEnergyEntries:](self, "reaccountBackupRestoreWithEnergyEntries:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryBreakdownService mapCloudDocsToAppsWithEnergyEntries:](self, "mapCloudDocsToAppsWithEnergyEntries:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mapDeletedAppsWithEnergyEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  int v42;
  NSObject *v43;
  id v45;
  id obj;
  const __CFString *v47;
  uint64_t v48;
  _QWORD v49[5];
  _QWORD block[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBatteryBreakdownService deletedAppNames](self, "deletedAppNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    -[PLBatteryBreakdownService deletedAppClipNames](self, "deletedAppClipNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      return v4;
  }
  -[PLBatteryBreakdownService deletedAppClipNames](self, "deletedAppClipNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {

LABEL_8:
    -[PLBatteryBreakdownService deletedAppNames](self, "deletedAppNames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v11 = CFSTR("DeletedApp");
    }
    else
    {
      -[PLBatteryBreakdownService deletedAppClipNames](self, "deletedAppClipNames");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      v11 = CFSTR("DeletedAppClip");
      if (!v15)
        v11 = 0;
    }
    goto LABEL_12;
  }
  -[PLBatteryBreakdownService deletedAppNames](self, "deletedAppNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    goto LABEL_8;
  v11 = CFSTR("DeletedAppAndAppClip");
LABEL_12:
  v47 = v11;
  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v47;
    _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "Display Name for Deleted entry: %@", buf, 0xCu);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v45 = v4;
  obj = v4;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v17)
  {
    v18 = v17;
    v48 = *(_QWORD *)v52;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v52 != v48)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v19);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v21 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __61__PLBatteryBreakdownService_mapDeletedAppsWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v21;
          if (qword_1ED884F20 != -1)
            dispatch_once(&qword_1ED884F20, block);
          if (byte_1ED884D88)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntry=%@"), v20);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "lastPathComponent");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService mapDeletedAppsWithEnergyEntries:]");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 2291);

            PLLogCommon();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v22;
              _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        -[PLBatteryBreakdownService deletedAppNames](self, "deletedAppNames");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "containsObject:", v29))
        {

        }
        else
        {
          -[PLBatteryBreakdownService deletedAppClipNames](self, "deletedAppClipNames");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "containsObject:", v31);

          if (!v32)
            goto LABEL_39;
        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v33 = objc_opt_class();
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __61__PLBatteryBreakdownService_mapDeletedAppsWithEnergyEntries___block_invoke_1257;
          v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v49[4] = v33;
          if (qword_1ED884F28 != -1)
            dispatch_once(&qword_1ED884F28, v49);
          if (byte_1ED884D89)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this is a deleted app"));
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "lastPathComponent");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService mapDeletedAppsWithEnergyEntries:]");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 2294);

            PLLogCommon();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v34;
              _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        PLLogCommon();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "This is a deleted entity", buf, 2u);
        }

        objc_msgSend(v20, "setObject:forKeyedSubscript:", v47, CFSTR("PLBatteryUIAppBundleIDKey"));
LABEL_39:
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "containsString:", CFSTR("Unspecified"));

        if (v42)
        {
          PLLogCommon();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CAF47000, v43, OS_LOG_TYPE_DEFAULT, "AppDeletion : Found an unspecified entry so refactoring", buf, 2u);
          }

          objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("DeletedApp"), CFSTR("PLBatteryUIAppBundleIDKey"));
        }
        ++v19;
      }
      while (v18 != v19);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v18);
  }

  v4 = v45;
  return v4;
}

uint64_t __61__PLBatteryBreakdownService_mapDeletedAppsWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D88 = result;
  return result;
}

uint64_t __61__PLBatteryBreakdownService_mapDeletedAppsWithEnergyEntries___block_invoke_1257(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D89 = result;
  return result;
}

- (id)mapPluginsToAppsWithEnergyEntries:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id obj;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[5];
  _QWORD block[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = a3;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v41)
  {
    v4 = 0x1E0D7F000uLL;
    v40 = *(_QWORD *)v45;
    v5 = CFSTR("PluginType");
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v45 != v40)
          objc_enumerationMutation(obj);
        v7 = v5;
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v6);
        if (objc_msgSend(*(id *)(v4 + 4000), "debugEnabled"))
        {
          v9 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __63__PLBatteryBreakdownService_mapPluginsToAppsWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v9;
          if (qword_1ED884F30 != -1)
            dispatch_once(&qword_1ED884F30, block);
          if (byte_1ED884D8A)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntry=%@"), v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "lastPathComponent");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService mapPluginsToAppsWithEnergyEntries:]");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 2317);

            PLLogCommon();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v10;
              _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v4 = 0x1E0D7F000uLL;
          }
        }
        -[PLBatteryBreakdownService installedPluginBundleIDToPluginEntry](self, "installedPluginBundleIDToPluginEntry");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v7;
        if (v18)
        {
          if (objc_msgSend(*(id *)(v4 + 4000), "debugEnabled"))
          {
            v19 = objc_opt_class();
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __63__PLBatteryBreakdownService_mapPluginsToAppsWithEnergyEntries___block_invoke_1264;
            v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v42[4] = v19;
            if (qword_1ED884F38 != -1)
              dispatch_once(&qword_1ED884F38, v42);
            if (byte_1ED884D8B)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this is a plugin"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "lastPathComponent");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService mapPluginsToAppsWithEnergyEntries:]");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 2322);

              PLLogCommon();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v20;
                _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v4 = 0x1E0D7F000;
              v5 = v7;
            }
          }
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PluginId"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.AppStore.ProductPageExtension"));

          if ((v27 & 1) == 0)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PluginParentApp"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("PLBatteryUIAppBundleIDKey"));

            objc_msgSend(v18, "objectForKeyedSubscript:", v5);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.watchkit"));

            if (v30)
            {
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
              v31 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("WatchEnergy"));
            }
            else
            {
              objc_msgSend(v18, "objectForKeyedSubscript:", v5);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.widgetkit-extension"));

              if (!v33)
                goto LABEL_28;
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, CFSTR("ChronoWidgetEnergy"));

              PLLogCommon();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "doubleValue");
                *(_DWORD *)buf = 138412546;
                v49 = v35;
                v50 = 2048;
                v51 = v37;
                _os_log_debug_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEBUG, "Widget Energy for %@ : %f", buf, 0x16u);

                v5 = v7;
              }
            }

          }
        }
LABEL_28:

        ++v6;
      }
      while (v41 != v6);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v41);
  }
  return obj;
}

uint64_t __63__PLBatteryBreakdownService_mapPluginsToAppsWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D8A = result;
  return result;
}

uint64_t __63__PLBatteryBreakdownService_mapPluginsToAppsWithEnergyEntries___block_invoke_1264(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D8B = result;
  return result;
}

- (id)mapGizmoToAppsWithEnergyEntries:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
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
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v56 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        -[PLBatteryBreakdownService gizmoDaemonToAppBundleID](self, "gizmoDaemonToAppBundleID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("PLBatteryUIAppBundleIDKey"));
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("WatchEnergy"));

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v6);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "hasSuffix:", CFSTR("/watch")))
        {
          objc_msgSend(v20, "substringWithRange:", 0, objc_msgSend(v20, "length") - 6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("PLBatteryUIAppBundleIDKey"));

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("WatchEnergy"));

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v16);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v23 = v14;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v48 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * k);
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "hasSuffix:", CFSTR(".watchkitextension")))
        {
          objc_msgSend(v29, "substringWithRange:", 0, objc_msgSend(v29, "length") - 18);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("PLBatteryUIAppBundleIDKey"));

          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("WatchEnergy"));

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    }
    while (v25);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = v23;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * m);
        -[PLBatteryBreakdownService gizmoIDSTopicToAppBundleID](self, "gizmoIDSTopicToAppBundleID", (_QWORD)v43);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v40, CFSTR("PLBatteryUIAppBundleIDKey"));
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v41, CFSTR("WatchEnergy"));

        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    }
    while (v34);
  }

  return v32;
}

- (id)mapCloudDocsToAppsWithEnergyEntries:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v7 = CFSTR("com.apple.clouddocs.");
    v8 = CFSTR(".");
    do
    {
      v9 = 0;
      v21 = v5;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hasPrefix:", v7))
        {
          objc_msgSend(v11, "substringFromIndex:", -[__CFString length](v7, "length"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "rangeOfString:", v8);
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = v6;
            v16 = v7;
            v17 = v3;
            v18 = v8;
            objc_msgSend(v12, "substringFromIndex:", v13 + v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("PLBatteryUIAppBundleIDKey"));

            v8 = v18;
            v3 = v17;
            v7 = v16;
            v6 = v15;
            v5 = v21;
          }

        }
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)reaccountExchangeEntriesWithEnergyEntries:(id)a3
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
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  double v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.activesync"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14
      && (objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey")),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "doubleValue"),
          v18 = v17,
          v16,
          v18 != 0.0))
    {
      v39 = v15;
      v40 = v4;
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
      v49 = 0u;
      v20 = objc_msgSend(&unk_1E86518D8, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v50;
        v23 = 0.0;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v50 != v22)
              objc_enumerationMutation(&unk_1E86518D8);
            objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v25)
            {
              objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "doubleValue");
              v29 = v28;

              if (v29 >= 0.0)
                v30 = v29;
              else
                v30 = 0.0;
              v23 = v23 + v30;
            }

          }
          v21 = objc_msgSend(&unk_1E86518D8, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v21);
      }
      else
      {
        v23 = 0.0;
      }
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v31 = objc_msgSend(&unk_1E86518D8, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v46;
        v34 = MEMORY[0x1E0C809B0];
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v46 != v33)
              objc_enumerationMutation(&unk_1E86518D8);
            objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v36;
            if (v36)
            {
              v41[0] = v34;
              v41[1] = 3221225472;
              v41[2] = __71__PLBatteryBreakdownService_reaccountExchangeEntriesWithEnergyEntries___block_invoke;
              v41[3] = &unk_1E8580218;
              v42 = v36;
              v43 = v18;
              v44 = v23;
              objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v41);

            }
          }
          v32 = objc_msgSend(&unk_1E86518D8, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        }
        while (v32);
      }
      v19 = (id)objc_msgSend(v6, "mutableCopy");
      v15 = v39;
      objc_msgSend(v19, "removeObject:", v39);
      v4 = v40;
    }
    else
    {
      v19 = v6;
    }

  }
  else
  {
    v19 = (id)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

void __71__PLBatteryBreakdownService_reaccountExchangeEntriesWithEnergyEntries___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)reaccountBackupRestoreWithEnergyEntries:(id)a3
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
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD block[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Backup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Restore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (qword_1ED884F40 != -1)
        dispatch_once(&qword_1ED884F40, block);
      if (byte_1ED884D8C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("backupEnergyEntry=%@, restoreEnergyEntry=%@"), v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService reaccountBackupRestoreWithEnergyEntries:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 2485);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v17;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (v14 && v15)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Backup & Restore"), CFSTR("PLBatteryUIAppBundleIDKey"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Backup & Restore"), CFSTR("PLBatteryUIAppNameKey"));
      v23 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke_1300;
      v36[3] = &unk_1E8579480;
      v24 = v14;
      v37 = v24;
      v25 = v15;
      v38 = v25;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v36);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v35[0] = v23;
        v35[1] = 3221225472;
        v35[2] = __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke_2;
        v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v35[4] = objc_opt_class();
        if (qword_1ED884F48 != -1)
          dispatch_once(&qword_1ED884F48, v35);
        if (byte_1ED884D8D)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("combined backupEnergyEntry=%@"), v24);
          v26 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "lastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService reaccountBackupRestoreWithEnergyEntries:]");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v28, v29, 2497);

          v30 = (void *)v26;
          PLLogCommon();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v30;
            _os_log_debug_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v32 = (id)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v32, "removeObject:", v25);

    }
    else
    {
      v32 = v6;
    }

  }
  else
  {
    v32 = (id)MEMORY[0x1E0C9AA60];
  }

  return v32;
}

uint64_t __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D8C = result;
  return result;
}

void __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke_1300(uint64_t a1, void *a2, void *a3)
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

uint64_t __69__PLBatteryBreakdownService_reaccountBackupRestoreWithEnergyEntries___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D8D = result;
  return result;
}

- (id)combineDuplicatesWithEnergyEntries:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v38;
  id obj;
  uint64_t v40;
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  _QWORD block[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0x1E0D7F000uLL;
    v8 = MEMORY[0x1E0C809B0];
    v40 = *(_QWORD *)v47;
    v38 = v4;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v40)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v9);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
        {
          v12 = objc_opt_class();
          block[0] = v8;
          block[1] = 3221225472;
          block[2] = __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v12;
          if (qword_1ED884F50 != -1)
            dispatch_once(&qword_1ED884F50, block);
          if (byte_1ED884D8E)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name=%@"), v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "lastPathComponent");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService combineDuplicatesWithEnergyEntries:]");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 2508);

            PLLogCommon();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v13;
              _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v4 = v38;
            v7 = 0x1E0D7F000uLL;
            v8 = MEMORY[0x1E0C809B0];
          }
        }
        if (v11)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
          {
            v20 = objc_opt_class();
            v44[0] = v8;
            v44[1] = 3221225472;
            v44[2] = __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_1309;
            v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v44[4] = v20;
            if (qword_1ED884F58 != -1)
              dispatch_once(&qword_1ED884F58, v44);
            if (byte_1ED884D8F)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("storedEnergyEntry=%@"), v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "lastPathComponent");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService combineDuplicatesWithEnergyEntries:]");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 2512);

              PLLogCommon();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v21;
                _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v4 = v38;
              v7 = 0x1E0D7F000uLL;
              v8 = MEMORY[0x1E0C809B0];
            }
          }
          if (v19)
          {
            v42[0] = v8;
            v42[1] = 3221225472;
            v42[2] = __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_1312;
            v42[3] = &unk_1E8580240;
            v43 = v19;
            objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v42);

          }
          else
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);
          }
          if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
          {
            v27 = objc_opt_class();
            v41[0] = v8;
            v41[1] = 3221225472;
            v41[2] = __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_2;
            v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v41[4] = v27;
            if (qword_1ED884F60 != -1)
              dispatch_once(&qword_1ED884F60, v41);
            if (byte_1ED884D90)
            {
              v28 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v4, "objectForKeyedSubscript:", v11);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringWithFormat:", CFSTR("nameToEnergyEntry[name]=%@"), v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v31 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "lastPathComponent");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService combineDuplicatesWithEnergyEntries:]");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 2540);

              PLLogCommon();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v30;
                _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v7 = 0x1E0D7F000;
              v8 = MEMORY[0x1E0C809B0];
            }
          }

        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "allValues");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

uint64_t __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D8E = result;
  return result;
}

uint64_t __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_1309(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D8F = result;
  return result;
}

void __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_1312(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("NotificationInfo")))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("NotificationInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v5 || v6)
      objc_msgSend(v6, "combineWith:", v5);
    else
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("NotificationInfo"));
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v13, "rangeOfString:", CFSTR("AppTypeKey")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "doubleValue");
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v8, "numberWithDouble:", v10 + v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v13);

LABEL_9:
  }

}

uint64_t __64__PLBatteryBreakdownService_combineDuplicatesWithEnergyEntries___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D90 = result;
  return result;
}

- (id)determineDisplayNamesWithEnergyEntries:(id)a3
{
  const __CFString *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  __CFString *v26;
  PLBatteryBreakdownService *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD block[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = a3;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v31)
  {
    v4 = CFSTR("PLBatteryUIAppBundleIDKey");
    v5 = 0x1E0D7F000uLL;
    v30 = *(_QWORD *)v35;
    v28 = self;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v6);
        objc_msgSend(v7, "objectForKeyedSubscript:", v4);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
        {
          v9 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __68__PLBatteryBreakdownService_determineDisplayNamesWithEnergyEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v9;
          if (qword_1ED884F68 != -1)
            dispatch_once(&qword_1ED884F68, block);
          if (byte_1ED884D91)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@"), v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "lastPathComponent");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService determineDisplayNamesWithEnergyEntries:]");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 2548);

            PLLogCommon();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v10;
              _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v5 = 0x1E0D7F000uLL;
          }
        }
        -[PLBatteryBreakdownService installedBundleIDToDisplayName](self, "installedBundleIDToDisplayName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v8);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.Bridge")))
        {

          v17 = CFSTR("Apple Watch");
        }
        if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
        {
          v18 = objc_opt_class();
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __68__PLBatteryBreakdownService_determineDisplayNamesWithEnergyEntries___block_invoke_1321;
          v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v32[4] = v18;
          if (qword_1ED884F70 != -1)
            dispatch_once(&qword_1ED884F70, v32);
          if (byte_1ED884D92)
          {
            v19 = v4;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("displayName=%@"), v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "lastPathComponent");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService determineDisplayNamesWithEnergyEntries:]");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 2554);

            PLLogCommon();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v20;
              _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v4 = v19;
            self = v28;
            v5 = 0x1E0D7F000;
          }
        }
        if (v17)
          v26 = v17;
        else
          v26 = v8;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("PLBatteryUIAppNameKey"));

        ++v6;
      }
      while (v31 != v6);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v31);
  }
  return obj;
}

uint64_t __68__PLBatteryBreakdownService_determineDisplayNamesWithEnergyEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D91 = result;
  return result;
}

uint64_t __68__PLBatteryBreakdownService_determineDisplayNamesWithEnergyEntries___block_invoke_1321(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D92 = result;
  return result;
}

- (id)filterWithEnergyEntries:(id)a3 withQueryType:(int)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
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
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  int v43;
  id v44;
  id obj;
  PLBatteryBreakdownService *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD block[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v6;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v48)
  {
    v7 = 0x1E0D7F000uLL;
    v47 = *(_QWORD *)v54;
    v43 = a4;
    v46 = self;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v54 != v47)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v8);
        if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
        {
          v10 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v10;
          if (qword_1ED884F78 != -1)
            dispatch_once(&qword_1ED884F78, block);
          if (byte_1ED884D93)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntry=%@"), v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "lastPathComponent");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService filterWithEnergyEntries:withQueryType:]");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 2564);

            PLLogCommon();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v11;
              _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[PLBatteryBreakdownService appTypeForName:](self, "appTypeForName:", v17);
        if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
        {
          v19 = objc_opt_class();
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1326;
          v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v51[4] = v19;
          if (qword_1ED884F80 != -1)
            dispatch_once(&qword_1ED884F80, v51);
          if (byte_1ED884D94)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("appType=%i"), v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "lastPathComponent");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService filterWithEnergyEntries:withQueryType:]");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 2570);

            PLLogCommon();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v20;
              _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v46;
            v7 = 0x1E0D7F000uLL;
          }
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("PLBatteryUIAppTypeKey"));

        v27 = -[PLBatteryBreakdownService minimumRequiredQueryTypeForAppType:](self, "minimumRequiredQueryTypeForAppType:", v18);
        if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
        {
          v28 = objc_opt_class();
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1331;
          v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v50[4] = v28;
          if (qword_1ED884F88 != -1)
            dispatch_once(&qword_1ED884F88, v50);
          if (byte_1ED884D95)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("minimumRequiredQueryType=%i"), v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "lastPathComponent");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService filterWithEnergyEntries:withQueryType:]");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 2576);

            PLLogCommon();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v29;
              _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            a4 = v43;
            self = v46;
            v7 = 0x1E0D7F000uLL;
          }
        }
        if (a4 == 4)
        {
          if ((v18 & 0xFFFFFFFB) != 0)
            goto LABEL_39;
        }
        else
        {
          if (v27 > a4)
            goto LABEL_39;
          if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
          {
            v35 = objc_opt_class();
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v49[2] = __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1336;
            v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v49[4] = v35;
            if (qword_1ED884F90 != -1)
              dispatch_once(&qword_1ED884F90, v49);
            if (byte_1ED884D96)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("adding entry"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "lastPathComponent");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService filterWithEnergyEntries:withQueryType:]");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 2587);

              PLLogCommon();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v58 = v36;
                _os_log_debug_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              a4 = v43;
              self = v46;
              v7 = 0x1E0D7F000;
            }
          }
        }
        objc_msgSend(v44, "addObject:", v9);
LABEL_39:

        ++v8;
      }
      while (v48 != v8);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v48);
  }

  return v44;
}

uint64_t __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D93 = result;
  return result;
}

uint64_t __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1326(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D94 = result;
  return result;
}

uint64_t __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1331(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D95 = result;
  return result;
}

uint64_t __67__PLBatteryBreakdownService_filterWithEnergyEntries_withQueryType___block_invoke_1336(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D96 = result;
  return result;
}

- (int)appTypeForName:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _BOOL4 v14;

  v4 = a3;
  -[PLBatteryBreakdownService rootNodeNames](self, "rootNodeNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 5;
  }
  else
  {
    -[PLBatteryBreakdownService nonAppNames](self, "nonAppNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if ((v9 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[PLBatteryBreakdownService webAppNames](self, "webAppNames");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v4);

      if ((v11 & 1) != 0)
      {
        v7 = 4;
      }
      else
      {
        -[PLBatteryBreakdownService installedBundleIDToDisplayName](self, "installedBundleIDToDisplayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        v7 = 2 * v14;
      }
    }
  }

  return v7;
}

- (int)minimumRequiredQueryTypeForAppType:(int)a3
{
  if (a3 == 5)
    return 3;
  else
    return 2 * (a3 == 2);
}

- (id)adjustForegroundTimesWithEnergyEntries:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E864D458, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)adjustBackgroundTimesWithEnergyEntries:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E864D480, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)qualifiersWithEnergyEntry:(id)a3 bucketSize:(double)a4 andTotalEnergy:(double)a5
{
  id v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _BOOL4 v35;
  id v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  int v68;
  double v69;
  _QWORD *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  _QWORD *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  NSObject *v98;
  _QWORD *v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  double v141;
  double v142;
  NSObject *v143;
  uint64_t v144;
  _QWORD *v145;
  double v146;
  void *v147;
  void *v148;
  double v149;
  double v150;
  NSObject *v151;
  void *v152;
  _QWORD *v153;
  double v154;
  _QWORD *v155;
  double v156;
  void *v157;
  void *v158;
  double v159;
  double v160;
  double v161;
  double v162;
  NSObject *v163;
  void *v164;
  void *v165;
  double v166;
  double v167;
  double v168;
  void *v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  void *v174;
  void *v175;
  double v176;
  double v177;
  void *v178;
  void *v179;
  double v180;
  double v181;
  void *v182;
  void *v183;
  double v184;
  double v185;
  void *v186;
  double v187;
  double v188;
  double v189;
  void *v190;
  double v191;
  double v192;
  double v193;
  void *v194;
  void *v195;
  double v196;
  double v197;
  double v198;
  void *v199;
  int v200;
  void *v201;
  double v202;
  double v203;
  void *v204;
  int v205;
  uint64_t v206;
  void *v207;
  unint64_t v208;
  void *v209;
  int v210;
  void *v211;
  _QWORD v213[5];
  _QWORD v214[5];
  _QWORD v215[5];
  _QWORD v216[5];
  _QWORD v217[5];
  _QWORD v218[5];
  _QWORD v219[5];
  _QWORD v220[5];
  uint8_t buf[4];
  void *v222;
  __int16 v223;
  double v224;
  __int16 v225;
  double v226;
  __int16 v227;
  double v228;
  uint64_t v229;

  v229 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    v220[0] = MEMORY[0x1E0C809B0];
    v220[1] = 3221225472;
    v220[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke;
    v220[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v220[4] = v8;
    v9 = v220;
    if (qword_1ED884F98 != -1)
      dispatch_once(&qword_1ED884F98, v9);

    if (byte_1ED884D97)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntry=%@"), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 2714);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v222 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    v32 = v31;

    v33 = v23 + v26;
    objc_msgSend(MEMORY[0x1E0D7FFF8], "defaultBatteryEnergyCapacity");
    v35 = v34 <= 0.0 || v20 / v34 <= dbl_1CB3892F0[a4 > 3600.0];
    if (v33 > 0.0)
    {
      v37 = (v29 + v32) / v33;
      objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
      v38 = (void *)_CFPreferencesCopyValueWithContainer();
      v39 = v38;
      if (v38)
      {
        objc_msgSend(v38, "doubleValue");
        v41 = v40;
      }
      else
      {
        v41 = 0.8;
      }

      if (v37 >= v41 && v35)
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v43 = objc_opt_class();
          v219[0] = MEMORY[0x1E0C809B0];
          v219[1] = 3221225472;
          v219[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1353;
          v219[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v219[4] = v43;
          v44 = v219;
          if (qword_1ED884FA0 != -1)
            dispatch_once(&qword_1ED884FA0, v44);

          if (byte_1ED884D98)
          {
            v45 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stringWithFormat:", CFSTR("PluggedInQualifier: Adding plugged in qualifier based on BGTime %@, FGTime %@, BGPluggedInTime %@, FGPluggedInTime %@"), v46, v47, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "lastPathComponent");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:]");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "logMessage:fromFile:fromFunction:fromLineNumber:", v50, v53, v54, 2744);

            PLLogCommon();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v222 = v50;
              _os_log_debug_impl(&dword_1CAF47000, v55, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(v16, "addObject:", &unk_1E8634890);
      }
    }
    if (v20 == 0.0)
    {
      v36 = v16;
    }
    else
    {
      objc_msgSend(&unk_1E86518F0, "objectAtIndexedSubscript:", 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleValue");
      v59 = v58;

      v60 = v59 / v20;
      if (v59 / v20 > 0.33
        && objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 1, v17))
      {
        objc_msgSend(v16, "addObject:", &unk_1E86348A8);
      }
      objc_msgSend(&unk_1E8651908, "objectAtIndexedSubscript:", 2, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "doubleValue");
      v64 = v63;

      v65 = v20 - v64;
      v66 = v65 / v20;
      v67 = MEMORY[0x1E0C809B0];
      if (v65 / v20 > 0.5 && objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 2, v17))
      {
        v68 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
        if (v23 < 300.0 || (v69 = v23 / v26, v23 / v26 < 0.33))
        {
          if (v68)
          {
            v217[0] = v67;
            v217[1] = 3221225472;
            v217[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1371;
            v217[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v217[4] = objc_opt_class();
            v80 = v217;
            if (qword_1ED884FB0 != -1)
              dispatch_once(&qword_1ED884FB0, v80);

            if (byte_1ED884D9A)
            {
              v81 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "stringWithFormat:", CFSTR("BGQualifier: Removing qualifier based on BGTime %@, FGTime %@"), v82, v83);
              v84 = (void *)objc_claimAutoreleasedReturnValue();

              v85 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "lastPathComponent");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:]");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "logMessage:fromFile:fromFunction:fromLineNumber:", v84, v87, v88, 2766);

              PLLogCommon();
              v89 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v222 = v84;
                _os_log_debug_impl(&dword_1CAF47000, v89, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v67 = MEMORY[0x1E0C809B0];
            }
          }
        }
        else
        {
          if (v68)
          {
            v218[0] = v67;
            v218[1] = 3221225472;
            v218[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1365;
            v218[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v218[4] = objc_opt_class();
            v70 = v218;
            if (qword_1ED884FA8 != -1)
              dispatch_once(&qword_1ED884FA8, v70);

            if (byte_1ED884D99)
            {
              v71 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "stringWithFormat:", CFSTR("BGQualifier: Adding qualifier based on BGTime %@, FGTime %@"), v72, v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              v75 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "lastPathComponent");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService qualifiersWithEnergyEntry:bucketSize:andTotalEnergy:]");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "logMessage:fromFile:fromFunction:fromLineNumber:", v74, v77, v78, 2763);

              PLLogCommon();
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v222 = v74;
                _os_log_debug_impl(&dword_1CAF47000, v79, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v67 = MEMORY[0x1E0C809B0];
            }
          }
          objc_msgSend(v16, "addObject:", &unk_1E86348C0, v69);
        }
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.findmy")))
      {
        +[PLBatteryBreakdownService defaults](PLBatteryBreakdownService, "defaults");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("energyRatioIT"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "doubleValue");
        v93 = v92;

        objc_msgSend(&unk_1E8651920, "objectAtIndexedSubscript:", 59);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "doubleValue");
        v97 = v96;

        if (v97 / v20 > v93 && (objc_msgSend(v16, "containsObject:", &unk_1E86348C0, v97 / v20) & 1) == 0)
          objc_msgSend(v16, "addObject:", &unk_1E86348C0);
        PLLogCommon();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v222 = v16;
          _os_log_debug_impl(&dword_1CAF47000, v98, OS_LOG_TYPE_DEBUG, "IT Qualifier: %@", buf, 0xCu);
        }

      }
      v216[0] = v67;
      v216[1] = 3221225472;
      v216[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1377;
      v216[3] = &unk_1E85780C8;
      v216[4] = self;
      v99 = v216;
      if (qword_1ED884FB8 != -1)
        dispatch_once(&qword_1ED884FB8, v99);

      v100 = *(double *)&qword_1ED884FC0;
      objc_msgSend(&unk_1E8651938, "objectAtIndexedSubscript:", 48);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "doubleValue");
      v104 = v103;

      objc_msgSend(&unk_1E8651950, "objectAtIndexedSubscript:", 12);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "doubleValue");
      v108 = v104 + v107;

      objc_msgSend(&unk_1E8651968, "objectAtIndexedSubscript:", 13);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "doubleValue");
      v112 = v108 + v111;

      objc_msgSend(&unk_1E8651980, "objectAtIndexedSubscript:", 15);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E8651998, "objectAtIndexedSubscript:", 2);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:withRootNodeName:](PLBatteryBreakdownService, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKeyedSubscript:", v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "doubleValue");
      v118 = v112 + v117;

      objc_msgSend(&unk_1E86519B0, "objectAtIndexedSubscript:", 15);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E86519C8, "objectAtIndexedSubscript:", 7);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:withRootNodeName:](PLBatteryBreakdownService, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKeyedSubscript:", v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "doubleValue");
      v124 = v118 + v123;

      objc_msgSend(&unk_1E86519E0, "objectAtIndexedSubscript:", 15);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E86519F8, "objectAtIndexedSubscript:", 9);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:withRootNodeName:](PLBatteryBreakdownService, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKeyedSubscript:", v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "doubleValue");
      v130 = v124 + v129;

      objc_msgSend(&unk_1E8651A10, "objectAtIndexedSubscript:", 15);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E8651A28, "objectAtIndexedSubscript:", 52);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:withRootNodeName:](PLBatteryBreakdownService, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKeyedSubscript:", v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "doubleValue");
      v136 = v130 + v135;

      objc_msgSend(&unk_1E8651A40, "objectAtIndexedSubscript:", 15);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E8651A58, "objectAtIndexedSubscript:", 54);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLBatteryBreakdownService rootNodeQualificationNameWithQualificationName:withRootNodeName:](PLBatteryBreakdownService, "rootNodeQualificationNameWithQualificationName:withRootNodeName:", v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKeyedSubscript:", v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "doubleValue");
      v142 = v136 + v141;

      PLLogCommon();
      v143 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v222 = v17;
        v223 = 2048;
        v224 = v142;
        _os_log_debug_impl(&dword_1CAF47000, v143, OS_LOG_TYPE_DEBUG, "%@ locEnergy: %.3f", buf, 0x16u);
      }

      v144 = MEMORY[0x1E0C809B0];
      if (v142 / v20 > v100
        && objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 3, v17))
      {
        v215[0] = v144;
        v215[1] = 3221225472;
        v215[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1406;
        v215[3] = &unk_1E85780C8;
        v215[4] = self;
        v145 = v215;
        if (qword_1ED884FC8 != -1)
          dispatch_once(&qword_1ED884FC8, v145);

        v146 = *(double *)&qword_1ED884FD0;
        objc_msgSend(&unk_1E8651A70, "objectAtIndexedSubscript:", 15);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "doubleValue");
        v150 = v149;

        PLLogCommon();
        v151 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v222 = v17;
          v223 = 2048;
          v224 = v150;
          _os_log_debug_impl(&dword_1CAF47000, v151, OS_LOG_TYPE_DEBUG, "%@ bgLocEnergy: %.3f", buf, 0x16u);
        }

        if (v150 / v65 > v146 && objc_msgSend(v16, "containsObject:", &unk_1E86348C0, v150 / v65))
        {
          objc_msgSend(v16, "removeObject:", &unk_1E86348C0);
          v152 = &unk_1E86348D8;
        }
        else
        {
          v152 = &unk_1E86348F0;
        }
        objc_msgSend(v16, "addObject:", v152);
      }
      v214[0] = v144;
      v214[1] = 3221225472;
      v214[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1413;
      v214[3] = &unk_1E85780C8;
      v214[4] = self;
      v153 = v214;
      if (qword_1ED884FD8 != -1)
        dispatch_once(&qword_1ED884FD8, v153);

      v154 = *(double *)&qword_1ED884FE0;
      v213[0] = v144;
      v213[1] = 3221225472;
      v213[2] = __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_2;
      v213[3] = &unk_1E85780C8;
      v213[4] = self;
      v155 = v213;
      if (qword_1ED884FE8 != -1)
        dispatch_once(&qword_1ED884FE8, v155);

      v156 = *(double *)&qword_1ED884FF0;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NotificationInfo"));
      v157 = (void *)objc_claimAutoreleasedReturnValue();

      if (v157 && objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 9, v17))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NotificationInfo"));
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "notificationEnergy");
        v160 = v159;
        objc_msgSend(MEMORY[0x1E0D80078], "defaultBatteryEnergyCapacity");
        v162 = v160 * 100.0 / v161;
        PLLogCommon();
        v163 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v222 = v17;
          v223 = 2112;
          v224 = *(double *)&v158;
          v225 = 2048;
          v226 = v160;
          v227 = 2048;
          v228 = v162;
          _os_log_debug_impl(&dword_1CAF47000, v163, OS_LOG_TYPE_DEBUG, "%@ notificationInfo: %@, energy: %.3f, batteryPercent %.3f", buf, 0x2Au);
        }

        if (v160 / v20 > v154 || v162 > v156)
          objc_msgSend(v16, "addObject:", &unk_1E8634908, v160 / v20);

      }
      objc_msgSend(&unk_1E8651A88, "objectAtIndexedSubscript:", 3);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "doubleValue");
      v167 = v166;

      v168 = v167 / v20;
      if (v167 / v20 > 0.33
        && objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 4, v17))
      {
        objc_msgSend(v16, "addObject:", &unk_1E8634920);
      }
      objc_msgSend(&unk_1E8651AA0, "objectAtIndexedSubscript:", 4, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v169);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "doubleValue");
      v172 = v171;

      v173 = v172 / v20;
      if (v172 / v20 > 0.33
        && objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 5, v17))
      {
        objc_msgSend(v16, "addObject:", &unk_1E8634938);
      }
      objc_msgSend(&unk_1E8651AB8, "objectAtIndexedSubscript:", 14, v173);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v174);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "doubleValue");
      v177 = v176;

      objc_msgSend(&unk_1E8651AD0, "objectAtIndexedSubscript:", 15);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "doubleValue");
      v181 = v180;

      objc_msgSend(&unk_1E8651AE8, "objectAtIndexedSubscript:", 55);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v182);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "doubleValue");
      v185 = v184;

      if ((v177 + v181 + v185) / v20 > 0.03
        && objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 7, v17))
      {
        objc_msgSend(v16, "addObject:", &unk_1E8634950);
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("WatchEnergy"));
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "doubleValue");
      v188 = v187;

      if (-[PLBatteryBreakdownService showGizmoQualifier](self, "showGizmoQualifier"))
      {
        v189 = v188 / v20;
        if (v188 / v20 > 0.33)
        {
          if (objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 10, v17))
            objc_msgSend(v16, "addObject:", &unk_1E8634968);
        }
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ChronoWidgetEnergy"), v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "doubleValue");
      v192 = v191;

      v193 = v192 / v20;
      if (v192 / v20 > 0.33
        && objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 12, v17))
      {
        objc_msgSend(v16, "addObject:", &unk_1E8634980);
      }
      objc_msgSend(&unk_1E8651B00, "objectAtIndexedSubscript:", 10, v193);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "doubleValue");
      v197 = v196;

      v198 = v197 / v20;
      if (v197 / v20 > 0.33
        && objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 9, v17))
      {
        objc_msgSend(v16, "addObject:", &unk_1E8634908);
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"), v198);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v200 = objc_msgSend(v199, "isEqualToString:", CFSTR("com.apple.Home"));

      if (v200)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HomeKitEnergy"));
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v201, "doubleValue");
        v203 = v202;

        if (v203 / v20 > 0.33)
        {
          if (objc_msgSend((id)objc_opt_class(), "canSetQualifier:forBundleID:", 13, v17))
            objc_msgSend(v16, "addObject:", &unk_1E8634998);
        }
      }
      objc_msgSend((id)objc_opt_class(), "combineQualifiers:", v16);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "containsObject:", &unk_1E8634950))
      {
        v205 = objc_msgSend(v16, "containsObject:", &unk_1E86348C0);
        if (v66 > 0.5 && v205 && (objc_msgSend(v204, "containsObject:", &unk_1E8634890) & 1) == 0)
        {
          objc_msgSend(v204, "arrayByAddingObject:", &unk_1E86348C0);
          v206 = objc_claimAutoreleasedReturnValue();

          v204 = (void *)v206;
        }
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v204, "containsObject:", &unk_1E8634890))
        objc_msgSend(v207, "addObject:", &unk_1E8634890);
      if (objc_msgSend(v204, "count"))
      {
        v208 = 0;
        do
        {
          objc_msgSend(v204, "objectAtIndexedSubscript:", v208);
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          v210 = objc_msgSend(v209, "intValue");

          if (v210 != 11)
          {
            objc_msgSend(v204, "objectAtIndexedSubscript:", v208);
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v207, "addObject:", v211);

          }
          if (objc_msgSend(v207, "count") == 2)
            break;
          ++v208;
        }
        while (objc_msgSend(v204, "count") > v208);
      }
      v36 = v207;

    }
  }
  else
  {
    v36 = (id)MEMORY[0x1E0C9AA60];
  }

  return v36;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D97 = result;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1353(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D98 = result;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1365(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D99 = result;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1371(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D9A = result;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1377(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("energyRatioLocation"));
  qword_1ED884FC0 = v2;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1406(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("energyRatioBackgroundLocation"));
  qword_1ED884FD0 = v2;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_1413(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("energyRatioNotifications"));
  qword_1ED884FE0 = v2;
  return result;
}

uint64_t __81__PLBatteryBreakdownService_qualifiersWithEnergyEntry_bucketSize_andTotalEnergy___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("energyAbsoluteNotifications"));
  qword_1ED884FF0 = v2;
  return result;
}

+ (BOOL)canSetQualifier:(int64_t)a3 forBundleID:(id)a4
{
  id v5;
  char v6;
  char v7;
  char v8;
  char v9;
  unsigned int v10;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v5 = a4;
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilephone"));
  if (a3 == 2 && (v6 & 1) != 0)
    goto LABEL_9;
  v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.facetime"));
  if (a3 == 2 && (v7 & 1) != 0)
    goto LABEL_9;
  v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("HLS"));
  if (a3 == 2 && (v8 & 1) != 0)
    goto LABEL_9;
  v9 = objc_msgSend(v5, "isEqualToString:", CFSTR("Flashlight"));
  if (a3 == 2 && (v9 & 1) != 0)
    goto LABEL_9;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Backup & Restore")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("Backup")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("Restore")))
  {
    v13 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari"));
    if (a3 != 2 || (v13 & 1) == 0)
    {
      v14 = objc_msgSend(v5, "isEqualToString:", CFSTR("Hotspot"));
      if (a3 != 2 || (v14 & 1) == 0)
      {
        v15 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Maps"));
        if (a3 != 2 || (v15 & 1) == 0)
        {
          v16 = objc_msgSend(v5, "isEqualToString:", CFSTR("Siri"));
          if ((a3 != 2 || (v16 & 1) == 0)
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("Flashlight")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("PowerOutAccessories")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("DeletedApp")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("DeletedAppClip")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("DeletedAppAndAppClip")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("EN")) & 1) == 0)
          {
            if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Bridge")))
            {
              if ((unint64_t)a3 < 0xB)
              {
                v10 = (0x2FBu >> a3) & 1;
                goto LABEL_10;
              }
LABEL_41:
              LOBYTE(v10) = 1;
              goto LABEL_10;
            }
            v17 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.camera"));
            if ((a3 != 10 || (v17 & 1) == 0)
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("PoorCellCondition")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) == 0)
            {
              goto LABEL_41;
            }
          }
        }
      }
    }
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  LOBYTE(v10) = a3 != 7 && a3 != 2;
LABEL_10:

  return v10;
}

+ (id)combineQualifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", &unk_1E86348C0)
      && objc_msgSend(v5, "containsObject:", &unk_1E8634950))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E86348C0);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1E86348C0)
      && objc_msgSend(v5, "containsObject:", &unk_1E8634890))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E86348C0);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1E86348D8)
      && objc_msgSend(v5, "containsObject:", &unk_1E8634890))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E86348D8);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1E86348C0)
      && objc_msgSend(v5, "containsObject:", &unk_1E86348A8))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E86348C0);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1E8634950)
      && objc_msgSend(v5, "containsObject:", &unk_1E8634920))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E8634950);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1E86348C0)
      && objc_msgSend(v5, "containsObject:", &unk_1E8634938))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E86348C0);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1E8634938)
      && objc_msgSend(v5, "containsObject:", &unk_1E8634920))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E8634938);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1E86348C0)
      && objc_msgSend(v5, "containsObject:", &unk_1E8634968))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E86348C0);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1E86348C0)
      && objc_msgSend(v5, "containsObject:", &unk_1E8634998))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E86348C0);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1E86348C0)
      && objc_msgSend(v5, "containsObject:", &unk_1E8634908))
    {
      objc_msgSend(v5, "removeObject:", &unk_1E86348C0);
    }
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (BOOL)shouldShowBatteryBreakdownWithTotalSumEnergy:(double)a3 withtotalSumEnergyRatioCutOff:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;

  objc_msgSend(MEMORY[0x1E0D7FFC0], "entryKeyForOperatorName:withType:withName:", CFSTR("PLBatteryAgent"), *MEMORY[0x1E0D80370], CFSTR("Battery"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastEntryForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DesignCapacity"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Voltage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14 / 1000.0;

    v16 = v12 * v15 * a4 < a3;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)rootNodeQualificationNameWithQualificationName:(id)a3 withRootNodeName:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a3, a4);
}

- (BOOL)wasGizmoConnectedInRange:(_PLTimeIntervalRange)a3
{
  double var0;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  var0 = a3.var0;
  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3.var0 + a3.var1;
  objc_msgSend(MEMORY[0x1E0D7FFC0], "entryKeyForOperatorName:withType:withName:", CFSTR("PLIdentityServicesAgent"), *MEMORY[0x1E0D80378], CFSTR("LocalLinkType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select * from %@ where linkType=1 and timestamp>=%f and timestamp<=%f limit 1"), v5, *(_QWORD *)&var0, *(_QWORD *)&v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entriesForKey:withQuery:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PLBatteryBreakdownService_wasGizmoConnectedInRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED884FF8 != -1)
      dispatch_once(&qword_1ED884FF8, block);
    if (byte_1ED884D9B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Query Result %@"), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryBreakdownService.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryBreakdownService wasGizmoConnectedInRange:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 3076);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v17 = v9 && objc_msgSend(v9, "count");

  return v17;
}

uint64_t __54__PLBatteryBreakdownService_wasGizmoConnectedInRange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D9B = result;
  return result;
}

- (BOOL)showRootNodesInInternal
{
  BOOL result;

  if (qword_1ED885000 != -1)
    dispatch_once(&qword_1ED885000, &__block_literal_global_1458);
  result = qword_1ED885008;
  if (qword_1ED885008)
    return objc_msgSend((id)qword_1ED885008, "BOOLValue");
  return result;
}

void __52__PLBatteryBreakdownService_showRootNodesInInternal__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
  v0 = _CFPreferencesCopyValueWithContainer();
  v1 = (void *)qword_1ED885008;
  qword_1ED885008 = v0;

}

- (double)totalSumEnergyRatioCutOff
{
  return 0.001;
}

- (void)setRootNodeNames:(id)a3
{
  objc_storeStrong((id *)&self->_rootNodeNames, a3);
}

- (void)setNonAppNames:(id)a3
{
  objc_storeStrong((id *)&self->_nonAppNames, a3);
}

- (void)setIntermediateRootNodes:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateRootNodes, a3);
}

- (void)setDeletedAppNames:(id)a3
{
  objc_storeStrong((id *)&self->_deletedAppNames, a3);
}

- (void)setDeletedAppClipNames:(id)a3
{
  objc_storeStrong((id *)&self->_deletedAppClipNames, a3);
}

- (void)setWebAppNames:(id)a3
{
  objc_storeStrong((id *)&self->_webAppNames, a3);
}

- (void)setNodeIDToNodeName:(id)a3
{
  objc_storeStrong((id *)&self->_nodeIDToNodeName, a3);
}

- (void)setInstalledBundleIDToDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_installedBundleIDToDisplayName, a3);
}

- (void)setInstalledPluginBundleIDToPluginEntry:(id)a3
{
  objc_storeStrong((id *)&self->_installedPluginBundleIDToPluginEntry, a3);
}

- (void)setGizmoDaemonToAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoDaemonToAppBundleID, a3);
}

- (void)setGizmoIDSTopicToAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoIDSTopicToAppBundleID, a3);
}

- (void)setRootNodeNameToRootNodeEnergyKey:(id)a3
{
  objc_storeStrong((id *)&self->_rootNodeNameToRootNodeEnergyKey, a3);
}

- (void)setGivenNameToMappedName:(id)a3
{
  objc_storeStrong((id *)&self->_givenNameToMappedName, a3);
}

- (BOOL)showGizmoQualifier
{
  return self->_showGizmoQualifier;
}

- (void)setShowGizmoQualifier:(BOOL)a3
{
  self->_showGizmoQualifier = a3;
}

- (double)totalEnergyDay
{
  return self->_totalEnergyDay;
}

- (void)setTotalEnergyDay:(double)a3
{
  self->_totalEnergyDay = a3;
}

- (double)totalEnergyWeek
{
  return self->_totalEnergyWeek;
}

- (void)setTotalEnergyWeek:(double)a3
{
  self->_totalEnergyWeek = a3;
}

- (BOOL)hasHomeKitActivity
{
  return self->_hasHomeKitActivity;
}

- (void)setHasHomeKitActivity:(BOOL)a3
{
  self->_hasHomeKitActivity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenNameToMappedName, 0);
  objc_storeStrong((id *)&self->_rootNodeNameToRootNodeEnergyKey, 0);
  objc_storeStrong((id *)&self->_gizmoIDSTopicToAppBundleID, 0);
  objc_storeStrong((id *)&self->_gizmoDaemonToAppBundleID, 0);
  objc_storeStrong((id *)&self->_installedPluginBundleIDToPluginEntry, 0);
  objc_storeStrong((id *)&self->_installedBundleIDToDisplayName, 0);
  objc_storeStrong((id *)&self->_nodeIDToNodeName, 0);
  objc_storeStrong((id *)&self->_webAppNames, 0);
  objc_storeStrong((id *)&self->_deletedAppClipNames, 0);
  objc_storeStrong((id *)&self->_deletedAppNames, 0);
  objc_storeStrong((id *)&self->_intermediateRootNodes, 0);
  objc_storeStrong((id *)&self->_nonAppNames, 0);
  objc_storeStrong((id *)&self->_rootNodeNames, 0);
}

@end
