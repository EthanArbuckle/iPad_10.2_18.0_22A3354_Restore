@implementation PGGraphMemoryProcessorHelper

+ (id)localMemoryByUniqueIdentifierInPhotoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_localMemoryByUniqueIdentifierInPhotoLibrary:withAdditionalPredicate:", a3, 0);
}

+ (id)localMemoryByUniqueIdentifierForMemoryUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_localMemoryByUniqueIdentifierInPhotoLibrary:withAdditionalPredicate:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

+ (id)localMemoryByUniqueIdentifierWithGraphMemoryIdentifiers:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("graphMemoryIdentifier"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_localMemoryByUniqueIdentifierInPhotoLibrary:withAdditionalPredicate:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

+ (id)_localMemoryByUniqueIdentifierInPhotoLibrary:(id)a3 withAdditionalPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("pendingState"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  if (v6)
    objc_msgSend(v7, "addObject:", v6);
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIncludeLocalMemories:", 1);
  objc_msgSend(v9, "setIncludeRejectedMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v10);

  objc_msgSend((id)objc_opt_class(), "_fetchLocalMemoriesWithFetchOptions:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_fetchLocalMemoriesWithFetchOptions:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();

  v16 = v3;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "graphMemoryIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);
        }
        else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v13;
          _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "[PGGraphMemoryProcessorHelper] graphMemoryIdentifier is nil for %@", buf, 0xCu);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v10);
  }

  return v7;
}

+ (void)resetLocalMemoryLastEnrichmentDateOfMemoriesWithUniqueIdentifiers:(id)a3 localMemoryByUniqueIdentifierCache:(id)a4 inPhotoLibrary:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), (_QWORD)v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

    objc_msgSend((id)objc_opt_class(), "resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories:inPhotoLibrary:", v10, v9);
  }

}

+ (void)resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories:(id)a3 inPhotoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  int v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __109__PGGraphMemoryProcessorHelper_resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories_inPhotoLibrary___block_invoke;
    v17[3] = &unk_1E8435668;
    v7 = v5;
    v18 = v7;
    v16 = 0;
    v8 = objc_msgSend(v6, "performChangesAndWait:error:", v17, &v16);
    v9 = v16;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 67109120;
        v20 = v14;
        _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoryProcessorHelper] Successfully reset %d local memories", buf, 8u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 67109378;
      v20 = v15;
      v21 = 2112;
      v22 = v9;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "[PGGraphMemoryProcessorHelper] Failed to reset %d local memories, error=%@", buf, 0x12u);
    }

  }
}

void __109__PGGraphMemoryProcessorHelper_resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories_inPhotoLibrary___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLastEnrichmentDate:", 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

@end
