@implementation PLStorageCache

+ (id)sharedStorageCache
{
  if (sharedStorageCache_onceToken != -1)
    dispatch_once(&sharedStorageCache_onceToken, &__block_literal_global_7);
  return (id)sharedStorageCache_sharedStorageCache;
}

- (void)addToStagingAggregateEntryCache:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD block[4];
  __CFString *v19;
  uint64_t v20;

  v4 = a3;
  v5 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke;
    block[3] = &unk_1E6A52828;
    v19 = CFSTR("aggregate");
    v20 = objc_opt_class();
    if (addToStagingAggregateEntryCache__defaultOnce != -1)
      dispatch_once(&addToStagingAggregateEntryCache__defaultOnce, block);
    v7 = addToStagingAggregateEntryCache__classDebugEnabled;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateEntry=%@"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToStagingAggregateEntryCache:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 727);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLStorageCache stagingAggregateEntryCache](self, "stagingAggregateEntryCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_204;
  v16[3] = &unk_1E6A521A0;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v13, v14, v16);

}

- (NSMutableDictionary)stagingAggregateEntryCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)addToStagingEntryCache:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD block[5];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_11:
    v9 = -1;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "writeToDB") & 1) == 0)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v10 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v10;
      if (addToStagingEntryCache__defaultOnce != -1)
        dispatch_once(&addToStagingEntryCache__defaultOnce, block);
      if (addToStagingEntryCache__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("writeToDB=NO entry=%@"), v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToStagingEntryCache:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v13, v14, 396);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    goto LABEL_11;
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v6 = v5;
  v25 = v6;
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v21[5], "entryKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke_99;
  v17[3] = &unk_1E6A521C8;
  v17[4] = self;
  v18 = v6;
  v19 = &v20;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v7, v8, v17);

  v9 = objc_msgSend((id)v21[5], "entryID");
  _Block_object_dispose(&v20, 8);

LABEL_12:
  return v9;
}

+ (void)syncAndDispatchForEntryCache:(id)a3 forEntryKey:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a3;
  v8 = a5;
  +[PLCoreStorage storageQueueNameForEntryKey:](PLCoreStorage, "storageQueueNameForEntryKey:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PLStorageCache_syncAndDispatchForEntryCache_forEntryKey_withBlock___block_invoke;
  v13[3] = &unk_1E6A525F8;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v10, v13);

}

void __69__PLStorageCache_syncAndDispatchForEntryCache_forEntryKey_withBlock___block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_sync_exit(obj);

}

void __60__PLStorageCache_lastEntryCacheForEntryKey_withSubEntryKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "lastEntryCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  +[PLEntryDefinition subEntryKeyKeyForEntryKey:](PLEntryDefinition, "subEntryKeyKeyForEntryKey:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = v6;
    v7 = *(const __CFString **)(a1 + 48);
    if (!v7)
      v7 = CFSTR("__LastEntry__");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v6 = v11;
  }

}

void __54__PLStorageCache_stagingEntryCacheForEntryKey_withID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "stagingEntryCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __44__PLStorageCache_addToLastEntryCacheSubKey___block_invoke(uint64_t a1)
{
  void *v2;
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t block;
  uint64_t v33;
  BOOL (*v34)(uint64_t);
  void *v35;
  uint64_t v36;

  objc_msgSend(*(id *)(a1 + 32), "subEntryKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastEntryCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "entryKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 40), "lastEntryCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "entryKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    }
    objc_msgSend(*(id *)(a1 + 40), "lastEntryCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "entryKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "subEntryKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "entryID");
    if (v14 <= objc_msgSend(*(id *)(a1 + 32), "entryID"))
    {
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "lastEntryCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "entryKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "subEntryKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v19);

      v20 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v33 = 3221225472;
      v34 = __44__PLStorageCache_addToLastEntryCacheSubKey___block_invoke_2;
      v35 = &__block_descriptor_40_e5_v8__0lu32l8;
      v36 = v20;
      if (ArrayReserved_block_invoke_defaultOnce != -1)
        dispatch_once(&ArrayReserved_block_invoke_defaultOnce, &block);
      if (ArrayReserved_block_invoke_classDebugEnabled)
      {
        objc_msgSend(*(id *)(a1 + 32), "entryKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("PLStorageOperator_EventPoint_PLLog"));

        if ((v22 & 1) == 0)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 32), "entryKey");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "subEntryKey");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(*(id *)(a1 + 32), "entryID");
          objc_msgSend(v23, "stringWithFormat:", CFSTR("LastEntryCache added %@.%@ %lld"), v24, v25, v26, block, v33, v34, v35, v36);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "lastPathComponent");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToLastEntryCacheSubKey:]_block_invoke");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v29, v30, 196);

          PLLogCommon();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
    }
    if (!v13)
      objc_msgSend(*(id *)(a1 + 40), "setLastEntryCacheSize:", objc_msgSend(*(id *)(a1 + 40), "lastEntryCacheSize") + 1);

  }
}

- (void)insertIntoStagingEntryCache:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t block;
  uint64_t v34;
  BOOL (*v35)(uint64_t);
  void *v36;
  __CFString *v37;
  _QWORD v38[5];

  v4 = a3;
  if (v4)
  {
    v5 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    v6 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __46__PLStorageCache_insertIntoStagingEntryCache___block_invoke;
      v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v38[4] = objc_opt_class();
      if (insertIntoStagingEntryCache__defaultOnce != -1)
        dispatch_once(&insertIntoStagingEntryCache__defaultOnce, v38);
      if (insertIntoStagingEntryCache__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry=%@"), v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache insertIntoStagingEntryCache:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 435);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    }
    -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v4, "entryID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v4, v21);

    -[PLStorageCache setStagingEntryCacheSize:](self, "setStagingEntryCacheSize:", -[PLStorageCache stagingEntryCacheSize](self, "stagingEntryCacheSize") + 1);
    block = v6;
    v34 = 3221225472;
    v35 = __46__PLStorageCache_insertIntoStagingEntryCache___block_invoke_123;
    v36 = &unk_1E6A52050;
    v37 = CFSTR("PLStorageCache_Debug");
    if (insertIntoStagingEntryCache__defaultOnce_122 != -1)
      dispatch_once(&insertIntoStagingEntryCache__defaultOnce_122, &block);
    v22 = insertIntoStagingEntryCache__objectForKey;

    if (v22)
    {
      objc_msgSend(v4, "entryKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("PLStorageOperator_EventPoint_PLLog"));

      if ((v24 & 1) == 0)
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "entryKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v4, "entryID");
        objc_msgSend(v25, "stringWithFormat:", CFSTR("stagingCache added %@ %lld"), v26, v27, block, v34, v35, v36);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache insertIntoStagingEntryCache:]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v30, v31, 447);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
  }

}

- (NSMutableDictionary)stagingEntryCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)stagingEntryCacheSize
{
  return self->_stagingEntryCacheSize;
}

void __38__PLStorageCache_addToLastEntryCache___block_invoke(uint64_t a1)
{
  void *v2;
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  BOOL (*v43)(uint64_t);
  void *v44;
  uint64_t v45;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "subEntryKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "lastEntryCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "entryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 40), "lastEntryCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "entryKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    }
    objc_msgSend(*(id *)(a1 + 40), "lastEntryCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "entryKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("__LastEntry__"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v6, "entryID");
    if (v13 <= objc_msgSend(*(id *)(a1 + 32), "entryID"))
    {
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "lastEntryCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "entryKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("__LastEntry__"));

      v18 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PLStorageCache_addToLastEntryCache___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v18;
      if (ArrayReserved_block_invoke_2_defaultOnce != -1)
        dispatch_once(&ArrayReserved_block_invoke_2_defaultOnce, block);
      if (ArrayReserved_block_invoke_2_classDebugEnabled)
      {
        objc_msgSend(*(id *)(a1 + 32), "entryKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("PLStorageOperator_EventPoint_PLLog"));

        if ((v20 & 1) == 0)
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 32), "entryKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("LastEntryCache added %@ %lld"), v22, objc_msgSend(*(id *)(a1 + 32), "entryID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToLastEntryCache:]_block_invoke");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v25, v26, 216);

          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_18:

        }
      }
    }
  }
  else
  {

    v28 = objc_msgSend(v6, "entryID");
    if (v28 <= objc_msgSend(*(id *)(a1 + 32), "entryID"))
    {
      v29 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "lastEntryCache");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "entryKey");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v31);

      v32 = objc_opt_class();
      v41 = MEMORY[0x1E0C809B0];
      v42 = 3221225472;
      v43 = __38__PLStorageCache_addToLastEntryCache___block_invoke_68;
      v44 = &__block_descriptor_40_e5_v8__0lu32l8;
      v45 = v32;
      if (ArrayReserved_block_invoke_2_defaultOnce_66 != -1)
        dispatch_once(&ArrayReserved_block_invoke_2_defaultOnce_66, &v41);
      if (ArrayReserved_block_invoke_2_classDebugEnabled_67)
      {
        objc_msgSend(*(id *)(a1 + 32), "entryKey");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("PLStorageOperator_EventPoint_PLLog"));

        if ((v34 & 1) == 0)
        {
          v35 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 32), "entryKey");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(*(id *)(a1 + 32), "entryID");
          objc_msgSend(v35, "stringWithFormat:", CFSTR("LastEntryCache added %@ %lld"), v36, v37, v41, v42, v43, v44, v45);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "lastPathComponent");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToLastEntryCache:]_block_invoke_2");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v39, v40, 227);

          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
          goto LABEL_18;
        }
      }
    }
  }
  if (!v6)
    objc_msgSend(*(id *)(a1 + 40), "setLastEntryCacheSize:", objc_msgSend(*(id *)(a1 + 40), "lastEntryCacheSize") + 1);

}

- (NSMutableDictionary)lastEntryCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStagingEntryCacheSize:(int64_t)a3
{
  self->_stagingEntryCacheSize = a3;
}

- (void)addToLastEntryCacheSubKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLStorageCache *v10;

  v4 = a3;
  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PLStorageCache_addToLastEntryCacheSubKey___block_invoke;
  v8[3] = &unk_1E6A521A0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v5, v6, v8);

}

- (void)addToLastEntryCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLStorageCache *v10;

  v4 = a3;
  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PLStorageCache_addToLastEntryCache___block_invoke;
  v8[3] = &unk_1E6A521A0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v5, v6, v8);

}

- (id)stagingEntryCacheForEntryKey:(id)a3 withID:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__PLStorageCache_stagingEntryCacheForEntryKey_withID___block_invoke;
  v11[3] = &unk_1E6A526E8;
  v13 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = a4;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v7, v8, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (int64_t)entryIDForNewEntry:(id)a3
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
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  int64_t v52;
  void *v54;
  void *v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD block[6];

  v4 = a3;
  objc_msgSend(v4, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLStorageCache lastEntryCacheForEntryKey:](self, "lastEntryCacheForEntryKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PLStorageCache_entryIDForNewEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (entryIDForNewEntry__defaultOnce != -1)
      dispatch_once(&entryIDForNewEntry__defaultOnce, block);
    if (entryIDForNewEntry__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastEntry=%@"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache entryIDForNewEntry:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 366);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v8 = MEMORY[0x1E0C809B0];
    }
  }
  if (!v6)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "entryKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("SELECT seq + 1 AS nextSeq FROM SQLITE_SEQUENCE where name='%@';"),
      v23);
    v24 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "entryKey");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLStorageCache connectionForKey:](self, "connectionForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)v24;
    objc_msgSend(v26, "performQuery:", v24);
    v21 = objc_claimAutoreleasedReturnValue();

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v57[0] = v8;
      v57[1] = 3221225472;
      v57[2] = __37__PLStorageCache_entryIDForNewEntry___block_invoke_79;
      v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v57[4] = objc_opt_class();
      if (entryIDForNewEntry__defaultOnce_77 != -1)
        dispatch_once(&entryIDForNewEntry__defaultOnce_77, v57);
      if (entryIDForNewEntry__classDebugEnabled_78)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("result=%@"), v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastPathComponent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache entryIDForNewEntry:]");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v29, v30, 370);

        PLLogCommon();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    -[NSObject lastObject](v21, "lastObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("nextSeq"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v33, "longLongValue");

    v6 = 0;
    if ((unint64_t)v14 <= 1 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "entryKey");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("failed entryID Query! %@ %@"), v35, v21);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache entryIDForNewEntry:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v37, v38, 373);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
    goto LABEL_26;
  }
  v14 = objc_msgSend(v6, "entryID") + 1;
  if ((unint64_t)v14 <= 1 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "entryKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("failed entryID cache! %@"), v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache entryIDForNewEntry:]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 377);

    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v17;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
    v8 = MEMORY[0x1E0C809B0];
LABEL_26:

  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v56[0] = v8;
    v56[1] = 3221225472;
    v56[2] = __37__PLStorageCache_entryIDForNewEntry___block_invoke_90;
    v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v56[4] = objc_opt_class();
    if (entryIDForNewEntry__defaultOnce_88 != -1)
      dispatch_once(&entryIDForNewEntry__defaultOnce_88, v56);
    if (entryIDForNewEntry__classDebugEnabled_89)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("before MAX(): entryID=%llu"), v14);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastPathComponent");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache entryIDForNewEntry:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v42, v43, 380);

      PLLogCommon();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (v14 <= 1 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v45 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "entryKey");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", CFSTR("EntryID is 1! %@"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "lastPathComponent");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache entryIDForNewEntry:]");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v49, v50, 383);

    PLLogCommon();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  if (v14 <= 1)
    v52 = 1;
  else
    v52 = v14;

  return v52;
}

- (id)lastEntryCacheForEntryKey:(id)a3 withSubEntryKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__PLStorageCache_lastEntryCacheForEntryKey_withSubEntryKey___block_invoke;
  v13[3] = &unk_1E6A52698;
  v16 = &v17;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v8, v9, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)lastEntryCacheForEntryKey:(id)a3
{
  return -[PLStorageCache lastEntryCacheForEntryKey:withSubEntryKey:](self, "lastEntryCacheForEntryKey:withSubEntryKey:", a3, 0);
}

- (void)setLastEntryCacheSize:(int64_t)a3
{
  self->_lastEntryCacheSize = a3;
}

- (int64_t)lastEntryCacheSize
{
  return self->_lastEntryCacheSize;
}

void __75__PLStorageCache_stagingEntryCacheForEntryKey_withComparisons_isSingleton___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  char v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PLStorageCache_stagingEntryCacheForEntryKey_withComparisons_isSingleton___block_invoke_2;
  v4[3] = &unk_1E6A52760;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v2, "enumerateStagingEntryCacheForEntryKey:withBlock:", v3, v4);

}

void __50__PLStorageCache_stagingEntryCacheIDsForEntryKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
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
  objc_msgSend(*(id *)(a1 + 32), "stagingEntryCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
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
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "entryID", (_QWORD)v12));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)enumerateStagingEntryCacheForEntryKey:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLStorageCache enumerateEntryCache:withBlock:](self, "enumerateEntryCache:withBlock:", v8, v6);
}

- (void)enumerateEntryCache:(id)a3 withBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unsigned __int8 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, _BYTE *))a4;
  v20 = 0;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v9);
      objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v14, &v20);
      v15 = v20;

      if (v15)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", *(_QWORD *)(a1 + 32));

  if (v6 == -1)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (void)flushStagingAggregateEntryCacheToDatabase
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id obj;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  _QWORD block[4];
  __CFString *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  __CFString *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[PLStorageCache stagingAggregateEntryCache](self, "stagingAggregateEntryCache");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[PLStorageCache stagingAggregateEntryCache](self, "stagingAggregateEntryCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v3;
  v31 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v48;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v48 != v30)
          objc_enumerationMutation(v29);
        v35 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v32);
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v4 = objc_opt_class();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __59__PLStorageCache_flushStagingAggregateEntryCacheToDatabase__block_invoke;
          v44[3] = &unk_1E6A52828;
          v45 = CFSTR("aggregate");
          v46 = v4;
          if (flushStagingAggregateEntryCacheToDatabase_defaultOnce != -1)
            dispatch_once(&flushStagingAggregateEntryCacheToDatabase_defaultOnce, v44);
          v5 = flushStagingAggregateEntryCacheToDatabase_classDebugEnabled == 0;

          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entryKey=%@"), v35);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "lastPathComponent");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingAggregateEntryCacheToDatabase]");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 711);

            PLLogCommon();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v6;
              _os_log_debug_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        -[PLStorageCache connectionForKey:](self, "connectionForKey:", v35);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        -[PLStorageCache stagingAggregateEntryCache](self, "stagingAggregateEntryCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v35);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allKeys");
        v33 = (id)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v41;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v41 != v14)
                objc_enumerationMutation(v33);
              v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v15);
              v17 = (void *)MEMORY[0x1BCC9E9B4]();
              if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
              {
                v18 = objc_opt_class();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __59__PLStorageCache_flushStagingAggregateEntryCacheToDatabase__block_invoke_199;
                block[3] = &unk_1E6A52828;
                v38 = CFSTR("aggregate");
                v39 = v18;
                if (flushStagingAggregateEntryCacheToDatabase_defaultOnce_197 != -1)
                  dispatch_once(&flushStagingAggregateEntryCacheToDatabase_defaultOnce_197, block);
                v19 = flushStagingAggregateEntryCacheToDatabase_classDebugEnabled_198 == 0;

                if (!v19)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("matchingKeyToValue=%@"), v16);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "lastPathComponent");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingAggregateEntryCacheToDatabase]");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v22, v23, 716);

                  PLLogCommon();
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v53 = v20;
                    _os_log_debug_impl(&dword_1B6AB6000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                }
              }
              -[PLStorageCache getQueryForAggregateEntryKey:withMatchingKeyToValue:](self, "getQueryForAggregateEntryKey:withMatchingKeyToValue:", v35, v16);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (id)objc_msgSend(v34, "performQuery:", v25);

              objc_autoreleasePoolPop(v17);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
          }
          while (v13);
        }

        -[PLStorageCache stagingAggregateEntryCache](self, "stagingAggregateEntryCache");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "removeObjectForKey:", v35);

        ++v32;
      }
      while (v32 != v31);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v31);
  }

  objc_sync_exit(obj);
}

- (id)getEntryFromDBForEntryKey:(id)a3 withMatchingKeyToValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[PLStorageCache matchingPairs:](self, "matchingPairs:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM '%@' WHERE %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLStorageCache connectionForKey:](self, "connectionForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performQuery:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntry entryWithEntryKey:withData:](PLEntry, "entryWithEntryKey:withData:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)matchingPairs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), v10, v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" AND "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getQueryForAggregateEntryKey:(id)a3 withMatchingKeyToValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _UNKNOWN **v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  PLStorageCache *v57;
  id obj;
  uint64_t v59;
  _QWORD block[4];
  __CFString *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v57 = self;
  -[PLStorageCache getEntryFromDBForEntryKey:withMatchingKeyToValue:](self, "getEntryFromDBForEntryKey:withMatchingKeyToValue:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ID"));
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("NULL");
  }
  objc_msgSend(v9, "addObject:", CFSTR("ID"));
  v52 = (__CFString *)v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

  objc_msgSend(v7, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v14);

  objc_msgSend(v7, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v16);

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[PLStorageCache stagingAggregateEntryCache](v57, "stagingAggregateEntryCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v6;
  objc_msgSend(v17, "objectForKeyedSubscript:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v7;
  objc_msgSend(v18, "objectForKeyedSubscript:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0x1E0CB3000uLL;
  obj = v20;
  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v22)
  {
    v23 = v22;
    v24 = &off_1E6A51000;
    v59 = *(_QWORD *)v64;
    v55 = v8;
    do
    {
      v25 = 0;
      v56 = v23;
      do
      {
        if (*(_QWORD *)v64 != v59)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v25);
        if (objc_msgSend(v24[28], "debugEnabled"))
        {
          v27 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __70__PLStorageCache_getQueryForAggregateEntryKey_withMatchingKeyToValue___block_invoke;
          block[3] = &unk_1E6A52828;
          v61 = CFSTR("aggregate");
          v62 = v27;
          if (getQueryForAggregateEntryKey_withMatchingKeyToValue__defaultOnce != -1)
            dispatch_once(&getQueryForAggregateEntryKey_withMatchingKeyToValue__defaultOnce, block);
          v28 = getQueryForAggregateEntryKey_withMatchingKeyToValue__classDebugEnabled;

          if (v28)
          {
            v29 = v10;
            v30 = v9;
            objc_msgSend(*(id *)(v21 + 2368), "stringWithFormat:", CFSTR("aggregateEntry=%@"), v26);
            v31 = v21;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v31 + 2368), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "lastPathComponent");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v31;
            objc_msgSend(*(id *)(v31 + 2368), "stringWithUTF8String:", "-[PLStorageCache getQueryForAggregateEntryKey:withMatchingKeyToValue:]");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v34, v36, 777);

            PLLogCommon();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v68 = v32;
              _os_log_debug_impl(&dword_1B6AB6000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v9 = v30;
            v10 = v29;
            v21 = v35;
            v8 = v55;
            v23 = v56;
            v24 = &off_1E6A51000;
          }
        }
        if (v8)
        {
          objc_msgSend(v26, "aggregateKey");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(v26, "aggregateKey");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "doubleValue");
            objc_msgSend(v26, "updateWithValue:");

          }
        }
        objc_msgSend(v26, "aggregateKey");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v42);

        v43 = *(void **)(v21 + 2368);
        objc_msgSend(v26, "aggregateValue");
        objc_msgSend(v43, "stringWithFormat:", CFSTR("%f"), v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v45);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v23);
  }

  v46 = *(void **)(v21 + 2368);
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v47 = v10;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "componentsJoinedByString:", CFSTR(", "));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringWithFormat:", CFSTR("                          INSERT OR REPLACE INTO '%@'                           (%@)                           VALUES (%@);"),
    v54,
    v48,
    v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

void __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  double v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  unsigned __int16 v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  __CFString *v65;
  BOOL v66;
  BOOL v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *context;
  void *v83;
  void *v84;
  uint64_t v85;
  _QWORD v86[4];
  __CFString *v87;
  uint64_t v88;
  _QWORD block[4];
  __CFString *v90;
  uint64_t v91;
  _QWORD v92[5];
  id v93;
  id v94;
  id v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  unsigned __int16 v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  int v108;
  _QWORD v109[5];
  _QWORD v110[5];
  _QWORD v111[5];
  _QWORD v112[5];
  _QWORD v113[7];
  _QWORD v114[9];

  v114[7] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  context = (void *)MEMORY[0x1BCC9E9B4]();
  v85 = a1;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v7 = objc_opt_class();
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_3;
    v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v112[4] = v7;
    if (ArrayReserved_block_invoke_4_defaultOnce != -1)
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce, v112);
    if (ArrayReserved_block_invoke_4_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entryKey=%@"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 520);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v14 = *(void **)(a1 + 32);
  v13 = (id *)(a1 + 32);
  objc_msgSend(v14, "connectionForKey:", v5);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v13, "countWarnings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  v18 = objc_msgSend(*v13, "limitOfType:forEntryKey:", CFSTR("WarningLimit"), v5);
  v19 = v18;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v85 + 40) + 8) + 24))
  {
    v33 = 4 * (v17 >= v18);
    goto LABEL_35;
  }
  v20 = objc_msgSend(v6, "count");
  v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(v85 + 48) + 8) + 24);
  v22 = objc_msgSend(*(id *)(v85 + 32), "limitOfType:forEntryKey:", CFSTR("RateLimit"), v5);
  objc_msgSend(*(id *)(v85 + 32), "countSafetyDrop");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "intValue");

  v26 = objc_msgSend(*(id *)(v85 + 32), "limitOfType:forEntryKey:", CFSTR("SafetyDropLimit"), v5);
  if ((double)v20 / v21 > (double)v22)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v27 = objc_opt_class();
      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_144;
      v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v111[4] = v27;
      if (ArrayReserved_block_invoke_4_defaultOnce_142 != -1)
        dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_142, v111);
      if (ArrayReserved_block_invoke_4_classDebugEnabled_143)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rate exceeds threshold"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v30, v31, 538);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if (v17 < v19)
      v33 = 1;
    else
      v33 = 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v17 + 1));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v85 + 32), "countWarnings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v5);

    objc_msgSend(*(id *)(v85 + 32), "countSafetyDrop");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeObjectForKey:", v5);

    goto LABEL_35;
  }
  v37 = v26;
  objc_msgSend(*(id *)(v85 + 32), "countWarnings");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39 || v17 <= v19)
  {

    goto LABEL_34;
  }

  if (v25 >= v37)
  {
LABEL_34:
    objc_msgSend(*(id *)(v85 + 32), "countWarnings");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "removeObjectForKey:", v5);

    objc_msgSend(*(id *)(v85 + 32), "countSafetyDrop");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "removeObjectForKey:", v5);

    v33 = 0;
    goto LABEL_35;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v40 = objc_opt_class();
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_149;
    v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v110[4] = v40;
    if (ArrayReserved_block_invoke_4_defaultOnce_147 != -1)
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_147, v110);
    if (ArrayReserved_block_invoke_4_classDebugEnabled_148)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("safety drop"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v43, v44, 556);

      PLLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v25 + 1));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v85 + 32), "countSafetyDrop");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v5);

  v33 = 3;
LABEL_35:
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v50 = objc_opt_class();
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_154;
    v109[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v109[4] = v50;
    if (ArrayReserved_block_invoke_4_defaultOnce_152 != -1)
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_152, v109);
    if (ArrayReserved_block_invoke_4_classDebugEnabled_153)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("state=%i"), v33);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "lastPathComponent");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v53, v54, 573);

      PLLogCommon();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v105 = 0;
  v106 = &v105;
  v107 = 0x2020000000;
  v108 = 0;
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  v104 = 0;
  v56 = *(void **)(v85 + 32);
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_157;
  v92[3] = &unk_1E6A52800;
  v92[4] = v56;
  v96 = &v101;
  v57 = v83;
  v93 = v57;
  v100 = v33;
  v58 = *(_QWORD *)(v85 + 40);
  v97 = &v105;
  v98 = v58;
  v59 = v6;
  v94 = v59;
  v60 = v5;
  v61 = *(_QWORD *)(v85 + 56);
  v95 = v60;
  v99 = v61;
  objc_msgSend(v56, "enumerateEntryCache:withBlock:", v59, v92);
  v62 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_184;
  block[3] = &unk_1E6A52828;
  v90 = CFSTR("LogCacheSize");
  v91 = v62;
  if (ArrayReserved_block_invoke_4_defaultOnce_182 != -1)
    dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_182, block);
  v63 = ArrayReserved_block_invoke_4_classDebugEnabled_183 == 0;

  if (!v63)
  {
    v64 = objc_opt_class();
    v65 = CFSTR("RateLimit");
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2_188;
    v86[3] = &unk_1E6A52828;
    v87 = v65;
    v88 = v64;
    if (ArrayReserved_block_invoke_4_defaultOnce_186 != -1)
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_186, v86);
    v66 = ArrayReserved_block_invoke_4_classDebugEnabled_187 != 0;

    v67 = !v66;
    if (v33 >= 2u)
      v67 = 0;
    if (!v67)
    {
      objc_msgSend(*(id *)(v85 + 32), "countWarnings");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", v60);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "intValue");

      objc_msgSend(*(id *)(v85 + 32), "countSafetyDrop");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectForKeyedSubscript:", v60);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "intValue");

      v74 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v85 + 64) + 8) + 40);
      v113[0] = CFSTR("timestampEnd");
      v113[1] = CFSTR("EntryKey");
      v114[0] = v74;
      v114[1] = v60;
      v113[2] = CFSTR("InsertCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v106 + 6));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v114[2] = v84;
      v113[3] = CFSTR("UpdateCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v102 + 6));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v114[3] = v75;
      v113[4] = CFSTR("State");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)v33);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v114[4] = v76;
      v113[5] = CFSTR("WarningCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v70);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v114[5] = v77;
      v113[6] = CFSTR("SafetyDropCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v73);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v114[6] = v78;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 7);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v85 + 32), "lastCacheFlushDate");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLStorageOperator eventIntervalCacheSizeWithPayload:withEntryDate:](PLStorageOperator, "eventIntervalCacheSizeWithPayload:withEntryDate:", v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v81, "setEntryID:", 0x8000000000000000);
      objc_msgSend(v57, "writeEntry:", v81);

    }
  }

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);

  objc_autoreleasePoolPop(context);
}

- (int)limitOfType:(id)a3 forEntryKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v5 = a3;
  v6 = a4;
  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v7, "objectForKeyedSubscript:", v5),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

  }
  else
  {
    v10 = +[PLEntryDefinition limitOfType:forEntryKey:](PLEntryDefinition, "limitOfType:forEntryKey:", v5, v6);
  }

  return v10;
}

- (NSMutableDictionary)countWarnings
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableDictionary)countSafetyDrop
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (id)connectionForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3))
  {
    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectionForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)updateStagingEntryCacheWithEntry:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[7];
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v8 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (updateStagingEntryCacheWithEntry_withBlock__defaultOnce != -1)
        dispatch_once(&updateStagingEntryCacheWithEntry_withBlock__defaultOnce, block);
      if (updateStagingEntryCacheWithEntry_withBlock__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry=%@"), v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache updateStagingEntryCacheWithEntry:withBlock:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 454);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if ((objc_msgSend(v6, "writeToDB") & 1) != 0)
    {
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__3;
      v26[4] = __Block_byref_object_dispose__3;
      v14 = v6;
      v27 = v14;
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = __Block_byref_object_copy__129;
      v24[4] = __Block_byref_object_dispose__130;
      v25 = (id)MEMORY[0x1BCC9EB70](v7);
      -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "entryKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke_131;
      v23[3] = &unk_1E6A527B0;
      v23[4] = self;
      v23[5] = v24;
      v23[6] = v26;
      +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v15, v16, v23);

      _Block_object_dispose(v24, 8);
      _Block_object_dispose(v26, 8);

    }
    else if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v17 = objc_opt_class();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke_128;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v17;
      if (updateStagingEntryCacheWithEntry_withBlock__defaultOnce_126 != -1)
        dispatch_once(&updateStagingEntryCacheWithEntry_withBlock__defaultOnce_126, v28);
      if (updateStagingEntryCacheWithEntry_withBlock__classDebugEnabled_127)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("writeToDB=NO entry=%@"), v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache updateStagingEntryCacheWithEntry:withBlock:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 457);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
  }

}

- (void)lastEntryCachePruneToDate:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD block[5];

  v4 = a3;
  v5 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (lastEntryCachePruneToDate__defaultOnce != -1)
      dispatch_once(&lastEntryCachePruneToDate__defaultOnce, block);
    if (lastEntryCachePruneToDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin: date=%@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache lastEntryCachePruneToDate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 157);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v26[0] = v6;
    v26[1] = 3221225472;
    v26[2] = __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_50;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = objc_opt_class();
    if (lastEntryCachePruneToDate__defaultOnce_48 != -1)
      dispatch_once(&lastEntryCachePruneToDate__defaultOnce_48, v26);
    if (lastEntryCachePruneToDate__classDebugEnabled_49)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("in @synchronized: date=%@"), v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache lastEntryCachePruneToDate:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 160);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v18 = (void *)objc_opt_new();
  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_54;
  v23[3] = &unk_1E6A52670;
  v20 = v4;
  v24 = v20;
  v21 = v18;
  v25 = v21;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v23);

  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectsForKeys:", v21);

  objc_sync_exit(v12);
}

- (void)flushStagingEntryCacheToDatabase
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  id obj;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[9];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD block[4];
  __CFString *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  BOOL v62;
  _QWORD v63[3];
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[5];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke;
    v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v71[4] = v3;
    if (flushStagingEntryCacheToDatabase_defaultOnce != -1)
      dispatch_once(&flushStagingEntryCacheToDatabase_defaultOnce, v71);
    if (flushStagingEntryCacheToDatabase_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flushStagingEntryCacheToDatabase: start"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 504);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__3;
  v69 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v64 = 0;
  v9 = (void *)v66[5];
  -[PLStorageCache lastCacheFlushDate](self, "lastCacheFlushDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  v64 = v12;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v13 = -[PLStorageCache stagingEntryCacheSize](self, "stagingEntryCacheSize");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_139;
  block[3] = &unk_1E6A527D8;
  v57 = CFSTR("MinCacheSizeLimit");
  v58 = 200;
  if (flushStagingEntryCacheToDatabase_defaultOnce_138 != -1)
    dispatch_once(&flushStagingEntryCacheToDatabase_defaultOnce_138, block);
  v14 = flushStagingEntryCacheToDatabase_objectForKey;

  v62 = v13 >= v14;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__3;
  v54 = __Block_byref_object_dispose__3;
  v55 = 0;
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v15 = objc_opt_new();
    v16 = (void *)v51[5];
    v51[5] = v15;

  }
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v42);
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2;
  v49[3] = &unk_1E6A52850;
  v49[4] = self;
  v49[5] = &v59;
  v49[6] = v63;
  v49[7] = &v50;
  v49[8] = &v65;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v49);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[PLStorageCache countWarnings](self, "countWarnings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v72, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          -[PLStorageCache countWarnings](self, "countWarnings");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "intValue");

          LODWORD(v25) = -[PLStorageCache limitOfType:forEntryKey:](self, "limitOfType:forEntryKey:", CFSTR("WarningLimit"), v22);
          -[PLStorageCache countSafetyDrop](self, "countSafetyDrop");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "intValue");

          v31 = -[PLStorageCache limitOfType:forEntryKey:](self, "limitOfType:forEntryKey:", CFSTR("SafetyDropLimit"), v22);
          if (v27 >= (int)v25)
          {
            if (v30 < v31)
            {
              if (!*((_BYTE *)v60 + 24))
                continue;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v30 + 1));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLStorageCache countSafetyDrop](self, "countSafetyDrop");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, v22);

              goto LABEL_24;
            }
            if (!*((_BYTE *)v60 + 24))
              continue;
          }
          -[PLStorageCache countSafetyDrop](self, "countSafetyDrop");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "removeObjectForKey:", v22);

          -[PLStorageCache countWarnings](self, "countWarnings");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "removeObjectForKey:", v22);
LABEL_24:

          continue;
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v72, 16);
    }
    while (v19);
  }

  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeAllObjects");

  -[PLStorageCache setStagingEntryCacheSize:](self, "setStagingEntryCacheSize:", 0);
  objc_sync_exit(v42);

  -[PLStorageCache setLastCacheFlushDate:](self, "setLastCacheFlushDate:", v66[5]);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v36 = objc_opt_class();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_3_192;
    v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v44[4] = v36;
    if (flushStagingEntryCacheToDatabase_defaultOnce_190 != -1)
      dispatch_once(&flushStagingEntryCacheToDatabase_defaultOnce_190, v44);
    if (flushStagingEntryCacheToDatabase_classDebugEnabled_191)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flushStagingEntryCacheToDatabase: end"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lastPathComponent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v39, v40, 695);

      PLLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(&v65, 8);

}

- (NSDate)lastCacheFlushDate
{
  PLStorageCache *v2;
  NSDate *lastCacheFlushDate;
  void *v4;
  uint64_t v5;
  NSDate *v6;
  NSDate *v7;

  v2 = self;
  objc_sync_enter(v2);
  lastCacheFlushDate = v2->_lastCacheFlushDate;
  if (!lastCacheFlushDate)
  {
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "launchDate");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_lastCacheFlushDate;
    v2->_lastCacheFlushDate = (NSDate *)v5;

    lastCacheFlushDate = v2->_lastCacheFlushDate;
  }
  v7 = lastCacheFlushDate;
  objc_sync_exit(v2);

  return v7;
}

- (id)stagingEntryCacheIDsForEntryKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
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
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PLStorageCache_stagingEntryCacheIDsForEntryKey___block_invoke;
  v9[3] = &unk_1E6A521C8;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v5, v6, v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)stagingEntryCacheForEntryKey:(id)a3 withComparisons:(id)a4 isSingleton:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__PLStorageCache_stagingEntryCacheForEntryKey_withComparisons_isSingleton___block_invoke;
  v18[3] = &unk_1E6A52788;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v12 = v10;
  v21 = v12;
  v22 = a5;
  v13 = v9;
  v14 = v8;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v11, v14, v18);

  v15 = v21;
  v16 = v12;

  return v16;
}

- (void)setLastCacheFlushDate:(id)a3
{
  NSDate *v4;
  NSDate *lastCacheFlushDate;
  PLStorageCache *obj;

  v4 = (NSDate *)a3;
  obj = self;
  objc_sync_enter(obj);
  lastCacheFlushDate = obj->_lastCacheFlushDate;
  obj->_lastCacheFlushDate = v4;

  objc_sync_exit(obj);
}

void __36__PLStorageCache_sharedStorageCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedStorageCache_sharedStorageCache;
  sharedStorageCache_sharedStorageCache = v0;

}

- (PLStorageCache)init
{
  PLStorageCache *v2;
  uint64_t v3;
  NSMutableDictionary *lastEntryCache;
  uint64_t v5;
  NSMutableDictionary *stagingEntryCache;
  uint64_t v7;
  NSMutableDictionary *stagingAggregateEntryCache;
  uint64_t v9;
  NSMutableDictionary *countWarnings;
  uint64_t v11;
  NSMutableDictionary *countSafetyDrop;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLStorageCache;
  v2 = -[PLStorageCache init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    lastEntryCache = v2->_lastEntryCache;
    v2->_lastEntryCache = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    stagingEntryCache = v2->_stagingEntryCache;
    v2->_stagingEntryCache = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    stagingAggregateEntryCache = v2->_stagingAggregateEntryCache;
    v2->_stagingAggregateEntryCache = (NSMutableDictionary *)v7;

    v2->_lastEntryCacheSize = 0;
    v2->_stagingEntryCacheSize = 0;
    v9 = objc_opt_new();
    countWarnings = v2->_countWarnings;
    v2->_countWarnings = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    countSafetyDrop = v2->_countSafetyDrop;
    v2->_countSafetyDrop = (NSMutableDictionary *)v11;

  }
  return v2;
}

- (void)logSizeOfStagingEntryCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stagingEntryCacheSize=%ld"), -[PLStorageCache stagingEntryCacheSize](self, "stagingEntryCacheSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache logSizeOfStagingEntryCache]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 73);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLStorageCache logSizeOfEntryCache:](self, "logSizeOfEntryCache:", v8);

}

- (void)logSizeOfLastEntryCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastEntryCacheSize=%ld"), -[PLStorageCache lastEntryCacheSize](self, "lastEntryCacheSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache logSizeOfLastEntryCache]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 78);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLStorageCache logSizeOfEntryCache:](self, "logSizeOfEntryCache:", v8);

}

- (void)logFullLastEntryCacheForEntryKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache logFullLastEntryCacheForEntryKey:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 83);

  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

}

- (void)logStagingEntryCacheForEntryKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache logStagingEntryCacheForEntryKey:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 87);

  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

}

- (void)dumpStagingEntryCache
{
  id v3;

  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLStorageCache dumpEntryCache:](self, "dumpEntryCache:", v3);

}

- (void)dumpLastEntryCache
{
  id v3;

  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLStorageCache dumpEntryCache:](self, "dumpEntryCache:", v3);

}

- (void)logSizeOfEntryCache:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  objc_sync_enter(v3);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = (id)objc_opt_new();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PLStorageCache_logSizeOfEntryCache___block_invoke;
  v9[3] = &unk_1E6A52620;
  v9[4] = &v14;
  v9[5] = &v10;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend((id)v15[5], "appendFormat:", CFSTR("-----\ntotalCount %ld"), v11[3]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tempStorage count:\n%@"), v15[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache logSizeOfEntryCache:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 113);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  objc_sync_exit(v3);
}

void __38__PLStorageCache_logSizeOfEntryCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "count");
  else
    v6 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("%@ %ld\n"), v7, v6);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v6;

}

- (void)dumpEntryCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;

  v4 = a3;
  -[PLStorageCache logSizeOfEntryCache:](self, "logSizeOfEntryCache:", v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EntryCache DUMP!"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache dumpEntryCache:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 119);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  v10 = v4;
  objc_sync_enter(v10);
  objc_msgSend(v10, "removeAllObjects");
  objc_sync_exit(v10);

}

- (id)cachedEntryForEntryKey:(id)a3 withEntryID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  -[PLStorageCache lastEntryCacheForEntryKey:](self, "lastEntryCacheForEntryKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "entryID") != a4)
  {
    -[PLStorageCache stagingEntryCacheForEntryKey:withID:](self, "stagingEntryCacheForEntryKey:withID:", v6, a4);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = v8;

  return v10;
}

- (void)clearLastEntryCacheForEntryKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD block[5];

  v4 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PLStorageCache_clearLastEntryCacheForEntryKey___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (clearLastEntryCacheForEntryKey__defaultOnce != -1)
      dispatch_once(&clearLastEntryCacheForEntryKey__defaultOnce, block);
    if (clearLastEntryCacheForEntryKey__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin: entryKey=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache clearLastEntryCacheForEntryKey:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 148);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v12 = objc_opt_class();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __49__PLStorageCache_clearLastEntryCacheForEntryKey___block_invoke_43;
    v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v19[4] = v12;
    if (clearLastEntryCacheForEntryKey__defaultOnce_41 != -1)
      dispatch_once(&clearLastEntryCacheForEntryKey__defaultOnce_41, v19);
    if (clearLastEntryCacheForEntryKey__classDebugEnabled_42)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("in @synchronized: entryKey=%@"), v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache clearLastEntryCacheForEntryKey:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 151);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLStorageCache lastEntryCache](self, "lastEntryCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v4);

  objc_sync_exit(v11);
}

BOOL __49__PLStorageCache_clearLastEntryCacheForEntryKey___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  clearLastEntryCacheForEntryKey__classDebugEnabled = result;
  return result;
}

BOOL __49__PLStorageCache_clearLastEntryCacheForEntryKey___block_invoke_43(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  clearLastEntryCacheForEntryKey__classDebugEnabled_42 = result;
  return result;
}

BOOL __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  lastEntryCachePruneToDate__classDebugEnabled = result;
  return result;
}

BOOL __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_50(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  lastEntryCachePruneToDate__classDebugEnabled_49 = result;
  return result;
}

void __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a2;
  v5 = a3;
  +[PLEntryDefinition subEntryKeyKeyForEntryKey:](PLEntryDefinition, "subEntryKeyKeyForEntryKey:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__PLStorageCache_lastEntryCachePruneToDate___block_invoke_2;
    v12[3] = &unk_1E6A52648;
    v13 = *(id *)(a1 + 32);
    v8 = v7;
    v14 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);
    objc_msgSend(v5, "removeObjectsForKeys:", v8);
    if (!objc_msgSend(v5, "count"))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

  }
  else
  {
    objc_msgSend(v5, "entryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "compare:", *(_QWORD *)(a1 + 32));

    if (v10 == -1)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }

}

BOOL __44__PLStorageCache_addToLastEntryCacheSubKey___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_classDebugEnabled = result;
  return result;
}

BOOL __38__PLStorageCache_addToLastEntryCache___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_2_classDebugEnabled = result;
  return result;
}

BOOL __38__PLStorageCache_addToLastEntryCache___block_invoke_68(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_2_classDebugEnabled_67 = result;
  return result;
}

- (int64_t)stagingEntryCacheSizeForEntryKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PLStorageCache_stagingEntryCacheSizeForEntryKey___block_invoke;
  v9[3] = &unk_1E6A526C0;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v5, v6, v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__PLStorageCache_stagingEntryCacheSizeForEntryKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stagingEntryCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)stagingEntryCacheForEntryKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
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
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PLStorageCache_stagingEntryCacheForEntryKey___block_invoke;
  v9[3] = &unk_1E6A526C0;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v5, v6, v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__PLStorageCache_stagingEntryCacheForEntryKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "stagingEntryCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)stagingEntryCacheForEntryKey:(id)a3 withIDLessThan:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PLStorageCache_stagingEntryCacheForEntryKey_withIDLessThan___block_invoke;
  v11[3] = &unk_1E6A52738;
  v11[4] = self;
  v8 = v6;
  v13 = &v15;
  v14 = a4;
  v12 = v8;
  +[PLStorageCache syncAndDispatchForEntryCache:forEntryKey:withBlock:](PLStorageCache, "syncAndDispatchForEntryCache:forEntryKey:withBlock:", v7, v8, v11);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __62__PLStorageCache_stagingEntryCacheForEntryKey_withIDLessThan___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[6];

  v2 = (void *)a1[4];
  objc_msgSend(v2, "stagingEntryCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PLStorageCache_stagingEntryCacheForEntryKey_withIDLessThan___block_invoke_2;
  v6[3] = &unk_1E6A52710;
  v5 = a1[7];
  v6[4] = a1[6];
  v6[5] = v5;
  objc_msgSend(v2, "enumerateEntryCache:withBlock:", v4, v6);

}

void __62__PLStorageCache_stagingEntryCacheForEntryKey_withIDLessThan___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "entryID") < *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __75__PLStorageCache_stagingEntryCacheForEntryKey_withComparisons_isSingleton___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4 && objc_msgSend(v4, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = a1;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (!v6)
    {
LABEL_27:

      goto LABEL_28;
    }
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v10, "comparisonOperation") == 6)
        {
          objc_msgSend(v10, "key");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            goto LABEL_27;
        }
        else
        {
          v13 = objc_msgSend(v10, "comparisonOperation");
          objc_msgSend(v10, "key");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v13 == 7)
          {

            if (!v16)
              goto LABEL_27;
          }
          else
          {
            objc_msgSend(v10, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "plCompare:", v17);

            if ((!objc_msgSend(v10, "hasEqualComparisonComponent") || v18)
              && (!objc_msgSend(v10, "hasGreaterThanComparisonComponent") || v18 != 1)
              && (!objc_msgSend(v10, "hasLessThanComparisonComponent") || v18 != -1)
              && (objc_msgSend(v10, "comparisonOperation") != 1 || !v18))
            {
              goto LABEL_27;
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);

    v19 = *(void **)(v20 + 40);
  }
  else
  {
    v19 = *(void **)(a1 + 40);
  }
  objc_msgSend(v19, "addObject:", v3);
LABEL_28:

}

BOOL __37__PLStorageCache_entryIDForNewEntry___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  entryIDForNewEntry__classDebugEnabled = result;
  return result;
}

BOOL __37__PLStorageCache_entryIDForNewEntry___block_invoke_79(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  entryIDForNewEntry__classDebugEnabled_78 = result;
  return result;
}

BOOL __37__PLStorageCache_entryIDForNewEntry___block_invoke_90(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  entryIDForNewEntry__classDebugEnabled_89 = result;
  return result;
}

- (void)setNextEntryIDForEntryKey:(id)a3 toEntryID:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("UPDATE SQLITE_SEQUENCE SET seq = %lld WHERE name = '%@'"), a4, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PLStorageCache connectionForKey:](self, "connectionForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v8, "performQuery:", v10);
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addToStagingEntryCache__classDebugEnabled = result;
  return result;
}

void __41__PLStorageCache_addToStagingEntryCache___block_invoke_99(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  BOOL (*v36)(uint64_t);
  void *v37;
  uint64_t v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (ArrayReserved_block_invoke_3_defaultOnce != -1)
      dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce, block);
    if (ArrayReserved_block_invoke_3_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inside syncAndDispatch: entry=%@"), *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToStagingEntryCache:]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 401);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v8 = objc_opt_class();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke_104;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v8;
    if (ArrayReserved_block_invoke_3_defaultOnce_102 != -1)
      dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce_102, v40);
    if (ArrayReserved_block_invoke_3_classDebugEnabled_103)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("before entryIDForNewEntry: entryBlock.entryID=%llu"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToStagingEntryCache:]_block_invoke_2");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 404);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryID") <= 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setEntryID:", objc_msgSend(*(id *)(a1 + 32), "entryIDForNewEntry:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)));
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v14 = objc_opt_class();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __41__PLStorageCache_addToStagingEntryCache___block_invoke_110;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v14;
    if (ArrayReserved_block_invoke_3_defaultOnce_108 != -1)
      dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce_108, v39);
    if (ArrayReserved_block_invoke_3_classDebugEnabled_109)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("after entryIDForNewEntry: entryBlock.entryID=%llu"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToStagingEntryCache:]_block_invoke_2");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v17, v18, 408);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stagingEntryCacheForEntryKey:withID:", v21, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("PLStorageOperator_EventPoint_PLLog"));

    if ((v24 & 1) == 0 && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v25 = objc_opt_class();
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __41__PLStorageCache_addToStagingEntryCache___block_invoke_115;
      v37 = &__block_descriptor_40_e5_v8__0lu32l8;
      v38 = v25;
      if (ArrayReserved_block_invoke_3_defaultOnce_113 != -1)
        dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce_113, &v34);
      if (ArrayReserved_block_invoke_3_classDebugEnabled_114)
      {
        v26 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryID");
        objc_msgSend(v26, "stringWithFormat:", CFSTR("addToStagingEntryCache:: entryKey=%@, entryID=%llu already exists in cache"), v27, v28, v34, v35, v36, v37, v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToStagingEntryCache:]_block_invoke_2");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v31, v32, 413);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "insertIntoStagingEntryCache:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "existsInDB") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addToLastEntryCache:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(*(id *)(a1 + 32), "addToLastEntryCacheSubKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }
  }
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_3_classDebugEnabled = result;
  return result;
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke_104(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_3_classDebugEnabled_103 = result;
  return result;
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke_110(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_3_classDebugEnabled_109 = result;
  return result;
}

BOOL __41__PLStorageCache_addToStagingEntryCache___block_invoke_115(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_3_classDebugEnabled_114 = result;
  return result;
}

BOOL __46__PLStorageCache_insertIntoStagingEntryCache___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  insertIntoStagingEntryCache__classDebugEnabled = result;
  return result;
}

BOOL __46__PLStorageCache_insertIntoStagingEntryCache___block_invoke_123(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults BOOLForKey:](PLDefaults, "BOOLForKey:", *(_QWORD *)(a1 + 32));
  insertIntoStagingEntryCache__objectForKey = result;
  return result;
}

BOOL __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateStagingEntryCacheWithEntry_withBlock__classDebugEnabled = result;
  return result;
}

BOOL __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke_128(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateStagingEntryCacheWithEntry_withBlock__classDebugEnabled_127 = result;
  return result;
}

void __61__PLStorageCache_updateStagingEntryCacheWithEntry_withBlock___block_invoke_131(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "stagingEntryCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "entryID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(*(id *)(a1 + 32), "insertIntoStagingEntryCache:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  flushStagingEntryCacheToDatabase_classDebugEnabled = result;
  return result;
}

int64_t __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_139(uint64_t a1)
{
  int64_t result;

  result = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  flushStagingEntryCacheToDatabase_objectForKey = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_3(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_4_classDebugEnabled = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_144(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_4_classDebugEnabled_143 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_149(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_4_classDebugEnabled_148 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_154(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_4_classDebugEnabled_153 = result;
  return result;
}

void __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_157(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL (*v46)(uint64_t);
  void *v47;
  uint64_t v48;
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD block[5];

  v3 = a2;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2_158;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (ArrayReserved_block_invoke_5_defaultOnce != -1)
      dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce, block);
    if (ArrayReserved_block_invoke_5_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry=%@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 579);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v10 = (void *)MEMORY[0x1BCC9E9B4]();
  if (objc_msgSend(v3, "existsInDB"))
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v11 = +[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd");
    v12 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    if (v11)
    {
      if (v12)
      {
        v13 = objc_opt_class();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_161;
        v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v51[4] = v13;
        if (ArrayReserved_block_invoke_5_defaultOnce_159 != -1)
          dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_159, v51);
        if (ArrayReserved_block_invoke_5_classDebugEnabled_160)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("powerlogHelperd update: %@"), v3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v16, v17, 585);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
    }
    else
    {
      if (v12)
      {
        v32 = objc_opt_class();
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_166;
        v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v50[4] = v32;
        if (ArrayReserved_block_invoke_5_defaultOnce_164 != -1)
          dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_164, v50);
        if (ArrayReserved_block_invoke_5_classDebugEnabled_165)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updateEntry: entry=%@"), v3);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lastPathComponent");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v35, v36, 587);

          PLLogCommon();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "updateEntry:", v3);
    }
  }
  else
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (*(__int16 *)(a1 + 96) >= 2)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
        v19 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        if ((_DWORD)v19)
        {
          v20 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + v19;
          if (objc_msgSend(*(id *)(a1 + 48), "count") != v20)
          {
            v21 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
                + (uint64_t)*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            if (v21 != (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >> 1)
            {
              objc_msgSend(*(id *)(a1 + 32), "setNextEntryIDForEntryKey:toEntryID:", *(_QWORD *)(a1 + 56), objc_msgSend(v3, "entryID"));
              objc_msgSend(*(id *)(a1 + 32), "setNextEntryIDForEntryKey:toEntryID:", *(_QWORD *)(a1 + 56), objc_msgSend(v3, "entryID"));
              goto LABEL_48;
            }
          }
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "writeEntry:", v3);
    }
    v22 = +[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd");
    v23 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    if (v22)
    {
      if (v23)
      {
        v24 = objc_opt_class();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_171;
        v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v49[4] = v24;
        if (ArrayReserved_block_invoke_5_defaultOnce_169 != -1)
          dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_169, v49);
        if (ArrayReserved_block_invoke_5_classDebugEnabled_170)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("powerlogHelperd: %@"), v3);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v27, v28, 616);

          PLLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      v30 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      objc_msgSend(v3, "serialized");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v31);

    }
    else
    {
      if (v23)
      {
        v38 = objc_opt_class();
        v44 = MEMORY[0x1E0C809B0];
        v45 = 3221225472;
        v46 = __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_176;
        v47 = &__block_descriptor_40_e5_v8__0lu32l8;
        v48 = v38;
        if (ArrayReserved_block_invoke_5_defaultOnce_174 != -1)
          dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_174, &v44);
        if (ArrayReserved_block_invoke_5_classDebugEnabled_175)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("writeEntry: entry=%@"), v3, v44, v45, v46, v47, v48);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "lastPathComponent");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache flushStagingEntryCacheToDatabase]_block_invoke_2");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v41, v42, 619);

          PLLogCommon();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      objc_msgSend(*(id *)(a1 + 40), "writeEntry:", v3);
    }
  }
LABEL_48:
  objc_autoreleasePoolPop(v10);

}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2_158(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_5_classDebugEnabled = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_161(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_5_classDebugEnabled_160 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_166(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_5_classDebugEnabled_165 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_171(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_5_classDebugEnabled_170 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_176(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_5_classDebugEnabled_175 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_184(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_4_classDebugEnabled_183 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_2_188(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_4_classDebugEnabled_187 = result;
  return result;
}

BOOL __50__PLStorageCache_flushStagingEntryCacheToDatabase__block_invoke_3_192(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  flushStagingEntryCacheToDatabase_classDebugEnabled_191 = result;
  return result;
}

- (void)enumerateStagingEntryCacheWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLStorageCache stagingEntryCache](self, "stagingEntryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PLStorageCache_enumerateStagingEntryCacheWithBlock___block_invoke;
  v7[3] = &unk_1E6A52878;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __54__PLStorageCache_enumerateStagingEntryCacheWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateEntryCache:withBlock:", a3, *(_QWORD *)(a1 + 40));
}

BOOL __59__PLStorageCache_flushStagingAggregateEntryCacheToDatabase__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  flushStagingAggregateEntryCacheToDatabase_classDebugEnabled = result;
  return result;
}

BOOL __59__PLStorageCache_flushStagingAggregateEntryCacheToDatabase__block_invoke_199(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  flushStagingAggregateEntryCacheToDatabase_classDebugEnabled_198 = result;
  return result;
}

BOOL __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  addToStagingAggregateEntryCache__classDebugEnabled = result;
  return result;
}

void __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_204(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  __CFString *v37;
  uint64_t v38;
  _QWORD v39[4];
  __CFString *v40;
  uint64_t v41;
  _QWORD block[4];
  __CFString *v43;
  uint64_t v44;

  objc_msgSend(*(id *)(a1 + 32), "stagingAggregateEntryCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stagingAggregateEntryCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "entryKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "matchingKeyToValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "matchingKeyToValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "aggregateKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v12 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_2;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v43 = CFSTR("aggregate");
    v44 = v12;
    if (ArrayReserved_block_invoke_6_defaultOnce != -1)
      dispatch_once(&ArrayReserved_block_invoke_6_defaultOnce, block);
    v13 = ArrayReserved_block_invoke_6_classDebugEnabled;

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("existingAggregateEntry=%@"), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToStagingAggregateEntryCache:]_block_invoke");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v16, v17, 744);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v19 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v11)
  {
    if (v19)
    {
      v20 = objc_opt_class();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_209;
      v39[3] = &unk_1E6A52828;
      v39[1] = 3221225472;
      v40 = CFSTR("aggregate");
      v41 = v20;
      if (ArrayReserved_block_invoke_6_defaultOnce_207 != -1)
        dispatch_once(&ArrayReserved_block_invoke_6_defaultOnce_207, v39);
      v21 = ArrayReserved_block_invoke_6_classDebugEnabled_208;

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hit"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToStagingAggregateEntryCache:]_block_invoke_2");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v24, v25, 748);

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "aggregateValue");
    objc_msgSend(v11, "updateWithValue:");
  }
  else
  {
    if (v19)
    {
      v27 = objc_opt_class();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[2] = __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_215;
      v36[3] = &unk_1E6A52828;
      v36[1] = 3221225472;
      v37 = CFSTR("aggregate");
      v38 = v27;
      if (ArrayReserved_block_invoke_6_defaultOnce_213 != -1)
        dispatch_once(&ArrayReserved_block_invoke_6_defaultOnce_213, v36);
      v28 = ArrayReserved_block_invoke_6_classDebugEnabled_214;

      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("miss"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLStorageCache.m");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastPathComponent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLStorageCache addToStagingAggregateEntryCache:]_block_invoke_2");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v31, v32, 753);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v34 = *(void **)(a1 + 40);
    objc_msgSend(v34, "aggregateKey");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, v35);

  }
}

BOOL __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_6_classDebugEnabled = result;
  return result;
}

BOOL __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_209(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_6_classDebugEnabled_208 = result;
  return result;
}

BOOL __50__PLStorageCache_addToStagingAggregateEntryCache___block_invoke_215(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_6_classDebugEnabled_214 = result;
  return result;
}

BOOL __70__PLStorageCache_getQueryForAggregateEntryKey_withMatchingKeyToValue___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  getQueryForAggregateEntryKey_withMatchingKeyToValue__classDebugEnabled = result;
  return result;
}

- (void)setLastEntryCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setStagingEntryCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setStagingAggregateEntryCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setCountWarnings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setCountSafetyDrop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countSafetyDrop, 0);
  objc_storeStrong((id *)&self->_countWarnings, 0);
  objc_storeStrong((id *)&self->_stagingAggregateEntryCache, 0);
  objc_storeStrong((id *)&self->_stagingEntryCache, 0);
  objc_storeStrong((id *)&self->_lastEntryCache, 0);
  objc_storeStrong((id *)&self->_lastCacheFlushDate, 0);
}

@end
