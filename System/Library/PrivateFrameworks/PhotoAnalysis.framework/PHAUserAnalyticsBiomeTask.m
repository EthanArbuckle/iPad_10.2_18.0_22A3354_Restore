@implementation PHAUserAnalyticsBiomeTask

- (PHAUserAnalyticsBiomeTask)initWithTaskType:(signed __int16)a3
{
  PHAUserAnalyticsBiomeTask *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHAUserAnalyticsBiomeTask;
  result = -[PHAUserAnalyticsBiomeTask init](&v5, sel_init);
  if (result)
    result->_taskType = a3;
  return result;
}

- (NSString)name
{
  const __CFString *v2;

  v2 = CFSTR("PHAUserAnalyticsBiomeUnknown");
  if (self->_taskType == 1)
    v2 = CFSTR("PHAUserAnalyticsBiomeWeeklyTask");
  if (self->_taskType)
    return &v2->isa;
  else
    return (NSString *)CFSTR("PHAUserAnalyticsBiomeDailyTask");
}

- (double)period
{
  double result;

  result = dbl_1CADD05A0[self->_taskType == 1];
  if (!self->_taskType)
    return 86400.0;
  return result;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 0;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = v4;
  if (self->_taskType == 1 && !objc_msgSend(v4, "isReady"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHAUserAnalyticsBiomeTask shouldRunWithPhotoLibrary:](self, "shouldRunWithPhotoLibrary:", v6);

  }
  return v7;
}

- (BOOL)shouldRunWithPhotoLibrary:(id)a3
{
  char v4;
  void *v5;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "isSystemPhotoLibrary");
  if ((v4 & 1) == 0)
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_9549);
    v5 = (void *)__PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_DEBUG))
    {
      v7 = v5;
      -[PHAUserAnalyticsBiomeTask name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_DEBUG, "Task is running on a non system photo library: not running %@ job", (uint8_t *)&v9, 0xCu);

    }
  }
  return v4;
}

- (void)pruneBiomeEventsWithUUIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  void *v24;
  void *v25;
  void *v26;
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
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[10];

  v45[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  BiomeLibrary();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "Photos");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "UserAnalytics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v35;
  BiomeLibrary();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "Photos");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "Picker");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v32;
  BiomeLibrary();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "Photos");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "Search");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v29;
  BiomeLibrary();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "Photos");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "Map");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v26;
  BiomeLibrary();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "Photos");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "Memories");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "Viewed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v21;
  BiomeLibrary();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "Photos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Memories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v6;
  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Photos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MemoryCreation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v9;
  BiomeLibrary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Photos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = v22;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v18), "pruner");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v17;
        v38[1] = 3221225472;
        v38[2] = __55__PHAUserAnalyticsBiomeTask_pruneBiomeEventsWithUUIDs___block_invoke;
        v38[3] = &unk_1E8521C40;
        v39 = v3;
        objc_msgSend(v19, "deleteWithPolicy:eventsPassingTest:", CFSTR("deleted-or-hidden-asset"), v38);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v15);
  }

}

- (void)pruneDeletedRecordsFromBiomeFrom:(id)a3 progressReporter:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (__PXLog_genericOnceToken != -1)
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_140);
  v8 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1CAC16000, v8, OS_LOG_TYPE_INFO, "Biome deletion task starting", (uint8_t *)&v20, 2u);
  }
  -[PHAUserAnalyticsBiomeTask biomeUUIDsFrom:progressReporter:](self, "biomeUUIDsFrom:progressReporter:", &unk_1E8540D28, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAUserAnalyticsBiomeTask deletedAssetUUIDsFromBiomeFrom:biomeUUIDs:](self, "deletedAssetUUIDsFromBiomeFrom:biomeUUIDs:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v12 = v11;
    -[PHAUserAnalyticsBiomeTask pruneBiomeEventsWithUUIDs:](self, "pruneBiomeEventsWithUUIDs:", v10);
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_144);
    v13 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      v20 = 134217984;
      v21 = v12;
      _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "Biome deletion task deleted events for %lu memories).", (uint8_t *)&v20, 0xCu);
    }
  }
  -[PHAUserAnalyticsBiomeTask biomeUUIDsFrom:progressReporter:](self, "biomeUUIDsFrom:progressReporter:", &unk_1E8540D40, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAUserAnalyticsBiomeTask deletedMemoryUUIDsFromBiomeFrom:biomeUUIDs:](self, "deletedMemoryUUIDsFromBiomeFrom:biomeUUIDs:", v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (!v16)
    goto LABEL_15;
  v17 = v16;
  -[PHAUserAnalyticsBiomeTask pruneBiomeEventsWithUUIDs:](self, "pruneBiomeEventsWithUUIDs:", v15);
  if (__PXLog_genericOnceToken != -1)
    dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_151);
  v18 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    v20 = 134217984;
    v21 = v17;
    _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_INFO, "Biome deletion task deleted events for %lu assets).", (uint8_t *)&v20, 0xCu);
LABEL_15:
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_153);
  }
  v19 = __PXLog_genericOSLog;
  if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_INFO, "Biome deletion task completed.", (uint8_t *)&v20, 2u);
  }

}

- (id)biomeUUIDsFrom:(id)a3 progressReporter:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    *(_QWORD *)&v9 = 138412290;
    v19 = v9;
    do
    {
      v13 = 0;
      do
      {
        v14 = v11;
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v7);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "intValue", v19);
        v21 = v11;
        +[PHABiomeUtilities readUUIDsWithStream:progressReporter:error:](PHABiomeUtilities, "readUUIDsWithStream:progressReporter:error:", v15, v6, &v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v21;

        if (v16)
        {
          objc_msgSend(v20, "unionSet:", v16);
        }
        else
        {
          if (__PXLog_genericOnceToken != -1)
            dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_156);
          v17 = __PXLog_genericOSLog;
          if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v27 = v11;
            _os_log_error_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_ERROR, "Reading from Biome Failed with error: %@", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);

  }
  return v20;
}

- (id)deletedAssetUUIDsFromBiomeFrom:(id)a3 biomeUUIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFetchPropertySets:", v9);

    objc_msgSend(v8, "setIncludeHiddenAssets:", 0);
    v10 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v6, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchAssetsWithUUIDs:options:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      v13 = 0;
      do
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObject:", v15);

        ++v13;
      }
      while (v13 < objc_msgSend(v12, "count"));
    }

  }
  return v7;
}

- (id)deletedMemoryUUIDsFromBiomeFrom:(id)a3 biomeUUIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = *MEMORY[0x1E0CD1D20];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchPropertySets:", v10);

    objc_msgSend(MEMORY[0x1E0CD1630], "localIdentifiersWithUUIDs:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v14 = 0;
      do
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", v16);

        ++v14;
      }
      while (v14 < objc_msgSend(v13, "count"));
    }

  }
  return v7;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "workingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[PHAUserAnalyticsBiomeTask runWithPhotoLibrary:analytics:progressReporter:error:](self, "runWithPhotoLibrary:analytics:progressReporter:error:", v11, v12, v8, a5);
  return (char)a5;
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PHAPhotoStyle *v20;
  char v21;
  uint64_t v22;
  uint32_t denom;
  uint32_t numer;
  NSObject *v25;
  NSObject *v26;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = os_log_create("com.apple.photoanalysisd", "UserAnalyticsBiomeTask");
  v12 = os_signpost_id_generate(v11);
  info = 0;
  mach_timebase_info(&info);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "UserAnalyticsBiomeTask", ", buf, 2u);
  }

  v15 = mach_absolute_time();
  v16 = v10;
  v17 = v16;
  v18 = v16;
  if (self->_taskType == 1)
  {
    objc_msgSend(v16, "childProgressReporterForStep:outOf:", 0, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PHAUserAnalyticsBiomeTask pruneDeletedRecordsFromBiomeFrom:progressReporter:](self, "pruneDeletedRecordsFromBiomeFrom:progressReporter:", v9, v18);
  if (self->_taskType == 1)
  {
    objc_msgSend(v17, "childProgressReporterForStep:outOf:", 2, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PHAPhotoStyle initWithphotoLibrary:]([PHAPhotoStyle alloc], "initWithphotoLibrary:", v9);
    v21 = -[PHAPhotoStyle updateStyleStreamWithProgressReporter:error:](v20, "updateStyleStreamWithProgressReporter:error:", v19, a6);

  }
  else
  {
    v21 = 1;
  }
  v22 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v25 = v14;
  v26 = v25;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v26, OS_SIGNPOST_INTERVAL_END, v12, "UserAnalyticsBiomeTask", ", buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "UserAnalyticsBiomeTask";
    v31 = 2048;
    v32 = (float)((float)((float)((float)(v22 - v15) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v21;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAUserAnalyticsBiomeTask timeoutFatal:]", "PHAUserAnalyticsBiomeTask.m", 250, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAUserAnalyticsBiomeTask is stuck", v3, 2u);
  }
}

void __61__PHAUserAnalyticsBiomeTask_biomeUUIDsFrom_progressReporter___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __79__PHAUserAnalyticsBiomeTask_pruneDeletedRecordsFromBiomeFrom_progressReporter___block_invoke_152()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __79__PHAUserAnalyticsBiomeTask_pruneDeletedRecordsFromBiomeFrom_progressReporter___block_invoke_150()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __79__PHAUserAnalyticsBiomeTask_pruneDeletedRecordsFromBiomeFrom_progressReporter___block_invoke_143()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __79__PHAUserAnalyticsBiomeTask_pruneDeletedRecordsFromBiomeFrom_progressReporter___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

uint64_t __55__PHAUserAnalyticsBiomeTask_pruneBiomeEventsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  return v5;
}

void __55__PHAUserAnalyticsBiomeTask_shouldRunWithPhotoLibrary___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

@end
