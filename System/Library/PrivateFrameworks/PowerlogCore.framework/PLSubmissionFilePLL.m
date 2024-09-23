@implementation PLSubmissionFilePLL

- (PLSubmissionFilePLL)initWithConfig:(id)a3
{
  id v4;
  void *v5;
  PLSubmissionFilePLL *v6;
  objc_super v8;

  v4 = a3;
  if (!objc_msgSend(v4, "submitPLL"))
    goto LABEL_8;
  v8.receiver = self;
  v8.super_class = (Class)PLSubmissionFilePLL;
  self = -[PLSubmissionFile initWithConfig:](&v8, sel_initWithConfig_, v4);
  if (!self)
    goto LABEL_7;
  if (objc_msgSend(v4, "submitReasonType") == 4)
  {
    objc_msgSend(v4, "taskingType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionFilePLL setIsEnergyTasking:](self, "setIsEnergyTasking:", objc_msgSend(v5, "isEqualToString:", CFSTR("Energy")));

  }
  else
  {
    -[PLSubmissionFilePLL setIsEnergyTasking:](self, "setIsEnergyTasking:", 0);
  }
  if (-[PLSubmissionFilePLL copyAndPrepareLog](self, "copyAndPrepareLog"))
  {
LABEL_7:
    self = self;
    v6 = self;
  }
  else
  {
LABEL_8:
    v6 = 0;
  }

  return v6;
}

- (id)fileType
{
  return CFSTR("Powerlog");
}

- (id)fileExtension
{
  return CFSTR(".PLSQL.pll.anon");
}

- (void)logSubmissionSizeToAnalytics:(unint64_t)a3 withUncompressedSize:(unint64_t)a4
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFilePLL logSubmissionSizeToAnalytics:withUncompressedSize:].cold.1();
  AnalyticsSendEventLazy();
}

id __73__PLSubmissionFilePLL_logSubmissionSizeToAnalytics_withUncompressedSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("PowerlogCompressedSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("PowerlogUncompressedSize");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)copyAndPrepareLog
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
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
  uint64_t v28;
  void *v29;
  void *v30;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  PLLogSubmission();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v32) = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Preparing powerlog...", (uint8_t *)&v32, 2u);
  }

  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEnhancedTaskingAgent logAggregatedDataFromSignpostWithStartDate:withEndDate:](PLEnhancedTaskingAgent, "logAggregatedDataFromSignpostWithStartDate:withEndDate:", v5, v6);

  -[PLSubmissionFilePLL generateSubmissionTagForCurrentLog](self, "generateSubmissionTagForCurrentLog");
  objc_msgSend(v4, "getSubmitReasonTypeToFlushReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "submitReasonType") == 2)
    v9 = 5;
  else
    v9 = 60;

  PLLogSubmission();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFilePLL copyAndPrepareLog].cold.2();

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blockingFlushCachesWithReason:timeout:", v7, v9);

  -[PLSubmissionFile filePath](self, "filePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error no path provided!"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFilePLL.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFilePLL copyAndPrepareLog]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 109);

    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138412290;
      v33 = v16;
      _os_log_impl(&dword_1B6AB6000, v21, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v32, 0xCu);
    }
    goto LABEL_21;
  }
  -[PLSubmissionFile directory](self, "directory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PLSubmissionFile directory](self, "directory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", v15);

  }
  objc_msgSend(v4, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PLSubmissionFilePLL isEnergyTasking](self, "isEnergyTasking"))
  {
    objc_msgSend(v4, "cacheSize");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "cacheSize");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "integerValue");

      +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage allOperatorTablesToTrimConditionsForTrimDate:](PLCoreStorage, "allOperatorTablesToTrimConditionsForTrimDate:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v24) = objc_msgSend(v25, "copyDatabaseToPath:fromDate:toDate:withTableFilters:vacuumDB:withCacheSize:", v13, v16, 0, v26, 0, v24);

      if ((v24 & 1) != 0)
      {
LABEL_17:
        -[PLSubmissionFilePLL prepareDatabaseAtPath:](self, "prepareDatabaseAtPath:", v13);
        -[PLSubmissionFile decorateFile](self, "decorateFile");
        +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "clearTableHasTimestampColumnCache");

        v17 = 1;
        goto LABEL_22;
      }
    }
    else
    {
      v28 = +[PLUtilities SwitchToIncrementalVacuumEnabled](PLUtilities, "SwitchToIncrementalVacuumEnabled") ^ 1;
      +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage allOperatorTablesToTrimConditionsForTrimDate:](PLCoreStorage, "allOperatorTablesToTrimConditionsForTrimDate:", v16);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v28) = objc_msgSend(v29, "copyDatabaseToPath:fromDate:toDate:withTableFilters:vacuumDB:", v13, v16, 0, v30, v28);

      if ((v28 & 1) != 0)
        goto LABEL_17;
    }
    PLLogSubmission();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFilePLL copyAndPrepareLog].cold.1(v21);
LABEL_21:

    v17 = 0;
    goto LABEL_22;
  }
  v17 = -[PLSubmissionFilePLL copyLastArchiveToPath:](self, "copyLastArchiveToPath:", v13);
LABEL_22:

  return v17;
}

- (BOOL)prepareDatabaseAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PLSQLiteConnection *v12;
  BOOL v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v13 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v5, "cacheSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  objc_msgSend(v6, "removeEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hashEntries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trimmingQueries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PLSQLiteConnection initWithFilePath:]([PLSQLiteConnection alloc], "initWithFilePath:", v4);
  v13 = v12 != 0;
  if (v12)
  {
    v14 = -[PLSubmissionFilePLL updateSubmissionTagWithConnection:](self, "updateSubmissionTagWithConnection:", v12);
    objc_msgSend(v6, "removeEntries");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 || (objc_msgSend(v6, "hashEntries"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v6, "trimmingQueries");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
LABEL_20:
        -[PLSQLiteConnection closeConnection](v12, "closeConnection");
        goto LABEL_21;
      }
    }
    v27 = v6;
    -[PLSQLiteConnection dropTables:](v12, "dropTables:", v9);
    v26 = v10;
    -[PLSQLiteConnection hashEntryKeyKeys:](v12, "hashEntryKeyKeys:", v10);
    if (!+[PLUtilities SwitchToIncrementalVacuumEnabled](PLUtilities, "SwitchToIncrementalVacuumEnabled"))
      -[PLSQLiteConnection vacuum](v12, "vacuum");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v11;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
LABEL_10:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v20);
        if (+[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v4) <= v8)
          break;
        if (+[PLUtilities isValidString:](PLUtilities, "isValidString:", v21))
        {
          v22 = -[PLSQLiteConnection performQuery:](v12, "performQuery:", v21);
          if (!+[PLUtilities SwitchToIncrementalVacuumEnabled](PLUtilities, "SwitchToIncrementalVacuumEnabled"))-[PLSQLiteConnection vacuum](v12, "vacuum");
        }
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v18)
            goto LABEL_10;
          break;
        }
      }
    }

    v6 = v27;
    v11 = v25;
    v10 = v26;
    goto LABEL_20;
  }
LABEL_21:

LABEL_23:
  return v13;
}

- (void)generateSubmissionTagForCurrentLog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PLEntry *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t block;
  uint64_t v22;
  BOOL (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  PLEntry *v27;
  PLSubmissionFilePLL *v28;

  +[PLOperator entryKeyForType:andName:](PLStorageOperator, "entryKeyForType:andName:", CFSTR("EventForward"), CFSTR("SubmissionTag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEntryForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke;
    v26[3] = &unk_1E6A521A0;
    v9 = v6;
    v27 = v9;
    v28 = self;
    objc_msgSend(v8, "updateEntry:withBlock:", v9, v26);

    v10 = v27;
LABEL_3:

    goto LABEL_11;
  }
  v9 = -[PLEntry initWithEntryKey:]([PLEntry alloc], "initWithEntryKey:", v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntry setEntryDate:](v9, "setEntryDate:", v11);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntry setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, CFSTR("UUIDTag"));

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "writeEntry:withCompletionBlock:", v9, &__block_literal_global_44);

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v16 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke_2_39;
    v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    v25 = v16;
    if (generateSubmissionTagForCurrentLog_defaultOnce != -1)
      dispatch_once(&generateSubmissionTagForCurrentLog_defaultOnce, &block);
    if (generateSubmissionTagForCurrentLog_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("generateSubmissionTag CREATE (%@)\n"), v9, block, v22, v23, v24, v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFilePLL.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFilePLL generateSubmissionTagForCurrentLog]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v18, v19, 237);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      goto LABEL_3;
    }
  }
LABEL_11:

}

void __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v11;
  BOOL (*v12)(uint64_t);
  void *v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("UUIDTag"));

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke_2;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v4;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_7 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_7, &block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("generateSubmissionTag UPDATE (%@)\n"), *(_QWORD *)(a1 + 32), block, v11, v12, v13, v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFilePLL.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionFilePLL generateSubmissionTagForCurrentLog]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 230);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_7 = result;
  return result;
}

BOOL __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke_2_39(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  generateSubmissionTagForCurrentLog_classDebugEnabled = result;
  return result;
}

- (id)updateSubmissionTagWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSubmitReasonTypeToReasonLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 && v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFilePLL updateSubmissionTagWithConnection:].cold.1();

    objc_msgSend(v5, "tagUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLOperator entryKeyForType:andName:](PLStorageOperator, "entryKeyForType:andName:", CFSTR("EventForward"), CFSTR("SubmissionTag"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE %@ SET %@ = '%@', %@ = '%@'"), v8, CFSTR("Reason"), v6, CFSTR("UUIDTag"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v4, "performQuery:", v10);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFilePLL updateSubmissionTagWithConnection:].cold.2();
    v9 = 0;
  }

  return v9;
}

- (void)submit
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 1024;
  v9 = objc_msgSend(a1, "isEnergyTasking");
  OUTLINED_FUNCTION_8_4(&dword_1B6AB6000, a2, v5, "PLL upload file path = %@, isEnergyTasking = %d", (uint8_t *)&v6);

  OUTLINED_FUNCTION_8_3();
}

BOOL __29__PLSubmissionFilePLL_submit__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submit_classDebugEnabled_0 = result;
  return result;
}

id __29__PLSubmissionFilePLL_submit__block_invoke_83(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("reasonType");
  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "taskingConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithShort:", objc_msgSend(v2, "submitReasonType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)copyLastArchiveToPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL8 v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLArchiveManager lastArchivePath](PLArchiveManager, "lastArchivePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".gz"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "Copying last archive to %@...", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v9 = objc_msgSend(v8, "copyItemAtPath:toPath:error:", v5, v6, &v22);
  v10 = v22;

  -[PLSubmissionFilePLL emitCopyResult:](self, "emitCopyResult:", v9);
  PLLogSubmission();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFilePLL copyLastArchiveToPath:].cold.5();
    goto LABEL_17;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFilePLL copyLastArchiveToPath:].cold.4();

  v13 = +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:](PLUtilities, "decompressWithSource:withDestination:withRemoveSrc:", v6, v4, 1);
  -[PLSubmissionFilePLL emitDecompressionResult:](self, "emitDecompressionResult:", v13);
  if (!v13)
  {
    PLLogSubmission();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFilePLL copyLastArchiveToPath:].cold.3();

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileExistsAtPath:", v4);

  -[PLSubmissionFilePLL emitFileExists:](self, "emitFileExists:", v15);
  PLLogSubmission();
  v16 = objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFilePLL copyLastArchiveToPath:].cold.2((uint64_t)v4, v12);
LABEL_17:

LABEL_21:
    v19 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_1B6AB6000, v12, OS_LOG_TYPE_DEFAULT, "Successfully copied archived powerlog to %@!", buf, 0xCu);
  }

  v17 = -[PLSubmissionFilePLL prepareDatabaseAtPath:](self, "prepareDatabaseAtPath:", v4);
  -[PLSubmissionFilePLL emitPreparationResult:](self, "emitPreparationResult:", v17);
  if (!v17)
  {
    PLLogSubmission();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[PLSubmissionFilePLL copyLastArchiveToPath:].cold.1();

  }
  -[PLSubmissionFile decorateFile](self, "decorateFile");
  v19 = 1;
LABEL_22:

  return v19;
}

- (id)baseCADictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("TaskingRequest"));

  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "taskingType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("TaskingType"));

  -[PLSubmissionFile taskingConfig](self, "taskingConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("TaskingUUID"));

  return v3;
}

- (void)emitCopyResult:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[PLSubmissionFilePLL baseCADictionary](self, "baseCADictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("CopyResult"));

  v6 = v4;
  AnalyticsSendEventLazy();

}

id __38__PLSubmissionFilePLL_emitCopyResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)emitDecompressionResult:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[PLSubmissionFilePLL baseCADictionary](self, "baseCADictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("DecompressionResult"));

  v6 = v4;
  AnalyticsSendEventLazy();

}

id __47__PLSubmissionFilePLL_emitDecompressionResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)emitPreparationResult:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[PLSubmissionFilePLL baseCADictionary](self, "baseCADictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("PreparationResult"));

  v6 = v4;
  AnalyticsSendEventLazy();

}

id __45__PLSubmissionFilePLL_emitPreparationResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)emitFileExists:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[PLSubmissionFilePLL baseCADictionary](self, "baseCADictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("FileExists"));

  v6 = v4;
  AnalyticsSendEventLazy();

}

id __38__PLSubmissionFilePLL_emitFileExists___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isEnergyTasking
{
  return self->_isEnergyTasking;
}

- (void)setIsEnergyTasking:(BOOL)a3
{
  self->_isEnergyTasking = a3;
}

- (void)logSubmissionSizeToAnalytics:withUncompressedSize:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_7_1(&dword_1B6AB6000, MEMORY[0x1E0C81028], v0, "Compressed size %llu Uncompressed size %llu in MB", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyAndPrepareLog
{
  int v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  OUTLINED_FUNCTION_8_4(&dword_1B6AB6000, v1, (uint64_t)v1, "Flush cache for %@ with timeout %d", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateSubmissionTagWithConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Update submit reason to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateSubmissionTagWithConnection:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Cannot update submit reason to %@, connection = %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)copyLastArchiveToPath:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B6AB6000, v0, OS_LOG_TYPE_ERROR, "Failed to prepare PLL file %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyLastArchiveToPath:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 1024;
  v8 = objc_msgSend(v4, "fileExistsAtPath:", a1);
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "Expected file %@ not found after decompression! fileExists = %d", (uint8_t *)&v5, 0x12u);

  OUTLINED_FUNCTION_8_3();
}

- (void)copyLastArchiveToPath:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to decompress %@ with error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)copyLastArchiveToPath:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Decompressing archive %@...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyLastArchiveToPath:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to copy archived powerlog to %@ with error %@");
  OUTLINED_FUNCTION_1_0();
}

@end
