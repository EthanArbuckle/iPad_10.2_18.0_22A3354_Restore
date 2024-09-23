@implementation PLArchiveJob

- (PLArchiveJob)initWithManager:(id)a3 andArchiveEntry:(id)a4
{
  id v7;
  id v8;
  PLArchiveJob *v9;
  PLArchiveJob *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLArchiveJob;
  v9 = -[PLArchiveJob init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_manager, a3);
    objc_storeStrong((id *)&v10->_archiveEntry, a4);
    -[PLArchiveJob recover](v10, "recover");
  }

  return v10;
}

+ (id)storageQueue
{
  void *v2;
  void *v3;

  +[PLCoreStorage storageQueueNameForClass:](PLCoreStorage, "storageQueueNameForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setStage:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t block;
  uint64_t v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __25__PLArchiveJob_setStage___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (setStage__defaultOnce != -1)
      dispatch_once(&setStage__defaultOnce, &block);
    if (setStage__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLArchiveJob::setStage: stage=%i"), a3, block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveJob.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLArchiveJob setStage:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 45);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStage:", a3);

}

BOOL __25__PLArchiveJob_setStage___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setStage__classDebugEnabled = result;
  return result;
}

- (int64_t)stage
{
  void *v2;
  int64_t v3;

  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stage");

  return v3;
}

- (void)setNumAttempts:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t block;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __31__PLArchiveJob_setNumAttempts___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v5;
    if (setNumAttempts__defaultOnce != -1)
      dispatch_once(&setNumAttempts__defaultOnce, &block);
    if (setNumAttempts__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLArchiveJob::setNumAttempts: numAttempts=%i"), a3, block, v15, v16, v17, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveJob.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLArchiveJob setNumAttempts:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 53);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumAttempts:", a3);

  if (a3 >= 0xA)
  {
    -[PLArchiveJob manager](self, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLArchiveJob archiveEntry](self, "archiveEntry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailure:forArchiveEntry:", 1, v13);

  }
}

BOOL __31__PLArchiveJob_setNumAttempts___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setNumAttempts__classDebugEnabled = result;
  return result;
}

- (unint64_t)numAttempts
{
  void *v2;
  unint64_t v3;

  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numAttempts");

  return v3;
}

- (void)run
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  const char *v19;
  void *v20;
  int v21;
  uint64_t block;
  uint64_t v23;
  BOOL (*v24)(uint64_t);
  void *v25;
  uint64_t v26;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __19__PLArchiveJob_run__block_invoke;
    v25 = &__block_descriptor_40_e5_v8__0lu32l8;
    v26 = v3;
    if (run_defaultOnce != -1)
      dispatch_once(&run_defaultOnce, &block);
    if (run_classDebugEnabled)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[PLArchiveJob archiveEntry](self, "archiveEntry");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("PLArchiveJob::run: archive=%@"), v6, block, v23, v24, v25, v26);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveJob.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLArchiveJob run]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 67);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (-[PLArchiveJob stage](self, "stage") == -1)
    -[PLArchiveJob setStage:](self, "setStage:", 0);
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v13);
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMainDBSizeAtStart:", v14);

  -[PLArchiveJob setNumAttempts:](self, "setNumAttempts:", -[PLArchiveJob numAttempts](self, "numAttempts") + 1);
  -[PLArchiveJob startWatchdog](self, "startWatchdog");
  if (-[PLArchiveJob stage](self, "stage") <= 4)
  {
    do
    {
      -[PLArchiveJob manager](self, "manager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isInterrupted");

      if ((v17 & 1) != 0)
        break;
      v18 = (void *)MEMORY[0x1BCC9E9B4]();
      v19 = +[PLArchiveJob runSelectorForStage:](PLArchiveJob, "runSelectorForStage:", -[PLArchiveJob stage](self, "stage"));
      if (v19)
        ((void (*)(PLArchiveJob *, const char *))-[PLArchiveJob methodForSelector:](self, "methodForSelector:", v19))(self, v19);
      -[PLArchiveJob setStage:](self, "setStage:", -[PLArchiveJob stage](self, "stage") + 1);
      objc_autoreleasePoolPop(v18);
    }
    while (-[PLArchiveJob stage](self, "stage") < 5);
  }
  -[PLArchiveJob stopWatchdog](self, "stopWatchdog");
  -[PLArchiveJob manager](self, "manager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isInterrupted");

  if (v21)
    -[PLArchiveJob setNumAttempts:](self, "setNumAttempts:", -[PLArchiveJob numAttempts](self, "numAttempts") - 1);
}

BOOL __19__PLArchiveJob_run__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  run_classDebugEnabled = result;
  return result;
}

+ (SEL)runSelectorForStage:(int64_t)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  const char *v7;

  if (runSelectorForStage__once != -1)
    dispatch_once(&runSelectorForStage__once, &__block_literal_global_32);
  v4 = (void *)runSelectorForStage___stageToFunction;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = NSSelectorFromString(v6);
  else
    v7 = 0;

  return v7;
}

void __36__PLArchiveJob_runSelectorForStage___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v7[0] = &unk_1E6ABB048;
  NSStringFromSelector(sel_stageStart);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = &unk_1E6ABB060;
  NSStringFromSelector(sel_stageCopy);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = &unk_1E6ABB078;
  NSStringFromSelector(sel_stageTrim);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = &unk_1E6ABB090;
  NSStringFromSelector(sel_stageCompress);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = &unk_1E6ABB0A8;
  NSStringFromSelector(sel_stageRemove);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)runSelectorForStage___stageToFunction;
  runSelectorForStage___stageToFunction = v5;

}

- (void)stageCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PLSQLiteConnection *v8;
  void *v9;
  PLSQLiteConnection *v10;
  id v11;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "copyDatabaseToPath:", v7);

  v8 = [PLSQLiteConnection alloc];
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLSQLiteConnection initWithFilePath:](v8, "initWithFilePath:", v9);
  -[PLSQLiteConnection closeConnection](v10, "closeConnection");

}

- (void)stageTrim
{
  void *v3;
  void *v4;
  PLSQLiteConnection *v5;
  void *v6;
  void *v7;
  PLSQLiteConnection *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage allOperatorTablesToTrimConditionsForTrimDate:](PLCoreStorage, "allOperatorTablesToTrimConditionsForTrimDate:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [PLSQLiteConnection alloc];
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLSQLiteConnection initWithFilePath:](v5, "initWithFilePath:", v7);

  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSQLiteConnection trimAllTablesFromDate:toDate:withTableFilters:](v8, "trimAllTablesFromDate:toDate:withTableFilters:", v10, v12, v13);

  -[PLSQLiteConnection vacuum](v8, "vacuum");
  -[PLSQLiteConnection closeConnection](v8, "closeConnection");

}

- (void)stageCompress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  passwd *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compressedPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PLUtilities compressWithSource:withDestination:withLevel:](PLUtilities, "compressWithSource:withDestination:withLevel:", v4, v6, 4);

  if (v7)
  {
    +[PLUtilities runningAsUser](PLUtilities, "runningAsUser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("root"));

    if (!v9)
    {
      v10 = getpwnam("mobile");
      -[PLArchiveJob archiveEntry](self, "archiveEntry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "compressedPath");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      chown((const char *)objc_msgSend(v12, "fileSystemRepresentation"), v10->pw_uid, v10->pw_gid);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[PLArchiveJob archiveEntry](self, "archiveEntry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtPath:error:", v14, 0);

  }
}

- (void)stageRemove
{
  void *v3;
  _QWORD v4[5];

  +[PLArchiveJob storageQueue](PLArchiveJob, "storageQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__PLArchiveJob_stageRemove__block_invoke;
  v4[3] = &unk_1E6A52050;
  v4[4] = self;
  +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v3, v4);

}

void __27__PLArchiveJob_stageRemove__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "archiveEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage allOperatorTablesToTrimConditionsForTrimDate:](PLCoreStorage, "allOperatorTablesToTrimConditionsForTrimDate:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "archiveEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trimAllTablesFromDate:toDate:withTableFilters:", v8, 0, v9);

}

- (void)recover
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t block;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  v3 = +[PLArchiveJob recoverSelectorForStage:](PLArchiveJob, "recoverSelectorForStage:", -[PLArchiveJob stage](self, "stage"));
  if (v3)
  {
    v4 = v3;
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v5 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __23__PLArchiveJob_recover__block_invoke;
      v16 = &__block_descriptor_40_e5_v8__0lu32l8;
      v17 = v5;
      if (recover_defaultOnce != -1)
        dispatch_once(&recover_defaultOnce, &block);
      if (recover_classDebugEnabled)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = -[PLArchiveJob stage](self, "stage");
        objc_msgSend(v6, "stringWithFormat:", CFSTR("PLArchiveManager::recover for stage=%i"), v7, block, v14, v15, v16, v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLArchiveJob.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLArchiveJob recover]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 177);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    ((void (*)(PLArchiveJob *, const char *))-[PLArchiveJob methodForSelector:](self, "methodForSelector:", v4))(self, v4);
  }
}

BOOL __23__PLArchiveJob_recover__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  recover_classDebugEnabled = result;
  return result;
}

+ (SEL)recoverSelectorForStage:(int64_t)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  const char *v7;

  if (recoverSelectorForStage__once != -1)
    dispatch_once(&recoverSelectorForStage__once, &__block_literal_global_45);
  v4 = (void *)recoverSelectorForStage___stageToFunction;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = NSSelectorFromString(v6);
  else
    v7 = 0;

  return v7;
}

void __40__PLArchiveJob_recoverSelectorForStage___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = &unk_1E6ABB060;
  NSStringFromSelector(sel_recoverCopy);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = &unk_1E6ABB078;
  NSStringFromSelector(sel_recoverTrim);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = &unk_1E6ABB090;
  NSStringFromSelector(sel_recoverCompress);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)recoverSelectorForStage___stageToFunction;
  recoverSelectorForStage___stageToFunction = v3;

}

- (void)recoverCopy
{
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
  id v17;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v5, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("-shm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItemAtPath:error:", v9, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", CFSTR("-wal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeItemAtPath:error:", v13, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingString:", CFSTR("-journal"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeItemAtPath:error:", v16, 0);

}

- (void)recoverTrim
{
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
  id v14;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("-shm"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v6, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("-wal"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtPath:error:", v10, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingString:", CFSTR("-journal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeItemAtPath:error:", v13, 0);

}

- (void)recoverCompress
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLArchiveJob archiveEntry](self, "archiveEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "compressedPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v4, 0);

}

- (void)startWatchdog
{
  PLTimer *v3;
  void *v4;
  void *v5;
  PLTimer *v6;
  _QWORD v7[5];

  v3 = [PLTimer alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3600.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(17, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__PLArchiveJob_startWatchdog__block_invoke;
  v7[3] = &unk_1E6A535C0;
  v7[4] = self;
  v6 = -[PLTimer initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:](v3, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v4, 0, 0, v5, v7, 0.0, 0.0);
  -[PLArchiveJob setWatchdog:](self, "setWatchdog:", v6);

}

void __29__PLArchiveJob_startWatchdog__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "archiveEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailure:forArchiveEntry:", 0, v2);

}

- (void)stopWatchdog
{
  void *v3;
  void *v4;

  -[PLArchiveJob watchdog](self, "watchdog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimerActive:", 0);

  -[PLArchiveJob watchdog](self, "watchdog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[PLArchiveJob setWatchdog:](self, "setWatchdog:", 0);
}

- (PLArchiveJobManager)manager
{
  return (PLArchiveJobManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PLArchiveEntry)archiveEntry
{
  return (PLArchiveEntry *)objc_getProperty(self, a2, 16, 1);
}

- (void)setArchiveEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLTimer)watchdog
{
  return (PLTimer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWatchdog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_archiveEntry, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
