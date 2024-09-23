@implementation PGGraphPeopleSuggestionEnrichmentProcessor

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint32_t denom;
  uint32_t numer;
  NSObject *v21;
  NSObject *v22;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "enrichmentLoggingConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphPeopleSuggestionEnrichmentProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v16 = mach_absolute_time();
  v17 = objc_msgSend(v11, "isResumingFullAnalysis");

  if (v17)
  {
    -[PGGraphPeopleSuggestionEnrichmentProcessor _performPeopleSuggestionForHomeWithManager:progressBlock:](self, "_performPeopleSuggestionForHomeWithManager:progressBlock:", v9, v10);
    -[PGGraphPeopleSuggestionEnrichmentProcessor _performPeopleSuggestionForSharedLibraryWithManager:progressBlock:](self, "_performPeopleSuggestionForSharedLibraryWithManager:progressBlock:", v9, v10);
    v18 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v21 = v15;
    v22 = v21;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v22, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphPeopleSuggestionEnrichmentProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "PGGraphPeopleSuggestionEnrichmentProcessor";
      v26 = 2048;
      v27 = (float)((float)((float)((float)(v18 - v16) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

}

- (void)_performPeopleSuggestionForHomeWithManager:(id)a3 progressBlock:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestedPersonsForHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v12), "objectForKeyedSubscript:", CFSTR("localIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    v35 = v4;
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("suggestedForClientType == %d"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setInternalPredicate:](v14, "setInternalPredicate:", v15);

    v16 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v7, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchPersonsWithLocalIdentifiers:options:", v17, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "count");
    v36 = v5;
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v18, "fetchedObjectIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateWithFormat:", CFSTR("suggestedForClientType == %d && NOT (self in %@)"), 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setInternalPredicate:", v23);

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    v34 = v19;
    if (v19 | v25)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __103__PGGraphPeopleSuggestionEnrichmentProcessor__performPeopleSuggestionForHomeWithManager_progressBlock___block_invoke;
      v38[3] = &unk_1E8433828;
      v39 = v18;
      v40 = v24;
      v37 = 0;
      v26 = objc_msgSend(v36, "performChangesAndWait:error:", v38, &v37);
      v27 = v37;
      if ((v26 & 1) == 0)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "loggingConnection");
        v29 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v46 = (uint64_t)v27;
          _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "Failed to persist people suggestion for home: %@", buf, 0xCu);
        }

      }
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "loggingConnection");
    v31 = objc_claimAutoreleasedReturnValue();

    v4 = v35;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134218496;
      v46 = v32;
      v47 = 2048;
      v48 = v34;
      v49 = 2048;
      v50 = v25;
      _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_DEFAULT, "Suggesting %lu persons for client home (newly persisted: %lu, newly removed: %lu).", buf, 0x20u);
    }

    v5 = v36;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_DEFAULT, "Found no persons to suggest for client home.", buf, 2u);
    }
  }

}

void __103__PGGraphPeopleSuggestionEnrichmentProcessor__performPeopleSuggestionForHomeWithManager_progressBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "persistSuggestionForClient:", 1);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "persistSuggestionForClient:", 0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

}

@end
