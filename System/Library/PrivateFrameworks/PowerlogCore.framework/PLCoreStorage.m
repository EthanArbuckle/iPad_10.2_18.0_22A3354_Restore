@implementation PLCoreStorage

void __52__PLCoreStorage_dispatchAsyncForEntryKey_withBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

uint64_t __50__PLCoreStorage_writeEntries_withCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
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
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
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
        +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addToStagingEntryCache:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "checkCacheSizeForFlush");
  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)writeEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int64_t v12;
  uint64_t block;
  uint64_t v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  v4 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __28__PLCoreStorage_writeEntry___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v5;
    if (writeEntry__defaultOnce != -1)
      dispatch_once(&writeEntry__defaultOnce, &block);
    if (writeEntry__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry=%@"), v4, block, v15, v16, v17, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeEntry:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 1539);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "addToStagingEntryCache:", v4);

  -[PLCoreStorage checkCacheSizeForFlush](self, "checkCacheSizeForFlush");
  return v12;
}

- (void)checkCacheSizeForFlush
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  NSObject *v6;
  _QWORD block[5];

  +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stagingEntryCacheSize");
  v5 = -[PLCoreStorage generalEntryCacheSizeLimit](self, "generalEntryCacheSizeLimit");

  if (v4 > v5)
  {
    +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("CacheSizeFlush"));
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLCoreStorage_checkCacheSizeForFlush__block_invoke;
    block[3] = &unk_1E6A52050;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

- (int64_t)generalEntryCacheSizeLimit
{
  int64_t v2;
  _QWORD v4[4];
  __CFString *v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PLCoreStorage_generalEntryCacheSizeLimit__block_invoke;
  v4[3] = &unk_1E6A527D8;
  v5 = CFSTR("generalEntryCacheSize");
  v6 = 500;
  if (generalEntryCacheSizeLimit_defaultOnce != -1)
    dispatch_once(&generalEntryCacheSizeLimit_defaultOnce, v4);
  v2 = generalEntryCacheSizeLimit_objectForKey;

  return v2;
}

- (void)dispatchAsyncForEntryKey:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "storageQueueNameForEntryKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PLCoreStorage_dispatchAsyncForEntryKey_withBlock___block_invoke;
  block[3] = &unk_1E6A53788;
  v11 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

+ (id)storageQueueNameForEntryKey:(id)a3
{
  return (id)-[objc_class storageQueueName](+[PLEntryKey operatorClassForEntryKey:](PLEntryKey, "operatorClassForEntryKey:", a3), "storageQueueName");
}

- (BOOL)storageLocked
{
  if (storageLocked_onceToken != -1)
    dispatch_once(&storageLocked_onceToken, &__block_literal_global_14);
  return storageLocked_storageLocked;
}

- (void)writeProportionateAggregateEntry:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  _BOOL8 v16;
  int v17;
  void *v18;
  PLCoreStorage *v19;
  int v20;
  uint64_t v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  double v29;
  double v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  PLCoreStorage *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  double v64;
  uint64_t i;
  uint64_t v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  PLCoreStorage *v85;
  id obj;
  void *v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  __CFString *v95;
  uint64_t v96;
  _QWORD v97[4];
  __CFString *v98;
  uint64_t v99;
  _QWORD block[4];
  __CFString *v101;
  uint64_t v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "timeIntervalSinceDate:", v9);
  if (v11 <= 0.0)
  {
    v53 = self;
LABEL_28:
    -[PLCoreStorage writeAggregateEntry:](v53, "writeAggregateEntry:", v8);
    goto LABEL_43;
  }
  v12 = v11;
  objc_msgSend(v8, "entryKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[PLEntryDefinition isAggregateWallClockBucket:](PLEntryDefinition, "isAggregateWallClockBucket:", v13);

  +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = self;
  v16 = v14;
  v17 = objc_msgSend(v15, "bucketTimeStampForDate:withTimeReference:withBucketInterval:", v10, v14, 3600);

  +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v85;
  v20 = objc_msgSend(v18, "bucketTimeStampForDate:withTimeReference:withBucketInterval:", v9, v16, 3600);

  v89 = v8;
  v84 = v10;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v21 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke;
    block[3] = &unk_1E6A52828;
    v101 = CFSTR("writeAggregateEntry");
    v102 = v21;
    if (writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce != -1)
      dispatch_once(&writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce, block);
    v22 = writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled;

    if (v22)
    {
      v82 = v10;
      v23 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Split Entry: startDate: %@, endDate: %@"), v9, v82);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeProportionateAggregateEntry:withStartDate:withEndDate:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v26, v27, 1615);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v8 = v89;
      v9 = v23;
      v10 = v84;
      v19 = v85;
    }
  }
  v29 = (double)v17;
  v30 = (double)v20;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v31 = objc_opt_class();
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke_516;
    v97[3] = &unk_1E6A52828;
    v98 = CFSTR("writeAggregateEntry");
    v99 = v31;
    if (writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce_514 != -1)
      dispatch_once(&writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce_514, v97);
    v32 = writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled_515;

    if (v32)
    {
      v33 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v20);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("Split Entry: startHourBoundary: %@, endHourBoundary: %@"), v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeProportionateAggregateEntry:withStartDate:withEndDate:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v38, v39, 1616);

      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v10 = v84;
      v19 = v85;
    }
  }
  v41 = ((v29 - v30) / 3600.0);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v42 = objc_opt_class();
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke_521;
    v94[3] = &unk_1E6A52828;
    v95 = CFSTR("writeAggregateEntry");
    v96 = v42;
    if (writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce_519 != -1)
      dispatch_once(&writeProportionateAggregateEntry_withStartDate_withEndDate__defaultOnce_519, v94);
    v43 = writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled_520;

    if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Split Entry: numberOfIntermediateHourTicks = %d"), v41);
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "lastPathComponent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeProportionateAggregateEntry:withStartDate:withEndDate:]");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v45, v46, 1618);

      PLLogCommon();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v19 = v85;
      LODWORD(v41) = ((v29 - v30) / 3600.0);
    }
  }
  if (!(_DWORD)v41)
  {
    v53 = v19;
    goto LABEL_28;
  }
  objc_msgSend(v9, "timeIntervalSince1970");
  v49 = v48;
  objc_msgSend(v10, "timeIntervalSince1970");
  v51 = v50;
  v88 = (void *)objc_msgSend(v8, "copy");
  v52 = (void *)objc_msgSend(v8, "copy");
  v83 = v9;
  if ((_DWORD)v41 == 1)
    v87 = 0;
  else
    v87 = (void *)objc_msgSend(v8, "copy");
  v54 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v8, "entryDefinition");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition allAggregateKeysForEntryDefinition:](PLEntryDefinition, "allAggregateKeysForEntryDefinition:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setWithArray:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v57;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
  if (v58)
  {
    v59 = v58;
    v60 = v51 - v29;
    v61 = (v30 - v49 + 3600.0) / v12;
    v62 = v60 / v12;
    v63 = *(_QWORD *)v91;
    v64 = 3600.0 / v12;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v91 != v63)
          objc_enumerationMutation(obj);
        v66 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i);
        v67 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v89, "objectForKeyedSubscript:", v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "doubleValue");
        objc_msgSend(v67, "numberWithDouble:", v61 * v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setObject:forKeyedSubscript:", v70, v66);

        v71 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v89, "objectForKeyedSubscript:", v66);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "doubleValue");
        objc_msgSend(v71, "numberWithDouble:", v62 * v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v74, v66);

        if ((_DWORD)v41 != 1)
        {
          v75 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v89, "objectForKeyedSubscript:", v66);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "doubleValue");
          objc_msgSend(v75, "numberWithDouble:", v64 * v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKeyedSubscript:", v78, v66);

        }
      }
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
    }
    while (v59);
  }

  v9 = v83;
  objc_msgSend(v88, "setEntryDate:", v83);
  objc_msgSend(v52, "setEntryDate:", v84);
  -[PLCoreStorage writeAggregateEntry:](v85, "writeAggregateEntry:", v88);
  -[PLCoreStorage writeAggregateEntry:](v85, "writeAggregateEntry:", v52);
  if ((_DWORD)v41 != 1)
  {
    v79 = 1;
    do
    {
      v80 = (void *)objc_msgSend(v87, "copy");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v30 + (double)v79 * 3600.0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setEntryDate:", v81);

      -[PLCoreStorage writeAggregateEntry:](v85, "writeAggregateEntry:", v80);
      ++v79;
    }
    while ((_DWORD)v41 != v79);
  }

  v8 = v89;
  v10 = v84;
LABEL_43:

}

- (void)writeAggregateEntry:(id)a3
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
  id v14;
  _QWORD v15[4];
  id v16;
  PLCoreStorage *v17;
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
    block[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke;
    block[3] = &unk_1E6A52828;
    v19 = CFSTR("writeAggregateEntry");
    v20 = objc_opt_class();
    if (writeAggregateEntry__defaultOnce != -1)
      dispatch_once(&writeAggregateEntry__defaultOnce, block);
    v7 = writeAggregateEntry__classDebugEnabled;

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry=%@"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeAggregateEntry:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 1669);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(v4, "entryKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_524;
  v15[3] = &unk_1E6A521A0;
  v16 = v4;
  v17 = self;
  v14 = v4;
  -[PLCoreStorage dispatchAsyncForEntryKey:withBlock:](self, "dispatchAsyncForEntryKey:withBlock:", v13, v15);

}

- (int64_t)blockingWriteEntry:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  int64_t v8;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    v8 = -[PLCoreStorage writeEntry:](self, "writeEntry:", v6);
    if (v7)
      v7[2](v7);
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (BOOL)storageReady
{
  return self->_storageReady;
}

- (void)writeEntry:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[7];
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD block[6];

  v6 = a3;
  v7 = a4;
  v8 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLCoreStorage_writeEntry_withCompletionBlock___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (writeEntry_withCompletionBlock__defaultOnce != -1)
      dispatch_once(&writeEntry_withCompletionBlock__defaultOnce, block);
    if (writeEntry_withCompletionBlock__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry=%@"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeEntry:withCompletionBlock:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 1549);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (v6)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__5;
    v23 = __Block_byref_object_dispose__5;
    v24 = v6;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__505;
    v17[4] = __Block_byref_object_dispose__506;
    v18 = (id)MEMORY[0x1BCC9EB70](v7);
    objc_msgSend((id)v20[5], "entryKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __48__PLCoreStorage_writeEntry_withCompletionBlock___block_invoke_509;
    v16[3] = &unk_1E6A537B0;
    v16[4] = self;
    v16[5] = &v19;
    v16[6] = v17;
    -[PLCoreStorage dispatchAsyncForEntryKey:withBlock:](self, "dispatchAsyncForEntryKey:withBlock:", v15, v16);

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v19, 8);

  }
}

- (id)lastEntryForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastEntryCacheForEntryKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[PLCoreStorage lastEntryForKey:withFilters:](self, "lastEntryForKey:withFilters:", v4, &unk_1E6AF5ED0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addToLastEntryCache:", v6);

        +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addToLastEntryCacheSubKey:", v6);

      }
    }
    v9 = v6;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __51__PLCoreStorage_dispatchSyncForEntryKey_withBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)writeEntries:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[7];
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__5;
    v22 = __Block_byref_object_dispose__5;
    v23 = v6;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__505;
    v16[4] = __Block_byref_object_dispose__506;
    v17 = (id)MEMORY[0x1BCC9EB70](v7);
    objc_msgSend((id)v19[5], "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__PLCoreStorage_writeEntries_withCompletionBlock___block_invoke;
    v15[3] = &unk_1E6A527B0;
    v15[4] = self;
    v15[5] = &v18;
    v15[6] = v16;
    -[PLCoreStorage dispatchAsyncForEntryKey:withBlock:](self, "dispatchAsyncForEntryKey:withBlock:", v9, v15);

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v18, 8);

  }
  else if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("writeEntries: ERROR, no entries to write"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeEntries:withCompletionBlock:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 1519);

    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
}

- (PLSQLiteConnection)connection
{
  return (PLSQLiteConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)_updateEntry:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateStagingEntryCacheWithEntry:withBlock:", v7, v6);

    -[PLCoreStorage checkCacheSizeForFlush](self, "checkCacheSizeForFlush");
  }
}

- (void)flushCachesWithReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *label;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  dispatch_time_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD block[4];
  id v44;
  _QWORD v45[4];
  __CFString *v46;
  uint64_t v47;
  _QWORD v48[4];
  __CFString *v49;
  uint64_t v50;
  _QWORD v51[5];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  const char *v55;
  _QWORD v56[2];
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Cache Size"))
    && (+[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "stagingEntryCacheSize"),
        v7 = -[PLCoreStorage generalEntryCacheSizeLimit](self, "generalEntryCacheSizeLimit"),
        v5,
        v6 <= v7))
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v39 = objc_opt_class();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __39__PLCoreStorage_flushCachesWithReason___block_invoke;
      v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v51[4] = v39;
      if (flushCachesWithReason__defaultOnce != -1)
        dispatch_once(&flushCachesWithReason__defaultOnce, v51);
      if (flushCachesWithReason__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cache size is fine!"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastPathComponent");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage flushCachesWithReason:]");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v41, v42, 1347);

        PLLogCommon();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
        goto LABEL_18;
      }
    }
  }
  else
  {
    v8 = objc_opt_class();
    v9 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[2] = __39__PLCoreStorage_flushCachesWithReason___block_invoke_457;
    v48[3] = &unk_1E6A52828;
    v48[1] = 3221225472;
    v49 = CFSTR("LogCacheFlush");
    v50 = v8;
    if (flushCachesWithReason__defaultOnce_455 != -1)
      dispatch_once(&flushCachesWithReason__defaultOnce_455, v48);
    v10 = flushCachesWithReason__classDebugEnabled_456;

    if (v10)
    {
      v57[0] = v4;
      v56[0] = CFSTR("Reason");
      v56[1] = CFSTR("Size");
      v11 = (void *)MEMORY[0x1E0CB37E8];
      +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithLong:", objc_msgSend(v12, "stagingEntryCacheSize"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLStorageOperator eventPointCacheFlushWithPayload:](PLStorageOperator, "eventPointCacheFlushWithPayload:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addToStagingEntryCache:", v15);

    }
    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      label = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 138412546;
      v53 = v4;
      v54 = 2080;
      v55 = label;
      _os_log_impl(&dword_1B6AB6000, v17, OS_LOG_TYPE_DEFAULT, "Flush cache start with Reason: %@ on Queue:%s", buf, 0x16u);
    }

    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Timer")) & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0C99D68];
      v45[0] = v9;
      v45[1] = 3221225472;
      v45[2] = __39__PLCoreStorage_flushCachesWithReason___block_invoke_459;
      v45[3] = &unk_1E6A527D8;
      v46 = CFSTR("flushCachesInterval");
      v47 = 900;
      if (flushCachesWithReason__defaultOnce_458 != -1)
        dispatch_once(&flushCachesWithReason__defaultOnce_458, v45);
      v20 = flushCachesWithReason__objectForKey;

      objc_msgSend(v19, "dateWithTimeIntervalSinceNow:", (double)v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCoreStorage flushCachesTimer](self, "flushCachesTimer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFireDate:", v21);

    }
    if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    {
      v23 = (void *)os_transaction_create();
      v24 = (void *)MEMORY[0x1BCC9E9B4]();
      -[PLCoreStorage connection](self, "connection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "beginTransaction");

      +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "flushStagingEntryCacheToDatabase");

      +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "flushStagingAggregateEntryCacheToDatabase");

      -[PLCoreStorage connection](self, "connection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "endTransaction");

      objc_autoreleasePoolPop(v24);
      v29 = dispatch_time(0, 60000000000);
      +[PLUtilities transactionWorkQueue](PLUtilities, "transactionWorkQueue");
      v30 = objc_claimAutoreleasedReturnValue();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __39__PLCoreStorage_flushCachesWithReason___block_invoke_2;
      block[3] = &unk_1E6A52050;
      v44 = v23;
      v31 = v23;
      dispatch_after(v29, v30, block);

      +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", -3600.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "lastEntryCachePruneToDate:", v33);

    }
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Flush cache done with Reason: %@ on Queue:%s"), v4, dispatch_queue_get_label(0));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastPathComponent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage flushCachesWithReason:]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v36, v37, 1380);

      PLLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_18:

    }
  }

}

- (PLTimer)flushCachesTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 48, 1);
}

- (id)lastEntryForKey:(id)a3 withSubEntryKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastEntryCacheForEntryKey:withSubEntryKey:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
    }
    else
    {
      +[PLEntryDefinition subEntryKeyKeyForEntryKey:](PLEntryDefinition, "subEntryKeyKeyForEntryKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = CFSTR("__NOCACHEDUMP__");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = \"%@\"), v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLCoreStorage lastEntryForKey:withFilters:](self, "lastEntryForKey:withFilters:", v6, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addToLastEntryCacheSubKey:", v14);

      }
      v10 = v14;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)entriesForKey:(id)a3 withComparisons:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  PLCoreStorage *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v33 = self;
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLCoreStorage entriesForKey:withComparisons:].cold.5();

    +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stagingEntryCacheIDsForEntryKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stagingEntryCacheForEntryKey:withComparisons:isSingleton:", v6, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLCoreStorage entriesForKey:withComparisons:].cold.4();

    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLCoreStorage entriesForKey:withComparisons:].cold.3();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v20), "sqlWhereClause");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v18);
    }

    if (objc_msgSend(v10, "count"))
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("ID NOT IN (%@)"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v25);

    }
    v38[0] = CFSTR("where");
    v38[1] = CFSTR("__NOCACHEDUMP__");
    v39[0] = v15;
    v39[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoreStorage entriesForKey:withProperties:](v33, "entriesForKey:withProperties:", v6, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[PLCoreStorage entriesForKey:withComparisons:].cold.2();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObjectsFromArray:", v27);
    PLLogCommon();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[PLCoreStorage entriesForKey:withComparisons:].cold.1();

    objc_msgSend(v29, "sortedArrayUsingComparator:", &__block_literal_global_580);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)lastEntryForKey:(id)a3 withFilters:(id)a4
{
  void *v4;
  void *v5;

  -[PLCoreStorage lastEntriesForKey:count:withFilters:](self, "lastEntriesForKey:count:withFilters:", a3, 1, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)lastEntriesForKey:(id)a3 count:(int64_t)a4 withFilters:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = v8;
  if (a3)
  {
    if (!v8)
      v9 = (void *)MEMORY[0x1E0C9AA60];
    v10 = a3;
    if (objc_msgSend(v9, "count")
      && (objc_msgSend(v9, "firstObject"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("__NOCACHEDUMP__")),
          v11,
          v12))
    {
      v13 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v13, "removeObjectAtIndex:", 0);

      v14 = 1;
      v9 = v13;
    }
    else
    {
      v14 = 0;
    }
    v21[0] = CFSTR("where");
    v21[1] = CFSTR("order by");
    v22[0] = v9;
    v22[1] = &unk_1E6AF7188;
    v21[2] = CFSTR("limit");
    if (a4 >= 0)
      v15 = a4;
    else
      v15 = -a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v16;
    v21[3] = CFSTR("__NOCACHEDUMP__");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLCoreStorage entriesForKey:withProperties:](self, "entriesForKey:withProperties:", v10, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)entriesForKey:(id)a3 withProperties:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  id v25;
  _QWORD block[4];
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("__NOCACHEDUMP__"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("__NOCACHEDUMP__")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "BOOLValue"),
        v10,
        v9,
        (v11 & 1) == 0))
  {
    if (-[PLCoreStorage flushCachesIfRequiredForEntryKey:](self, "flushCachesIfRequiredForEntryKey:", v6)
      && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cache dumped for properties: %@"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage entriesForKey:withProperties:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v14, v15, 1877);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v17 = (void *)os_transaction_create();
  v18 = (void *)MEMORY[0x1BCC9E9B4]();
  +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "connectionForKey:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entriesForKey:withProperties:", v6, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v18);
  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[PLCoreStorage entriesForKey:withProperties:].cold.1();

  v23 = dispatch_time(0, 1000000000* +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("kPLXPCTransactionEndDelay"), 60));
  +[PLUtilities transactionWorkQueue](PLUtilities, "transactionWorkQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PLCoreStorage_entriesForKey_withProperties___block_invoke;
  block[3] = &unk_1E6A52050;
  v28 = v17;
  v25 = v17;
  dispatch_after(v23, v24, block);

  return v21;
}

- (void)dispatchSyncForEntryKey:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "storageQueueNameForEntryKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PLCoreStorage_dispatchSyncForEntryKey_withBlock___block_invoke;
  v10[3] = &unk_1E6A53788;
  v11 = v5;
  v9 = v5;
  +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v8, v10);

}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

uint64_t __39__PLCoreStorage_checkCacheSizeForFlush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flushCachesWithReason:", CFSTR("Cache Size"));
}

void __44__PLCoreStorage_loadDynamicValuesIntoEntry___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadDynamicValuesIntoEntry:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadArrayValuesIntoEntry:", *(_QWORD *)(a1 + 40));

}

uint64_t __39__PLCoreStorage_updateEntry_withBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEntry:withBlock:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (void)updateEntry:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__5;
  v13[4] = __Block_byref_object_dispose__5;
  v8 = v6;
  v14 = v8;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__505;
  v11[4] = __Block_byref_object_dispose__506;
  v12 = (id)MEMORY[0x1BCC9EB70](v7);
  objc_msgSend(v8, "entryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__PLCoreStorage_updateEntry_withBlock___block_invoke;
  v10[3] = &unk_1E6A537B0;
  v10[4] = self;
  v10[5] = v13;
  v10[6] = v11;
  -[PLCoreStorage dispatchAsyncForEntryKey:withBlock:](self, "dispatchAsyncForEntryKey:withBlock:", v9, v10);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);

}

- (void)loadDynamicValuesIntoEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PLCoreStorage_loadDynamicValuesIntoEntry___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCoreStorage dispatchSyncForEntryKey:withBlock:](self, "dispatchSyncForEntryKey:withBlock:", v5, v7);

}

+ (id)storageQueueNameForClass:(Class)a3
{
  __CFString *v4;
  void *v5;

  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
    || (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = CFSTR("storageQueue.shared");
  }
  else
  {
    NSStringFromClass(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(".storageQueue"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)setFileProtectionForPath:(id)a3 withLevel:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CB2AD8];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  LOBYTE(a3) = objc_msgSend(v8, "setAttributes:ofItemAtPath:error:", v9, v7, &v11);

  return (char)a3;
}

void __30__PLCoreStorage_storageLocked__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v0 = MKBGetDeviceLockState();
  v1 = MKBDeviceUnlockedSinceBoot();
  v2 = v1;
  v4 = (_DWORD)v0 == 1 && (_DWORD)v1 == 0;
  storageLocked_storageLocked = v4;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keybag lockstate=%d unlockedSinceBoot=%d"), v0, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage storageLocked]_block_invoke");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 143);

    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
}

- (void)logPreUnlockState:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("preUnlock");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLCoreStorage storageOperator](self, "storageOperator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logEventPointPreUnlock:", v5);

}

- (PLCoreStorage)init
{
  PLCoreStorage *v2;
  time_t v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *backgroundQueue;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *utilityQueue;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  PLCFNotificationOperatorComposition *v44;
  void *v45;
  PLCoreStorage *v46;
  uint64_t v47;
  PLCFNotificationOperatorComposition *keybagFirstUnlockNotification;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  NSObject *v60;
  NSObject *v61;
  PLSQLiteConnection *v62;
  NSObject *v63;
  uint64_t v64;
  PLSQLiteConnection *v65;
  PLSQLiteConnection *v66;
  PLSQLiteConnection *connection;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  NSMutableSet *safeCopyInProgress;
  _QWORD v76[4];
  PLCoreStorage *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD block[5];
  objc_super v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  int v91;
  __int16 v92;
  int v93;
  _BYTE v94[128];
  void *v95;
  _BYTE v96[128];
  _QWORD v97[6];

  v97[3] = *MEMORY[0x1E0C80C00];
  v87.receiver = self;
  v87.super_class = (Class)PLCoreStorage;
  v2 = -[PLCoreStorage init](&v87, sel_init);
  if (v2)
  {
    v3 = time(0);
    srand(v3);
    v4 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __21__PLCoreStorage_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (init_defaultOnce_0 != -1)
        dispatch_once(&init_defaultOnce_0, block);
      if (init_classDebugEnabled_0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("seeded random number generator, seed =%i"), v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage init]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 159);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(9, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create_with_target_V2("com.apple.powerlog.storage.background", v11, v12);
    backgroundQueue = v2->_backgroundQueue;
    v2->_backgroundQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create_with_target_V2("com.apple.powerlog.storage.utility", v15, v16);
    utilityQueue = v2->_utilityQueue;
    v2->_utilityQueue = (OS_dispatch_queue *)v17;

    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("/Library/BatteryLife/"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v20;
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v22;
    v97[2] = CFSTR("/tmp/powerlog/");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v24 = v23;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v83 != v27)
            objc_enumerationMutation(v24);
          +[PLUtilities createAndChownDirectory:](PLUtilities, "createAndChownDirectory:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
      }
      while (v26);
    }

    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingString:", CFSTR("/Library/BatteryLife/"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoreStorage setFileProtectionForPath:withLevel:](v2, "setFileProtectionForPath:withLevel:", v30, *MEMORY[0x1E0CB2AE0]);

    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v34 = v33;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v79;
      v38 = *MEMORY[0x1E0CB2AC0];
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v79 != v37)
            objc_enumerationMutation(v34);
          -[PLCoreStorage setFileProtectionForPath:withLevel:](v2, "setFileProtectionForPath:withLevel:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j), v38);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
      }
      while (v36);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CrashReporter/"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "removeItemAtPath:error:", v42, 0);

    *(_WORD *)&v2->_storageLocked = 1;
    if (-[PLCoreStorage storageLocked](v2, "storageLocked"))
    {
      PLLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6AB6000, v43, OS_LOG_TYPE_DEFAULT, "KEYBAG: Locked", buf, 2u);
      }

      v44 = [PLCFNotificationOperatorComposition alloc];
      dispatch_get_global_queue(-2, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v5;
      v76[1] = 3221225472;
      v76[2] = __21__PLCoreStorage_init__block_invoke_48;
      v76[3] = &unk_1E6A52118;
      v46 = v2;
      v77 = v46;
      v47 = -[PLCFNotificationOperatorComposition initWithWorkQueue:forNotification:requireState:withBlock:](v44, "initWithWorkQueue:forNotification:requireState:withBlock:", v45, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, v76);
      keybagFirstUnlockNotification = v46->_keybagFirstUnlockNotification;
      v46->_keybagFirstUnlockNotification = (PLCFNotificationOperatorComposition *)v47;

    }
    else
    {
      if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd")
        && _os_feature_enabled_impl())
      {
        -[PLCoreStorage applyContainerPOSIXPermissions](v2, "applyContainerPOSIXPermissions");
      }
      PLLogCommon();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6AB6000, v49, OS_LOG_TYPE_DEFAULT, "KEYBAG: Unlocked", buf, 2u);
      }

      if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
      {
        +[PLUtilities containerPath](PLUtilities, "containerPath");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
        v51 = objc_claimAutoreleasedReturnValue();

        if (+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
        {
          +[PLDefaults objectForKey:forApplicationID:synchronize:](PLDefaults, "objectForKey:forApplicationID:synchronize:", CFSTR("BUI_DEMO_PATH"), CFSTR("com.apple.powerlogd"), 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v52;
          if (v52)
          {
            v54 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v52, "pathExtension");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringWithFormat:", CFSTR(".%@"), v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "isEqualToString:", CFSTR(".PLSQL"));

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v58, "fileExistsAtPath:", v53);

            PLLogCommon();
            v60 = objc_claimAutoreleasedReturnValue();
            v61 = v60;
            if (v57 && v59)
            {
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                -[PLCoreStorage init].cold.3();

              v61 = v51;
              v51 = v53;
            }
            else if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v89 = v53;
              v90 = 1024;
              v91 = v57;
              v92 = 1024;
              v93 = v59;
              _os_log_error_impl(&dword_1B6AB6000, v61, OS_LOG_TYPE_ERROR, "PLCoreStorage: Unable to load '%@'. Resorting to main DB... (hasDBExt = %d, fileExists = %d)", buf, 0x18u);
            }

          }
        }
        v66 = -[PLSQLiteConnection initWithFilePath:withFlags:]([PLSQLiteConnection alloc], "initWithFilePath:withFlags:", v51, &unk_1E6AF5EA0);
        connection = v2->_connection;
        v2->_connection = v66;

        PLLogCommon();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          -[PLCoreStorage init].cold.2((id *)&v2->_connection, v63);
      }
      else
      {
        v62 = [PLSQLiteConnection alloc];
        +[PLUtilities containerPath](PLUtilities, "containerPath");
        v51 = objc_claimAutoreleasedReturnValue();
        -[NSObject stringByAppendingString:](v51, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = -[PLSQLiteConnection initWithFilePath:](v62, "initWithFilePath:", v63);
        v65 = v2->_connection;
        v2->_connection = (PLSQLiteConnection *)v64;

      }
      if (!v2->_connection)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no connection to DB"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "lastPathComponent");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage init]");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v68, v70, v71, 240);

        PLLogCommon();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 101);
      }
    }
    v73 = objc_opt_new();
    safeCopyInProgress = v2->_safeCopyInProgress;
    v2->_safeCopyInProgress = (NSMutableSet *)v73;

    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_70);

  }
  return v2;
}

BOOL __21__PLCoreStorage_init__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled_0 = result;
  return result;
}

uint64_t __21__PLCoreStorage_init__block_invoke_48(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v5[16];
  uint8_t buf[16];

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v2, OS_LOG_TYPE_DEFAULT, "KEYBAG: Unlock notification!", buf, 2u);
  }

  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "KEYBAG: Logging pre unlock state", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logPreUnlockState:", 0);
  return +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 1);
}

void __21__PLCoreStorage_init__block_invoke_69()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6ABABB0;
  v2[1] = &unk_1E6ABABC8;
  v3[0] = CFSTR("BLOB");
  v3[1] = CFSTR("INTEGER");
  v2[2] = &unk_1E6ABABE0;
  v2[3] = &unk_1E6ABABF8;
  v3[2] = CFSTR("TEXT");
  v3[3] = CFSTR("REAL");
  v2[4] = &unk_1E6ABAC10;
  v2[5] = &unk_1E6ABAC28;
  v3[4] = CFSTR("INTEGER");
  v3[5] = CFSTR("INTEGER");
  v2[6] = &unk_1E6ABAC40;
  v2[7] = &unk_1E6ABAC58;
  v3[6] = CFSTR("INTEGER");
  v3[7] = CFSTR("REAL");
  v2[8] = &unk_1E6ABAC70;
  v3[8] = CFSTR("BLOB");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PLVTypeToPLSQLiteType;
  PLVTypeToPLSQLiteType = v0;

}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  objc_super v6;

  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    +[PLArchiveManager sharedInstance](PLArchiveManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", 0);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)PLCoreStorage;
  -[PLCoreStorage dealloc](&v6, sel_dealloc);
}

- (void)setupStorageVersions
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storageLocked");

  if ((v5 & 1) == 0 && !+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    -[PLCoreStorage connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "tableExistsForTableName:", CFSTR("PLCoreStorage_schemaVersions"));

    if ((v7 & 1) != 0)
    {
      if (-[PLCoreStorage verifySchemaVersionOfTable:matchesExpectedVersion:](self, "verifySchemaVersionOfTable:matchesExpectedVersion:", CFSTR("PLCoreStorage_schemaVersions"), 1.08))
      {
        -[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:](self, "handleSchemaMismatchForTable:expectedVersion:schemaMatch:", CFSTR("PLCoreStorage_schemaVersions"), 2, 1.08);
      }
    }
    else
    {
      v16[0] = CFSTR("column-name");
      v16[1] = CFSTR("type");
      v17[0] = CFSTR("tableName");
      v17[1] = CFSTR("TEXT");
      v18[0] = &unk_1E6AF6D50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v8;
      v14[0] = CFSTR("column-name");
      v14[1] = CFSTR("type");
      v15[0] = CFSTR("schemaVersion");
      v15[1] = CFSTR("REAL");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLCoreStorage connection](self, "connection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "createTableName:withColumns:", CFSTR("PLCoreStorage_schemaVersions"), v10);

      -[PLCoreStorage connection](self, "connection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSchemaVersion:forTableName:", CFSTR("PLCoreStorage_schemaVersions"), 1.08);

      -[PLCoreStorage connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createIndexOnTable:forColumn:", CFSTR("PLCoreStorage_schemaVersions"), CFSTR("tableName"));

    }
  }
}

- (void)startStorage
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  PLKQueue *v16;
  __CFString *v17;
  void *v18;
  PLKQueue *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  char v23;
  _QWORD block[5];

  if (+[PLUtilities PreUnlockTelemetryEnabled](PLUtilities, "PreUnlockTelemetryEnabled")
    || (+[PowerlogCore sharedCore](PowerlogCore, "sharedCore"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "storage"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "storageLocked"),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    v6 = (void *)MEMORY[0x1BCC9E9B4]();
    -[PLCoreStorage setupStorageVersions](self, "setupStorageVersions");
    +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__PLCoreStorage_startStorage__block_invoke;
    block[3] = &unk_1E6A52050;
    block[4] = self;
    dispatch_async_and_wait(v7, block);

    +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoreStorage storageOperator](self, "storageOperator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStorageOperator:", v10);

    +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "initializeTimeOffsets");

    if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd")
      && !+[PLUtilities shouldLogPreUnlockTelemetry](PLUtilities, "shouldLogPreUnlockTelemetry"))
    {
      -[PLCoreStorage cleanupTmp](self, "cleanupTmp");
      -[PLCoreStorage removeOldPowerlogFiles](self, "removeOldPowerlogFiles");
      if (+[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("removedIDIndex"), 0))
      {
        -[PLCoreStorage connection](self, "connection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeIDIndexes");

        +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", MEMORY[0x1E0C9AAB0], CFSTR("removedIDIndex"), 1);
      }
      -[PLCoreStorage registerDailyTasks](self, "registerDailyTasks");
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(PLD_ManagedPreferencePath, "stringByAppendingString:", CFSTR("/com.apple.powerlogd.plist"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

      v16 = [PLKQueue alloc];
      v17 = PLD_ManagedPreferencePath;
      +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("profileDefaultsKQueue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      v22[1] = 3221225472;
      v22[2] = __29__PLCoreStorage_startStorage__block_invoke_2;
      v22[3] = &unk_1E6A534F0;
      v23 = v15;
      v22[4] = self;
      v19 = -[PLKQueue initWithPath:withDispatchQueue:withBlock:](v16, "initWithPath:withDispatchQueue:withBlock:", v17, v18, v22);

      -[PLCoreStorage setProfileDefaultsKQueue:](self, "setProfileDefaultsKQueue:", v19);
      -[PLCoreStorage profileDefaultsKQueue](self, "profileDefaultsKQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setEnabled:", 1);

      -[PLCoreStorage addAggdModeKeys](self, "addAggdModeKeys");
      +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLDefaults registerEPLNotificationWithQueue:](PLDefaults, "registerEPLNotificationWithQueue:", v21);

    }
    objc_autoreleasePoolPop(v6);
  }
}

void __29__PLCoreStorage_startStorage__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[PLEntryKey setupEntryObjectsForOperatorClass:](PLEntryKey, "setupEntryObjectsForOperatorClass:", objc_opt_class());
  +[PLOperator operator](PLStorageOperator, "operator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStorageOperator:", v2);

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "storageOperator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupStorageForOperator:", v4);

}

void __29__PLCoreStorage_startStorage__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  __CFString *v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PLD_ManagedPreferencePath, "stringByAppendingString:", CFSTR("/com.apple.powerlogd.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (*(unsigned __int8 *)(a1 + 40) != v4)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v5 = objc_opt_class();
      v12 = MEMORY[0x1E0C809B0];
      v14 = __29__PLCoreStorage_startStorage__block_invoke_3;
      v15 = &unk_1E6A52828;
      v13 = 3221225472;
      v16 = CFSTR("profileDefaults");
      v17 = v5;
      if (kPLTaskingEndNotification_block_invoke_defaultOnce != -1)
        dispatch_once(&kPLTaskingEndNotification_block_invoke_defaultOnce, &v12);
      v6 = kPLTaskingEndNotification_block_invoke_classDebugEnabled;

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** WARNING *** SystemDebugProfile installed/uninstalled, bouncing powerlogd"), v12, v13, v14, v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage startStorage]_block_invoke_2");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 345);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 3, v12, v13, v14, v15);
  }
}

BOOL __29__PLCoreStorage_startStorage__block_invoke_3(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLTaskingEndNotification_block_invoke_classDebugEnabled = result;
  return result;
}

- (void)addAggdModeKeys
{
  PLADClientAddValueForScalarKey(CFSTR("com.apple.powerlog.fullMode"), +[PLDefaults fullMode](PLDefaults, "fullMode"));
  if (+[PLDefaults fullMode](PLDefaults, "fullMode"))
    AnalyticsSendEventLazy();
  PLADClientAddValueForScalarKey(CFSTR("com.apple.powerlog.liteMode"), +[PLDefaults liteMode](PLDefaults, "liteMode"));
  if (+[PLDefaults liteMode](PLDefaults, "liteMode"))
    AnalyticsSendEventLazy();
  PLADClientAddValueForScalarKey(CFSTR("com.apple.powerlog.taskMode"), +[PLDefaults taskMode](PLDefaults, "taskMode"));
  if (+[PLDefaults taskMode](PLDefaults, "taskMode"))
    AnalyticsSendEventLazy();
}

void *__32__PLCoreStorage_addAggdModeKeys__block_invoke()
{
  return &unk_1E6AF6D78;
}

void *__32__PLCoreStorage_addAggdModeKeys__block_invoke_2()
{
  return &unk_1E6AF6DA0;
}

void *__32__PLCoreStorage_addAggdModeKeys__block_invoke_3()
{
  return &unk_1E6AF6DC8;
}

- (void)stopStorage
{
  void *v3;
  void *v4;

  +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopDRTasking");

  +[PLRapidController sharedInstance](PLRapidController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopDRTasking");

  -[PLCoreStorage blockingFlushCachesWithReason:](self, "blockingFlushCachesWithReason:", CFSTR("stopStorage"));
}

- (void)configureCacheFlush
{
  PLCFNotificationOperatorComposition *v3;
  void *v4;
  uint64_t v5;
  PLCFNotificationOperatorComposition *v6;
  PLCFNotificationOperatorComposition *v7;
  void *v8;
  PLCFNotificationOperatorComposition *v9;
  PLXPCResponderOperatorComposition *v10;
  OS_dispatch_queue *backgroundQueue;
  PLXPCResponderOperatorComposition *v12;
  PLTimer *v13;
  void *v14;
  double v15;
  void *v16;
  PLTimer *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  v3 = [PLCFNotificationOperatorComposition alloc];
  +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke;
  v21[3] = &unk_1E6A52118;
  v21[4] = self;
  v6 = -[PLCFNotificationOperatorComposition initWithWorkQueue:forNotification:requireState:withBlock:](v3, "initWithWorkQueue:forNotification:requireState:withBlock:", v4, CFSTR("com.apple.powerlogd.flushCaches"), 0, v21);

  -[PLCoreStorage setFlushCachesCFNotification:](self, "setFlushCachesCFNotification:", v6);
  v7 = [PLCFNotificationOperatorComposition alloc];
  +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke_2;
  v20[3] = &unk_1E6A52118;
  v20[4] = self;
  v9 = -[PLCFNotificationOperatorComposition initWithWorkQueue:forNotification:requireState:withBlock:](v7, "initWithWorkQueue:forNotification:requireState:withBlock:", v8, CFSTR("com.apple.powerlogd.blockingFlushCaches"), 0, v20);

  -[PLCoreStorage setBlockingFlushCachesCFNotification:](self, "setBlockingFlushCachesCFNotification:", v9);
  v10 = [PLXPCResponderOperatorComposition alloc];
  backgroundQueue = self->_backgroundQueue;
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke_3;
  v19[3] = &unk_1E6A53598;
  v19[4] = self;
  v12 = -[PLXPCResponderOperatorComposition initWithWorkQueue:withRegistration:withBlock:](v10, "initWithWorkQueue:withRegistration:withBlock:", backgroundQueue, &unk_1E6AF6DF0, v19);
  -[PLCoreStorage setXPCFlushCacheResponder:](self, "setXPCFlushCacheResponder:", v12);
  if (+[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("CacheFlushTimerEnabled"), 1))
  {
    v13 = [PLTimer alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (double)+[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("flushCachesInterval"), 900);
    +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("CacheFlushTimer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke_4;
    v18[3] = &unk_1E6A535C0;
    v18[4] = self;
    v17 = -[PLTimer initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:](v13, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v14, 1, 0, v16, v18, v15, 0.0);

    -[PLCoreStorage setFlushCachesTimer:](self, "setFlushCachesTimer:", v17);
  }

}

uint64_t __36__PLCoreStorage_configureCacheFlush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flushCachesWithReason:", CFSTR("CFNotification"));
}

void __36__PLCoreStorage_configureCacheFlush__block_invoke_2(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(*(id *)(a1 + 32), "blockingFlushCachesWithReason:", CFSTR("CFNotification"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.powerlogd.blockingFlushCaches.complete"), 0, 0, 4u);
}

void *__36__PLCoreStorage_configureCacheFlush__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "blockingFlushCachesWithReason:", CFSTR("XPCFlushCacheResponder"));
  return &unk_1E6AF6E18;
}

void __36__PLCoreStorage_configureCacheFlush__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PLCoreStorage_configureCacheFlush__block_invoke_5;
  block[3] = &unk_1E6A52050;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __36__PLCoreStorage_configureCacheFlush__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flushCachesWithReason:", CFSTR("Timer"));
}

- (void)initOperatorDependancies
{
  NSObject *v3;
  PLXPCResponderOperatorComposition *v4;
  PLXPCResponderOperatorComposition *v5;
  PLXPCResponderOperatorComposition *v6;
  PLXPCResponderOperatorComposition *v7;
  PLXPCResponderOperatorComposition *v8;
  PLXPCResponderOperatorComposition *v9;
  PLXPCResponderOperatorComposition *v10;
  OS_dispatch_queue *backgroundQueue;
  PLXPCResponderOperatorComposition *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  BOOL v17;
  __CFString **v18;
  _BOOL4 v19;
  __CFString **v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  char v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  __CFString *v56;
  void *v57;
  id v58;
  _QWORD v59[5];
  uint8_t buf[16];
  _QWORD v61[6];
  _QWORD v62[8];

  v62[6] = *MEMORY[0x1E0C80C00];
  -[PLCoreStorage setStorageReady:](self, "setStorageReady:", 1);
  if (+[PLUtilities shouldLogPreUnlockTelemetry](PLUtilities, "shouldLogPreUnlockTelemetry"))
  {
    PLLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "KEYBAG: Logging pre unlock state", buf, 2u);
    }

    -[PLCoreStorage logPreUnlockState:](self, "logPreUnlockState:", 1);
    -[PLCoreStorage configureCacheFlush](self, "configureCacheFlush");
    return;
  }
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    -[PLCoreStorage removeErroneousQualificationEntries](self, "removeErroneousQualificationEntries");
    v4 = -[PLXPCResponderOperatorComposition initWithWorkQueue:withRegistration:withBlock:]([PLXPCResponderOperatorComposition alloc], "initWithWorkQueue:withRegistration:withBlock:", self->_backgroundQueue, &unk_1E6AF6E40, &__block_literal_global_193_0);
    -[PLCoreStorage setSafeFileResponder:](self, "setSafeFileResponder:", v4);
    v5 = -[PLXPCResponderOperatorComposition initWithWorkQueue:withRegistration:withBlock:]([PLXPCResponderOperatorComposition alloc], "initWithWorkQueue:withRegistration:withBlock:", self->_backgroundQueue, &unk_1E6AF6E68, &__block_literal_global_216);
    -[PLCoreStorage setBlPathResponder:](self, "setBlPathResponder:", v5);
    v6 = -[PLXPCResponderOperatorComposition initWithWorkQueue:withRegistration:withBlock:]([PLXPCResponderOperatorComposition alloc], "initWithWorkQueue:withRegistration:withBlock:", self->_backgroundQueue, &unk_1E6AF6E90, &__block_literal_global_222);
    -[PLCoreStorage setArchivesResponder:](self, "setArchivesResponder:", v6);
    v7 = -[PLXPCResponderOperatorComposition initWithWorkQueue:withRegistration:withBlock:]([PLXPCResponderOperatorComposition alloc], "initWithWorkQueue:withRegistration:withBlock:", self->_backgroundQueue, &unk_1E6AF6EB8, &__block_literal_global_230);
    -[PLCoreStorage setQuarantineResponder:](self, "setQuarantineResponder:", v7);
    v8 = -[PLXPCResponderOperatorComposition initWithWorkQueue:withRegistration:withBlock:]([PLXPCResponderOperatorComposition alloc], "initWithWorkQueue:withRegistration:withBlock:", self->_backgroundQueue, &unk_1E6AF6EE0, &__block_literal_global_238);
    -[PLCoreStorage setQuarantineCopyResponder:](self, "setQuarantineCopyResponder:", v8);
    v9 = -[PLXPCResponderOperatorComposition initWithWorkQueue:withRegistration:withBlock:]([PLXPCResponderOperatorComposition alloc], "initWithWorkQueue:withRegistration:withBlock:", self->_backgroundQueue, &unk_1E6AF6F08, &__block_literal_global_244);
    -[PLCoreStorage setBatteryUIPlistsResponder:](self, "setBatteryUIPlistsResponder:", v9);
    v10 = [PLXPCResponderOperatorComposition alloc];
    backgroundQueue = self->_backgroundQueue;
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __41__PLCoreStorage_initOperatorDependancies__block_invoke_7;
    v59[3] = &unk_1E6A53598;
    v59[4] = self;
    v12 = -[PLXPCResponderOperatorComposition initWithWorkQueue:withRegistration:withBlock:](v10, "initWithWorkQueue:withRegistration:withBlock:", backgroundQueue, &unk_1E6AF6F30, v59);
    -[PLCoreStorage setUpgradeLogsResponder:](self, "setUpgradeLogsResponder:", v12);
    +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoreStorage storageOperator](self, "storageOperator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStorageOperator:", v14);

    +[PLArchiveManager sharedInstance](PLArchiveManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", 1);

  }
  v16 = -[PLCoreStorage storageLocked](self, "storageLocked");
  v17 = +[PLDefaults fullMode](PLDefaults, "fullMode");
  if (!v16)
  {
    if (v17)
    {
      v18 = kPLStorageModeFull;
      goto LABEL_16;
    }
    v19 = +[PLDefaults taskMode](PLDefaults, "taskMode");
    v18 = kPLStorageModeLite;
    v20 = kPLStorageModeTask;
LABEL_14:
    if (v19)
      v18 = v20;
    goto LABEL_16;
  }
  if (!v17)
  {
    v19 = +[PLDefaults taskMode](PLDefaults, "taskMode");
    v18 = kPLStorageModeLockedLite;
    v20 = kPLStorageModeLockedTask;
    goto LABEL_14;
  }
  v18 = kPLStorageModeLockedFull;
LABEL_16:
  v21 = *v18;
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    if (+[PLDefaults objectExistsForKey:](PLDefaults, "objectExistsForKey:", CFSTR("PLUUID")))
    {
      +[PLDefaults objectForKey:synchronize:](PLDefaults, "objectForKey:synchronize:", CFSTR("PLUUID"), 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCoreStorage setUuid:](self, "setUuid:", v22);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCoreStorage setUuid:](self, "setUuid:", v24);

      -[PLCoreStorage uuid](self, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v22, CFSTR("PLUUID"), 1);
    }

    v25 = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("PLExitReasonKey"), -1);
    +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("PLExitReasonKey"), 1);
    -[PLCoreStorage storageOperator](self, "storageOperator");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = CFSTR("Mode");
    v61[1] = CFSTR("Version");
    v56 = v21;
    v62[0] = v21;
    v62[1] = &unk_1E6ABEE60;
    v61[2] = CFSTR("PID");
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithInt:", objc_msgSend(v27, "processIdentifier"));
    v28 = (void *)0x1E0CB3000;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v29;
    v61[3] = CFSTR("ProcessName");
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "processName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v31;
    v61[4] = CFSTR("ExitReason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v32;
    v61[5] = CFSTR("DefaultsEnabled");
    v33 = +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("logDefaultsToDB"), 0);
    if (v33)
    {
      +[PLDefaults allDefaultsEnabled](PLDefaults, "allDefaultsEnabled");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "description");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v62[5] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "logEventForwardConfiguration:", v35);

    if (v33)
    {

      v34 = v28;
    }

    +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "taskingModeSafeguard");

    +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "taskingModeSetup");

    v21 = v56;
  }
  +[PLRapidController sharedInstance](PLRapidController, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "registerDataCollectionActivity");

  if (+[PLPlatform internalBuild](PLPlatform, "internalBuild")
    && _os_feature_enabled_impl())
  {
    +[PPSSafeguardController sharedInstance](PPSSafeguardController, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "registerDataCollectionActivity");

  }
  -[PLCoreStorage configureCacheFlush](self, "configureCacheFlush");
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "registerUserSwitchStakeHolder:", self);

  }
  v41 = (void *)MEMORY[0x1BCC9E9B4]();
  v42 = (void *)MEMORY[0x1E0C99E98];
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "fileURLWithPath:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *MEMORY[0x1E0C999D8];
  v58 = 0;
  v47 = objc_msgSend(v44, "setResourceValue:forKey:error:", v45, v46, &v58);
  v48 = v58;

  if ((v47 & 1) == 0)
  {
    v49 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v44, "lastPathComponent");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "stringWithFormat:", CFSTR("Error excluding %@ from backup %@"), v50, v48);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "lastPathComponent");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage initOperatorDependancies]");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v53, v54, 755);

    PLLogCommon();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  objc_autoreleasePoolPop(v41);

}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _UNKNOWN **v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received safe log file request from %d, %@"), a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage initOperatorDependancies]_block_invoke");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 452);

  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v70 = v8;
    _os_log_impl(&dword_1B6AB6000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v13 = (void *)objc_msgSend(v7, "mutableCopy");
  +[PLFileStats logStartDate](PLFileStats, "logStartDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertFromMonotonicToSystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLFileStats logEndDate](PLFileStats, "logEndDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertFromMonotonicToSystem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("clean"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("folder"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v58 = v7;
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("folder"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      buf[0] = 0;
      if (objc_msgSend(v22, "fileExistsAtPath:isDirectory:", v21, buf) && buf[0])
      {
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        objc_msgSend(v22, "contentsOfDirectoryAtPath:error:", v21, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v61 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(v21, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "removeItemAtPath:error:", v28, 0);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
          }
          while (v25);
        }

      }
      v66[0] = CFSTR("path");
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("folder"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v29;
      v66[1] = CFSTR("startDate");
      v30 = v15;
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v67[1] = v30;
      v66[2] = CFSTR("endDate");
      v31 = v17;
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v67[2] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if (v15)
        {
LABEL_21:

          v7 = v58;
          goto LABEL_34;
        }
      }
      else
      {

        if (v15)
          goto LABEL_21;
      }

      goto LABEL_21;
    }
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("path"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = &off_1E6A51000;
  if (v33)
  {
    +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "generatePLLSubmissionWithPayload:", v13);
LABEL_24:

    goto LABEL_28;
  }
  v59 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "filenameDateStringWithStartDate:endDate:", v15, v17);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("folder"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", CFSTR("/tmp/powerlog/"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("/tmp/powerlog/"), CFSTR("folder"));
  }
  v38 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("folder"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities shortUUIDString](PLUtilities, "shortUUIDString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("%@powerlog_%@_%@.PLSQL"), v39, v36, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v41, CFSTR("path"));

  +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "generatePLLSubmissionWithPayload:", v13);

  v7 = v59;
  if (!v37)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("path"));
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v47, "lastPathComponent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("path"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingString:", v35);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v47) = +[PLUtilities moveItemAtPath:toPath:withName:error:](PLUtilities, "moveItemAtPath:toPath:withName:error:", v48, v49, v35, 0);

    if ((v47 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("path"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("path"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "lastPathComponent");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingString:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "moveItemAtPath:toPath:error:", v51, v54, 0);

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("path"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "lastPathComponent");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingString:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v57, CFSTR("path"));

    v7 = v59;
    v34 = &off_1E6A51000;
    goto LABEL_24;
  }
LABEL_28:
  v43 = v34[72];
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("path"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "markFileAsPurgeable:withUrgency:", v44, 32);

  v64[0] = CFSTR("path");
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("path"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v21;
  v64[1] = CFSTR("startDate");
  v22 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v65[1] = v22;
  v64[2] = CFSTR("endDate");
  v45 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v65[2] = v45;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

    if (v15)
      goto LABEL_35;
    goto LABEL_34;
  }
  if (!v15)
LABEL_34:

LABEL_35:
  return v32;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_215()
{
  void *v0;
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("BLPath");
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingString:", CFSTR("/Library/BatteryLife/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id obj;
  id obja;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  const __CFString *v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a5, "mutableCopy");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("folder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v6;
  if (!v6)
  {
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", CFSTR("/tmp/powerlog/"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("/tmp/powerlog/"), CFSTR("folder"));
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  +[PLArchiveManager archiveEntriesFinished](PLArchiveManager, "archiveEntriesFinished");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("disallow_resyncs"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "BOOLValue"))
        {

LABEL_12:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("folder"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "compressedPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByAppendingString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "compressedPath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "copyItemAtPath:toPath:error:", v19, v17, 0);

          +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v17, 32);
          objc_msgSend(v11, "setSyncedOffDate:", v37);

          continue;
        }
        v13 = objc_msgSend(v11, "syncedOff");

        if ((v13 & 1) == 0)
          goto LABEL_12;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v8);
  }

  if (!v34)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    +[PLArchiveManager allArchivePaths](PLArchiveManager, "allArchivePaths");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(obja);
          v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("folder"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringByAppendingString:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v26) = objc_msgSend(v28, "fileExistsAtPath:", v27);

          if ((_DWORD)v26)
          {
            objc_msgSend(v24, "lastPathComponent");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingString:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLUtilities moveItemAtPath:toPath:withName:error:](PLUtilities, "moveItemAtPath:toPath:withName:error:", v27, v30, v29, 0);
            +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v30, 32);

          }
        }
        v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v21);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("/var/mobile/Library/Logs/CrashReporter/"), CFSTR("folder"));
  }
  v46 = CFSTR("folder");
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  const __CFString *v35;
  __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a5;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &off_1E6A51000;
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v11)
  {
    v12 = v11;
    v30 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v30)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v7[72], "containerPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAppendingString:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("folder"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("folder"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingString:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("folder"));
          v22 = v7;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByAppendingString:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "moveItemAtPath:toPath:error:", v17, v24, 0);

          v7 = v22;
        }
        else
        {
          objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingString:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7[72], "moveItemAtPath:toPath:withName:error:", v17, v20, v14, 0);
        }
        objc_msgSend(v7[72], "markFileAsPurgeable:withUrgency:", v20, 32);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v12);
  }

  v35 = CFSTR("folder");
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("folder"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = CFSTR("/var/mobile/Library/Logs/CrashReporter/");
  }
  v36 = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)

  return v27;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("folder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("folder"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("/var/mobile/Library/Logs/CrashReporter/");
  }

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities PLCopyItemsFromPath:toPath:](PLUtilities, "PLCopyItemsFromPath:toPath:", v9, v7);

  v12 = CFSTR("folder");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("folder")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Debug/"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("folder"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentsOfDirectoryAtPath:error:", v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __41__PLCoreStorage_initOperatorDependancies__block_invoke_6;
    v26 = &unk_1E6A536C8;
    v27 = v13;
    v28 = v14;
    v29 = v15;
    v17 = v15;
    v18 = v14;
    v19 = v13;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v23);
    v30 = CFSTR("folder");
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("folder"), v23, v24, v25, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v21;
}

void __41__PLCoreStorage_initOperatorDependancies__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "copyItemAtPath:toPath:error:", v6, v5, 0);
  +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v5, 32);

}

id __41__PLCoreStorage_initOperatorDependancies__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a5, "mutableCopy");
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __41__PLCoreStorage_initOperatorDependancies__block_invoke_7_cold_1((uint64_t)v6, v7, v8);

  if (v6
    && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("folder")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = *(void **)(a1 + 32);
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MajorVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("folder"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "copyUpgradePowerlogsAtPath:toPath:", v12, v13);

    v14 = *(void **)(a1 + 32);
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MinorVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("folder"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "copyUpgradePowerlogsAtPath:toPath:", v16, v17);

    v21 = CFSTR("folder");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("folder"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v19;
}

- (void)copyUpgradePowerlogsAtPath:(id)a3 toPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v5, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke;
  v12[3] = &unk_1E6A536C8;
  v13 = v5;
  v14 = v7;
  v15 = v6;
  v8 = v6;
  v9 = v7;
  v10 = v5;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

void __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(a1[4], "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "contentsOfDirectoryAtPath:error:", v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke_2;
  v8[3] = &unk_1E6A536C8;
  v9 = v4;
  v10 = v3;
  v11 = a1[6];
  v5 = v3;
  v6 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), CFSTR("UpgradeLogs"), *(_QWORD *)(a1 + 40), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke_2_cold_1();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = objc_msgSend(v9, "copyItemAtPath:toPath:error:", v5, v7, &v13);
  v11 = v13;

  if ((v10 & 1) != 0)
  {
    +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v7, 32);
  }
  else
  {
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v11;
      _os_log_error_impl(&dword_1B6AB6000, v12, OS_LOG_TYPE_ERROR, "Failed to copy upgrade logs at path: %@ to path: %@ with error: %@", buf, 0x20u);
    }

  }
}

- (void)removeOldPowerlogFiles
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/BatteryLife"), 0);

}

- (void)registerDailyTasks
{
  double v3;
  double v4;
  _BOOL4 v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PLTimer *v13;
  void *v14;
  OS_dispatch_queue *v15;
  PLNSNotificationOperatorComposition *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  PLNSNotificationOperatorComposition *v24;
  OS_dispatch_queue *utilityQueue;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[4];
  __CFString *v29;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD block[4];
  __CFString *v33;
  uint64_t v34;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("dbDailyTasksInterval"), -1.0);
  v4 = v3;
  v5 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v4 <= 0.0)
  {
    v17 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __35__PLCoreStorage_registerDailyTasks__block_invoke_289;
      v28[3] = &unk_1E6A52828;
      v29 = CFSTR("DailyTasks");
      v30 = objc_opt_class();
      if (registerDailyTasks_defaultOnce_287 != -1)
        dispatch_once(&registerDailyTasks_defaultOnce_287, v28);
      v18 = registerDailyTasks_classDebugEnabled_288;

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting up dailyTaskNotification dbDailyTasksInterval=%f"), *(_QWORD *)&v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage registerDailyTasks]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v21, v22, 807);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v24 = [PLNSNotificationOperatorComposition alloc];
    utilityQueue = self->_utilityQueue;
    v26 = *MEMORY[0x1E0C99690];
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __35__PLCoreStorage_registerDailyTasks__block_invoke_293;
    v27[3] = &unk_1E6A52118;
    v27[4] = self;
    v16 = -[PLNSNotificationOperatorComposition initWithWorkQueue:forNotification:withBlock:](v24, "initWithWorkQueue:forNotification:withBlock:", utilityQueue, v26, v27);
    -[PLCoreStorage setDailyTaskNotification:](self, "setDailyTaskNotification:", v16);
  }
  else
  {
    if (v5)
    {
      v6 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __35__PLCoreStorage_registerDailyTasks__block_invoke;
      block[3] = &unk_1E6A52828;
      block[1] = 3221225472;
      v33 = CFSTR("DailyTasks");
      v34 = v6;
      if (registerDailyTasks_defaultOnce != -1)
        dispatch_once(&registerDailyTasks_defaultOnce, block);
      v7 = registerDailyTasks_classDebugEnabled;

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting up dailyTaskTimer with dbDailyTasksInterval=%f"), *(_QWORD *)&v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage registerDailyTasks]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 798);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v13 = [PLTimer alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_utilityQueue;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __35__PLCoreStorage_registerDailyTasks__block_invoke_284;
    v31[3] = &unk_1E6A535C0;
    v31[4] = self;
    v16 = -[PLTimer initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:](v13, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v14, 1, 0, v15, v31, v4, 0.0);

    -[PLCoreStorage setDailyTaskTimer:](self, "setDailyTaskTimer:", v16);
  }

}

BOOL __35__PLCoreStorage_registerDailyTasks__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  registerDailyTasks_classDebugEnabled = result;
  return result;
}

uint64_t __35__PLCoreStorage_registerDailyTasks__block_invoke_284(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  BOOL (*v12)(uint64_t);
  void *v13;
  __CFString *v14;
  uint64_t v15;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    v10 = MEMORY[0x1E0C809B0];
    v12 = __35__PLCoreStorage_registerDailyTasks__block_invoke_2;
    v13 = &unk_1E6A52828;
    v11 = 3221225472;
    v14 = CFSTR("DailyTasks");
    v15 = v2;
    if (kPLTaskingEndNotification_block_invoke_2_defaultOnce != -1)
      dispatch_once(&kPLTaskingEndNotification_block_invoke_2_defaultOnce, &v10);
    v3 = kPLTaskingEndNotification_block_invoke_2_classDebugEnabled;

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DailyTasks timer!"), v10, v11, v12, v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage registerDailyTasks]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 801);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dailyTasks", v10, v11, v12, v13);
}

BOOL __35__PLCoreStorage_registerDailyTasks__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLTaskingEndNotification_block_invoke_2_classDebugEnabled = result;
  return result;
}

BOOL __35__PLCoreStorage_registerDailyTasks__block_invoke_289(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  registerDailyTasks_classDebugEnabled_288 = result;
  return result;
}

uint64_t __35__PLCoreStorage_registerDailyTasks__block_invoke_293(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  BOOL (*v12)(uint64_t);
  void *v13;
  __CFString *v14;
  uint64_t v15;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    v10 = MEMORY[0x1E0C809B0];
    v12 = __35__PLCoreStorage_registerDailyTasks__block_invoke_2_294;
    v13 = &unk_1E6A52828;
    v11 = 3221225472;
    v14 = CFSTR("DailyTasks");
    v15 = v2;
    if (kPLTaskingEndNotification_block_invoke_3_defaultOnce != -1)
      dispatch_once(&kPLTaskingEndNotification_block_invoke_3_defaultOnce, &v10);
    v3 = kPLTaskingEndNotification_block_invoke_3_classDebugEnabled;

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DailyTasks notification!"), v10, v11, v12, v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage registerDailyTasks]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 810);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dailyTasks", v10, v11, v12, v13);
}

BOOL __35__PLCoreStorage_registerDailyTasks__block_invoke_2_294(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLTaskingEndNotification_block_invoke_3_classDebugEnabled = result;
  return result;
}

- (void)dailyTasks
{
  NSObject *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  __CFString *v17;
  id v18;
  uint8_t buf[16];

  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "DailyTasks fire!", buf, 2u);
  }

  -[PLCoreStorage connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEmptyOldTables");

  -[PLCoreStorage cleanupTmp](self, "cleanupTmp");
  -[PLCoreStorage cleanupQuarantine](self, "cleanupQuarantine");
  +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateOTASubmissionAndSendTaskingEndSubmission:", 1);

  v6 = +[PLDefaults fullMode](PLDefaults, "fullMode");
  v7 = CFSTR("com.apple.powerlogd.litemodesize");
  if (v6)
    v7 = CFSTR("com.apple.powerlogd.fullmodesize");
  v8 = v7;
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLADClientAddValueForScalarKey(v8, +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v10));

  v11 = +[PLDefaults fullMode](PLDefaults, "fullMode");
  v12 = CFSTR("litemode");
  if (v11)
    v12 = CFSTR("fullmode");
  v13 = v12;
  AnalyticsSendEventLazy();
  +[PLArchiveManager lastArchivePath](PLArchiveManager, "lastArchivePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    PLADClientAddValueForScalarKey(-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR(".compressed")), +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v14));
    v17 = v13;
    v18 = v14;
    AnalyticsSendEventLazy();

  }
  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_DEFAULT, "DailyTasks reporting perf stats to CA", buf, 2u);
  }

  -[PLCoreStorage reportPerfStats](self, "reportPerfStats");
  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_DEFAULT, "DailyTasks done!", buf, 2u);
  }

}

id __27__PLCoreStorage_dailyTasks__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = *(_QWORD *)(a1 + 32);
  v7[0] = CFSTR("mode");
  v7[1] = CFSTR("size");
  v1 = (void *)MEMORY[0x1E0CB37E8];
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = CFSTR("compressed");
  v8[1] = v4;
  v8[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __27__PLCoreStorage_dailyTasks__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v6[0] = *(_QWORD *)(a1 + 32);
  v5[0] = CFSTR("mode");
  v5[1] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v1));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = CFSTR("compressed");
  v6[1] = v2;
  v6[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)applyContainerPOSIXPermissions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Applying container permissions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

id __47__PLCoreStorage_applyContainerPOSIXPermissions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("DidSetPermissions"));

  return v2;
}

- (void)reportPerfStats
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __int128 v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = objc_msgSend(&unk_1E6AF5EB8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v14;
    *(_QWORD *)&v3 = 138412290;
    v11 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(&unk_1E6AF5EB8);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        +[PLUtilities getPerfStatsForProcess:](PLUtilities, "getPerfStatsForProcess:", v7, v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v12 = v8;
          AnalyticsSendEventLazy();
          v10 = v12;
        }
        else
        {
          PLLogCommon();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v11;
            v18 = v7;
            _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_INFO, "DailyTasks perf stats not available for %@", buf, 0xCu);
          }
        }

      }
      v4 = objc_msgSend(&unk_1E6AF5EB8, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v4);
  }
}

id __32__PLCoreStorage_reportPerfStats__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)cleanupTmp
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v42;
  id v43;
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v3, &v58);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v58;

  v43 = (id)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v55;
    v40 = *MEMORY[0x1E0CB2A38];
    v9 = CFSTR(".PLSQL");
    do
    {
      v10 = 0;
      v46 = v7;
      do
      {
        if (*(_QWORD *)v55 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
        if ((objc_msgSend(v11, "hasSuffix:", v9) & 1) != 0
          || (objc_msgSend(v11, "hasSuffix:", CFSTR(".PLSQL-shm")) & 1) != 0
          || objc_msgSend(v11, "hasSuffix:", CFSTR(".PLSQL-wal")))
        {
          if (objc_msgSend(v11, "hasPrefix:", CFSTR("PLSafeFileInprogress_")))
          {
            objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PLSafeFileInprogress_"), &stru_1E6A56538);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E6A56538);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            -[PLCoreStorage safeCopyInProgress](self, "safeCopyInProgress");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "containsObject:", v13);

            if ((v15 & 1) == 0)
              objc_msgSend(v43, "addObject:", v11);
          }
          else
          {
            v16 = v8;
            v17 = v9;
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)MEMORY[0x1E0CB3940];
            NSTemporaryDirectory();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", CFSTR("%@/%@"), v20, v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v5;
            objc_msgSend(v18, "attributesOfItemAtPath:error:", v21, &v53);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v53;

            objc_msgSend(v13, "objectForKeyedSubscript:", v40);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "timeIntervalSinceNow");
            if (v24 < -7200.0)
              objc_msgSend(v43, "addObject:", v11);

            v5 = v22;
            v9 = v17;
            v8 = v16;
            v7 = v46;
          }

        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v7);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v44 = v43;
  v25 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v25)
  {
    v26 = v25;
    v47 = *(_QWORD *)v50;
    do
    {
      v27 = 0;
      v28 = v5;
      v42 = v26;
      do
      {
        if (*(_QWORD *)v50 != v47)
          objc_enumerationMutation(v44);
        v29 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v27);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0CB3940];
        NSTemporaryDirectory();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@/%@"), v32, v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v28;
        v34 = objc_msgSend(v30, "removeItemAtPath:error:", v33, &v48);
        v5 = v48;

        if ((v34 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to remove file %@ %@"), v29, v5);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "lastPathComponent");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage cleanupTmp]");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v37, v38, 962);

          PLLogCommon();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v35;
            _os_log_impl(&dword_1B6AB6000, v39, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }

          v26 = v42;
        }
        ++v27;
        v28 = v5;
      }
      while (v26 != v27);
      v26 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v26);
  }

}

- (void)cleanupQuarantine
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v9);
        +[PLUtilities containerPath](PLUtilities, "containerPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingString:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "attributesOfItemAtPath:error:", v13, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "fileModificationDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceDate:", v16);
        v19 = v18;

        if (v19 > 604800.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeItemAtPath:error:", v13, 0);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v7);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/Quarantine/"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentsOfDirectoryAtPath:error:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v41;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v28);
        +[PLUtilities containerPath](PLUtilities, "containerPath");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/Quarantine/"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringByAppendingString:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "attributesOfItemAtPath:error:", v32, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "fileModificationDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "timeIntervalSinceDate:", v35);
        v38 = v37;

        if (v38 > 604800.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "removeItemAtPath:error:", v32, 0);

        }
        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v26);
  }

}

- (void)handleSchemaMismatchForTable:(id)a3 expectedVersion:(double)a4 schemaMatch:(signed __int16)a5
{
  int v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  char v35;
  char v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t n;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t i;
  void *v109;
  void *v110;
  PLCoreStorage *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  PLCoreStorage *v120;
  void *v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t j;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  NSObject *v145;
  NSObject *v146;
  uint64_t v147;
  id obj;
  id obja;
  id v150;
  id v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  PLCoreStorage *v156;
  void *v157;
  void *v158;
  void *v159;
  id v160;
  id v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD block[4];
  __CFString *v175;
  uint64_t v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _QWORD v181[4];
  __CFString *v182;
  uint64_t v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  uint8_t buf[4];
  id v197;
  __int16 v198;
  double v199;
  __int16 v200;
  int v201;
  __int16 v202;
  __CFString *v203;
  _QWORD v204[3];
  _QWORD v205[3];
  _BYTE v206[128];
  _BYTE v207[128];
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _QWORD v213[3];
  _QWORD v214[6];

  v214[3] = *MEMORY[0x1E0C80C00];
  v7 = (unsigned __int16)a5;
  v8 = a3;
  -[PLCoreStorage connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "schemaVersionForTable:", v8);
  v11 = v10;

  if (v11 != a4)
  {
    -[PLCoreStorage storageOperator](self, "storageOperator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v214[0] = v8;
    v213[0] = CFSTR("TableName");
    v213[1] = CFSTR("PreviousVersion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v214[1] = v13;
    v213[2] = CFSTR("CurrentVersion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v214[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v214, v213, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logEventForwardSchemaChange:", v15);

  }
  v16 = 0;
  if (v7 <= 65533)
  {
    if (!v7)
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR! Do not call handleSchemaMismatchForTable with PLSchemaVersionSame"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "lastPathComponent");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v88, v89, 1006);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
LABEL_72:
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_73:

        v16 = 0;
        goto LABEL_113;
      }
LABEL_76:
      v16 = 0;
      goto LABEL_114;
    }
    if (v7 == 65533)
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR! Do not call handleSchemaMismatchForTable with PLSchemaVersionNone"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 1010);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          goto LABEL_72;
        goto LABEL_73;
      }
      goto LABEL_76;
    }
    goto LABEL_99;
  }
  if (v7 == 65534)
  {
    -[PLCoreStorage connection](self, "connection");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE '%@' RENAME TO 'PLOLD_%@_%f';"),
      v8,
      v8,
      *(_QWORD *)&v11);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (id)objc_msgSend(v90, "performQuery:", v91);

    -[PLCoreStorage connection](self, "connection");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v91) = objc_msgSend(v93, "tableExistsForTableName:", v8);

    if ((_DWORD)v91)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to move %@"), v8);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_103;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Dynamic"), v8);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoreStorage connection](self, "connection");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "tableExistsForTableName:", v94);

    if (!v96)
      goto LABEL_80;
    -[PLCoreStorage connection](self, "connection");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE '%@' RENAME TO 'PLOLD_%@_%f';"),
      v94,
      v94,
      *(_QWORD *)&v11);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = (id)objc_msgSend(v97, "performQuery:", v98);

    -[PLCoreStorage connection](self, "connection");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v98) = objc_msgSend(v100, "tableExistsForTableName:", v94);

    if ((_DWORD)v98)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to move %@"), v94);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v7 = 3;
    }
    else
    {
LABEL_80:
      v157 = v94;
      v152 = v8;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND name LIKE \"%@_Array_%%\" AND name NOT LIKE \"PLOLD_%@_Array_%%\";"),
        v8,
        v8);
      v101 = objc_claimAutoreleasedReturnValue();
      -[PLCoreStorage connection](self, "connection");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = (void *)v101;
      objc_msgSend(v102, "performQuery:", v101);
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      v194 = 0u;
      v195 = 0u;
      v192 = 0u;
      v193 = 0u;
      v104 = v103;
      v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v192, v212, 16);
      v161 = v104;
      if (!v105)
        goto LABEL_88;
      v106 = v105;
      v107 = *(_QWORD *)v193;
      do
      {
        for (i = 0; i != v106; ++i)
        {
          if (*(_QWORD *)v193 != v107)
            objc_enumerationMutation(v161);
          v109 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * i);
          -[PLCoreStorage connection](self, "connection");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = self;
          v112 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("name"));
          v113 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("name"));
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "stringWithFormat:", CFSTR("ALTER TABLE '%@' RENAME TO 'PLOLD_%@_%f';"),
            v113,
            v114,
            *(_QWORD *)&v11);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = (id)objc_msgSend(v110, "performQuery:", v115);

          self = v111;
          -[PLCoreStorage connection](v111, "connection");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("name"));
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v113) = objc_msgSend(v117, "tableExistsForTableName:", v118);

          if ((v113 & 1) != 0)
          {
            v136 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("name"));
            v123 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "stringWithFormat:", CFSTR("unable to move %@"), v123);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v7 = 3;
            v135 = v161;
            v134 = v161;
            v8 = v152;
            v94 = v157;
            goto LABEL_97;
          }
        }
        v104 = v161;
        v106 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v192, v212, 16);
      }
      while (v106);
LABEL_88:

        v152);
      v119 = objc_claimAutoreleasedReturnValue();
      v120 = self;
      -[PLCoreStorage connection](self, "connection");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v155 = (void *)v119;
      objc_msgSend(v121, "performQuery:", v119);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      v190 = 0u;
      v191 = 0u;
      v188 = 0u;
      v189 = 0u;
      v123 = v122;
      v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v188, v211, 16);
      if (v124)
      {
        v125 = v124;
        v126 = *(_QWORD *)v189;
        do
        {
          for (j = 0; j != v125; ++j)
          {
            if (*(_QWORD *)v189 != v126)
              objc_enumerationMutation(v123);
            v128 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * j);
            -[PLCoreStorage connection](v120, "connection");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v130 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("name"));
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "stringWithFormat:", CFSTR("DROP INDEX %@;"), v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = (id)objc_msgSend(v129, "performQuery:", v132);

          }
          v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v188, v211, 16);
        }
        while (v125);
      }

      self = v120;
      v8 = v152;
      -[PLCoreStorage setupStorageForEntryKey:](v120, "setupStorageForEntryKey:", v152);
      v16 = 0;
      v7 = 65534;
      v134 = v155;
      v94 = v157;
      v135 = v161;
LABEL_97:

    }
LABEL_99:
    if ((v7 - 1) > 2)
      goto LABEL_114;
    if (v7 == 1)
    {

      v137 = 0;
      v16 = CFSTR("Previous Version Newer");
      v138 = 1;
      goto LABEL_105;
    }
    if (v7 == 2)
    {

      v16 = CFSTR("New File Required");
      v137 = 1;
      v138 = 2;
LABEL_105:
      -[PLCoreStorage storageOperator](self, "storageOperator");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v204[0] = CFSTR("TableName");
      v204[1] = CFSTR("CurrentVersion");
      v205[0] = v16;
      v205[1] = &unk_1E6ABAC88;
      v204[2] = CFSTR("PreviousVersion");
      v205[2] = &unk_1E6ABAC88;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v205, v204, 3);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "logEventForwardSchemaChange:", v140);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR! PLSQLversion mismatch on %@! expectedVersion=%f schemaMatch=%d error=%@"), v8, *(_QWORD *)&a4, v138, v16);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "lastPathComponent");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v141, v143, v144, 1123);

      PLLogCommon();
      v145 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      PLLogCommon();
      v146 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v197 = v8;
        v198 = 2048;
        v199 = a4;
        v200 = 1024;
        v201 = v138;
        v202 = 2112;
        v203 = v16;
        _os_log_error_impl(&dword_1B6AB6000, v146, OS_LOG_TYPE_ERROR, "SQL mismatch on %@ (expected=%f schemaMatch=%d error=%@)", buf, 0x26u);
      }

      -[PLCoreStorage connection](self, "connection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v137)
        v147 = 1008;
      else
        v147 = 1007;
      +[PLUtilities exitWithReason:connection:](PLUtilities, "exitWithReason:connection:", v147, v17);
      goto LABEL_113;
    }
LABEL_103:
    v137 = 0;
    v138 = 3;
    goto LABEL_105;
  }
  v156 = self;
  -[PLCoreStorage connection](self, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tableInfo:", v8);
  v160 = (id)objc_claimAutoreleasedReturnValue();

  +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v8);
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v187 = 0u;
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition allKeysForEntryDefinition:](PLEntryDefinition, "allKeysForEntryDefinition:");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v153 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v210, 16);
  if (!v153)
    goto LABEL_44;
  v150 = *(id *)v185;
  do
  {
    v23 = 0;
    do
    {
      if (*(id *)v185 != v150)
        objc_enumerationMutation(obj);
      v24 = *(_QWORD *)(*((_QWORD *)&v184 + 1) + 8 * v23);
      +[PLEntryDefinition keyConfigsForEntryDefinition:](PLEntryDefinition, "keyConfigsForEntryDefinition:", v158);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("Type"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "shortValue");

      if (v28)
      {
        v179 = 0u;
        v180 = 0u;
        v177 = 0u;
        v178 = 0u;
        v29 = v160;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v177, v209, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v178;
          while (2)
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v178 != v32)
                objc_enumerationMutation(v29);
              objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * k), "objectForKeyedSubscript:", CFSTR("name"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "isEqualToString:", v24);

              if ((v35 & 1) != 0)
              {
                v36 = 1;
                goto LABEL_26;
              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v177, v209, 16);
            if (v31)
              continue;
            break;
          }
        }
        v36 = 0;
LABEL_26:

        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v37 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __74__PLCoreStorage_handleSchemaMismatchForTable_expectedVersion_schemaMatch___block_invoke_380;
          block[3] = &unk_1E6A52828;
          v175 = CFSTR("schemaMismatch");
          v176 = v37;
          if (handleSchemaMismatchForTable_expectedVersion_schemaMatch__defaultOnce_378 != -1)
            dispatch_once(&handleSchemaMismatchForTable_expectedVersion_schemaMatch__defaultOnce_378, block);
          v38 = handleSchemaMismatchForTable_expectedVersion_schemaMatch__classDebugEnabled_379;

          if (v38)
          {
            v39 = (void *)MEMORY[0x1E0CB3940];
            NSStringFromBOOL();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "stringWithFormat:", CFSTR("%@ key=%@ existsInTable=%@"), v8, v24, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "lastPathComponent");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v43, v44, 1075);

            PLLogCommon();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v197 = v41;
              _os_log_debug_impl(&dword_1B6AB6000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        if ((v36 & 1) == 0)
        {
          v46 = (void *)MEMORY[0x1E0CB3940];
          v47 = (void *)PLVTypeToPLSQLiteType;
          +[PLEntryDefinition keyConfigsForEntryDefinition:](PLEntryDefinition, "keyConfigsForEntryDefinition:", v158);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForKey:", v24);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("Type"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKeyedSubscript:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithFormat:", CFSTR("ALTER TABLE '%@' ADD COLUMN '%@' %@;"), v8, v24, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          -[PLCoreStorage connection](v156, "connection");
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = (id)-[NSObject performQuery:](v53, "performQuery:", v52);
LABEL_41:

        }
      }
      else if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v55 = objc_opt_class();
        v181[0] = MEMORY[0x1E0C809B0];
        v181[1] = 3221225472;
        v181[2] = __74__PLCoreStorage_handleSchemaMismatchForTable_expectedVersion_schemaMatch___block_invoke;
        v181[3] = &unk_1E6A52828;
        v182 = CFSTR("schemaMismatch");
        v183 = v55;
        if (handleSchemaMismatchForTable_expectedVersion_schemaMatch__defaultOnce != -1)
          dispatch_once(&handleSchemaMismatchForTable_expectedVersion_schemaMatch__defaultOnce, v181);
        v56 = handleSchemaMismatchForTable_expectedVersion_schemaMatch__classDebugEnabled;

        if (v56)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ key=%@ skip arrays"), v8, v24);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "lastPathComponent");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:]");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v52, v58, v59, 1063);

          PLLogCommon();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v197 = v52;
            _os_log_debug_impl(&dword_1B6AB6000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
          goto LABEL_41;
        }
      }
      ++v23;
    }
    while (v23 != v153);
    v153 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v210, 16);
  }
  while (v153);
LABEL_44:

  v60 = +[PLEntryDefinition overridesEntryDateForEntryKey:](PLEntryDefinition, "overridesEntryDateForEntryKey:", v8);
  v61 = (void *)MEMORY[0x1E0C9AA70];
  if (v60)
    v61 = &unk_1E6AF6F80;
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  obja = v61;
  objc_msgSend(obja, "allKeys");
  v151 = (id)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v170, v208, 16);
  if (v62)
  {
    v63 = v62;
    v154 = *(_QWORD *)v171;
    do
    {
      for (m = 0; m != v63; ++m)
      {
        if (*(_QWORD *)v171 != v154)
          objc_enumerationMutation(v151);
        v65 = *(_QWORD *)(*((_QWORD *)&v170 + 1) + 8 * m);
        v166 = 0u;
        v167 = 0u;
        v168 = 0u;
        v169 = 0u;
        v66 = v160;
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v166, v207, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v167;
LABEL_53:
          v70 = 0;
          while (1)
          {
            if (*(_QWORD *)v167 != v69)
              objc_enumerationMutation(v66);
            objc_msgSend(*(id *)(*((_QWORD *)&v166 + 1) + 8 * v70), "objectForKeyedSubscript:", CFSTR("name"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v71, "isEqualToString:", v65);

            if ((v72 & 1) != 0)
              break;
            if (v68 == ++v70)
            {
              v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v166, v207, 16);
              if (v68)
                goto LABEL_53;
              goto LABEL_59;
            }
          }
        }
        else
        {
LABEL_59:

          v73 = (void *)MEMORY[0x1E0CB3940];
          v74 = (void *)PLVTypeToPLSQLiteType;
          objc_msgSend(obja, "objectForKeyedSubscript:", v65);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "objectForKeyedSubscript:", v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "stringWithFormat:", CFSTR("ALTER TABLE '%@' ADD COLUMN '%@' %@;"), v8, v65, v76);
          v66 = (id)objc_claimAutoreleasedReturnValue();

          -[PLCoreStorage connection](v156, "connection");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = (id)objc_msgSend(v77, "performQuery:", v66);

        }
      }
      v63 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v170, v208, 16);
    }
    while (v63);
  }

  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  +[PLEntryDefinition allIndexKeysForEntryKey:](PLEntryDefinition, "allIndexKeysForEntryKey:", v8);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v162, v206, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v163;
    do
    {
      for (n = 0; n != v81; ++n)
      {
        if (*(_QWORD *)v163 != v82)
          objc_enumerationMutation(v79);
        v84 = *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * n);
        -[PLCoreStorage connection](v156, "connection");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "createIndexOnTable:forColumn:", v8, v84);

      }
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v162, v206, 16);
    }
    while (v81);
  }

  -[PLCoreStorage connection](v156, "connection");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setSchemaVersion:forTableName:", v8, a4);

  v16 = 0;
  v17 = v160;
LABEL_113:

LABEL_114:
}

BOOL __74__PLCoreStorage_handleSchemaMismatchForTable_expectedVersion_schemaMatch___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  handleSchemaMismatchForTable_expectedVersion_schemaMatch__classDebugEnabled = result;
  return result;
}

BOOL __74__PLCoreStorage_handleSchemaMismatchForTable_expectedVersion_schemaMatch___block_invoke_380(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  handleSchemaMismatchForTable_expectedVersion_schemaMatch__classDebugEnabled_379 = result;
  return result;
}

- (signed)verifySchemaVersionOfTable:(id)a3 matchesExpectedVersion:(double)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  signed __int16 v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t block;
  uint64_t v22;
  BOOL (*v23)(uint64_t);
  void *v24;
  __CFString *v25;
  uint64_t v26;

  v6 = a3;
  -[PLCoreStorage connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "tableExistsForTableName:", v6);

  if (v8)
  {
    -[PLCoreStorage connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "schemaVersionForTable:", v6);
    v11 = v10;

    if (v11 == 0.0)
    {
      v12 = -2;
    }
    else if (v11 == a4)
    {
      v12 = 0;
    }
    else if (v11 >= a4)
    {
      if (v11 <= a4)
        v12 = 3;
      else
        v12 = 1;
    }
    else if ((int)a4 == (int)v11)
    {
      v12 = -1;
    }
    else
    {
      v12 = -2;
    }
  }
  else
  {
    v12 = -3;
    v11 = 0.0;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v13 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v23 = __67__PLCoreStorage_verifySchemaVersionOfTable_matchesExpectedVersion___block_invoke;
    v24 = &unk_1E6A52828;
    v22 = 3221225472;
    v25 = CFSTR("schemaMismatch");
    v26 = v13;
    if (verifySchemaVersionOfTable_matchesExpectedVersion__defaultOnce != -1)
      dispatch_once(&verifySchemaVersionOfTable_matchesExpectedVersion__defaultOnce, &block);
    v14 = verifySchemaVersionOfTable_matchesExpectedVersion__classDebugEnabled;

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ expectedVersion=%f schemaVersion=%f schemaMatch=%d"), v6, *(_QWORD *)&a4, *(_QWORD *)&v11, v12, block, v22, v23, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage verifySchemaVersionOfTable:matchesExpectedVersion:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v17, v18, 1165);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

  return v12;
}

BOOL __67__PLCoreStorage_verifySchemaVersionOfTable_matchesExpectedVersion___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  verifySchemaVersionOfTable_matchesExpectedVersion__classDebugEnabled = result;
  return result;
}

- (void)setupTableName:(id)a3 withEntryKeyConfig:(id)a4 withKeyOrder:(id)a5 isDynamic:(BOOL)a6 withShouldIndexFKID:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t j;
  void *v27;
  void *v28;
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
  void *v41;
  uint64_t k;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  uint64_t v62;
  void *v63;
  void *v64;
  PLCoreStorage *v65;
  void *v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD block[4];
  __CFString *v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v7 = a7;
  v8 = a6;
  v93 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v70 = v13;
  v65 = self;
  v66 = v12;
  v64 = v16;
  if (v8)
  {
    if (v7)
      objc_msgSend(v16, "addObject:", CFSTR("FK_ID"));
    objc_msgSend(v15, "addObject:", &unk_1E6AF6FA8);
    v18 = &unk_1E6AF6FD0;
  }
  else
  {
    +[PLEntryDefinition allIndexKeysForEntryKey:](PLEntryDefinition, "allIndexKeysForEntryKey:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v19);

    objc_msgSend(v17, "removeObject:", CFSTR("FK_ID"));
    objc_msgSend(v15, "addObject:", &unk_1E6AF6FA8);
    if (+[PLEntryDefinition isAggregateForEntryKey:](PLEntryDefinition, "isAggregateForEntryKey:", v12))
    {
      objc_msgSend(v15, "addObject:", &unk_1E6AF6FF8);
      objc_msgSend(v15, "addObject:", &unk_1E6AF7020);
      objc_msgSend(v17, "addObject:", CFSTR("timestamp"));
      objc_msgSend(v17, "addObject:", CFSTR("timeInterval"));
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      +[PLEntryDefinition allAggregatePrimaryKeysForEntryKey:](PLEntryDefinition, "allAggregatePrimaryKeysForEntryKey:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v83 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(v17, "addObject:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
        }
        while (v22);
      }
      v25 = v15;

      v13 = v70;
      goto LABEL_18;
    }
    if (+[PLEntryDefinition overridesEntryDateForEntryKey:](PLEntryDefinition, "overridesEntryDateForEntryKey:", v12))
    {
      objc_msgSend(v15, "addObject:", &unk_1E6AF7048);
      v18 = &unk_1E6AF7070;
    }
    else
    {
      v18 = &unk_1E6AF7098;
    }
  }
  v25 = v15;
  objc_msgSend(v15, "addObject:", v18);
LABEL_18:
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v14;
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (!v69)
    goto LABEL_36;
  v68 = *(_QWORD *)v79;
  do
  {
    for (j = 0; j != v69; ++j)
    {
      if (*(_QWORD *)v79 != v68)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
      objc_msgSend(v13, "objectForKey:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Type"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "shortValue"))
      {

LABEL_25:
        v87[0] = CFSTR("column-name");
        v87[1] = CFSTR("type");
        v88[0] = v27;
        v30 = (void *)PLVTypeToPLSQLiteType;
        objc_msgSend(v13, "objectForKey:", v27);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Type"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v88[1] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v34);

        goto LABEL_34;
      }
      objc_msgSend(v13, "objectForKey:", v27);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("TypeArraySize"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
        goto LABEL_25;
      objc_msgSend(v13, "objectForKey:", v27);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("TypeArrayValue"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = (void *)PLVTypeToPLSQLiteType;
      if (v38)
      {
        objc_msgSend(v13, "objectForKey:", v27);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("TypeArrayValue"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", v41);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend((id)PLVTypeToPLSQLiteType, "objectForKeyedSubscript:", &unk_1E6ABABE0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      for (k = 0; ; k = (k + 1))
      {
        objc_msgSend(v70, "objectForKey:", v27);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("TypeArraySize"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "intValue");

        if ((int)k >= v45)
          break;
        v89[0] = CFSTR("column-name");
        objc_msgSend(v27, "stringByAppendingFormat:", CFSTR("_%d"), k);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v89[1] = CFSTR("type");
        v90[0] = v46;
        v90[1] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v47);

      }
      v13 = v70;
LABEL_34:

    }
    v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  }
  while (v69);
LABEL_36:

  v48 = v25;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v49 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __94__PLCoreStorage_setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID___block_invoke;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v76 = CFSTR("setupTable");
    v77 = v49;
    if (setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID__defaultOnce != -1)
      dispatch_once(&setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID__defaultOnce, block);
    v50 = setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID__classDebugEnabled;

    if (v50)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tableName=%@ tableSchemaColumns=%@"), v66, v25);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "lastPathComponent");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage setupTableName:withEntryKeyConfig:withKeyOrder:isDynamic:withShouldIndexFKID:]");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v53, v54, 1217);

      PLLogCommon();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v13 = v70;
    }
  }
  -[PLCoreStorage connection](v65, "connection");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "createTableName:withColumns:", v66, v25);

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v57 = v64;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v72;
    do
    {
      for (m = 0; m != v59; ++m)
      {
        if (*(_QWORD *)v72 != v60)
          objc_enumerationMutation(v57);
        v62 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * m);
        -[PLCoreStorage connection](v65, "connection");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "createIndexOnTable:forColumn:", v66, v62);

      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v71, v86, 16);
    }
    while (v59);
  }

}

BOOL __94__PLCoreStorage_setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  setupTableName_withEntryKeyConfig_withKeyOrder_isDynamic_withShouldIndexFKID__classDebugEnabled = result;
  return result;
}

- (void)setupArrayForTableName:(id)a3 forColumnNamed:(id)a4 withValueType:(signed __int16)a5 withShouldIndexFKID:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v6 = a6;
  v7 = a5;
  v21[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Array_%@"), v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", &unk_1E6AF70C0);
  objc_msgSend(v12, "addObject:", &unk_1E6AF70E8);
  v20[0] = CFSTR("column-name");
  v20[1] = CFSTR("type");
  v21[0] = CFSTR("value");
  v14 = (void *)PLVTypeToPLSQLiteType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v17);

  -[PLCoreStorage connection](self, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createTableName:withColumns:", v13, v12);

  if (v6)
  {
    -[PLCoreStorage connection](self, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createIndexOnTable:forColumn:", v13, CFSTR("FK_ID"));

  }
}

- (void)setupCompositeIndexOnTable:(id)a3 withColumns:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PLCoreStorage connection](self, "connection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createCompositeIndexOnTable:forColumns:", v7, v6);

}

- (void)setupStorageForEntryKey:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char isKindOfClass;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id obj;
  id v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD block[5];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition keyConfigsForEntryKey:](PLEntryDefinition, "keyConfigsForEntryKey:", v3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      +[PLEntryDefinition schemaVersionForEntryKey:](PLEntryDefinition, "schemaVersionForEntryKey:", v3);
      v6 = v5;
      v7 = -[PLCoreStorage verifySchemaVersionOfTable:matchesExpectedVersion:](self, "verifySchemaVersionOfTable:matchesExpectedVersion:", v3);
      if (v6 > 0.0 && (_DWORD)v7 == -3)
      {
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v9 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __41__PLCoreStorage_setupStorageForEntryKey___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v9;
          if (setupStorageForEntryKey__defaultOnce != -1)
            dispatch_once(&setupStorageForEntryKey__defaultOnce, block);
          if (setupStorageForEntryKey__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No table for %@"), v3);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "lastPathComponent");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage setupStorageForEntryKey:]");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 1259);

            PLLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          }
        }
        -[PLCoreStorage connection](self, "connection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSchemaVersion:forTableName:", v3, v6);

        +[PLEntryDefinition sortedKeysFromEntryDefinition:](PLEntryDefinition, "sortedKeysFromEntryDefinition:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCoreStorage setupTableName:withEntryKeyConfig:withKeyOrder:isDynamic:withShouldIndexFKID:](self, "setupTableName:withEntryKeyConfig:withKeyOrder:isDynamic:withShouldIndexFKID:", v3, v44, v16, 0, 0);
        v43 = v3;
        if (+[PLEntryDefinition hasArrayKeysForEntryKey:](PLEntryDefinition, "hasArrayKeysForEntryKey:", v3))
        {
          v41 = v16;
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v17 = v4;
          +[PLEntryDefinition arrayKeysForEntryDefinition:](PLEntryDefinition, "arrayKeysForEntryDefinition:", v4);
          obj = (id)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v47 != v20)
                  objc_enumerationMutation(obj);
                v22 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
                objc_msgSend(v44, "objectForKeyedSubscript:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("TypeArrayValue"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "shortValue");

                +[PLEntryDefinition allIndexKeysForEntryDefinition:](PLEntryDefinition, "allIndexKeysForEntryDefinition:", v17);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "containsObject:", CFSTR("FK_ID"));

                v3 = v43;
                -[PLCoreStorage setupArrayForTableName:forColumnNamed:withValueType:withShouldIndexFKID:](self, "setupArrayForTableName:forColumnNamed:withValueType:withShouldIndexFKID:", v43, v22, v25, v27);
              }
              v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
            }
            while (v19);
          }

          v4 = v17;
          v16 = v41;
        }
        if (+[PLEntryDefinition hasDynamicKeysForEntryDefinition:](PLEntryDefinition, "hasDynamicKeysForEntryDefinition:", v4))
        {
          +[PLEntryKey dynamicEntryKeyForEntryKey:](PLEntryKey, "dynamicEntryKeyForEntryKey:", v3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLEntryDefinition dynamicKeyConfigsForEntryDefinition:](PLEntryDefinition, "dynamicKeyConfigsForEntryDefinition:", v4);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v29, "mutableCopy");

          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("key"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("key"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("key"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addEntriesFromDictionary:", v34);

              objc_msgSend(v30, "removeObjectForKey:", CFSTR("key"));
            }
          }
          else
          {
            +[PLEntryDefinition sharedInstance](PLEntryDefinition, "sharedInstance");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "commonTypeDict_StringFormat");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v36, CFSTR("key"));

          }
          objc_msgSend(v30, "allKeys");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "sortedArrayUsingSelector:", sel_compare_);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          +[PLEntryDefinition allIndexKeysForEntryDefinition:](PLEntryDefinition, "allIndexKeysForEntryDefinition:", v4);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "containsObject:", CFSTR("FK_ID"));

          -[PLCoreStorage setupTableName:withEntryKeyConfig:withKeyOrder:isDynamic:withShouldIndexFKID:](self, "setupTableName:withEntryKeyConfig:withKeyOrder:isDynamic:withShouldIndexFKID:", v28, v30, v38, 1, v40);
          v3 = v43;
        }

      }
      else if ((_DWORD)v7)
      {
        -[PLCoreStorage handleSchemaMismatchForTable:expectedVersion:schemaMatch:](self, "handleSchemaMismatchForTable:expectedVersion:schemaMatch:", v3, v7, v6);
      }
    }

  }
}

BOOL __41__PLCoreStorage_setupStorageForEntryKey___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setupStorageForEntryKey__classDebugEnabled = result;
  return result;
}

- (void)setupStorageForOperator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd")
    && !+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    +[PLEntryKey entryKeysForOperator:](PLEntryKey, "entryKeysForOperator:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = (void *)objc_msgSend(v5, "copy", 0);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            -[PLCoreStorage setupStorageForEntryKey:](self, "setupStorageForEntryKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (void)setupStorageForOperatorName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    +[PLEntryKey entryKeysForOperatorName:](PLEntryKey, "entryKeysForOperatorName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = (void *)objc_msgSend(v5, "copy", 0);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            -[PLCoreStorage setupStorageForEntryKey:](self, "setupStorageForEntryKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (void)setupStorageForOperatorClass:(Class)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    +[PLEntryKey entryKeysForOperatorClass:](PLEntryKey, "entryKeysForOperatorClass:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = (void *)objc_msgSend(v5, "copy", 0);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            -[PLCoreStorage setupStorageForEntryKey:](self, "setupStorageForEntryKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }
}

BOOL __39__PLCoreStorage_flushCachesWithReason___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  flushCachesWithReason__classDebugEnabled = result;
  return result;
}

BOOL __39__PLCoreStorage_flushCachesWithReason___block_invoke_457(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  flushCachesWithReason__classDebugEnabled_456 = result;
  return result;
}

int64_t __39__PLCoreStorage_flushCachesWithReason___block_invoke_459(uint64_t a1)
{
  int64_t result;

  result = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  flushCachesWithReason__objectForKey = result;
  return result;
}

- (void)blockingFlushCachesWithReason:(id)a3
{
  -[PLCoreStorage blockingFlushCachesWithReason:timeout:](self, "blockingFlushCachesWithReason:timeout:", a3, 60);
}

- (void)blockingFlushCachesWithReason:(id)a3 timeout:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
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
  objc_class *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  uint64_t v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  _QWORD v56[4];
  __CFString *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD block[4];
  __CFString *v68;
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v4 = *(_QWORD *)&a4;
  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PLCoreStorage_blockingFlushCachesWithReason_timeout___block_invoke;
    block[3] = &unk_1E6A52828;
    v68 = CFSTR("blockingFlush");
    v69 = v7;
    if (blockingFlushCachesWithReason_timeout__defaultOnce != -1)
      dispatch_once(&blockingFlushCachesWithReason_timeout__defaultOnce, block);
    v8 = blockingFlushCachesWithReason_timeout__classDebugEnabled;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage blockingFlushCachesWithReason:timeout:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 1388);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v55 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "agents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allOperators");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v64 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "className");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v22);

        +[PLCoreStorage storageQueueNameForClass:](PLCoreStorage, "storageQueueNameForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v19);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "services");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allOperators");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v60 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "className");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v31);

        +[PLCoreStorage storageQueueNameForClass:](PLCoreStorage, "storageQueueNameForClass:", objc_opt_class());
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v32);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v28);
  }

  -[PLCoreStorage blockingFlushQueues:withTimeout:](self, "blockingFlushQueues:withTimeout:", v14, v4);
  objc_msgSend(v14, "removeAllObjects");
  objc_msgSend(v14, "addObject:", CFSTR("PLTimeReferenceBaseband"));
  objc_msgSend(v14, "addObject:", CFSTR("PLTimeReferenceSystem"));
  objc_msgSend(v14, "addObject:", CFSTR("PLTimeReferenceKernel"));
  objc_msgSend(v14, "addObject:", CFSTR("PLTimeManager"));
  if (!+[PLPlatform isHomePod](PLPlatform, "isHomePod"))
  {
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "accounting");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "accounting");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "className");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v37);

      +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "accounting");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage storageQueueNameForClass:](PLCoreStorage, "storageQueueNameForClass:", objc_opt_class());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v40);

    }
  }
  -[PLCoreStorage blockingFlushQueues:withTimeout:](self, "blockingFlushQueues:withTimeout:", v14, v4);
  objc_msgSend(v14, "removeAllObjects");
  v41 = (objc_class *)objc_opt_class();
  NSStringFromClass(v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v42);

  -[PLCoreStorage blockingFlushQueues:withTimeout:](self, "blockingFlushQueues:withTimeout:", v14, v4);
  objc_msgSend(v14, "removeAllObjects");
  v43 = (objc_class *)objc_opt_class();
  NSStringFromClass(v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v44);

  -[PLCoreStorage blockingFlushQueues:withTimeout:](self, "blockingFlushQueues:withTimeout:", v14, v4);
  objc_msgSend(v14, "removeAllObjects");
  +[PLCoreStorage storageQueueNameForClass:](PLCoreStorage, "storageQueueNameForClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v45);

  -[PLCoreStorage blockingFlushQueues:withTimeout:](self, "blockingFlushQueues:withTimeout:", v14, v4);
  objc_msgSend(v14, "removeAllObjects");
  -[PLCoreStorage flushCachesWithReason:](self, "flushCachesWithReason:", v55);
  v46 = (objc_class *)objc_opt_class();
  NSStringFromClass(v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v47);

  -[PLCoreStorage blockingFlushQueues:withTimeout:](self, "blockingFlushQueues:withTimeout:", v14, v4);
  objc_msgSend(v14, "removeAllObjects");
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v48 = objc_opt_class();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __55__PLCoreStorage_blockingFlushCachesWithReason_timeout___block_invoke_477;
    v56[3] = &unk_1E6A52828;
    v57 = CFSTR("blockingFlush");
    v58 = v48;
    if (blockingFlushCachesWithReason_timeout__defaultOnce_475 != -1)
      dispatch_once(&blockingFlushCachesWithReason_timeout__defaultOnce_475, v56);
    v49 = blockingFlushCachesWithReason_timeout__classDebugEnabled_476;

    if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "lastPathComponent");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage blockingFlushCachesWithReason:timeout:]");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v50, v52, v53, 1451);

      PLLogCommon();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

}

BOOL __55__PLCoreStorage_blockingFlushCachesWithReason_timeout___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  blockingFlushCachesWithReason_timeout__classDebugEnabled = result;
  return result;
}

BOOL __55__PLCoreStorage_blockingFlushCachesWithReason_timeout___block_invoke_477(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  blockingFlushCachesWithReason_timeout__classDebugEnabled_476 = result;
  return result;
}

- (void)blockingFlushQueues:(id)a3 withTimeout:(int)a4
{
  id v5;
  _UNKNOWN **v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  dispatch_semaphore_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _UNKNOWN **v24;
  PLCoreStorage *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  unint64_t v33;
  dispatch_time_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  _QWORD v46[4];
  __CFString *v47;
  uint64_t v48;
  _QWORD block[4];
  NSObject *v50;
  PLCoreStorage *v51;
  uint64_t v52;
  _QWORD v53[4];
  __CFString *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  __CFString *v61;
  uint64_t v62;
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = &off_1E6A51000;
  v7 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke;
    v60[3] = &unk_1E6A52828;
    v61 = CFSTR("blockingFlush");
    v62 = objc_opt_class();
    if (blockingFlushQueues_withTimeout__defaultOnce != -1)
      dispatch_once(&blockingFlushQueues_withTimeout__defaultOnce, v60);
    v9 = blockingFlushQueues_withTimeout__classDebugEnabled;

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin for queueNames=%@"), v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage blockingFlushQueues:withTimeout:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 1455);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v15 = dispatch_semaphore_create(0);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v57;
    v43 = v16;
    v44 = v15;
    v42 = *(_QWORD *)v57;
    do
    {
      v20 = 0;
      v45 = v18;
      do
      {
        if (*(_QWORD *)v57 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v20);
        if (objc_msgSend(v6[28], "debugEnabled"))
        {
          v22 = objc_opt_class();
          v53[0] = v8;
          v53[1] = 3221225472;
          v53[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_484;
          v53[3] = &unk_1E6A52828;
          v54 = CFSTR("blockingFlush");
          v55 = v22;
          if (blockingFlushQueues_withTimeout__defaultOnce_482 != -1)
            dispatch_once(&blockingFlushQueues_withTimeout__defaultOnce_482, v53);
          v23 = blockingFlushQueues_withTimeout__classDebugEnabled_483;

          if (v23)
          {
            v24 = v6;
            v25 = self;
            v26 = v8;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("waiting: %@"), v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "lastPathComponent");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage blockingFlushQueues:withTimeout:]");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v29, v30, 1459);

            PLLogCommon();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v27;
              _os_log_debug_impl(&dword_1B6AB6000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v8 = v26;
            self = v25;
            v6 = v24;
            v16 = v43;
            v15 = v44;
            v18 = v45;
            v19 = v42;
          }
        }
        +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v21);
        v32 = objc_claimAutoreleasedReturnValue();
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_487;
        block[3] = &unk_1E6A53760;
        v50 = v15;
        v51 = self;
        v52 = v21;
        dispatch_async(v32, block);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v16, "count"))
  {
    v33 = 0;
    do
    {
      v34 = dispatch_time(0, 1000000000 * a4);
      dispatch_semaphore_wait(v15, v34);
      ++v33;
    }
    while (objc_msgSend(v16, "count") > v33);
  }
  if ((objc_msgSend(v6[28], "debugEnabled") & 1) != 0)
  {
    v46[0] = v8;
    v46[1] = 3221225472;
    v46[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_492;
    v46[3] = &unk_1E6A52828;
    v47 = CFSTR("blockingFlush");
    v48 = objc_opt_class();
    if (blockingFlushQueues_withTimeout__defaultOnce_490 != -1)
      dispatch_once(&blockingFlushQueues_withTimeout__defaultOnce_490, v46);
    v35 = blockingFlushQueues_withTimeout__classDebugEnabled_491;

    if (v35)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end for queueNames=%@"), v16);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage blockingFlushQueues:withTimeout:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v38, v39, 1473);

      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

}

BOOL __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  blockingFlushQueues_withTimeout__classDebugEnabled = result;
  return result;
}

BOOL __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_484(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  blockingFlushQueues_withTimeout__classDebugEnabled_483 = result;
  return result;
}

void __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_487(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  __CFString *v10;
  uint64_t v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_2;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v10 = CFSTR("blockingFlush");
    v11 = v2;
    if (kPLTaskingEndNotification_block_invoke_4_defaultOnce != -1)
      dispatch_once(&kPLTaskingEndNotification_block_invoke_4_defaultOnce, block);
    v3 = kPLTaskingEndNotification_block_invoke_4_classDebugEnabled;

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("finished: %@"), *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage blockingFlushQueues:withTimeout:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 1464);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLTaskingEndNotification_block_invoke_4_classDebugEnabled = result;
  return result;
}

BOOL __49__PLCoreStorage_blockingFlushQueues_withTimeout___block_invoke_492(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  blockingFlushQueues_withTimeout__classDebugEnabled_491 = result;
  return result;
}

- (BOOL)flushCachesIfRequiredForEntryKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stagingEntryCacheSizeForEntryKey:", v4);

  if (v6 >= 1)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cache dump for query entryKey=%@ cacheSize=%ld"), v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage flushCachesIfRequiredForEntryKey:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 1480);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Query EntryKey %@"), v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoreStorage flushCachesWithReason:](self, "flushCachesWithReason:", v12);

  }
  return v6 > 0;
}

int64_t __43__PLCoreStorage_generalEntryCacheSizeLimit__block_invoke(uint64_t a1)
{
  int64_t result;

  result = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  generalEntryCacheSizeLimit_objectForKey = result;
  return result;
}

BOOL __28__PLCoreStorage_writeEntry___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  writeEntry__classDebugEnabled = result;
  return result;
}

BOOL __48__PLCoreStorage_writeEntry_withCompletionBlock___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  writeEntry_withCompletionBlock__classDebugEnabled = result;
  return result;
}

void __48__PLCoreStorage_writeEntry_withCompletionBlock___block_invoke_509(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(*(id *)(a1 + 32), "writeEntry:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_autoreleasePoolPop(v2);
}

BOOL __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled = result;
  return result;
}

BOOL __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke_516(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled_515 = result;
  return result;
}

BOOL __76__PLCoreStorage_writeProportionateAggregateEntry_withStartDate_withEndDate___block_invoke_521(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  writeProportionateAggregateEntry_withStartDate_withEndDate__classDebugEnabled_520 = result;
  return result;
}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  writeAggregateEntry__classDebugEnabled = result;
  return result;
}

void __37__PLCoreStorage_writeAggregateEntry___block_invoke_524(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id obj;
  uint64_t v70;
  _BOOL8 v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  _QWORD v77[4];
  __CFString *v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  __CFString *v85;
  uint64_t v86;
  _QWORD block[4];
  __CFString *v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  __CFString *v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  void *v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PLEntryDefinition isAggregateWallClockBucket:](PLEntryDefinition, "isAggregateWallClockBucket:", v3);

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "entryDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition aggregateBucketDefinitionsForEntryDefinition:](PLEntryDefinition, "aggregateBucketDefinitionsForEntryDefinition:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v72 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
  if (v72)
  {
    v70 = *(_QWORD *)v98;
    v71 = v4;
    v74 = v2;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v98 != v70)
          objc_enumerationMutation(obj);
        v73 = v7;
        v8 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v7);
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v9 = objc_opt_class();
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_2;
          v94[3] = &unk_1E6A52828;
          v95 = CFSTR("writeAggregateEntry");
          v96 = v9;
          if (kPLTaskingEndNotification_block_invoke_5_defaultOnce != -1)
            dispatch_once(&kPLTaskingEndNotification_block_invoke_5_defaultOnce, v94);
          v10 = kPLTaskingEndNotification_block_invoke_5_classDebugEnabled;

          if (v10)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bucketIntervalNumber=%@"), v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "lastPathComponent");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeAggregateEntry:]_block_invoke");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v13, v14, 1677);

            PLLogCommon();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v104 = v11;
              _os_log_debug_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(v8, "doubleValue");
        v17 = v16;
        +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "entryDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (double)(int)objc_msgSend(v18, "bucketTimeStampForDate:withTimeReference:withBucketInterval:", v19, v71, (int)v17);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("timestamp"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("timeInterval"));

        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "entryDefinition");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLEntryDefinition allAggregatePrimaryKeysForEntryDefinition:](PLEntryDefinition, "allAggregatePrimaryKeysForEntryDefinition:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = v24;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v91;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v91 != v27)
                objc_enumerationMutation(v75);
              v29 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v28);
              if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
              {
                v30 = objc_opt_class();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_529;
                block[3] = &unk_1E6A52828;
                v88 = CFSTR("writeAggregateEntry");
                v89 = v30;
                if (kPLTaskingEndNotification_block_invoke_5_defaultOnce_527 != -1)
                  dispatch_once(&kPLTaskingEndNotification_block_invoke_5_defaultOnce_527, block);
                v31 = kPLTaskingEndNotification_block_invoke_5_classDebugEnabled_528;

                if (v31)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("primaryKey=%@"), v29);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "lastPathComponent");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeAggregateEntry:]_block_invoke_2");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v34, v35, 1689);

                  PLLogCommon();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v104 = v32;
                    _os_log_debug_impl(&dword_1B6AB6000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v2 = v74;
                }
              }
              objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v29);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "setObject:forKeyedSubscript:", v37, v29);

              ++v28;
            }
            while (v26 != v28);
            v26 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
          }
          while (v26);
        }

        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v38 = objc_opt_class();
          v84[0] = MEMORY[0x1E0C809B0];
          v84[1] = 3221225472;
          v84[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_535;
          v84[3] = &unk_1E6A52828;
          v85 = CFSTR("writeAggregateEntry");
          v86 = v38;
          if (kPLTaskingEndNotification_block_invoke_5_defaultOnce_533 != -1)
            dispatch_once(&kPLTaskingEndNotification_block_invoke_5_defaultOnce_533, v84);
          v39 = kPLTaskingEndNotification_block_invoke_5_classDebugEnabled_534;

          if (v39)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("matchingKeyToValue=%@"), v2);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "lastPathComponent");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeAggregateEntry:]_block_invoke_2");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v42, v43, 1693);

            PLLogCommon();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v104 = v40;
              _os_log_debug_impl(&dword_1B6AB6000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        v45 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(*(id *)(a1 + 32), "entryDefinition");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLEntryDefinition allAggregateKeysForEntryDefinition:](PLEntryDefinition, "allAggregateKeysForEntryDefinition:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setWithArray:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v49 = v48;
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
        if (v50)
        {
          v51 = v50;
          v76 = *(id *)v81;
          do
          {
            v52 = 0;
            do
            {
              if (*(id *)v81 != v76)
                objc_enumerationMutation(v49);
              v53 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v52);
              if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
              {
                v54 = objc_opt_class();
                v77[0] = MEMORY[0x1E0C809B0];
                v77[1] = 3221225472;
                v77[2] = __37__PLCoreStorage_writeAggregateEntry___block_invoke_540;
                v77[3] = &unk_1E6A52828;
                v78 = CFSTR("writeAggregateEntry");
                v79 = v54;
                if (kPLTaskingEndNotification_block_invoke_5_defaultOnce_538 != -1)
                  dispatch_once(&kPLTaskingEndNotification_block_invoke_5_defaultOnce_538, v77);
                v55 = kPLTaskingEndNotification_block_invoke_5_classDebugEnabled_539;

                if (v55)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateKey=%@"), v53);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "lastPathComponent");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage writeAggregateEntry:]_block_invoke_2");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v56, v58, v59, 1698);

                  PLLogCommon();
                  v60 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v104 = v56;
                    _os_log_debug_impl(&dword_1B6AB6000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v2 = v74;
                }
              }
              v61 = (void *)objc_opt_new();
              objc_msgSend(*(id *)(a1 + 32), "entryKey");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setEntryKey:", v62);

              v63 = (void *)objc_msgSend(v2, "mutableCopy");
              objc_msgSend(v61, "setMatchingKeyToValue:", v63);

              v64 = (void *)objc_msgSend(v49, "mutableCopy");
              objc_msgSend(v64, "removeObject:", v53);
              objc_msgSend(v64, "allObjects");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setOtherAggregateKeys:", v65);

              objc_msgSend(v61, "setAggregateKey:", v53);
              objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v53);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "doubleValue");
              objc_msgSend(v61, "setAggregateValue:");

              objc_msgSend(*(id *)(a1 + 32), "entryDefinition");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setAggregateFunction:", +[PLEntryDefinition aggregateFunctionForEntryDefinition:forKey:](PLEntryDefinition, "aggregateFunctionForEntryDefinition:forKey:", v67, v53));

              +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "addToStagingAggregateEntryCache:", v61);

              ++v52;
            }
            while (v51 != v52);
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v80, v101, 16);
          }
          while (v51);
        }

        v7 = v73 + 1;
      }
      while (v73 + 1 != v72);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    }
    while (v72);
  }

}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLTaskingEndNotification_block_invoke_5_classDebugEnabled = result;
  return result;
}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke_529(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLTaskingEndNotification_block_invoke_5_classDebugEnabled_528 = result;
  return result;
}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke_535(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLTaskingEndNotification_block_invoke_5_classDebugEnabled_534 = result;
  return result;
}

BOOL __37__PLCoreStorage_writeAggregateEntry___block_invoke_540(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  kPLTaskingEndNotification_block_invoke_5_classDebugEnabled_539 = result;
  return result;
}

- (void)setAllNullValuesForEntryKey:(id)a3 forKey:(id)a4 toValue:(id)a5 withFilters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[9];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v14 = v10;
  v35 = v14;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v15 = v11;
  v29 = v15;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__5;
  v22[4] = __Block_byref_object_dispose__5;
  v16 = v12;
  v23 = v16;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__5;
  v20[4] = __Block_byref_object_dispose__5;
  v17 = v13;
  v21 = v17;
  -[PLCoreStorage flushCachesIfRequiredForEntryKey:](self, "flushCachesIfRequiredForEntryKey:", v25[5]);
  v18 = v31[5];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__PLCoreStorage_setAllNullValuesForEntryKey_forKey_toValue_withFilters___block_invoke;
  v19[3] = &unk_1E6A537D8;
  v19[4] = self;
  v19[5] = &v30;
  v19[6] = &v24;
  v19[7] = v22;
  v19[8] = v20;
  -[PLCoreStorage dispatchAsyncForEntryKey:withBlock:](self, "dispatchAsyncForEntryKey:withBlock:", v18, v19);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __72__PLCoreStorage_setAllNullValuesForEntryKey_forKey_toValue_withFilters___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllNullValuesForEntryKey:forKey:toValue:withFilters:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

- (void)deleteEntry:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "entryKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "entryID");

  -[PLCoreStorage deleteEntryForKey:WithRowID:](self, "deleteEntryForKey:WithRowID:", v6, v5);
}

- (void)deleteEntryForKey:(id)a3 WithRowID:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[7];
  _QWORD v10[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v6 = a3;
  v16 = v6;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = a4;
  -[PLCoreStorage flushCachesIfRequiredForEntryKey:](self, "flushCachesIfRequiredForEntryKey:", v6);
  +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearLastEntryCacheForEntryKey:", v6);

  v8 = v12[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PLCoreStorage_deleteEntryForKey_WithRowID___block_invoke;
  v9[3] = &unk_1E6A537B0;
  v9[4] = self;
  v9[5] = &v11;
  v9[6] = v10;
  -[PLCoreStorage dispatchAsyncForEntryKey:withBlock:](self, "dispatchAsyncForEntryKey:withBlock:", v8, v9);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);

}

void __45__PLCoreStorage_deleteEntryForKey_WithRowID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteEntryForKey:withRowID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

- (void)deleteAllEntriesForKey:(id)a3
{
  -[PLCoreStorage deleteAllEntriesForKey:beforeTimestamp:withFilters:](self, "deleteAllEntriesForKey:beforeTimestamp:withFilters:", a3, 0, 0);
}

- (void)deleteAllEntriesForKey:(id)a3 withFilters:(id)a4
{
  -[PLCoreStorage deleteAllEntriesForKey:beforeTimestamp:withFilters:](self, "deleteAllEntriesForKey:beforeTimestamp:withFilters:", a3, 0, a4);
}

- (void)deleteAllEntriesForKey:(id)a3 beforeTimestamp:(id)a4
{
  -[PLCoreStorage deleteAllEntriesForKey:beforeTimestamp:withFilters:](self, "deleteAllEntriesForKey:beforeTimestamp:withFilters:", a3, a4, 0);
}

- (void)deleteAllEntriesForKey:(id)a3 beforeTimestamp:(id)a4 withFilters:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[8];
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__5;
    v23 = __Block_byref_object_dispose__5;
    v11 = v8;
    v24 = v11;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__5;
    v17[4] = __Block_byref_object_dispose__5;
    v18 = v9;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__5;
    v15[4] = __Block_byref_object_dispose__5;
    v16 = v10;
    -[PLCoreStorage flushCachesIfRequiredForEntryKey:](self, "flushCachesIfRequiredForEntryKey:", v11);
    +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clearLastEntryCacheForEntryKey:", v11);

    v13 = v20[5];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__PLCoreStorage_deleteAllEntriesForKey_beforeTimestamp_withFilters___block_invoke;
    v14[3] = &unk_1E6A53800;
    v14[4] = self;
    v14[5] = v17;
    v14[6] = v15;
    v14[7] = &v19;
    -[PLCoreStorage dispatchAsyncForEntryKey:withBlock:](self, "dispatchAsyncForEntryKey:withBlock:", v13, v14);
    _Block_object_dispose(v15, 8);

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v19, 8);

  }
}

void __68__PLCoreStorage_deleteAllEntriesForKey_beforeTimestamp_withFilters___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "timeIntervalSince1970");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("timestamp < %f"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v5);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(v7, "addObjectsFromArray:");
  if (!objc_msgSend(v7, "count"))
  {

    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteAllEntriesForKey:withFilters:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (int64_t)countOfEntriesForKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stagingEntryCacheSizeForEntryKey:", v4);

  -[PLCoreStorage connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT COUNT(ID) AS count FROM %@;"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "performQuery:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 += objc_msgSend(v11, "longValue");

  }
  return v6;
}

- (void)processEntriesForKey:(id)a3 withProperties:(id)a4 withBlock:(id)a5
{
  void (**v7)(id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id obj;
  uint64_t v42;
  id v43;
  uint64_t v45;
  void *context;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[8];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD block[4];
  __CFString *v67;
  uint64_t v68;
  _BYTE v69[128];
  void *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v40 = a4;
  v7 = (void (**)(id, _QWORD))a5;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PLCoreStorage_processEntriesForKey_withProperties_withBlock___block_invoke;
    block[3] = &unk_1E6A527D8;
    v67 = CFSTR("processEntriesBatchSize");
    v68 = 10;
    if (processEntriesForKey_withProperties_withBlock__defaultOnce != -1)
      dispatch_once(&processEntriesForKey_withProperties_withBlock__defaultOnce, block);
    v9 = processEntriesForKey_withProperties_withBlock__objectForKey;

    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("__NOCACHEDUMP__"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("__NOCACHEDUMP__")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "BOOLValue"),
          v11,
          v10,
          (v12 & 1) == 0))
    {
      if (-[PLCoreStorage flushCachesIfRequiredForEntryKey:](self, "flushCachesIfRequiredForEntryKey:", v39)
        && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cache dumped for properties: %@"), v40);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage processEntriesForKey:withProperties:withBlock:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 1813);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x3032000000;
    v64[3] = __Block_byref_object_copy__5;
    v64[4] = __Block_byref_object_dispose__5;
    v18 = v39;
    v65 = v18;
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__5;
    v62[4] = __Block_byref_object_dispose__5;
    v63 = v40;
    v56 = 0;
    v57 = &v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__5;
    v60 = __Block_byref_object_dispose__5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v61 = (id)objc_claimAutoreleasedReturnValue();
    v55[0] = v8;
    v55[1] = 3221225472;
    v55[2] = __63__PLCoreStorage_processEntriesForKey_withProperties_withBlock___block_invoke_556;
    v55[3] = &unk_1E6A53800;
    v55[4] = self;
    v55[5] = v64;
    v55[6] = v62;
    v55[7] = &v56;
    -[PLCoreStorage dispatchSyncForEntryKey:withBlock:](self, "dispatchSyncForEntryKey:withBlock:", v18, v55);
    v43 = v18;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    while (1)
    {
      v21 = v20;
      if (objc_msgSend((id)v57[5], "count") <= (unint64_t)v20)
        break;
      v22 = objc_msgSend((id)v57[5], "count");
      if (v22 >= v9 + v20)
        v20 += v9;
      else
        v20 = v22;
      objc_msgSend((id)v57[5], "subarrayWithRange:", v21, v20 - (int)v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v23);

    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v19;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v73, 16);
    if (v24)
    {
      v42 = *(_QWORD *)v52;
      do
      {
        v25 = 0;
        v45 = v24;
        do
        {
          if (*(_QWORD *)v52 != v42)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v25);
          context = (void *)MEMORY[0x1BCC9E9B4]();
          v27 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", "));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("ID IN (%@)"), v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v72[0] = MEMORY[0x1E0C9AAB0];
          v71[0] = CFSTR("__NOCACHEDUMP__");
          v71[1] = CFSTR("where");
          v70 = v29;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v72[1] = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          -[PLCoreStorage entriesForKey:withProperties:](self, "entriesForKey:withProperties:", v43, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v33 = v32;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
          if (v34)
          {
            v35 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v48 != v35)
                  objc_enumerationMutation(v33);
                v37 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                v38 = (void *)MEMORY[0x1BCC9E9B4]();
                v7[2](v7, v37);
                objc_autoreleasePoolPop(v38);
              }
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v69, 16);
            }
            while (v34);
          }

          objc_autoreleasePoolPop(context);
          ++v25;
        }
        while (v25 != v45);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v73, 16);
      }
      while (v24);
    }

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v64, 8);
  }

}

int64_t __63__PLCoreStorage_processEntriesForKey_withProperties_withBlock___block_invoke(uint64_t a1)
{
  int64_t result;

  result = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  processEntriesForKey_withProperties_withBlock__objectForKey = result;
  return result;
}

void __63__PLCoreStorage_processEntriesForKey_withProperties_withBlock___block_invoke_556(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT ID FROM '%@' "), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:", CFSTR("where"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" AND "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("WHERE %@ "), v5);

  }
  objc_msgSend(v2, "appendString:", CFSTR(";"));
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performQuery:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "objectForKeyedSubscript:", CFSTR("ID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (id)entriesForKey:(id)a3
{
  return -[PLCoreStorage entriesForKey:withComparisons:](self, "entriesForKey:withComparisons:", a3, 0);
}

uint64_t __47__PLCoreStorage_entriesForKey_withComparisons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(a2, "entryID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "entryID");

  objc_msgSend(v7, "numberWithLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (id)entriesForKey:(id)a3 withQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  if (-[PLCoreStorage flushCachesIfRequiredForEntryKey:](self, "flushCachesIfRequiredForEntryKey:", v6)
    && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cache dumped for query: %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage entriesForKey:withQuery:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 1936);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__PLCoreStorage_entriesForKey_withQuery___block_invoke;
  v17[3] = &unk_1E6A52698;
  v20 = &v21;
  v17[4] = self;
  v13 = v6;
  v18 = v13;
  v14 = v7;
  v19 = v14;
  -[PLCoreStorage dispatchSyncForEntryKey:withBlock:](self, "dispatchSyncForEntryKey:withBlock:", v13, v17);
  v15 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __41__PLCoreStorage_entriesForKey_withQuery___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entriesForKey:withQuery:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)entriesForKey:(id)a3 inTimeRange:(_PLTimeIntervalRange)a4 withFilters:(id)a5
{
  double location;
  void *v8;
  void *v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  location = a4.location;
  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a4.location + a4.length;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("timestamp BETWEEN %f AND %f"), *(_QWORD *)&location, *(_QWORD *)&v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObjectsFromArray:", v11);
  v18[0] = CFSTR("where");
  v18[1] = CFSTR("order by");
  v19[0] = v14;
  v19[1] = &unk_1E6AF7110;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoreStorage entriesForKey:withProperties:](self, "entriesForKey:withProperties:", v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)entriesForKey:(id)a3 inTimeRange:(_PLTimeIntervalRange)a4 withCountOfEntriesBefore:(int64_t)a5 withCountOfEntriesAfter:(int64_t)a6 withFilters:(id)a7
{
  double length;
  double location;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD block[4];
  __CFString *v38;
  uint64_t v39;

  length = a4.length;
  location = a4.location;
  v13 = (void *)MEMORY[0x1E0C99DE8];
  v14 = a7;
  v15 = a3;
  -[PLCoreStorage entriesForKey:inTimeRange:withFilters:](self, "entriesForKey:inTimeRange:withFilters:", v15, v14, location, length);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "entryID");

    objc_msgSend(v17, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "entryID");

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v22 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __104__PLCoreStorage_entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters___block_invoke;
      block[3] = &unk_1E6A52828;
      block[1] = 3221225472;
      v38 = CFSTR("query");
      v39 = v22;
      if (entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters__defaultOnce != -1)
        dispatch_once(&entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters__defaultOnce, block);
      v23 = entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters__classDebugEnabled;

      if (v23)
      {
        v35 = v21;
        v36 = a6;
        v34 = v19;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first=%lld last=%lld"), v19, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage entriesForKey:inTimeRange:withCountOfEntriesBefore:withCountOfEntriesAfter:withFilters:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v26, v27, 1961);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        v21 = v35;
        a6 = v36;
        v19 = v34;
      }
    }
    -[PLCoreStorage entriesForKey:startingFromRowID:count:withFilters:](self, "entriesForKey:startingFromRowID:count:withFilters:", v15, v19 + 1, a5, v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v29);

    -[PLCoreStorage entriesForKey:startingFromRowID:count:withFilters:](self, "entriesForKey:startingFromRowID:count:withFilters:", v15, v21 - 1, -a6, v14);
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLCoreStorage entriesForKey:before:timeInterval:count:withFilters:](self, "entriesForKey:before:timeInterval:count:withFilters:", v15, 1, a5, v14, location);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v31);

    -[PLCoreStorage entriesForKey:before:timeInterval:count:withFilters:](self, "entriesForKey:before:timeInterval:count:withFilters:", v15, 0, a6, v14, location + length);
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v30;

  objc_msgSend(v17, "addObjectsFromArray:", v32);
  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_596);
  return v17;
}

BOOL __104__PLCoreStorage_entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters__classDebugEnabled = result;
  return result;
}

uint64_t __104__PLCoreStorage_entriesForKey_inTimeRange_withCountOfEntriesBefore_withCountOfEntriesAfter_withFilters___block_invoke_594(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "entryID");
  if (v6 <= objc_msgSend(v5, "entryID"))
  {
    v8 = objc_msgSend(v4, "entryID");
    v7 = v8 < objc_msgSend(v5, "entryID");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)entriesForKey:(id)a3 before:(BOOL)a4 timeInterval:(double)a5 count:(int64_t)a6 withFilters:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v9 = a4;
  v27[3] = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = CFSTR(">=");
  if (v9)
  {
    v15 = CFSTR("<=");
    v16 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    v16 = MEMORY[0x1E0C9AAA0];
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timestamp %@ %f"), v15, *(_QWORD *)&a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v17);

  objc_msgSend(v14, "addObjectsFromArray:", v12);
  v27[0] = v14;
  v26[0] = CFSTR("where");
  v26[1] = CFSTR("order by");
  v24 = CFSTR("timestamp");
  v25 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v18;
  v26[2] = CFSTR("limit");
  if (a6 >= 0)
    v19 = a6;
  else
    v19 = -a6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoreStorage entriesForKey:withProperties:](self, "entriesForKey:withProperties:", v13, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)entryForKey:(id)a3 withID:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedEntryForEntryKey:withEntryID:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    -[PLCoreStorage entriesForKey:startingFromRowID:count:withFilters:](self, "entriesForKey:startingFromRowID:count:withFilters:", v6, a4, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "firstObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

- (id)entriesForKey:(id)a3 startingFromRowID:(int64_t)a4 count:(int64_t)a5 withFilters:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  const __CFString *v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0C9AAB0];
  v13 = (void *)MEMORY[0x1E0C9AAA0];
  if (v11)
    v14 = v11;
  else
    v14 = (void *)MEMORY[0x1E0C9AA60];
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  if (a5 > 0)
    v12 = v13;
  v16 = CFSTR("<=");
  if (a5 > 0)
    v16 = CFSTR(">=");
  if (!a5)
    v16 = CFSTR("==");
  if (a5 < 0)
    a5 = -a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ID %@ %lld"), v16, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v17);

  v31[0] = v15;
  v30[0] = CFSTR("where");
  v30[1] = CFSTR("order by");
  v28 = CFSTR("timestamp");
  v29 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v18;
  v30[2] = CFSTR("limit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v15, "count") >= 2)
  {
    objc_msgSend(v15, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("__NOCACHEDUMP__"));

    if (v22)
    {
      objc_msgSend(v15, "removeObjectAtIndex:", 0);
      v23 = (void *)objc_msgSend(v20, "mutableCopy");
      objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("__NOCACHEDUMP__"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v15, CFSTR("where"));

      v20 = v23;
    }
  }
  -[PLCoreStorage entriesForKey:withProperties:](self, "entriesForKey:withProperties:", v10, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqual:", MEMORY[0x1E0C9AAA0]))
  {
    objc_msgSend(v24, "sortedArrayUsingComparator:", &__block_literal_global_609);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = v24;
  }
  v26 = v25;

  return v26;
}

uint64_t __67__PLCoreStorage_entriesForKey_startingFromRowID_count_withFilters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "entryID");
  if (v6 <= objc_msgSend(v5, "entryID"))
  {
    v8 = objc_msgSend(v4, "entryID");
    v7 = v8 < objc_msgSend(v5, "entryID");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (id)firstEntryForKey:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[PLCoreStorage entriesForKey:withProperties:](self, "entriesForKey:withProperties:", a3, &unk_1E6AF7160);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)lastEntryForKey:(id)a3 withComparisons:(id)a4 isSingleton:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  __CFString *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD block[4];
  __CFString *v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v5 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (v5)
    {
      v10 = 0;
    }
    else
    {
      +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stagingEntryCacheIDsForEntryKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stagingEntryCacheForEntryKey:withComparisons:isSingleton:", v8, v9, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v16 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __61__PLCoreStorage_lastEntryForKey_withComparisons_isSingleton___block_invoke;
      block[3] = &unk_1E6A52828;
      block[1] = 3221225472;
      v59 = CFSTR("lastEntryForKey:withComparisons:isSingleton:");
      v60 = v16;
      if (lastEntryForKey_withComparisons_isSingleton__defaultOnce != -1)
        dispatch_once(&lastEntryForKey_withComparisons_isSingleton__defaultOnce, block);
      v17 = lastEntryForKey_withComparisons_isSingleton__classDebugEnabled;

      if (v17)
      {
        v47 = v14;
        v49 = v10;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cacheEntry=%@"), v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage lastEntryForKey:withComparisons:isSingleton:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 2108);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        v14 = v47;
        v10 = v49;
      }
    }
    if (v15 && (v5 || (objc_msgSend(v15, "existsInDB") & 1) == 0))
    {
      v11 = v15;
    }
    else
    {
      v48 = v14;
      v50 = v10;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", CFSTR("__NOCACHEDUMP__"));
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v24 = v9;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v55 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "sqlWhereClause");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v29);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
        }
        while (v26);
      }

      v10 = v50;
      if (objc_msgSend(v50, "count"))
      {
        objc_msgSend(v50, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "mutableCopy");

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v15, "entryID"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "removeObject:", v32);

        }
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR(","));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("ID NOT IN (%@)"), v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v35);

      }
      -[PLCoreStorage lastEntryForKey:withFilters:](self, "lastEntryForKey:withFilters:", v8, v23);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v37 = objc_opt_class();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[2] = __61__PLCoreStorage_lastEntryForKey_withComparisons_isSingleton___block_invoke_626;
        v51[3] = &unk_1E6A52828;
        v51[1] = 3221225472;
        v52 = CFSTR("lastEntryForKey:withComparisons:isSingleton:");
        v53 = v37;
        if (lastEntryForKey_withComparisons_isSingleton__defaultOnce_624 != -1)
          dispatch_once(&lastEntryForKey_withComparisons_isSingleton__defaultOnce_624, v51);
        v38 = lastEntryForKey_withComparisons_isSingleton__classDebugEnabled_625;

        if (v38)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dbEntry=%@"), v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "lastPathComponent");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage lastEntryForKey:withComparisons:isSingleton:]");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v41, v42, 2132);

          PLLogCommon();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          v10 = v50;
        }
      }
      v44 = objc_msgSend(v36, "entryID");
      if (v44 == objc_msgSend(v15, "entryID"))
        v45 = v15;
      else
        v45 = v36;
      v11 = v45;

      v14 = v48;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

BOOL __61__PLCoreStorage_lastEntryForKey_withComparisons_isSingleton___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  lastEntryForKey_withComparisons_isSingleton__classDebugEnabled = result;
  return result;
}

BOOL __61__PLCoreStorage_lastEntryForKey_withComparisons_isSingleton___block_invoke_626(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  lastEntryForKey_withComparisons_isSingleton__classDebugEnabled_625 = result;
  return result;
}

- (id)lastEntryForKey:(id)a3 withIDLessThan:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastEntryCacheForEntryKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "entryID") > a4)
    {
      +[PLStorageCache sharedStorageCache](PLStorageCache, "sharedStorageCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stagingEntryCacheForEntryKey:withIDLessThan:", v6, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "entryID") <= a4)
      {
        v8 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ID < %lld"), a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCoreStorage lastEntryForKey:withFilters:](self, "lastEntryForKey:withFilters:", v6, v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)removeErroneousQualificationEntries
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  -[PLCoreStorage connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "performQuery:", CFSTR("DELETE FROM PLAccountingOperator_EventInterval_QualificationEvents WHERE QualificationID = 13;"));

  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_INFO, "Performed query to remove qualificationID = 13 from DB", v5, 2u);
  }

}

- (id)processIDEntryForPid:(int)a3
{
  uint64_t v3;
  PLValueComparison *v5;
  void *v6;
  PLValueComparison *v7;
  PLValueComparison *v8;
  void *v9;
  void *v10;
  void *v11;
  PLValueComparison *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v3 = *(_QWORD *)&a3;
  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = [PLValueComparison alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:](v5, "initWithKey:withValue:withComparisonOperation:", CFSTR("PID"), v6, 0);

  v8 = [PLValueComparison alloc];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  +[PLUtilities deviceBootTime](PLUtilities, "deviceBootTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:](v8, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v11, 2);

  v16[0] = v7;
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoreStorage lastEntryForKey:withComparisons:isSingleton:](self, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("PLProcessMonitorAgent_EventForward_ProcessID"), v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)aggregateEntriesForKey:(id)a3 withBucketLength:(double)a4 inTimeIntervalRange:(_PLTimeIntervalRange)a5
{
  double length;
  double location;
  id v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  __CFString *v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__5;
  v33 = __Block_byref_object_dispose__5;
  v34 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__PLCoreStorage_aggregateEntriesForKey_withBucketLength_inTimeIntervalRange___block_invoke;
  v23[3] = &unk_1E6A538A8;
  v26 = location;
  v27 = length;
  v28 = a4;
  v25 = &v29;
  v23[4] = self;
  v11 = v9;
  v24 = v11;
  -[PLCoreStorage dispatchSyncForEntryKey:withBlock:](self, "dispatchSyncForEntryKey:withBlock:", v11, v23);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __77__PLCoreStorage_aggregateEntriesForKey_withBucketLength_inTimeIntervalRange___block_invoke_2;
    block[3] = &unk_1E6A52828;
    v21 = CFSTR("aggregate");
    v22 = objc_opt_class();
    if (aggregateEntriesForKey_withBucketLength_inTimeIntervalRange__defaultOnce != -1)
      dispatch_once(&aggregateEntriesForKey_withBucketLength_inTimeIntervalRange__defaultOnce, block);
    v12 = aggregateEntriesForKey_withBucketLength_inTimeIntervalRange__classDebugEnabled;

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entryResults=%@"), v30[5]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLCoreStorage.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoreStorage aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 2221);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v18 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v18;
}

void __77__PLCoreStorage_aggregateEntriesForKey_withBucketLength_inTimeIntervalRange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timestamp + timeInterval AS timestampEnd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timestamp <= %f AND %f <= timestampEnd"), *(double *)(a1 + 56) + *(double *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timeInterval = %f"), *(_QWORD *)(a1 + 72));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13[0] = CFSTR("where");
  v13[1] = CFSTR("select");
  v14[0] = v4;
  v14[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entriesForKey:withProperties:", v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

BOOL __77__PLCoreStorage_aggregateEntriesForKey_withBucketLength_inTimeIntervalRange___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  aggregateEntriesForKey_withBucketLength_inTimeIntervalRange__classDebugEnabled = result;
  return result;
}

+ (id)allOperatorTablesToTrimConditionsForTrimDate:(id)a3
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t k;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  id obj;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  void *v76;
  _QWORD v77[4];

  v77[2] = *MEMORY[0x1E0C80C00];
  v55 = a3;
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "agents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v4;
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storageOperator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (!+[PLPlatform isHomePod](PLPlatform, "isHomePod"))
  {
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accounting");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "agents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allOperators");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v17);

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "services");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allOperators");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v12;
  objc_msgSend(v12, "addObjectsFromArray:", v20);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v7;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  if (v22)
  {
    v23 = v22;
    v53 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v69 != v53)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "tablesToTrimConditionsForTrimDate:", v55);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v65;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v65 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
              objc_msgSend(v21, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v31)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v32, v30);

              }
              objc_msgSend(v21, "objectForKeyedSubscript:", v30);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v30);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v34);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
          }
          while (v27);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    }
    while (v23);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v49 = v51;
  v54 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v54)
  {
    v52 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v54; ++k)
      {
        if (*(_QWORD *)v61 != v52)
          objc_enumerationMutation(v49);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "tablesToTrimConditionsForTrimDate:", v55);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        objc_msgSend(v36, "allKeys");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v57;
          do
          {
            for (m = 0; m != v39; ++m)
            {
              if (*(_QWORD *)v57 != v40)
                objc_enumerationMutation(v37);
              v42 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * m);
              objc_msgSend(v21, "objectForKeyedSubscript:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v43)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v44, v42);

              }
              objc_msgSend(v21, "objectForKeyedSubscript:", v42);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", v42);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObject:", v46);

            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
          }
          while (v39);
        }

      }
      v54 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v54);
  }

  +[PPSSQLStorage trimConditionsForPLSQLWithTrimDate:](PPSSQLStorage, "trimConditionsForPLSQLWithTrimDate:", v55);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addEntriesFromDictionary:", v47);

  return v21;
}

- (void)logMessage:(id)a3 fromFile:(id)a4 fromFunction:(id)a5 fromLineNumber:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[PLCoreStorage storageOperator](self, "storageOperator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("message");
  v16[1] = CFSTR("file");
  v17[0] = v12;
  v17[1] = v11;
  v17[2] = v10;
  v16[2] = CFSTR("function");
  v16[3] = CFSTR("line");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "logEventPointPLLog:", v15);
}

+ (void)logMessage:(id)a3 fromFile:(id)a4 fromFunction:(id)a5 fromLineNumber:(int64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  __CFString *v18;
  char v19;
  _QWORD block[4];
  __CFString *v21;
  char v22;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PLCoreStorage_logMessage_fromFile_fromFunction_fromLineNumber___block_invoke;
  block[3] = &unk_1E6A534F0;
  v21 = CFSTR("PLLogToSyslogOnly");
  v22 = 0;
  if (logMessage_fromFile_fromFunction_fromLineNumber__defaultOnce != -1)
    dispatch_once(&logMessage_fromFile_fromFunction_fromLineNumber__defaultOnce, block);
  v12 = logMessage_fromFile_fromFunction_fromLineNumber__objectForKey;

  if (!v12)
  {
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __65__PLCoreStorage_logMessage_fromFile_fromFunction_fromLineNumber___block_invoke_2;
    v17[3] = &unk_1E6A534F0;
    v18 = CFSTR("PLLogToSyslog");
    v19 = 0;
    if (logMessage_fromFile_fromFunction_fromLineNumber__defaultOnce_660 != -1)
      dispatch_once(&logMessage_fromFile_fromFunction_fromLineNumber__defaultOnce_660, v17);
    v13 = logMessage_fromFile_fromFunction_fromLineNumber__objectForKey_661;

    if (v13)
      NSLog(CFSTR("%@: %@"), v10, v16);
    if (+[PowerlogCore sharedCoreStarted](PowerlogCore, "sharedCoreStarted"))
    {
      +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "storage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v9, v10, a6);

      goto LABEL_12;
    }
    if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      goto LABEL_12;
  }
  NSLog(CFSTR("%@: %@"), v10, v16);
LABEL_12:

}

BOOL __65__PLCoreStorage_logMessage_fromFile_fromFunction_fromLineNumber___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  logMessage_fromFile_fromFunction_fromLineNumber__objectForKey = result;
  return result;
}

BOOL __65__PLCoreStorage_logMessage_fromFile_fromFunction_fromLineNumber___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  logMessage_fromFile_fromFunction_fromLineNumber__objectForKey_661 = result;
  return result;
}

- (void)willSwitchUser
{
  +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 5);
}

+ (id)additionalTables
{
  BOOL v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (+[PLDefaults taskMode](PLDefaults, "taskMode"))
    v2 = _additionalTables == 0;
  else
    v2 = 0;
  if (v2)
  {
    PLLogSubmission();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "_additionalTables: Looking for DRConfig", (uint8_t *)&v11, 2u);
    }

    +[PLDefaults objectForKey:ifNotSet:](PLDefaults, "objectForKey:ifNotSet:", CFSTR("PLTaskingTables"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_additionalTables;
    _additionalTables = v4;

    if (!_additionalTables)
    {
      PLLogSubmission();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "_additionalTables: DRConfig not found. Looking for DA defaults", (uint8_t *)&v11, 2u);
      }

      PLOSAPreferencesGetValue(CFSTR("PLTaskingTables"), CFSTR("com.apple.powerlogd"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)_additionalTables;
      _additionalTables = v7;

    }
    PLLogSubmission();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = _additionalTables;
      _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_DEFAULT, "_additionalTables: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)_additionalTables;
  else
    return 0;
}

- (void)attemptToSendTaskingStartNotification
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "taskingStarted");

  if (v4)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Tasking started, send out notification to inform clients.", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("kPLTaskingStartNotification"), self);

    notify_post("kPLTaskingStartNotificationGlobal");
  }
}

- (void)setStorageLocked:(BOOL)a3
{
  self->_storageLocked = a3;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setStorageReady:(BOOL)a3
{
  self->_storageReady = a3;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PLKQueue)profileDefaultsKQueue
{
  return (PLKQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProfileDefaultsKQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLTimer)dailyTaskTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDailyTaskTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setFlushCachesTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLCFNotificationOperatorComposition)flushCachesCFNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFlushCachesCFNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLCFNotificationOperatorComposition)blockingFlushCachesCFNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBlockingFlushCachesCFNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLCFNotificationOperatorComposition)keybagFirstUnlockNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeybagFirstUnlockNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCResponderOperatorComposition)safeFileResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSafeFileResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLXPCResponderOperatorComposition)XPCFlushCacheResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setXPCFlushCacheResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLXPCResponderOperatorComposition)blPathResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBlPathResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCResponderOperatorComposition)archivesResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setArchivesResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCResponderOperatorComposition)quarantineResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setQuarantineResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCResponderOperatorComposition)quarantineCopyResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setQuarantineCopyResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLXPCResponderOperatorComposition)batteryUIPlistsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBatteryUIPlistsResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLXPCResponderOperatorComposition)upgradeLogsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUpgradeLogsResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLStorageOperator)storageOperator
{
  return (PLStorageOperator *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStorageOperator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableSet)safeCopyInProgress
{
  return (NSMutableSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSafeCopyInProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (OS_dispatch_queue)backgroundQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168, 1);
}

- (void)setBackgroundQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (OS_dispatch_queue)utilityQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setUtilityQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_safeCopyInProgress, 0);
  objc_storeStrong((id *)&self->_storageOperator, 0);
  objc_storeStrong((id *)&self->_upgradeLogsResponder, 0);
  objc_storeStrong((id *)&self->_batteryUIPlistsResponder, 0);
  objc_storeStrong((id *)&self->_quarantineCopyResponder, 0);
  objc_storeStrong((id *)&self->_quarantineResponder, 0);
  objc_storeStrong((id *)&self->_archivesResponder, 0);
  objc_storeStrong((id *)&self->_blPathResponder, 0);
  objc_storeStrong((id *)&self->_XPCFlushCacheResponder, 0);
  objc_storeStrong((id *)&self->_safeFileResponder, 0);
  objc_storeStrong((id *)&self->_keybagFirstUnlockNotification, 0);
  objc_storeStrong((id *)&self->_blockingFlushCachesCFNotification, 0);
  objc_storeStrong((id *)&self->_flushCachesCFNotification, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_flushCachesTimer, 0);
  objc_storeStrong((id *)&self->_dailyTaskTimer, 0);
  objc_storeStrong((id *)&self->_profileDefaultsKQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)registerDailyTasks_XPCActivity
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD handler[5];
  id v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("dbDailyTasksInterval"), (double)(uint64_t)*MEMORY[0x1E0C807B8]);
  v4 = v3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = v4;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Setting up dailyTasks XPC activity with dbDailyTasksInterval = %f", buf, 0xCu);
  }

  v6 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_26;
  handler[3] = &unk_1E6A53C28;
  v9 = v4;
  handler[4] = self;
  v8 = &__block_literal_global_18;
  xpc_activity_register("com.apple.powerlogd.dailyTasks", v6, handler);

}

BOOL __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke(uint64_t a1, void *a2, xpc_activity_state_t a3)
{
  void *v4;
  _xpc_activity_s *v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v15[0] = &unk_1E6ABACD0;
  v15[1] = &unk_1E6ABACE8;
  v16[0] = CFSTR("RUN");
  v16[1] = CFSTR("DONE");
  v15[2] = &unk_1E6ABAD00;
  v15[3] = &unk_1E6ABAD18;
  v16[2] = CFSTR("WAIT");
  v16[3] = CFSTR("DEFER");
  v15[4] = &unk_1E6ABAD30;
  v16[4] = CFSTR("CONTINUE");
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_activity_set_state(v5, a3);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_DEFAULT, "registerDailyTasks: set XPC activity state to %@", (uint8_t *)&v13, 0xCu);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_cold_1(a3, v6, v9);
  }

  return v7;
}

void __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_26(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  xpc_object_t v6;
  uint64_t v7;
  xpc_object_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  _xpc_activity_s *v15;
  id v16;
  uint8_t buf[4];
  xpc_object_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    {
      if (xpc_activity_should_defer(v3))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "dailyTasks");
        +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "workQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_28;
        v14[3] = &unk_1E6A53C00;
        v16 = *(id *)(a1 + 40);
        v15 = v3;
        dispatch_async(v13, v14);

      }
    }
  }
  else if (!state)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "registerDailyTasks: Check in for XPC activity...", buf, 2u);
    }

    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C80898], 1);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E0C807A8], (uint64_t)*(double *)(a1 + 48));
    xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
    v7 = *MEMORY[0x1E0C807C0];
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E0C80760], 22 * *MEMORY[0x1E0C807C0]);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E0C80790], 2 * v7);
    v8 = xpc_activity_copy_criteria(v3);
    v9 = v8;
    if (v8 && xpc_equal(v8, v6))
    {
      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "registerDailyTasks: Existing criteria found { %@ }", buf, 0xCu);
      }

    }
    else
    {
      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_DEFAULT, "registerDailyTasks: Existing criteria not found, setting default criteria { %@ }...", buf, 0xCu);
      }

      xpc_activity_set_criteria(v3, v6);
    }

  }
}

uint64_t __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 5);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLCoreStorage: 'BUI_DEMO_PATH' is valid.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __41__PLCoreStorage_initOperatorDependancies__block_invoke_7_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  void *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = &unk_1E6AF6F58;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_4_2(&dword_1B6AB6000, a2, a3, "Received xpc request for registration: %@ and payload: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

void __51__PLCoreStorage_copyUpgradePowerlogsAtPath_toPath___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_2(&dword_1B6AB6000, v0, (uint64_t)v0, "Copying upgrade log at path: %@ to path: %@", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)entriesForKey:withProperties:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_2(&dword_1B6AB6000, v0, (uint64_t)v0, "Callers of entriesForKey %@ withProperties %@", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)entriesForKey:withComparisons:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "All entries found in cache and database: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)entriesForKey:withComparisons:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Entries found in database: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)entriesForKey:withComparisons:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Searching for matching entries in database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)entriesForKey:withComparisons:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Entries found in cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)entriesForKey:withComparisons:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Searching for matching entries in cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __62__PLCoreStorage_XPCScheduling__registerDailyTasks_XPCActivity__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v6;
  _os_log_error_impl(&dword_1B6AB6000, a3, OS_LOG_TYPE_ERROR, "registerDailyTasks: failed to set XPC activity state to %@", (uint8_t *)&v7, 0xCu);

}

@end
