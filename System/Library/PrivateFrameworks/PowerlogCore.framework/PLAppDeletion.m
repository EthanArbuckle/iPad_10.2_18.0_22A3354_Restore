@implementation PLAppDeletion

+ (id)getProtectionLevel:(int)a3
{
  id *v3;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v3 = (id *)MEMORY[0x1E0CB2AC0];
  }
  else
  {
    v3 = (id *)MEMORY[0x1E0CB2AB8];
  }
  return *v3;
}

+ (void)traverseVersionDirectory:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PLAppDeletion_traverseVersionDirectory_withBlock___block_invoke;
  v11[3] = &unk_1E6A52D00;
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

}

void __52__PLAppDeletion_traverseVersionDirectory_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)setFileProtectionForPath:(id)a3 withLevel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CB2AD8];
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v8, v5, &v13);
  v10 = v13;

  if (v10)
  {
    PLLogAppDeletion();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v10;
      _os_log_error_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_ERROR, "Failed to set file protection %@ for file at path: %@ with error: %@", buf, 0x20u);
    }

  }
  return v9;
}

+ (BOOL)changePermissionsForFilesInDirectory:(id)a3 withProtectionLevel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v6, 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v22;
    *(_QWORD *)&v11 = 138412546;
    v20 = v11;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(v6, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14), v20, (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        PLLogAppDeletion();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v20;
          v26 = v15;
          v27 = 2112;
          v28 = v7;
          _os_log_debug_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_DEBUG, "Changing permission for file %@ to %@", buf, 0x16u);
        }

        if ((objc_msgSend(a1, "setFileProtectionForPath:withLevel:", v15, v7) & 1) == 0)
        {
          PLLogAppDeletion();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            +[PLAppDeletion changePermissionsForFilesInDirectory:withProtectionLevel:].cold.1();

          v17 = 0;
          goto LABEL_15;
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v12)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_15:

  return v17;
}

+ (BOOL)changePermissionForDirectory:(id)a3 withProtectionLevel:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__PLAppDeletion_changePermissionForDirectory_withProtectionLevel___block_invoke;
  v10[3] = &unk_1E6A54C50;
  v12 = &v14;
  v13 = a1;
  v8 = v7;
  v11 = v8;
  objc_msgSend(a1, "traverseVersionDirectory:withBlock:", v6, v10);
  LOBYTE(a1) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)a1;
}

void __66__PLAppDeletion_changePermissionForDirectory_withProtectionLevel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "changePermissionsForFilesInDirectory:withProtectionLevel:", v3, *(_QWORD *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    PLLogAppDeletion();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__PLAppDeletion_changePermissionForDirectory_withProtectionLevel___block_invoke_cold_1();

  }
}

+ (BOOL)changeClassProtection:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;

  objc_msgSend(a1, "getProtectionLevel:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    PLLogAppDeletion();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[PLAppDeletion changeClassProtection:].cold.1(a3, v13);
    goto LABEL_13;
  }
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MajorVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "changePermissionForDirectory:withProtectionLevel:", v7, v5);

  if ((v8 & 1) == 0)
  {
    PLLogAppDeletion();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[PLAppDeletion changeClassProtection:].cold.4();
    goto LABEL_13;
  }
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MinorVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "changePermissionForDirectory:withProtectionLevel:", v10, v5);

  PLLogAppDeletion();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[PLAppDeletion changeClassProtection:].cold.3();
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[PLAppDeletion changeClassProtection:].cold.2();
  v14 = 1;
LABEL_14:

  return v14;
}

+ (id)filePermissionCriteria
{
  NSObject *v2;
  xpc_object_t v3;

  PLLogAppDeletion();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[PLAppDeletion filePermissionCriteria].cold.1();

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808B0], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  return v3;
}

+ (void)registerFilePermissionActivity
{
  void *v3;
  _QWORD handler[5];

  objc_msgSend(a1, "filePermissionCriteria");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __47__PLAppDeletion_registerFilePermissionActivity__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.powerlogd.XPCFilePermissionScheduler", v3, handler);

}

void __47__PLAppDeletion_registerFilePermissionActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;

  v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleFilePermissionXPCActivityCallback:", v3);
  }
  else
  {
    PLLogAppDeletion();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __47__PLAppDeletion_registerFilePermissionActivity__block_invoke_cold_1();

  }
}

+ (void)handleFilePermissionXPCActivityCallback:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = +[PLAppDeletion changeClassProtection:](PLAppDeletion, "changeClassProtection:", 1);
  PLLogAppDeletion();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[PLAppDeletion handleFilePermissionXPCActivityCallback:].cold.1();

    objc_msgSend(a1, "finishXPCActivity:", v4);
    objc_msgSend(a1, "registerAppDeletionActivity");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "Deferring activity as changing class protection to ClassC failed", v8, 2u);
    }

    if ((objc_msgSend(a1, "deferXPCActivity:", v4) & 1) == 0)
      objc_msgSend(a1, "finishXPCActivity:", v4);
  }

}

+ (void)setup
{
  id v3;

  objc_msgSend(a1, "constructAppReferenceTableList");
  objc_msgSend(a1, "constructFileNames");
  objc_msgSend(a1, "constructAppReferenceMapping");
  v3 = (id)objc_msgSend(a1, "constructUpdateQueries");
}

+ (void)resetStateVariables
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  processedFilesCounter = 0;
  objc_msgSend((id)listOfFileNames, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)listOfFileNames, "setObject:forKeyedSubscript:", &unk_1E6ABB000, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PLAppDeletionActivityComplete"), 0, 0);

}

+ (id)pluginsForBundleID:(id)a3
{
  id v3;
  PLValueComparison *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:]([PLValueComparison alloc], "initWithKey:withValue:withComparisonOperation:", CFSTR("PluginParentApp"), v3, 0);

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entriesForKey:withComparisons:", CFSTR("PLApplicationAgent_EventNone_AllPlugins"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)maskAssociatedPlugins:(id)a3 withMaskedDictionary:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "pluginsForBundleID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PluginId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (void *)_MergedGlobals;
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PluginId"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v15);

        }
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PluginExecutableName"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)qword_1ED539A58;
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PluginExecutableName"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v6, v18);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

+ (id)processNameForBundleID:(id)a3
{
  id v3;
  PLValueComparison *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:]([PLValueComparison alloc], "initWithKey:withValue:withComparisonOperation:", CFSTR("BundleID"), v3, 0);

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("PLProcessMonitorAgent_EventForward_ProcessID"), v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ProcessName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)maskProcessName:(id)a3 withMaskedDictionary:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a1, "processNameForBundleID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend((id)qword_1ED539A58, "setObject:forKeyedSubscript:", v7, v6);

}

+ (void)constructAppReferenceMapping
{
  uint64_t v7;

  v7 = objc_msgSend(a2, "entryID");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_1B6AB6000, a4, OS_LOG_TYPE_DEBUG, "AppDeletion : already processed this entry %lld", a1, 0xCu);
}

+ (void)populateIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    v7 = &off_1E6A51000;
    v21 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1BCC9E9B4]();
        objc_msgSend(v7[47], "sharedSQLiteConnection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "tableExistsForTableName:", v9);

        if (v12)
        {
          +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[PLEntryDefinition hasAppIdentifierKeysForEntryDefinition:](PLEntryDefinition, "hasAppIdentifierKeysForEntryDefinition:", v13))
          {
            v14 = (void *)objc_opt_new();
            v15 = (void *)objc_opt_new();
            v16 = (void *)objc_opt_new();
            +[PLEntryDefinition keyConfigsForEntryDefinition:](PLEntryDefinition, "keyConfigsForEntryDefinition:", v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __37__PLAppDeletion_populateIdentifiers___block_invoke;
            v22[3] = &unk_1E6A52458;
            v18 = v14;
            v23 = v18;
            v19 = v15;
            v24 = v19;
            v20 = v16;
            v25 = v20;
            objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);
            if (objc_msgSend(v18, "count"))
              objc_msgSend((id)tableNameToBundleIdentifier, "setObject:forKeyedSubscript:", v18, v9);
            if (objc_msgSend(v19, "count", v21))
              objc_msgSend((id)tableNameToAppIdentifier, "setObject:forKeyedSubscript:", v19, v9);
            if (objc_msgSend(v20, "count"))
              objc_msgSend((id)tableNameToProcessIdentifier, "setObject:forKeyedSubscript:", v20, v9);

            v3 = v21;
            v7 = &off_1E6A51000;
          }

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v5);
  }

}

void __37__PLAppDeletion_populateIdentifiers___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    objc_msgSend(a1[4], "addObject:", v12);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
    objc_msgSend(a1[5], "addObject:", v12);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProcessName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
    objc_msgSend(a1[6], "addObject:", v12);

}

+ (void)iterateAgents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "agents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allOperators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "entryKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(a1, "populateIdentifiers:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

+ (void)iterateServices
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allOperators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "entryKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(a1, "populateIdentifiers:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

+ (void)constructAppReferenceTableList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "AppDeletion : tableNameToBundleIdentifier is %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __47__PLAppDeletion_constructAppReferenceTableList__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)tableNameToBundleIdentifier;
  tableNameToBundleIdentifier = v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)tableNameToAppIdentifier;
  tableNameToAppIdentifier = v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)tableNameToProcessIdentifier;
  tableNameToProcessIdentifier = v6;

  objc_msgSend(*(id *)(a1 + 32), "iterateAgents");
  objc_msgSend(*(id *)(a1 + 32), "iterateServices");
  return objc_msgSend((id)tableNameToBundleIdentifier, "setObject:forKeyedSubscript:", &unk_1E6AF5F48, CFSTR("PLAccountingOperator_EventNone_Nodes"));
}

+ (id)constructUpdateQueries
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  __CFString *v8;
  __CFString *v9;

  v2 = objc_opt_new();
  v3 = (void *)updateQueries;
  updateQueries = v2;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PLAppDeletion_constructUpdateQueries__block_invoke;
  v7[3] = &unk_1E6A54C98;
  v8 = CFSTR("PLApplicationAgent_EventNone_AllApps");
  v9 = CFSTR("AppDistributorID");
  objc_msgSend((id)tableNameToBundleIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);
  objc_msgSend((id)tableNameToAppIdentifier, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_77);
  objc_msgSend((id)tableNameToProcessIdentifier, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_78_0);
  PLLogAppDeletion();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[PLAppDeletion constructUpdateQueries].cold.1();

  v5 = (id)updateQueries;
  return v5;
}

void __39__PLAppDeletion_constructUpdateQueries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **p_cache;
  uint64_t v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
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
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
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
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = a3;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v60;
    p_cache = &OBJC_METACLASS___PLDarkWakeState.cache;
    v50 = v5;
    v47 = a1;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v60 != v41)
          objc_enumerationMutation(obj);
        v43 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v7);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v45 = p_cache[332];
        v48 = (id)objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
        if (v48)
        {
          v46 = *(_QWORD *)v56;
          v44 = v8;
          do
          {
            for (i = 0; i != v48; i = (char *)i + 1)
            {
              if (*(_QWORD *)v56 != v46)
                objc_enumerationMutation(v45);
              v10 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
              v11 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));
              v12 = (void *)MEMORY[0x1E0CB37A0];
              if (v11)
              {
                v13 = *(_QWORD *)(a1 + 32);
                v14 = *(_QWORD *)(a1 + 40);
                objc_msgSend(p_cache[332], "objectForKeyedSubscript:", v10);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MaskedName"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "stringWithFormat:", CFSTR("UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND AppDeletedDate != 0;"),
                  v13,
                  v14,
                  v16,
                  v8,
                  v10);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend((id)updateQueries, "addObject:", v17);
                PLLogAppDeletion();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v65 = v17;
                  _os_log_debug_impl(&dword_1B6AB6000, v18, OS_LOG_TYPE_DEBUG, "AppDeletion : updateQueries for AppDistributorID is %@", buf, 0xCu);
                }

                v19 = (void *)MEMORY[0x1E0CB37A0];
                objc_msgSend((id)qword_1ED539A60, "objectForKeyedSubscript:", v10);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MaskedName"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = v44;
                v5 = v50;
                objc_msgSend(v19, "stringWithFormat:", CFSTR("UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND AppDeletedDate != 0;"),
                  v50,
                  v44,
                  v21,
                  v44,
                  v10);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend((id)updateQueries, "addObject:", v22);
              }
              else
              {
                objc_msgSend(p_cache[332], "objectForKeyedSubscript:", v10);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("MaskedName"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(p_cache[332], "objectForKeyedSubscript:", v10);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("DeleteTimestamp"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "doubleValue");
                objc_msgSend(v12, "stringWithFormat:", CFSTR("UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND timestamp <= %f;"),
                  v5,
                  v8,
                  v24,
                  v8,
                  v10,
                  v27);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend((id)updateQueries, "addObject:", v17);
              }

              a1 = v47;
              p_cache = (void **)(&OBJC_METACLASS___PLDarkWakeState + 16);
            }
            v48 = (id)objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
          }
          while (v48);
        }

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v49 = (id)_MergedGlobals;
        v28 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v52 != v30)
                objc_enumerationMutation(v49);
              v32 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
              v33 = (void *)MEMORY[0x1E0CB37A0];
              objc_msgSend((id)_MergedGlobals, "objectForKeyedSubscript:", v32);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("MaskedName"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)_MergedGlobals, "objectForKeyedSubscript:", v32);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("DeleteTimestamp"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "doubleValue");
              objc_msgSend(v33, "stringWithFormat:", CFSTR("UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND timestamp <= %f;"),
                v50,
                v8,
                v35,
                v8,
                v32,
                v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend((id)updateQueries, "addObject:", v39);
            }
            v29 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
          }
          while (v29);
        }

        v7 = v43 + 1;
        v5 = v50;
        a1 = v47;
        p_cache = (void **)(&OBJC_METACLASS___PLDarkWakeState + 16);
      }
      while (v43 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v42);
  }

}

void __39__PLAppDeletion_constructUpdateQueries__block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a3;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(obj);
        v21 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v4);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v22 = (id)qword_1ED539A68;
        v6 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v25 != v8)
                objc_enumerationMutation(v22);
              v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              v11 = (void *)MEMORY[0x1E0CB37A0];
              objc_msgSend((id)qword_1ED539A68, "objectForKeyedSubscript:", v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MaskedName"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)qword_1ED539A68, "objectForKeyedSubscript:", v10);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DeleteTimestamp"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "doubleValue");
              objc_msgSend(v11, "stringWithFormat:", CFSTR("UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND timestamp <= %f;"),
                v23,
                v5,
                v13,
                v5,
                v10,
                v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend((id)updateQueries, "addObject:", v17);
            }
            v7 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v7);
        }

        v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v20);
  }

}

void __39__PLAppDeletion_constructUpdateQueries__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a3;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(obj);
        v21 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v4);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v22 = (id)qword_1ED539A58;
        v6 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v25 != v8)
                objc_enumerationMutation(v22);
              v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              v11 = (void *)MEMORY[0x1E0CB37A0];
              objc_msgSend((id)qword_1ED539A58, "objectForKeyedSubscript:", v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MaskedName"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)qword_1ED539A58, "objectForKeyedSubscript:", v10);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DeleteTimestamp"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "doubleValue");
              objc_msgSend(v11, "stringWithFormat:", CFSTR("UPDATE '%@' SET %@ ='%@' WHERE %@ = '%@' AND timestamp <= %f;"),
                v23,
                v5,
                v13,
                v5,
                v10,
                v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend((id)updateQueries, "addObject:", v17);
            }
            v7 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v7);
        }

        v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v20);
  }

}

+ (void)addFilesToList:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentsOfDirectoryAtPath:error:", v3, 0);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "pathExtension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR(".%@"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "isEqualToString:", CFSTR(".gz")) & 1) != 0)
        {
          objc_msgSend(v3, "stringByAppendingPathComponent:", v8);
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)listOfFileNames, "setObject:forKeyedSubscript:", &unk_1E6ABB000, v12);
        }
        else
        {
          PLLogAppDeletion();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v8;
            _os_log_debug_impl(&dword_1B6AB6000, v12, OS_LOG_TYPE_DEBUG, "AppDeletion : skipping non-gz file %@", buf, 0xCu);
          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

}

+ (void)constructFileNames
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = objc_opt_new();
  v4 = (void *)listOfFileNames;
  listOfFileNames = v3;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addFilesToList:", v6);

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MajorVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__PLAppDeletion_constructFileNames__block_invoke;
  v13[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v13[4] = a1;
  +[PLAppDeletion traverseVersionDirectory:withBlock:](PLAppDeletion, "traverseVersionDirectory:withBlock:", v8, v13);

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MinorVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __35__PLAppDeletion_constructFileNames__block_invoke_2;
  v12[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v12[4] = a1;
  +[PLAppDeletion traverseVersionDirectory:withBlock:](PLAppDeletion, "traverseVersionDirectory:withBlock:", v11, v12);

}

uint64_t __35__PLAppDeletion_constructFileNames__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addFilesToList:", a2);
}

uint64_t __35__PLAppDeletion_constructFileNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addFilesToList:", a2);
}

+ (void)updateQuery:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  sqlite3 *v11;
  id v12;
  int v13;
  int v14;
  NSObject *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char *errmsg;
  sqlite3 *ppDb;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  char *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  errmsg = 0;
  ppDb = 0;
  v3 = objc_retainAutorelease(a3);
  if (sqlite3_open_v2((const char *)objc_msgSend(v3, "UTF8String"), &ppDb, 2, 0))
  {
    PLLogAppDeletion();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[PLAppDeletion updateQuery:].cold.1();
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = (id)updateQueries;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    if (v5)
    {
      v6 = v5;
      v16 = v3;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x1BCC9E9B4]();
          v11 = ppDb;
          v12 = objc_retainAutorelease(v9);
          v13 = sqlite3_exec(v11, (const char *)objc_msgSend(v12, "UTF8String"), 0, 0, &errmsg);
          if (v13)
          {
            v14 = v13;
            PLLogAppDeletion();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v24 = v12;
              v25 = 1024;
              v26 = v14;
              v27 = 2080;
              v28 = errmsg;
              _os_log_error_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_ERROR, "failed to execute update query %@ - %d and %s", buf, 0x1Cu);
            }

            sqlite3_free(errmsg);
          }
          objc_autoreleasePoolPop(v10);
        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
      }
      while (v6);
      v3 = v16;
    }
  }

  sqlite3_close(ppDb);
}

+ (void)deleteAppReferencesFromCompressedFiles:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  _xpc_activity_s *activity;
  id obj;
  uint8_t v34;
  _BYTE v35[15];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  int v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  activity = (_xpc_activity_s *)a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)listOfFileNames, "allKeys");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend((id)listOfFileNames, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "intValue");

        if (v9)
        {
          PLLogAppDeletion();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v7;
            _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "AppDeletion : filename %@ is processed", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v7, "stringByDeletingLastPathComponent");
          v10 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "lastPathComponent");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringByDeletingPathExtension");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject stringByAppendingPathComponent:](v10, "stringByAppendingPathComponent:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          PLLogAppDeletion();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v7;
            _os_log_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_DEFAULT, "AppDeletion : invoking decompress on file %@", buf, 0xCu);
          }

          v15 = +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:](PLUtilities, "decompressWithSource:withDestination:withRemoveSrc:", v7, v13, 1);
          PLLogAppDeletion();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v15)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v13;
              _os_log_debug_impl(&dword_1B6AB6000, v17, OS_LOG_TYPE_DEBUG, "AppDeletion : invoking update query on file %@", buf, 0xCu);
            }

            objc_msgSend(a1, "updateQuery:", v13);
            PLLogAppDeletion();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v13;
              _os_log_impl(&dword_1B6AB6000, v18, OS_LOG_TYPE_DEFAULT, "AppDeletion : invoking compress on file %@", buf, 0xCu);
            }

            +[PLUtilities compressWithSource:withDestination:withLevel:](PLUtilities, "compressWithSource:withDestination:withLevel:", v13, v7, 4);
            objc_msgSend(v30, "removeItemAtPath:error:", v13, 0);
            objc_msgSend(v13, "stringByAppendingString:", CFSTR("-shm"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "removeItemAtPath:error:", v19, 0);

            objc_msgSend(v13, "stringByAppendingString:", CFSTR("-wal"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "removeItemAtPath:error:", v20, 0);

            objc_msgSend((id)listOfFileNames, "setObject:forKeyedSubscript:", &unk_1E6ABB018, v7);
            v21 = ++processedFilesCounter;
            if (v21 == objc_msgSend(obj, "count"))
            {
              PLLogAppDeletion();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend((id)listOfFileNames, "objectForKeyedSubscript:", v7);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "intValue");
                *(_DWORD *)buf = 138412546;
                v41 = v7;
                v42 = 1024;
                v43 = v29;
                _os_log_impl(&dword_1B6AB6000, v27, OS_LOG_TYPE_DEFAULT, "Did not defer activity file %@ and processed %d", buf, 0x12u);

              }
              PLLogAppDeletion();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6AB6000, v23, OS_LOG_TYPE_DEFAULT, "All compressed files processed", buf, 2u);
              }
              goto LABEL_38;
            }
            if (activity && xpc_activity_should_defer(activity))
            {
              v22 = objc_msgSend(a1, "deferXPCActivity:", activity);
              PLLogAppDeletion();
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
              if (v22)
              {
                if (v24)
                  +[PLAppDeletion deleteAppReferencesFromCompressedFiles:].cold.1((uint64_t)v7, v23);
LABEL_38:

                goto LABEL_39;
              }
              if (v24)
                +[PLAppDeletion deleteAppReferencesFromCompressedFiles:].cold.2(&v34, v35, v23);
            }
            else
            {
              PLLogAppDeletion();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend((id)listOfFileNames, "objectForKeyedSubscript:", v7);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "intValue");
                *(_DWORD *)buf = 138412546;
                v41 = v7;
                v42 = 1024;
                v43 = v26;
                _os_log_impl(&dword_1B6AB6000, v23, OS_LOG_TYPE_DEFAULT, "Did not defer activity file %@ and processed %d", buf, 0x12u);

              }
            }

          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v13;
              _os_log_error_impl(&dword_1B6AB6000, v17, OS_LOG_TYPE_ERROR, "AppDeletion : failed to decompress file %@", buf, 0xCu);
            }

            ++processedFilesCounter;
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_39:

}

+ (void)deleteAppReferencesInCurrentPowerlog
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)updateQueries;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v8, "performQuery:returnValue:returnResult:", v7, 0, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

+ (void)deleteAppReferenceMapping
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id obj;
  id obja;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)qword_1ED539A60;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v37 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1E0CB37A0];
        objc_msgSend((id)qword_1ED539A60, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MaskedName"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)qword_1ED539A60, "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DeleteTimestamp"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(v7, "stringWithFormat:", CFSTR("UPDATE '%@' SET AppBundleId ='%@' WHERE AppBundleId = '%@' AND timestamp <= %f;"),
          CFSTR("PLApplicationAgent_EventForward_ApplicationDidUninstall"),
          v9,
          v6,
          v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (id)objc_msgSend(v14, "performQuery:returnValue:returnResult:", v13, 0, 0);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v3);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obja = (id)qword_1ED539A68;
  v16 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(obja);
        v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        v21 = (void *)MEMORY[0x1E0CB37A0];
        objc_msgSend((id)qword_1ED539A68, "objectForKeyedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("MaskedName"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)qword_1ED539A68, "objectForKeyedSubscript:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DeleteTimestamp"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        objc_msgSend(v21, "stringWithFormat:", CFSTR("UPDATE '%@' SET AppName ='%@' WHERE AppName = '%@' AND timestamp <= %f;"),
          CFSTR("PLApplicationAgent_EventForward_ApplicationDidUninstall"),
          v23,
          v20,
          v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (id)objc_msgSend(v28, "performQuery:returnValue:returnResult:", v27, 0, 0);

      }
      v17 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v17);
  }

}

+ (void)deleteAppReferences:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "setup");
  v5 = objc_msgSend((id)updateQueries, "count");
  PLLogAppDeletion();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      +[PLAppDeletion deleteAppReferences:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PLAppDeletionActivityStarted"), a1, qword_1ED539A60);

    objc_msgSend(a1, "deleteAppReferencesInCurrentPowerlog");
    objc_msgSend(a1, "deleteAppReferencesFromCompressedFiles:", v4);
  }
  else
  {
    if (v7)
      +[PLAppDeletion deleteAppReferences:].cold.1();

    processedFilesCounter = objc_msgSend((id)listOfFileNames, "count");
  }

}

+ (id)appDeletionCriteria
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808D8], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  return v2;
}

+ (void)registerAppDeletionActivity
{
  void *v3;
  _QWORD handler[5];

  objc_msgSend(a1, "appDeletionCriteria");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __44__PLAppDeletion_registerAppDeletionActivity__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.powerlogd.XPCAppDeletionScheduler", v3, handler);

}

void __44__PLAppDeletion_registerAppDeletionActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  NSObject *v6;

  v3 = a2;
  state = xpc_activity_get_state(v3);
  PLLogAppDeletion();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __44__PLAppDeletion_registerAppDeletionActivity__block_invoke_cold_2();

  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleAppDeletionXPCActivityCallback:", v3);
  }
  else
  {
    PLLogAppDeletion();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __44__PLAppDeletion_registerAppDeletionActivity__block_invoke_cold_1();

  }
}

+ (void)handleAppDeletionXPCActivityCallback:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;

  v4 = a3;
  PLLogAppDeletion();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[PLAppDeletion handleAppDeletionXPCActivityCallback:].cold.4();

  objc_msgSend(a1, "deleteAppReferences:", v4);
  v6 = processedFilesCounter;
  if (v6 == objc_msgSend((id)listOfFileNames, "count"))
  {
    objc_msgSend(a1, "deleteAppReferenceMapping");
    objc_msgSend(a1, "finishXPCActivity:", v4);
    PLLogAppDeletion();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[PLAppDeletion handleAppDeletionXPCActivityCallback:].cold.2();

    PLLogAppDeletion();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[PLAppDeletion handleAppDeletionXPCActivityCallback:].cold.1();

    +[PLAppDeletion changeClassProtection:](PLAppDeletion, "changeClassProtection:", 0);
    objc_msgSend(a1, "resetStateVariables");
  }
  else
  {
    PLLogAppDeletion();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[PLAppDeletion handleAppDeletionXPCActivityCallback:].cold.3();

  }
}

+ (BOOL)finishXPCActivity:(id)a3
{
  _xpc_activity_s *v3;
  _xpc_activity_s *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;

  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3)
  {
    v5 = xpc_activity_set_state(v3, 5);
    PLLogAppDeletion();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        +[PLAppDeletion finishXPCActivity:].cold.1();
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[PLSubmissions(XPCScheduling) finishXPCActivity:].cold.1();
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)deferXPCActivity:(id)a3
{
  _xpc_activity_s *v3;
  _xpc_activity_s *v4;
  NSObject *v5;
  BOOL v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 3)
    {
      PLLogAppDeletion();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        +[PLAppDeletion deferXPCActivity:].cold.1();
    }
    else
    {
      v7 = xpc_activity_set_state(v4, 3);
      PLLogAppDeletion();
      v5 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
      if (!v7)
      {
        if (v8)
          +[PLAppDeletion deferXPCActivity:].cold.3();
        v6 = 0;
        goto LABEL_13;
      }
      if (v8)
        +[PLAppDeletion deferXPCActivity:].cold.2();
    }
    v6 = 1;
LABEL_13:

    goto LABEL_14;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

+ (void)changePermissionsForFilesInDirectory:withProtectionLevel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "changePermissionsForFilesInDirectory failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__PLAppDeletion_changePermissionForDirectory_withProtectionLevel___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "changePermissionForDirectory failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)changeClassProtection:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "Invalid option %d for protection level ", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

+ (void)changeClassProtection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "FileProtection has been changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)changeClassProtection:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "Could not change permission for minor version folder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)changeClassProtection:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "Could not change permission for major version folder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)filePermissionCriteria
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Configuring File Permission criteria", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __47__PLAppDeletion_registerFilePermissionActivity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Activity state: not to run", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)handleFilePermissionXPCActivityCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Successfully completed changing class protection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)constructUpdateQueries
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "AppDeletion : updateQueries is %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)updateQuery:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "AppDeletion : failed to open db %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)deleteAppReferencesFromCompressedFiles:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)listOfFileNames, "objectForKeyedSubscript:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 1024;
  v8 = objc_msgSend(v4, "intValue");
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "Deferring activity after file %@ and processed %d", (uint8_t *)&v5, 0x12u);

}

+ (void)deleteAppReferencesFromCompressedFiles:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_DEBUG, "Could not set state to defer, continue", buf, 2u);
}

+ (void)deleteAppReferences:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "AppDeletion : Update queries empty, bail out from activity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)deleteAppReferences:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "AppDeletion : Notifying Accounting module to clear up cache references", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __44__PLAppDeletion_registerAppDeletionActivity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "AppDeletion : Activity state: not to run", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __44__PLAppDeletion_registerAppDeletionActivity__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "AppDeletion : State is being set to %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)handleAppDeletionXPCActivityCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "AppDeletion : Change to class B", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)handleAppDeletionXPCActivityCallback:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "AppDeletion : Successfully completed app deletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)handleAppDeletionXPCActivityCallback:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "AppDeletion : App Deletion Activity was deferred as there are still files to process", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)handleAppDeletionXPCActivityCallback:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "AppDeletion : Delete app references", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)finishXPCActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Set background state to done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)deferXPCActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Background state already in defer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)deferXPCActivity:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Set background state to defer %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)deferXPCActivity:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Failed to set background state to defer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
