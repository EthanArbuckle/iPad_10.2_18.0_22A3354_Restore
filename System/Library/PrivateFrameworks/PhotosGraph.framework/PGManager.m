@implementation PGManager

- (id)suggestedRecipientsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 sharingOptions:(id)a5
{
  id v8;
  id v9;
  char *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  PGSharingManager *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint32_t denom;
  uint32_t numer;
  NSObject *v22;
  NSObject *v23;
  uint64_t v25;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (char *)a5;
  -[PGManager suggestionsLoggingConnection](self, "suggestionsLoggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SuggestedRecipientsForAssetLocalIdentifiers", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v25 = mach_absolute_time();
  -[PGManager workingContextForSuggestions](self, "workingContextForSuggestions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PGSharingManager initWithWorkingContext:]([PGSharingManager alloc], "initWithWorkingContext:", v15);
  -[PGManager suggestionsLoggingConnection](self, "suggestionsLoggingConnection");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v10;
    v29 = 2112;
    v30 = *(double *)&v8;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Asking for recipient suggestions from options %@, for assets %@ moments %@", buf, 0x20u);
  }

  -[PGSharingManager suggestionResultsForAssetLocalIdentifiers:momentLocalIdentifiers:options:](v16, "suggestionResultsForAssetLocalIdentifiers:momentLocalIdentifiers:options:", v8, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v22 = v14;
  v23 = v22;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_END, v12, "SuggestedRecipientsForAssetLocalIdentifiers", ", buf, 2u);
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "SuggestedRecipientsForAssetLocalIdentifiers";
    v29 = 2048;
    v30 = (float)((float)((float)((float)(v19 - v25) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v18;
}

- (id)suggestedContributionsForAssetsMetadata:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  char *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  char *v24;
  NSObject *v25;
  PGManager *v26;
  id v27;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  -[PGManager suggestionsLoggingConnection](self, "suggestionsLoggingConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = v5;
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SuggestedContribution", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v11 = mach_absolute_time();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v30 = v4;
    _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Asking for contributions for metadata: %{private}@", buf, 0xCu);
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __62__PGManager_Sharing__suggestedContributionsForAssetsMetadata___block_invoke;
  v23[3] = &unk_1E8435410;
  v24 = v4;
  v12 = v10;
  v25 = v12;
  v26 = self;
  v13 = v6;
  v27 = v13;
  v14 = v4;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v23);
  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v12;
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_END, v8, "SuggestedContribution", ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "SuggestedContribution";
    v31 = 2048;
    v32 = (float)((float)((float)((float)(v15 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v20 = v27;
  v21 = v13;

  return v21;
}

- (BOOL)generateDefaultRulesForLibraryScopeWithLocalIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PGManager photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CD15E0];
  v35[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchLibraryScopesWithLocalIdentifiers:options:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CD1600], "fetchLibraryScopeRulesForLibraryScope:options:", v15, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      if (a5)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Library scope already has existing rules: %@"), v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDescription:", v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19 = 0;
    }
    else
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy_;
      v33 = __Block_byref_object_dispose_;
      v34 = 0;
      v21 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __95__PGManager_Sharing__generateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke;
      v26[3] = &unk_1E842DCB8;
      v28 = &v29;
      v26[4] = self;
      v27 = v9;
      -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v26);
      if (objc_msgSend((id)v30[5], "count"))
      {
        v23[0] = v21;
        v23[1] = 3221225472;
        v23[2] = __95__PGManager_Sharing__generateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke_2;
        v23[3] = &unk_1E8435708;
        v24 = v15;
        v25 = &v29;
        v19 = objc_msgSend(v10, "performChangesAndWait:error:", v23, a5);

      }
      else
      {
        v19 = 1;
      }

      _Block_object_dispose(&v29, 8);
    }
    goto LABEL_13;
  }
  if (a5)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot find library scope for identifier: %@"), v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDescription:", v16);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (id)suggestedMomentLocalIdentifiersForPersonLocalIdentifiers:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__PGManager_Sharing__suggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke;
  v13[3] = &unk_1E8427AF8;
  v10 = v8;
  v14 = v10;
  v15 = &v23;
  v16 = &v17;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v13);
  if (a5)
    *a5 = objc_retainAutorelease((id)v18[5]);
  objc_msgSend((id)v24[5], "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (id)homeCircularRegions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGManager serviceManager](self, "serviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    __assert_rtn("-[PGManager(Sharing) homeCircularRegions]", "PGManager+Sharing.m", 270, "serviceManager != nil");
  v5 = v4;
  objc_msgSend(v4, "mePerson");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "countOfAddressesOfType:", 0);
    -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[PGManager(Sharing) homeCircularRegions]";
      v20 = 2048;
      v21 = v8;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_DEFAULT, "%s: Found %zu potential home addresses", buf, 0x16u);
    }

    -[PGManager locationCache](self, "locationCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prefetchPersonAddressesIfNeededWithLocationCache:", v10);

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__PGManager_Sharing__homeCircularRegions__block_invoke;
    v16[3] = &unk_1E8427B20;
    v11 = v3;
    v17 = v11;
    objc_msgSend(v7, "enumerateAddressesOfType:asPlacemarkWithBlock:", 0, v16);
    -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[NSObject count](v11, "count");
      *(_DWORD *)buf = 136315394;
      v19 = "-[PGManager(Sharing) homeCircularRegions]";
      v20 = 2048;
      v21 = v13;
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_DEFAULT, "%s: Created %zu home circular regions", buf, 0x16u);
    }

    v14 = v17;
  }
  else
  {
    -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[PGManager(Sharing) homeCircularRegions]";
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_DEFAULT, "%s: No me person found, not returning any home circular regions", buf, 0xCu);
    }
  }

  return v3;
}

- (id)recentFrequentLocationRegions
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  PGManager *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke;
  v7[3] = &unk_1E8435640;
  v4 = v3;
  v8 = v4;
  v9 = self;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v7);
  v5 = v4;

  return v5;
}

- (id)textFeaturesForMomentLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PGManager *v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PGManager_Sharing__textFeaturesForMomentLocalIdentifiers___block_invoke;
  v11[3] = &unk_1E84354B0;
  v12 = v4;
  v13 = self;
  v6 = v5;
  v14 = v6;
  v7 = v4;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v11);
  v8 = v14;
  v9 = v6;

  return v9;
}

void __60__PGManager_Sharing__textFeaturesForMomentLocalIdentifiers___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[4], "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = a1[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CD1698], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "graph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__PGManager_Sharing__textFeaturesForMomentLocalIdentifiers___block_invoke_210;
    v15[3] = &unk_1E8436408;
    v16 = a1[6];
    objc_msgSend(v12, "enumerateNodesUsingBlock:", v15);
    v13 = v16;
  }
  else
  {
    objc_msgSend(a1[5], "suggestionsLoggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = a1[4];
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEFAULT, "Cannot get text features for moments %@ - no moment node found", buf, 0xCu);
    }
  }

}

void __60__PGManager_Sharing__textFeaturesForMomentLocalIdentifiers___block_invoke_210(uint64_t a1, void *a2)
{
  id v3;
  PGTextFeatureGenerator *v4;
  void *v5;
  void *v6;
  PGTextFeatureGenerator *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [PGTextFeatureGenerator alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGTextFeatureGenerator initWithMomentNodes:graph:](v4, "initWithMomentNodes:graph:", v5, v6);

  -[PGTextFeatureGenerator knowledgeFeatures](v7, "knowledgeFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "encodedData", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = *(void **)(a1 + 32);
  objc_msgSend(v3, "localIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v9, v17);

}

void __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a2;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v26 = v6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke_2;
  v20[3] = &unk_1E8427B48;
  v20[4] = &v21;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v20);
  v8 = (void *)v22[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v8, "isEqualToDate:", v9);

  if ((v8 & 1) == 0)
  {
    objc_msgSend((id)v22[5], "dateByAddingTimeInterval:", -7889400.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CB3588]);
    v12 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v10, v22[5]);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke_3;
    v16[3] = &unk_1E8427B70;
    v13 = v12;
    v17 = v13;
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v18 = v14;
    v19 = v15;
    objc_msgSend(v5, "enumerateNodesUsingBlock:", v16);

  }
  _Block_object_dispose(&v21, 8);

}

void __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "universalEndDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "laterDate:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __51__PGManager_Sharing__recentFrequentLocationRegions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "universalDateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intersectsDateInterval:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(v3, "addressNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0C9E368]);
      objc_msgSend(v6, "coordinate");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v6, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v7, "initWithCenter:radius:identifier:", v12, v9, v11, 150.0);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "graphLoggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = 136315395;
        v16 = "-[PGManager(Sharing) recentFrequentLocationRegions]_block_invoke_3";
        v17 = 2113;
        v18 = v3;
        _os_log_fault_impl(&dword_1CA237000, v14, OS_LOG_TYPE_FAULT, "%s: frequent location skipped due to missing address node edge: %{private}@", (uint8_t *)&v15, 0x16u);
      }

    }
  }

}

void __41__PGManager_Sharing__homeCircularRegions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "region");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __97__PGManager_Sharing__suggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  objc_msgSend(a2, "graph");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "momentNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = *(_QWORD *)(a1[5] + 8);
    v7 = *(void **)(v6 + 40);
    if (v5)
    {
      objc_msgSend(v4, "localIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unionSet:", v8);

      +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "concludedTripTypeNodesInGraph:", v25);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "highlightGroupNodes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "highlightNodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "highlightGroupNodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "collectionByIntersecting:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      objc_msgSend(v13, "momentNodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unionSet:", v16);

    }
    else
    {
      *(_QWORD *)(v6 + 40) = 0;

      v22 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No moment nodes found for persons with local identifiers: %@"), a1[4]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDescription:", v9);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1[6] + 8);
      v10 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }

  }
  else
  {
    v17 = *(_QWORD *)(a1[5] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

    v19 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No person nodes found for local identifiers: %@"), a1[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDescription:", v4);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;
  }

}

void __95__PGManager_Sharing__generateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "graph");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "defaultRulesWithOptions:graph:", v5, v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __95__PGManager_Sharing__generateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD15E8], "changeRequestForLibraryScope:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "autoSharePolicy") != 2)
    objc_msgSend(v2, "setAutoSharePolicy:", 2);
  objc_msgSend(v2, "updateWithCustomRules:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __62__PGManager_Sharing__suggestedContributionsForAssetsMetadata___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGShareBackSuggesterInput suggesterInputsWithDictionaries:](PGShareBackSuggesterInput, "suggesterInputsWithDictionaries:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGShareBackSuggester shareBackSuggesterForCMMWithLoggingConnection:photoLibrary:graph:](PGShareBackSuggester, "shareBackSuggesterForCMMWithLoggingConnection:photoLibrary:graph:", v5, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0;
  objc_msgSend(v7, "suggesterResultsForUnclusteredSuggesterInputs:inGraph:error:", v4, v3, &v76);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v76;
  +[PGShareBackSuggesterResult momentNodesForSuggesterResults:](PGShareBackSuggesterResult, "momentNodesForSuggesterResults:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v58 = v7;
  }
  else
  {
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global_1106);
    objc_msgSend(v12, "setMaximumDistance:", 864000.0);
    objc_msgSend(v12, "setMinimumNumberOfObjects:", 2);
    objc_msgSend(v11, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performWithDataset:progressBlock:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "count"))
    {
      v31 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v82 = v11;
        _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] None of the matched moment nodes were contiguous: %{private}@", buf, 0xCu);
      }
      goto LABEL_26;
    }
    v56 = v3;
    v58 = v7;
    v51 = v9;
    v52 = v4;
    v53 = (void *)objc_msgSend(v11, "mutableCopy");
    v15 = objc_opt_new();
    v16 = v11;
    v11 = (void *)v15;

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v17 = v14;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v73 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "objects");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObjectsFromArray:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
      }
      while (v19);
    }

    objc_msgSend(v53, "minusSet:", v11);
    if (objc_msgSend(v53, "count"))
    {
      v23 = *(NSObject **)(a1 + 40);
      v3 = v56;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v82 = v53;
        _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Discarding non contiguous moments: %{private}@", buf, 0xCu);
      }

      v9 = v51;
      v4 = v52;
      v7 = v58;
LABEL_26:

      goto LABEL_27;
    }
    v55 = v8;
    v32 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v33 = v11;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v69 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          if (objc_msgSend(v38, "isPartOfTrip"))
          {
            objc_msgSend(v38, "highlightGroupNode");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObject:", v39);

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      }
      while (v35);
    }
    v59 = v33;

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v40 = v32;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v65;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v65 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
          v46 = objc_msgSend(v40, "countForObject:", v45);
          if (v46 >= 2)
          {
            v47 = v46;
            objc_msgSend(v45, "eventEnrichmentMomentNodes");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v48, "count") > v47)
            {
              v49 = *(NSObject **)(a1 + 40);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                v82 = v45;
                _os_log_impl(&dword_1CA237000, v49, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Adding moment nodes from trip %{private}@", buf, 0xCu);
              }
              objc_msgSend(v48, "temporarySet");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "unionSet:", v50);

            }
          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
      }
      while (v42);
    }

    v8 = v55;
    v3 = v56;
    v9 = v51;
    v4 = v52;
    v11 = v59;
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v12 = v11;
  v24 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
  if (v24)
  {
    v25 = v24;
    v54 = v8;
    v57 = v3;
    v26 = v9;
    v27 = *(_QWORD *)v61;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v61 != v27)
          objc_enumerationMutation(v12);
        v29 = *(void **)(a1 + 56);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * m), "localIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v30);

      }
      v25 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
    }
    while (v25);
    v11 = v12;
    v3 = v57;
    v7 = v58;
    v9 = v26;
    v8 = v54;
  }
  else
  {
    v11 = v12;
    v7 = v58;
  }
LABEL_27:

}

void __62__PGManager_Sharing__suggestedContributionsForAssetsMetadata___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "universalStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
}

+ (id)defaultRulesWithOptions:(id)a3 graph:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "partners");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "localIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc_init(MEMORY[0x1E0CD15F8]);
          objc_msgSend(v13, "setCriteria:", 1);
          v21 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setPersonUUIDs:", v14);

          v15 = objc_alloc_init(MEMORY[0x1E0CD1600]);
          objc_msgSend(v15, "addCondition:", v13);
          objc_msgSend(v5, "addObject:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)regenerateMemoriesOfCategory:(unint64_t)a3 progressReporter:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__PGManager_MemoriesPrivate__regenerateMemoriesOfCategory_progressReporter_completionBlock___block_invoke;
  v12[3] = &unk_1E8427CB8;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  -[PGManager performAsynchronousGraphWriteUsingBlock:](self, "performAsynchronousGraphWriteUsingBlock:", v12);

}

void __92__PGManager_MemoriesPrivate__regenerateMemoriesOfCategory_progressReporter_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  PGGraphBuilder *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v4, "instantiateMutableGraphWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v5, "enableInTransactionCheck");
    objc_msgSend(v5, "enterBatch");
    v7 = -[PGGraphBuilder initWithGraph:manager:]([PGGraphBuilder alloc], "initWithGraph:manager:", v5, v3);
    objc_msgSend(*(id *)(a1 + 40), "childProgressReporterFromStart:toEnd:", 0.1, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphIngestMemoryProcessor regenerateMemoriesOfCategory:withGraphBuilder:progressReporter:](PGGraphIngestMemoryProcessor, "regenerateMemoriesOfCategory:withGraphBuilder:progressReporter:", *(_QWORD *)(a1 + 56), v7, v8);
    objc_msgSend(v5, "leaveBatch");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)_momentNodesFromMemory:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1630], "fetchMomentsBackingMemory:options:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "uuid", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v10, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_featureNodesForEncodedFeatures:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PGFeature *v14;
  PGFeature *v15;
  void *v16;
  void *v17;
  PGGraphFeatureNodeCollection *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
          v14 = [PGFeature alloc];
          v15 = -[PGFeature initWithEncodedFeature:](v14, "initWithEncodedFeature:", v13, (_QWORD)v20);
          -[PGFeature nodeInGraph:](v15, "nodeInGraph:", v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
            objc_msgSend(v7, "addIdentifier:", objc_msgSend(v16, "identifier"));

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v18 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphFeatureNodeCollection alloc], "initWithGraph:elementIdentifiers:", v6, v7);
  }
  else
  {
    v18 = -[MAElementCollection initWithGraph:]([PGGraphFeatureNodeCollection alloc], "initWithGraph:", v6);
  }

  return v18;
}

- (double)targetCurationDurationWithCurationLength:(unint64_t)a3 customDuration:(double)result
{
  if (a3)
  {
    if (a3 == 4)
    {
      return 90.0;
    }
    else
    {
      result = 60.0;
      if (a3 == 1)
        return 40.0;
    }
  }
  return result;
}

- (id)curationOfLength:(unint64_t)a3 forMemory:(id)a4 customDuration:(double)a5 useAssetEligibility:(BOOL)a6 curationContext:(id)a7
{
  _BOOL4 v8;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v39;
  void *context;
  id v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _BYTE *v53;
  unint64_t v54;
  double v55;
  char v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[4];
  const char *v62;
  __int16 v63;
  void *v64;
  _BYTE buf[24];
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _BYTE v69[128];
  _QWORD v70[4];

  v8 = a6;
  v70[1] = *MEMORY[0x1E0C80C00];
  v44 = a4;
  v42 = a7;
  -[PGManager photoLibrary](self, "photoLibrary");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGManager isReady](self, "isReady"))
  {
    context = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v43, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFetchPropertySets:", v12);

    objc_msgSend(v11, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v44, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchExtendedCuratedAssetsInAssetCollection:options:", v44, v11, v39);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v16 = 0;
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v58 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(v20, "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v21);

            if ((v16 & 1) != 0)
              v16 = 1;
            else
              v16 = objc_msgSend(v20, "isGuestAsset");
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        }
        while (v17);
      }

    }
    else
    {
      v16 = 0;
      v14 = 0;
    }

    objc_autoreleasePoolPop(context);
    -[PGManager curationManager](self, "curationManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManager serviceManager](self, "serviceManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v66 = __Block_byref_object_copy__1375;
    v67 = __Block_byref_object_dispose__1376;
    v68 = 0;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __101__PGManager_Memories__curationOfLength_forMemory_customDuration_useAssetEligibility_curationContext___block_invoke;
    v45[3] = &unk_1E8427C70;
    v45[4] = self;
    v28 = v44;
    v46 = v28;
    v54 = a3;
    v55 = a5;
    v29 = v26;
    v47 = v29;
    v48 = v43;
    v30 = v42;
    v49 = v30;
    v31 = v27;
    v50 = v31;
    v53 = buf;
    v32 = v39;
    v51 = v32;
    v33 = v14;
    v52 = v33;
    v56 = v16;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v45);
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      v34 = *(id *)(*(_QWORD *)&buf[8] + 40);
    }
    else
    {
      -[PGManager workingContext](self, "workingContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "loggingConnection");
      v36 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v28, "uuid");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v61 = 136315394;
        v62 = "-[PGManager(Memories) curationOfLength:forMemory:customDuration:useAssetEligibility:curationContext:]";
        v63 = 2112;
        v64 = v37;
        _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_DEFAULT, "%s using fallback curation for memory uuid %@, as memory specific enrichment failed", v61, 0x16u);

      }
      -[PGManager _fallbackCurationOfLength:forMemory:customDuration:curationContext:](self, "_fallbackCurationOfLength:forMemory:customDuration:curationContext:", a3, v28, v30, a5);
      v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v34;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[PGManager workingContext](self, "workingContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "loggingConnection");
    v23 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v44, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[PGManager(Memories) curationOfLength:forMemory:customDuration:useAssetEligibility:curationContext:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_DEFAULT, "%s using fallback curation for memory uuid %@, graph is not ready", buf, 0x16u);

    }
    -[PGManager _fallbackCurationOfLength:forMemory:customDuration:curationContext:](self, "_fallbackCurationOfLength:forMemory:customDuration:curationContext:", a3, v44, v42, a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (id)_fallbackCurationOfLength:(unint64_t)a3 forMemory:(id)a4 customDuration:(double)a5 curationContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  PGCurator_PHAsset *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  void *v56;
  PGMemoryGenerator *v58;
  PGMemoryCurationSession *v59;
  void *v60;
  PGCurator_PHAsset *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;
  _BYTE v87[128];
  _QWORD v88[3];

  v88[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  -[PGManager photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a3 == 2)
  {
    objc_msgSend(v12, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFetchPropertySets:", v15);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchCuratedAssetsInAssetCollection:options:", v10, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v81 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * i), "uuid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      }
      while (v20);
    }
    v24 = v18;
  }
  else
  {
    -[PGManager curationManager](self, "curationManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFetchPropertySets:", v27);

    v70 = v25;
    objc_msgSend(v25, "defaultAssetFetchOptionsForMemories");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v68 = v10;
    v66 = v26;
    if (a3 != 1 && (a3 || a5 >= 60.0))
    {
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchExtendedCuratedAssetsInAssetCollection:options:", v10, v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchCuratedAssetsInAssetCollection:options:", v10, v26);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchCuratedAssetsInAssetCollection:options:", v10, v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v10, v26);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    v30 = (void *)v29;
    v31 = objc_alloc(MEMORY[0x1E0C99D20]);
    v65 = v28;
    objc_msgSend(v28, "fetchedObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "initWithArray:", v32);

    objc_msgSend(v11, "curationSession");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "prepareAssets:", v33);

    +[PGGraphBuilder topTierAestheticScoreForRatio:inPhotoLibrary:](PGGraphBuilder, "topTierAestheticScoreForRatio:inPhotoLibrary:", v13, 0.01);
    +[PGMemoryGenerationHelper prepareAssets:forMemoriesWithTopTierAestheticScore:curationContext:](PGMemoryGenerationHelper, "prepareAssets:forMemoriesWithTopTierAestheticScore:curationContext:", v33, v11);
    v35 = objc_alloc(MEMORY[0x1E0CD1620]);
    v36 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v18, "fetchPropertySets");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)v33;
    v71 = v13;
    v39 = objc_msgSend(v35, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v33, v13, 0, v38, 0, 0);

    v63 = (void *)v39;
    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B1B8]), "initWithAssetFetchResult:curationContext:", v39, v11);
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v30, "count"));
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v41 = v30;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v77;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v77 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "uuid");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v46);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
      }
      while (v43);
    }

    -[PGManager memoriesLoggingConnection](self, "memoriesLoggingConnection");
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = objc_alloc_init(PGCurator_PHAsset);
    -[PGCurator setLoggingConnection:](v48, "setLoggingConnection:", v47);
    +[PGGraphLocationHelper inefficientLocationHelper](PGGraphLocationHelper, "inefficientLocationHelper");
    v67 = v11;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[PGMemoryCurationSession initWithCurationManager:photoLibrary:curationContext:locationHelper:]([PGMemoryCurationSession alloc], "initWithCurationManager:photoLibrary:curationContext:locationHelper:", v70, v71, v11, v60);
    v62 = (void *)v47;
    v58 = -[PGMemoryGenerator initWithMemoryCurationSession:loggingConnection:]([PGMemoryGenerator alloc], "initWithMemoryCurationSession:loggingConnection:", v59, v47);
    -[PGMemoryGenerator baseCurationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:](v58, "baseCurationOptionsWithRequiredAssetUUIDs:eligibleAssetUUIDs:", v40, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setUseDurationBasedCuration:", 1);
    objc_msgSend(v49, "setMinimumDuration:", 0.0);
    -[PGManager targetCurationDurationWithCurationLength:customDuration:](self, "targetCurationDurationWithCurationLength:customDuration:", a3, a5);
    objc_msgSend(v49, "setTargetDuration:");
    objc_msgSend(v49, "setFailIfMinimumDurationNotReached:", 0);
    v61 = v48;
    -[PGCurator_PHAsset bestAssetsForFeeder:options:debugInfo:progressBlock:](v48, "bestAssetsForFeeder:options:debugInfo:progressBlock:", v69, v49, 0, &__block_literal_global_1373);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v50, "count"));
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v51 = v50;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v73;
      do
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v73 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * k), "uuid");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v56);

        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
      }
      while (v53);
    }

    v11 = v67;
    v10 = v68;
    v14 = v70;
    v13 = v71;
    v24 = v66;
  }

  return v17;
}

void __101__PGManager_Memories__curationOfLength_forMemory_customDuration_useAssetEligibility_curationContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  PGTriggeredMemory *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PGTriggeredMemory *v15;
  double v16;
  double v17;
  PGGraphLocationHelper *v18;
  PGMemoryCurationSession *v19;
  PGEnrichedMemoryFactory *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;

  objc_msgSend(a2, "graph");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_momentNodesFromMemory:inGraph:", *(_QWORD *)(a1 + 40), v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "photosGraphProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("encodedFeatures"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "photosGraphProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("memoryCategorySubcategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "_featureNodesForEncodedFeatures:inGraph:", v30, v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "photosGraphProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("generatedWithFallbackRequirements"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = [PGTriggeredMemory alloc];
  v12 = objc_msgSend(*(id *)(a1 + 40), "category");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "graphMemoryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v28) = v10;
  v15 = -[PGTriggeredMemory initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:generatedWithFallbackRequirements:](v11, "initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:generatedWithFallbackRequirements:", v12, v6, v29, v7, MEMORY[0x1E0C9AA70], v13, v14, v28);

  objc_msgSend(*(id *)(a1 + 32), "targetCurationDurationWithCurationLength:customDuration:", *(_QWORD *)(a1 + 104), *(double *)(a1 + 112));
  v17 = v16;
  v18 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v31);
  v19 = -[PGMemoryCurationSession initWithCurationManager:photoLibrary:curationContext:locationHelper:]([PGMemoryCurationSession alloc], "initWithCurationManager:photoLibrary:curationContext:locationHelper:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v18);
  v20 = -[PGEnrichedMemoryFactory initWithMemoryCurationSession:graph:serviceManager:]([PGEnrichedMemoryFactory alloc], "initWithMemoryCurationSession:graph:serviceManager:", v19, v31, *(_QWORD *)(a1 + 72));
  v21 = *(_QWORD *)(a1 + 80);
  v22 = *(_QWORD *)(a1 + 88);
  v23 = *(unsigned __int8 *)(a1 + 120);
  objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGEnrichedMemoryFactory curatedAssetUUIDsWithTriggeredMemory:keyAsset:extendedCuratedAssetUUIDs:targetCurationDuration:allowGuestAsset:progressReporter:](v20, "curatedAssetUUIDsWithTriggeredMemory:keyAsset:extendedCuratedAssetUUIDs:targetCurationDuration:allowGuestAsset:progressReporter:", v15, v21, v22, v23, v24, v17);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

}

- (BOOL)shouldValidateGraphConsistency
{
  NSObject *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  PGGraph *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PGManager graphConsistencyCheckLoggingConnection](self, "graphConsistencyCheckLoggingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)objc_opt_class(), "graphConsistencyCheckIsEnabled") & 1) != 0)
  {
    v4 = CFSTR("validation-photosgraph");
    -[PGManager graphPersistenceParentDirectoryURL](self, "graphPersistenceParentDirectoryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraph graphURLForName:parentDirectoryURL:](PGGraph, "graphURLForName:parentDirectoryURL:", CFSTR("validation-photosgraph"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PGManager isReady](self, "isReady"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

      if ((v9 & 1) != 0)
      {
        v18 = 0;
        v10 = -[MAGraph initWithPersistentStoreURL:options:error:]([PGGraph alloc], "initWithPersistentStoreURL:options:error:", v6, 4, &v18);
        v11 = v18;
        if (v10)
        {
          -[PGGraph infoNode](v10, "infoNode");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dateOfLastIncrementalUpdateInvocation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13
            && (objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "isDateInToday:", v13),
                v14,
                (v15 & 1) != 0))
          {
            v16 = 1;
          }
          else
          {
            if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v13;
              _os_log_impl(&dword_1CA237000, v3, OS_LOG_TYPE_INFO, "Skipping graph consistency check: Graph was last updated on %@", buf, 0xCu);
            }
            v16 = 0;
          }

        }
        else
        {
          if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v11;
            _os_log_error_impl(&dword_1CA237000, v3, OS_LOG_TYPE_ERROR, "[PGManager+Consistency] Skipping graph consistency check: Failed to load the validation graph: %@", buf, 0xCu);
          }
          v16 = 0;
        }

      }
      else
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v3, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Skipping graph consistency check: No validation graph available", buf, 2u);
        }
        v16 = 0;
      }

    }
    else
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v3, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Skipping graph consistency check: manager is not ready", buf, 2u);
      }
      v16 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v3, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Skipping graph consistency check: default disabled", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (BOOL)destroyValidationGraph
{
  void *v2;
  void *v3;
  BOOL v4;
  uint64_t v6;

  -[PGManager graphPersistenceParentDirectoryURL](self, "graphPersistenceParentDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraph graphURLForName:parentDirectoryURL:](PGGraph, "graphURLForName:parentDirectoryURL:", CFSTR("validation-photosgraph"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = +[MAGraph destroyPersistentStoreAtURL:error:](PGGraph, "destroyPersistentStoreAtURL:error:", v3, &v6);

  return v4;
}

- (void)reportMetricsLogWithConsistencyCheckResult:(id)a3 loggingConnection:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[PGManager analytics](self, "analytics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "overallSimilarityScore");
      v10 = v9;
      -[PGManager analytics](self, "analytics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = CFSTR("graphSchemaVersion");
      v18[1] = CFSTR("type");
      v19[0] = &unk_1E84E2840;
      v19[1] = CFSTR("overall");
      v18[2] = CFSTR("similarityScore");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendEvent:withPayload:", CFSTR("com.apple.Photos.Intelligence.GraphConsistency"), v13);

      objc_initWeak(&location, self);
      objc_msgSend(v6, "similarityScoreByDomain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __87__PGManager_Consistency__reportMetricsLogWithConsistencyCheckResult_loggingConnection___block_invoke;
      v15[3] = &unk_1E84280E8;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "[PGManager+Consistency] Core Analytics is nil", (uint8_t *)&location, 2u);
    }
  }

}

- (void)validateGraphConsistencyIfNeededWithProgressBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  NSObject *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGManager graphConsistencyCheckLoggingConnection](self, "graphConsistencyCheckLoggingConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGManager shouldValidateGraphConsistency](self, "shouldValidateGraphConsistency"))
  {
    v25 = 0;
    v26 = (double *)&v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__3676;
    v29 = __Block_byref_object_dispose__3677;
    v30 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __76__PGManager_Consistency__validateGraphConsistencyIfNeededWithProgressBlock___block_invoke;
    v21[3] = &unk_1E8429F40;
    v21[4] = self;
    v24 = &v25;
    v23 = v4;
    v6 = v5;
    v22 = v6;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v21);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v26[5];
      *(_DWORD *)buf = 138412290;
      v32 = v7;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Graph consistency check: %@", buf, 0xCu);
    }
    v8 = *((_QWORD *)v26 + 5);
    if (!v8)
      goto LABEL_13;
    -[PGManager graphConsistencyCheckLoggingConnection](self, "graphConsistencyCheckLoggingConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManager reportMetricsLogWithConsistencyCheckResult:loggingConnection:](self, "reportMetricsLogWithConsistencyCheckResult:loggingConnection:", v8, v9);

    objc_msgSend(*((id *)v26 + 5), "overallSimilarityScore");
    v11 = v10;
    +[PGUserDefaults graphConsistencyPercentageThresholdForTTR](PGUserDefaults, "graphConsistencyPercentageThresholdForTTR");
    v13 = v12;
    v14 = +[PGUserDefaults graphConsistencyNotificationIsEnabled](PGUserDefaults, "graphConsistencyNotificationIsEnabled");
    if (v11 < v13 && v14)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v32 = v11;
        v33 = 2048;
        v34 = v13;
        _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "[PGManager+Consistency] Graph consistency score %.2f bellow %.2f: prompting user to file a radar.", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("an incremental graph rebuild inconsistency was detected"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11 * 100.0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Graph] %@ - %.2f%% consistent"), v16, *(_QWORD *)&v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The last incrementally updated graph is %.2f%% consistent with the fully rebuilt one. Please file a radar to help diagnose consistency issues."), *(_QWORD *)&v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@\n\nDetails per domain:\n%@"), v18, v19, *((_QWORD *)v26 + 5));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D716E8], "tapToRadarWithTitle:description:radarComponent:displayReason:attachments:", v18, v20, 1, v16, MEMORY[0x1E0C9AA60]);

    }
    else
    {
LABEL_13:
      -[PGManager destroyValidationGraph](self, "destroyValidationGraph");
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    -[PGManager destroyValidationGraph](self, "destroyValidationGraph");
  }

}

void __76__PGManager_Consistency__validateGraphConsistencyIfNeededWithProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  PGGraph *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "graphPersistenceParentDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraph graphURLForName:parentDirectoryURL:](PGGraph, "graphURLForName:parentDirectoryURL:", CFSTR("validation-photosgraph"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = -[MAGraph initWithPersistentStoreURL:options:error:]([PGGraph alloc], "initWithPersistentStoreURL:options:error:", v5, 4, &v15);
  v7 = v15;
  if (v6)
  {
    objc_msgSend(v3, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "graphConsistencyCheckLoggingConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "consistencyCheckResultOfGraph:andGraph:loggingConnection:progressBlock:", v6, v8, v10, *(_QWORD *)(a1 + 48));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    v14 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "[PGManager+Consistency] Failed to load validation graph: %@", buf, 0xCu);
    }
  }

}

void __87__PGManager_Consistency__reportMetricsLogWithConsistencyCheckResult_loggingConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PGGraphDomainToString((unsigned __int16)objc_msgSend(a2, "unsignedIntValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "analytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("graphSchemaVersion");
  v10[1] = CFSTR("type");
  v11[0] = &unk_1E84E2840;
  v11[1] = v6;
  v10[2] = CFSTR("similarityScore");
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.Photos.Intelligence.GraphConsistency"), v9);
}

+ (BOOL)graphConsistencyCheckIsEnabled
{
  return +[PGUserDefaults graphConsistencyCheckIsEnabled](PGUserDefaults, "graphConsistencyCheckIsEnabled");
}

+ (id)consistencyCheckResultOfGraph:(id)a3 andGraph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6
{
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  char v15;
  PGGraphConsistencyCheckResult *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  double Current;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  double v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t k;
  uint64_t v49;
  double v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  int v57;
  void *v58;
  void (**v59)(void *, int *, double);
  uint64_t v60;
  void (**v61)(void *, int *, double);
  uint64_t v62;
  void (**v63)(void *, int *, double);
  NSObject *v64;
  uint64_t v65;
  uint32_t numer;
  uint32_t denom;
  NSObject *v68;
  NSObject *v69;
  double v70;
  char v71;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  PGGraphConsistencyCheckResult *v83;
  void *v84;
  void *context;
  uint64_t v86;
  void *v87;
  id aBlock;
  NSObject *oslog;
  id v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  id v94;
  void (**v95)(void *, int *, double);
  id obj;
  id v97;
  id v98;
  char v99;
  _QWORD v100[4];
  id v101;
  id v102;
  void (**v103)(void *, int *, double);
  uint64_t *p_buf;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t v107;
  _QWORD v108[4];
  void (**v109)(void *, int *, double);
  uint64_t *v110;
  uint64_t *v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[4];
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint64_t v131;
  double *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  char v138;
  mach_timebase_info info;
  int v140;
  _QWORD v141[3];
  uint64_t buf;
  __int128 v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v97 = a3;
  v98 = a4;
  v9 = a5;
  aBlock = a6;
  v10 = v9;
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGManagerConsitencySimilarityScore", ", (uint8_t *)&buf, 2u);
  }
  oslog = v13;

  info = 0;
  mach_timebase_info(&info);
  v80 = mach_absolute_time();
  v95 = (void (**)(void *, int *, double))_Block_copy(aBlock);
  v135 = 0;
  v136 = &v135;
  v137 = 0x2020000000;
  v138 = 0;
  v131 = 0;
  v132 = (double *)&v131;
  v133 = 0x2020000000;
  v134 = 0;
  if (!v95
    || (v14 = CFAbsoluteTimeGetCurrent(), v14 - v132[3] < 0.01)
    || (v132[3] = v14,
        LOBYTE(v140) = 0,
        v95[2](v95, &v140, 0.0),
        v15 = *((_BYTE *)v136 + 24) | v140,
        (*((_BYTE *)v136 + 24) = v15) == 0))
  {
    v16 = 0;
    if (!v97 || !v98)
      goto LABEL_110;
    v17 = objc_msgSend(v97, "nodesCount");
    v18 = objc_msgSend(v98, "nodesCount");
    +[PGManager consistencyIgnoredNodeDomainCodes](PGManager, "consistencyIgnoredNodeDomainCodes");
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v150, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v128;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v128 != v20)
            objc_enumerationMutation(obj);
          v22 = (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * i), "unsignedIntValue");
          v17 -= objc_msgSend(v97, "nodesCountForDomain:", v22);
          v18 -= objc_msgSend(v98, "nodesCountForDomain:", v22);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v150, 16);
      }
      while (v19);
    }

    v83 = objc_alloc_init(PGGraphConsistencyCheckResult);
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)objc_opt_class(), "nodeDomainsFromGraph:", v97);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend((id)objc_opt_class(), "nodeDomainsFromGraph:", v98);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "unionSet:", v25);

    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke;
    v125[3] = &unk_1E8428110;
    v26 = v23;
    v126 = v26;
    objc_msgSend(v84, "enumerateObjectsUsingBlock:", v125);
    -[PGGraphConsistencyCheckResult setSimilarityScoreByDomain:](v83, "setSimilarityScoreByDomain:", v26);
    v77 = v26;
    if (!v17 && v18 > 0 || v17 >= 1 && !v18)
    {
      v16 = v83;
LABEL_109:

      goto LABEL_110;
    }
    objc_msgSend((id)objc_opt_class(), "nodesByClassFromGraph:", v97);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nodesByClassFromGraph:", v98);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v132[3] >= 0.01)
      {
        v132[3] = Current;
        LOBYTE(v140) = 0;
        v95[2](v95, &v140, 0.1);
        v28 = *((_BYTE *)v136 + 24) | v140;
        *((_BYTE *)v136 + 24) = v28;
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf = 0xF104000202;
            LOWORD(v143) = 2080;
            *(_QWORD *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Core/PGManager+Consistency.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
          v16 = 0;
          goto LABEL_108;
        }
      }
    }
    v29 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v82, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v30);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v81, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithArray:", v32);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_msgSend(v75, "mutableCopy");
    objc_msgSend(v33, "intersectSet:", v74);
    v73 = v33;
    if (!objc_msgSend(v33, "count"))
    {
      v16 = v83;
LABEL_107:

LABEL_108:
      goto LABEL_109;
    }
    v93 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v76 = v33;
    v34 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v121, v149, 16);
    if (v34)
    {
      v79 = *(_QWORD *)v122;
      while (2)
      {
        v35 = 0;
        v78 = v34;
        do
        {
          if (*(_QWORD *)v122 != v79)
            objc_enumerationMutation(v76);
          v86 = v35;
          v36 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v35);
          context = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v82, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "objectForKeyedSubscript:", v36);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v94 = v37;
          v38 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v117, v148, 16);
          if (v38)
          {
            v39 = *(_QWORD *)v118;
            while (2)
            {
              for (j = 0; j != v38; ++j)
              {
                if (*(_QWORD *)v118 != v39)
                  objc_enumerationMutation(v94);
                v41 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * j);
                if (v95)
                {
                  v42 = CFAbsoluteTimeGetCurrent();
                  if (v42 - v132[3] >= 0.01)
                  {
                    v132[3] = v42;
                    LOBYTE(v140) = 0;
                    v95[2](v95, &v140, 0.4);
                    v43 = *((_BYTE *)v136 + 24) | v140;
                    *((_BYTE *)v136 + 24) = v43;
                    if (v43)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        buf = 0x10504000202;
                        LOWORD(v143) = 2080;
                        *(_QWORD *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/p"
                                                         "hotoanalysis/PhotosGraph/Framework/Core/PGManager+Consistency.m";
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
                      }
                      v57 = 0;
                      v47 = v94;
                      goto LABEL_73;
                    }
                  }
                }
                objc_msgSend((id)objc_opt_class(), "nodesOfClass:matchingNode:inGraph:", v36, v41, v98);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v44;
                if (v44 && objc_msgSend(v44, "count") == 1)
                {
                  objc_msgSend(v45, "anyNode");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "setObject:forKeyedSubscript:", v41, v46);

                }
              }
              v38 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v117, v148, 16);
              if (v38)
                continue;
              break;
            }
          }

          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v47 = v87;
          v92 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v113, v147, 16);
          if (v92)
          {
            v90 = v47;
            v91 = *(_QWORD *)v114;
            while (2)
            {
              for (k = 0; k != v92; ++k)
              {
                if (*(_QWORD *)v114 != v91)
                  objc_enumerationMutation(v90);
                v49 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * k);
                if (v95)
                {
                  v50 = CFAbsoluteTimeGetCurrent();
                  if (v50 - v132[3] >= 0.01)
                  {
                    v132[3] = v50;
                    LOBYTE(v140) = 0;
                    v95[2](v95, &v140, 0.4);
                    v51 = *((_BYTE *)v136 + 24) | v140;
                    *((_BYTE *)v136 + 24) = v51;
                    if (v51)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        buf = 0x10E04000202;
                        LOWORD(v143) = 2080;
                        *(_QWORD *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/p"
                                                         "hotoanalysis/PhotosGraph/Framework/Core/PGManager+Consistency.m";
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
                      }
                      v57 = 0;
                      goto LABEL_71;
                    }
                  }
                }
                objc_msgSend((id)objc_opt_class(), "nodesOfClass:matchingNode:inGraph:", v36, v49, v97);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v52;
                if (v52 && objc_msgSend(v52, "count") == 1)
                {
                  objc_msgSend(v53, "anyNode");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v93, "objectForKeyedSubscript:", v49);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = objc_msgSend(v54, "isEqualToNode:", v55);

                  if ((v56 & 1) == 0)
                    objc_msgSend(v93, "removeObjectForKey:", v49);

                }
              }
              v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v113, v147, 16);
              if (v92)
                continue;
              break;
            }
            v57 = 1;
LABEL_71:
            v47 = v90;
          }
          else
          {
            v57 = 1;
          }
LABEL_73:

          objc_autoreleasePoolPop(context);
          if (!v57)
          {
            v16 = 0;
            v61 = (void (**)(void *, int *, double))v76;
            goto LABEL_106;
          }
          v35 = v86 + 1;
        }
        while (v86 + 1 != v78);
        v34 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v121, v149, 16);
        if (v34)
          continue;
        break;
      }
    }

    v58 = (void *)objc_opt_class();
    v108[0] = MEMORY[0x1E0C809B0];
    v108[1] = 3221225472;
    v108[2] = __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke_227;
    v108[3] = &unk_1E8434F30;
    v59 = v95;
    v109 = v59;
    v112 = 0x3F847AE147AE147BLL;
    v110 = &v131;
    v111 = &v135;
    v60 = objc_msgSend(v58, "_totalNumberOfIdenticalNodesFromNode1ByNode2:withNumberOfIdenticalNodesByDomain:loggingConnection:progressBlock:", v93, v77, oslog, v108);
    if (*((_BYTE *)v136 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 0x11E04000202;
        LOWORD(v143) = 2080;
        *(_QWORD *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Core/PGManager+Consistency.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      v16 = 0;
LABEL_105:
      v61 = v109;
LABEL_106:

      goto LABEL_107;
    }
    v62 = v60;
    buf = 0;
    *(_QWORD *)&v143 = &buf;
    *((_QWORD *)&v143 + 1) = 0x3032000000;
    v144 = __Block_byref_object_copy__3676;
    v145 = __Block_byref_object_dispose__3677;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v146 = (id)objc_claimAutoreleasedReturnValue();
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke_229;
    v100[3] = &unk_1E8428138;
    v101 = v97;
    v102 = v98;
    p_buf = &buf;
    v63 = v59;
    v103 = v63;
    v105 = &v131;
    v106 = &v135;
    v107 = 0x3F847AE147AE147BLL;
    objc_msgSend(v77, "enumerateKeysAndObjectsUsingBlock:", v100);
    if (*((_BYTE *)v136 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v140 = 67109378;
        LODWORD(v141[0]) = 303;
        WORD2(v141[0]) = 2080;
        *(_QWORD *)((char *)v141 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Core/PGManager+Consistency.m";
        v64 = MEMORY[0x1E0C81028];
LABEL_85:
        _os_log_impl(&dword_1CA237000, v64, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v140, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        v140 = 134217984;
        v141[0] = v62;
        _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Total number of identical nodes in graph1 and graph2 = %lu\n", (uint8_t *)&v140, 0xCu);
      }
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        v140 = 134217984;
        v141[0] = v17;
        _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Total number of nodes in graph1 = %lu\n", (uint8_t *)&v140, 0xCu);
      }
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        v140 = 134217984;
        v141[0] = v18;
        _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_INFO, "[PGManager+Consistency] Total number of nodes in graph2 = %lu\n", (uint8_t *)&v140, 0xCu);
      }
      -[PGGraphConsistencyCheckResult setOverallSimilarityScore:](v83, "setOverallSimilarityScore:", (double)v62 / (double)(v17 + v18 - v62));
      -[PGGraphConsistencyCheckResult setSimilarityScoreByDomain:](v83, "setSimilarityScoreByDomain:", *(_QWORD *)(v143 + 40));
      v65 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v68 = oslog;
      v69 = v68;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
      {
        LOWORD(v140) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v69, OS_SIGNPOST_INTERVAL_END, v11, "PGManagerConsitencySimilarityScore", ", (uint8_t *)&v140, 2u);
      }

      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        v140 = 136315394;
        v141[0] = "PGManagerConsitencySimilarityScore";
        LOWORD(v141[1]) = 2048;
        *(double *)((char *)&v141[1] + 2) = (float)((float)((float)((float)(v65 - v80) * (float)numer) / (float)denom)
                                                  / 1000000.0);
        _os_log_impl(&dword_1CA237000, v69, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v140, 0x16u);
      }
      if (!v95
        || (v70 = CFAbsoluteTimeGetCurrent(), v70 - v132[3] < 0.01)
        || (v132[3] = v70,
            v99 = 0,
            v63[2](v63, (int *)&v99, 1.0),
            v71 = *((_BYTE *)v136 + 24) | v99,
            (*((_BYTE *)v136 + 24) = v71) == 0))
      {
        v16 = v83;
        goto LABEL_104;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v140 = 67109378;
        LODWORD(v141[0]) = 314;
        WORD2(v141[0]) = 2080;
        *(_QWORD *)((char *)v141 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Core/PGManager+Consistency.m";
        v64 = MEMORY[0x1E0C81028];
        goto LABEL_85;
      }
    }
    v16 = 0;
LABEL_104:

    _Block_object_dispose(&buf, 8);
    goto LABEL_105;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0xD004000202;
    LOWORD(v143) = 2080;
    *(_QWORD *)((char *)&v143 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Core/PGManager+Consistency.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  v16 = 0;
LABEL_110:
  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(&v135, 8);

  return v16;
}

+ (int64_t)_totalNumberOfIdenticalNodesFromNode1ByNode2:(id)a3 withNumberOfIdenticalNodesByDomain:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  char v16;
  int64_t v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  double Current;
  char v23;
  char v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *p_buf;
  uint64_t *v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  int v45;
  int v46;
  __int16 v47;
  const char *v48;
  uint64_t buf;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _Block_copy(v13);
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  if (!v14
    || (v15 = CFAbsoluteTimeGetCurrent(), v15 - v38[3] < 0.01)
    || (v38[3] = v15,
        LOBYTE(v45) = 0,
        (*((void (**)(void *, int *, double))v14 + 2))(v14, &v45, 0.0),
        v16 = *((_BYTE *)v42 + 24) | v45,
        (*((_BYTE *)v42 + 24) = v16) == 0))
  {
    objc_msgSend((id)objc_opt_class(), "consistencyIgnoredNodeDomainClasses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 0;
    *(_QWORD *)&v50 = &buf;
    *((_QWORD *)&v50 + 1) = 0x2020000000;
    v51 = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __138__PGManager_Consistency___totalNumberOfIdenticalNodesFromNode1ByNode2_withNumberOfIdenticalNodesByDomain_loggingConnection_progressBlock___block_invoke;
    v26[3] = &unk_1E8428188;
    v35 = a1;
    v27 = v10;
    v19 = v18;
    v28 = v19;
    v29 = v11;
    p_buf = &buf;
    v30 = v12;
    v20 = v14;
    v31 = v20;
    v33 = &v37;
    v36 = 0x3F847AE147AE147BLL;
    v34 = &v41;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v26);
    if (*((_BYTE *)v42 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v45 = 67109378;
        v46 = 408;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGM"
              "anager+Consistency.m";
        v21 = MEMORY[0x1E0C81028];
LABEL_10:
        _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v45, 0x12u);
      }
    }
    else
    {
      if (!v14
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v38[3] < 0.01)
        || (v38[3] = Current,
            v25 = 0,
            (*((void (**)(id, char *, double))v20 + 2))(v20, &v25, 1.0),
            v23 = *((_BYTE *)v42 + 24) | v25,
            (*((_BYTE *)v42 + 24) = v23) == 0))
      {
        v17 = *(_QWORD *)(v50 + 24);
        goto LABEL_18;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v45 = 67109378;
        v46 = 410;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGM"
              "anager+Consistency.m";
        v21 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }
    v17 = 0;
LABEL_18:

    _Block_object_dispose(&buf, 8);
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x14104000202;
    LOWORD(v50) = 2080;
    *(_QWORD *)((char *)&v50 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Core/PGManager+Consistency.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  v17 = 0;
LABEL_19:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v17;
}

+ (id)edgesByNodeFromEdges:(id)a3 andNode:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PGManager_Consistency__edgesByNodeFromEdges_andNode___block_invoke;
  v14[3] = &unk_1E8436610;
  v15 = v5;
  v9 = v8;
  v16 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateEdgesUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

+ (id)nodeDomainsFromGraph:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "consistencyIgnoredNodeDomainClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42A50], "any");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__PGManager_Consistency__nodeDomainsFromGraph___block_invoke;
  v14[3] = &unk_1E8432898;
  v15 = v7;
  v9 = v6;
  v16 = v9;
  v10 = v7;
  objc_msgSend(v5, "enumerateNodesMatchingFilter:usingBlock:", v8, v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

+ (id)nodesByClassFromGraph:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "consistencyIgnoredNodeDomainClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42A50], "any");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__PGManager_Consistency__nodesByClassFromGraph___block_invoke;
  v14[3] = &unk_1E8432898;
  v15 = v7;
  v9 = v6;
  v16 = v9;
  v10 = v7;
  objc_msgSend(v5, "enumerateNodesMatchingFilter:usingBlock:", v8, v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

+ (id)nodesOfClass:(id)a3 matchingNode:(id)a4 inGraph:(id)a5
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    v13 = (void *)objc_opt_class();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ownerNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_nodesOfClass:matchingNodes:inGraph:", v15, v17, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc(MEMORY[0x1E0D429E0]);
    +[PGGraphIsOwnedByEdge filter](PGGraphIsOwnedByEdge, "filter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inRelation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v21;
    v22 = objc_alloc(MEMORY[0x1E0D42A50]);
    objc_msgSend(v7, "label");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithLabel:domain:", v23, objc_msgSend(v7, "domain"));
    objc_msgSend(v24, "relation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v19, "initWithSteps:", v26);

    +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHomeWorkNodeCollection, "nodesRelatedToNodes:withRelation:", v18, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "entityFilter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphNodeCollection, "nodesMatchingFilter:inGraph:", v29, v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v28;
}

+ (id)_nodesOfClass:(id)a3 matchingNodes:(id)a4 inGraph:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  PGGraphNodeCollection *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3676;
  v24 = __Block_byref_object_dispose__3677;
  v25 = -[MAElementCollection initWithGraph:]([PGGraphNodeCollection alloc], "initWithGraph:", v10);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__PGManager_Consistency___nodesOfClass_matchingNodes_inGraph___block_invoke;
  v15[3] = &unk_1E84281B0;
  v19 = a1;
  v11 = v8;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  v18 = &v20;
  objc_msgSend(v9, "enumerateNodesUsingBlock:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)consistencyIgnoredNodeDomainClasses
{
  void *v2;
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)consistencyIgnoredNodeDomainCodes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 21);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 302);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __62__PGManager_Consistency___nodesOfClass_matchingNodes_inGraph___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "nodesOfClass:matchingNode:inGraph:", a1[4], v3, a1[5]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "collectionByFormingUnionWith:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __48__PGManager_Consistency__nodesByClassFromGraph___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v4);
    }
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __47__PGManager_Consistency__nodeDomainsFromGraph___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v7, "domain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __55__PGManager_Consistency__edgesByNodeFromEdges_andNode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "oppositeNode:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, v3);
  }
  objc_msgSend(v4, "addObject:", v5);

}

void __138__PGManager_Consistency___totalNumberOfIdenticalNodesFromNode1ByNode2_withNumberOfIdenticalNodesByDomain_loggingConnection_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  PGGraphNodeCollection *v11;
  void *v12;
  void *v13;
  PGGraphNodeCollection *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  NSObject *v25;
  double Current;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, _BYTE *);
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v28 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_msgSend(v7, "properties"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "properties"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = +[PGConsistencyUtility properties:areConsistentWithProperties:toleranceFactor:](PGConsistencyUtility, "properties:areConsistentWithProperties:toleranceFactor:", v8, v9, 2), v9, v8, v10))
  {
    v11 = -[MANodeCollection initWithNode:]([PGGraphNodeCollection alloc], "initWithNode:", v7);
    +[PGGraphEdgeCollection edgesFromNodes:](PGGraphEdgeCollection, "edgesFromNodes:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 96), "edgesByNodeFromEdges:andNode:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MANodeCollection initWithNode:]([PGGraphNodeCollection alloc], "initWithNode:", v6);
    +[PGGraphEdgeCollection edgesFromNodes:](PGGraphEdgeCollection, "edgesFromNodes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "count");
    if (v16 == objc_msgSend(v15, "count"))
    {
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __138__PGManager_Consistency___totalNumberOfIdenticalNodesFromNode1ByNode2_withNumberOfIdenticalNodesByDomain_loggingConnection_progressBlock___block_invoke_2;
      v32 = &unk_1E8428160;
      v17 = v6;
      v33 = v17;
      v34 = *(id *)(a1 + 32);
      v35 = *(id *)(a1 + 40);
      v37 = &v38;
      v36 = v13;
      objc_msgSend(v15, "enumerateEdgesUsingBlock:", &v29);
      if (*((_BYTE *)v39 + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v17, "domain"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19 == 0;

        if (v20)
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", &unk_1E84EB1F8, v18);
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v18, v28, v29, v30, v31, v32, v33, v34, v35);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23 + 1.0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v24, v18);

        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      }
      else
      {
        v25 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v7;
          v44 = 2112;
          v45 = v17;
          _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[PGManager+Consistency] The node %@ is not consistent with node %@", buf, 0x16u);
        }
      }
      if (*(_QWORD *)(a1 + 64))
      {
        Current = CFAbsoluteTimeGetCurrent();
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        if (Current - *(double *)(v27 + 24) >= *(double *)(a1 + 104))
        {
          *(double *)(v27 + 24) = Current;
          buf[0] = 0;
          (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(0.5);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) |= buf[0];
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
            *v28 = 1;
        }
      }

    }
  }
  _Block_object_dispose(&v38, 8);

}

void __138__PGManager_Consistency___totalNumberOfIdenticalNodesFromNode1ByNode2_withNumberOfIdenticalNodesByDomain_loggingConnection_progressBlock___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  _BYTE *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v5, "oppositeNode:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v10) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v12) & 1) == 0)
  {
    if (v8)
    {
      v28 = v12;
      v29 = v10;
      v26 = a1;
      v27 = a3;
      v31 = v7;
      v32 = v6;
      v30 = v8;
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v8);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v34;
LABEL_6:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v17);
          objc_msgSend(v18, "label");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "label");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "isEqualToString:", v20))
          {
            v21 = objc_msgSend(v18, "domain");
            v22 = objc_msgSend(v5, "domain");

            if (v21 == v22)
            {
              objc_msgSend(v18, "properties");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "properties");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = +[PGConsistencyUtility properties:areConsistentWithProperties:toleranceFactor:](PGConsistencyUtility, "properties:areConsistentWithProperties:toleranceFactor:", v23, v24, 2);

              if (v25)
                goto LABEL_19;
              goto LABEL_18;
            }
          }
          else
          {

          }
          if (v15 == ++v17)
          {
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v15)
              goto LABEL_6;
            break;
          }
        }
      }

LABEL_18:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v26 + 64) + 8) + 24) = 0;
      *v27 = 1;
LABEL_19:

      v7 = v31;
      v6 = v32;
      v10 = v29;
      v8 = v30;
      v12 = v28;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      *a3 = 1;
    }
  }

  objc_autoreleasePoolPop(v6);
}

uint64_t __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1E84E2858, a2);
}

void __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke_227(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __97__PGManager_Consistency__consistencyCheckResultOfGraph_andGraph_loggingConnection_progressBlock___block_invoke_229(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double Current;
  uint64_t v17;

  v7 = a2;
  v8 = a3;
  v9 = (unsigned __int16)objc_msgSend(v7, "unsignedIntValue");
  v10 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "nodesCountForDomain:", v9);
  v11 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "nodesCountForDomain:", v9);
  objc_msgSend(v8, "doubleValue");
  v13 = v12;

  v14 = v10 + v11 - v13;
  if (v14 <= 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", &unk_1E84EB1F8, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 / v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v15, v7);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (Current - *(double *)(v17 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v17 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(0.9);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        *a4 = 1;
    }
  }

}

- (id)sortedArrayForPersonLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PGManager_People__sortedArrayForPersonLocalIdentifiers___block_invoke;
  v11[3] = &unk_1E8435640;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)allSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7327;
  v23 = __Block_byref_object_dispose__7328;
  v24 = 0;
  -[PGManager photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PGManager_People__allSocialGroupsForMemberLocalIdentifier_options___block_invoke;
  v14[3] = &unk_1E84340C0;
  v18 = &v19;
  v9 = v6;
  v15 = v9;
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v14);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)socialGroupsOverlappingMemberLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7327;
  v18 = __Block_byref_object_dispose__7328;
  v19 = 0;
  -[PGManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PGManager_People__socialGroupsOverlappingMemberLocalIdentifiers___block_invoke;
  v10[3] = &unk_1E842DCB8;
  v13 = &v14;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)maximalSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7327;
  v18 = __Block_byref_object_dispose__7328;
  v19 = 0;
  -[PGManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PGManager_People__maximalSocialGroupsOverlappingMemberLocalIdentifiers___block_invoke;
  v10[3] = &unk_1E842DCB8;
  v13 = &v14;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)assetCollectionsForPersonLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7327;
  v18 = __Block_byref_object_dispose__7328;
  v19 = 0;
  -[PGManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PGManager_People__assetCollectionsForPersonLocalIdentifiers___block_invoke;
  v10[3] = &unk_1E842DCB8;
  v6 = v4;
  v11 = v6;
  v13 = &v14;
  v7 = v5;
  v12 = v7;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)assetIdentifiersForPersonLocalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__7327;
  v37 = __Block_byref_object_dispose__7328;
  v38 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __63__PGManager_People__assetIdentifiersForPersonLocalIdentifiers___block_invoke;
  v30[3] = &unk_1E8435578;
  v7 = v4;
  v31 = v7;
  v32 = &v33;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v30);
  if (objc_msgSend((id)v34[5], "count"))
  {
    -[PGManager photoLibrary](self, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v28[0] = v6;
    v28[1] = 3221225472;
    v28[2] = __63__PGManager_People__assetIdentifiersForPersonLocalIdentifiers___block_invoke_2;
    v28[3] = &unk_1E8432160;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v10;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN (%@) AND ANY %K.%K IN (%@)"), CFSTR("moment.uuid"), v34[5], CFSTR("detectedFaces"), CFSTR("personForFace.personUUID"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSortDescriptors:", v13);

    objc_msgSend(v9, "setInternalPredicate:", v11);
    objc_msgSend(v9, "setChunkSizeForFetch:", 2000);
    v40 = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchPropertySets:", v14);

    objc_msgSend(v9, "setIncludeAssetSourceTypes:", 5);
    -[PGManager photoLibrary](self, "photoLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPhotoLibrary:", v15);

    objc_msgSend(v9, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v9);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "localIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
      }
      while (v17);
    }

  }
  v21 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v21 = v5;
  v22 = v21;

  _Block_object_dispose(&v33, 8);
  return v22;
}

- (BOOL)mePersonContactIdentifierDidChangeWithGraphUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  mach_timebase_info v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  uint8_t *v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  char v23;
  mach_timebase_info info;
  uint8_t v25[4];
  const char *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGManager loggingConnection](self, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MePersonContactIdentifierDidChange", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v9 = mach_absolute_time();
  *(_QWORD *)buf = 0;
  v21 = buf;
  v22 = 0x2020000000;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__PGManager_People__mePersonContactIdentifierDidChangeWithGraphUpdate___block_invoke;
  v17[3] = &unk_1E8435578;
  v10 = v4;
  v18 = v10;
  v19 = buf;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v17);
  v11 = mach_absolute_time();
  v12 = info;
  v13 = v8;
  v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_END, v6, "MePersonContactIdentifierDidChange", ", v25, 2u);
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v25 = 136315394;
    v26 = "MePersonContactIdentifierDidChange";
    v27 = 2048;
    v28 = (float)((float)((float)((float)(v11 - v9) * (float)v12.numer) / (float)v12.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v25, 0x16u);
  }
  v15 = v21[24] != 0;

  _Block_object_dispose(buf, 8);
  return v15;
}

- (id)relationshipInferencesForPersonLocalIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint32_t denom;
  uint32_t numer;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGManager guessWhoLoggingConnection](self, "guessWhoLoggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "RelationshipInferencesForPersonLocalIdentifiers", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v9 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__PGManager_People__relationshipInferencesForPersonLocalIdentifiers___block_invoke;
    v20[3] = &unk_1E8435640;
    v21 = v4;
    v11 = v10;
    v22 = v11;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v20);
    v12 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v15 = v8;
    v16 = v15;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_END, v6, "RelationshipInferencesForPersonLocalIdentifiers", ", buf, 2u);
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "RelationshipInferencesForPersonLocalIdentifiers";
      v26 = 2048;
      v27 = (float)((float)((float)((float)(v12 - v9) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v17 = v22;
    v18 = v11;

  }
  return v10;
}

- (id)suggestedPersonsForHome
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  mach_timebase_info v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PGManager guessWhoLoggingConnection](self, "guessWhoLoggingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "SuggestedPersonsForHome", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v7 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__PGManager_People__suggestedPersonsForHome__block_invoke;
  v15[3] = &unk_1E84353C0;
  v9 = v8;
  v16 = v9;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v15);
  v10 = mach_absolute_time();
  v11 = info;
  v12 = v6;
  v13 = v12;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_END, v4, "SuggestedPersonsForHome", ", buf, 2u);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "SuggestedPersonsForHome";
    v20 = 2048;
    v21 = (float)((float)((float)((float)(v10 - v7) * (float)v11.numer) / (float)v11.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v9;
}

- (id)suggestedPersonsForSharedLibraryParticipants
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  mach_timebase_info v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PGManager guessWhoLoggingConnection](self, "guessWhoLoggingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "suggestedPersonsForSharedLibraryParticipants", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v7 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PGManager_People__suggestedPersonsForSharedLibraryParticipants__block_invoke;
  v15[3] = &unk_1E84353C0;
  v9 = v8;
  v16 = v9;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v15);
  v10 = mach_absolute_time();
  v11 = info;
  v12 = v6;
  v13 = v12;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_END, v4, "suggestedPersonsForSharedLibraryParticipants", ", buf, 2u);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "suggestedPersonsForSharedLibraryParticipants";
    v20 = 2048;
    v21 = (float)((float)((float)((float)(v10 - v7) * (float)v11.numer) / (float)v11.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v9;
}

- (id)suggestedPersonsForSharedLibraryContentInclusion
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  mach_timebase_info v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PGManager guessWhoLoggingConnection](self, "guessWhoLoggingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "suggestedPersonsForSharedLibraryContentInclusion", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v7 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__PGManager_People__suggestedPersonsForSharedLibraryContentInclusion__block_invoke;
  v15[3] = &unk_1E84353C0;
  v9 = v8;
  v16 = v9;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v15);
  v10 = mach_absolute_time();
  v11 = info;
  v12 = v6;
  v13 = v12;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_END, v4, "suggestedPersonsForSharedLibraryContentInclusion", ", buf, 2u);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "suggestedPersonsForSharedLibraryContentInclusion";
    v20 = 2048;
    v21 = (float)((float)((float)((float)(v10 - v7) * (float)v11.numer) / (float)v11.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v9;
}

void __69__PGManager_People__suggestedPersonsForSharedLibraryContentInclusion__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  const __CFString *v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "familyPersonNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  objc_msgSend(v3, "inferredFamilyPersonNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionByFormingUnionWith:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v6;
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", PGManagerPersonNodeComparisonBlock);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "localIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
        {
          v15 = *(void **)(a1 + 32);
          v26 = CFSTR("localIdentifier");
          v27 = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "loggingConnection");
          v16 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "[Person Knowledge] no local identifier found for person", buf, 2u);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v11);
  }

}

void __65__PGManager_People__suggestedPersonsForSharedLibraryParticipants__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  const __CFString *v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__PGManager_People__suggestedPersonsForSharedLibraryParticipants__block_invoke_2;
  v22[3] = &unk_1E8434020;
  v5 = v4;
  v23 = v5;
  objc_msgSend(v3, "enumeratePersonNodesIncludingMe:withBlock:", 0, v22);
  v17 = v5;
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", PGManagerPersonNodeComparisonBlock);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = *(void **)(a1 + 32);
        v24 = CFSTR("localIdentifier");
        objc_msgSend(v13, "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v16);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v10);
  }

}

void __65__PGManager_People__suggestedPersonsForSharedLibraryParticipants__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isMyPartner") & 1) != 0 || objc_msgSend(v3, "isMyInferredPartner"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __44__PGManager_People__suggestedPersonsForHome__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
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
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  const __CFString *v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __44__PGManager_People__suggestedPersonsForHome__block_invoke_2;
  v56[3] = &unk_1E8434020;
  v6 = v4;
  v57 = v6;
  objc_msgSend(v3, "enumeratePersonNodesIncludingMe:withBlock:", 1, v56);
  v7 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v41 = v3;
  objc_msgSend(v3, "meNodeCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addressNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v5;
  v54[1] = 3221225472;
  v54[2] = __44__PGManager_People__suggestedPersonsForHome__block_invoke_3;
  v54[3] = &unk_1E8432320;
  v11 = v7;
  v55 = v11;
  objc_msgSend(v10, "enumerateIdentifiersAsCollectionsWithBlock:", v54);

  v12 = objc_msgSend(v11, "count");
  if (v12)
  {
    v13 = (double)v12;
    v50 = 0u;
    v51 = 0u;
    v14 = (double)(unint64_t)objc_msgSend(v11, "pg_accumulatedCount") / (double)v12;
    v52 = 0u;
    v53 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v51;
      v19 = 0.0;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v15);
          v21 = objc_msgSend(v15, "countForObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
          v19 = v19 + ((double)v21 - v14) * ((double)v21 - v14);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      }
      while (v17);
    }
    else
    {
      v19 = 0.0;
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v22 = v15;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    if (v23)
    {
      v24 = v23;
      v25 = (unint64_t)fmax(ceil(v14 + sqrt(v19 / v13) * -0.5), 2.0);
      v26 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v47 != v26)
            objc_enumerationMutation(v22);
          v28 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          if (objc_msgSend(v22, "countForObject:", v28) > v25)
            objc_msgSend(v6, "addObject:", v28);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
      }
      while (v24);
    }

  }
  v39 = v11;
  v40 = v6;
  objc_msgSend(v6, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sortedArrayUsingComparator:", PGManagerPersonNodeComparisonBlock);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "localIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "length"))
        {
          v37 = *(void **)(a1 + 32);
          v58 = CFSTR("localIdentifier");
          v59 = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v38);

        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
    }
    while (v33);
  }

}

void __44__PGManager_People__suggestedPersonsForHome__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isFavorite") & 1) != 0
    || (objc_msgSend(v3, "isMemberOfMyFamily") & 1) != 0
    || (objc_msgSend(v3, "isInferredMemberOfMyFamily") & 1) != 0
    || objc_msgSend(v3, "isMeNode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

void __44__PGManager_People__suggestedPersonsForHome__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a3, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PGManager_People__suggestedPersonsForHome__block_invoke_4;
  v5[3] = &unk_1E8432530;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateIdentifiersAsCollectionsWithBlock:", v5);

}

void __44__PGManager_People__suggestedPersonsForHome__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "personNodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

}

void __69__PGManager_People__relationshipInferencesForPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_checkCanRead");
  objc_msgSend(v3, "meNode");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v32 = a1;
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v3;
    objc_msgSend(v3, "personNodesForPersonLocalIdentifiers:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v6 = v5;
    v36 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    if (v36)
    {
      v33 = *(_QWORD *)v44;
      v34 = v6;
      do
      {
        for (i = 0; i != v36; i = v27 + 1)
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(v6);
          v37 = i;
          v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v8, "localIdentifier");
          v9 = objc_claimAutoreleasedReturnValue();
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "loggingConnection");
          v11 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v9;
            _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[Person Knowledge] Querying for inferred relationships for person %@", buf, 0xCu);
          }
          v38 = (void *)v9;

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "relationshipEdgesToPersonNode:matchingQuery:", v8, 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v40 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                objc_msgSend(v18, "label");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                PGRelationshipTypeFromRelationshipLabel(v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v18, "confidence");
                objc_msgSend(v21, "numberWithDouble:");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, v20);

                +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "loggingConnection");
                v24 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v18, "confidence");
                  *(_DWORD *)buf = 138412802;
                  v48 = (uint64_t)v19;
                  v49 = 2112;
                  v50 = v38;
                  v51 = 2048;
                  v52 = v25;
                  _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "[Person Knowledge] Relationship of type %@ inferred for person %@ with confidence %.02f", buf, 0x20u);
                }

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
            }
            while (v15);
          }
          if (objc_msgSend(v12, "count"))
          {
            v26 = v38;
            objc_msgSend(*(id *)(v32 + 40), "setObject:forKeyedSubscript:", v12, v38);
            v6 = v34;
            v27 = v37;
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "loggingConnection");
            v29 = objc_claimAutoreleasedReturnValue();

            v27 = v37;
            v26 = v38;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v48 = (uint64_t)v38;
              _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[Person Knowledge] No inferred relationships found for person %@", buf, 0xCu);
            }

            v6 = v34;
          }

        }
        v36 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      }
      while (v36);
    }

    v3 = v31;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "[Person Knowledge] No relationship inferences found due to nil me node", buf, 2u);
    }
  }

}

void __71__PGManager_People__mePersonContactIdentifierDidChangeWithGraphUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  objc_msgSend(a2, "graph");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "meNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inferredPersonNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = v3;
  else
    v6 = v4;
  objc_msgSend(v6, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PGManager_People__mePersonContactIdentifierDidChangeWithGraphUpdate___block_invoke_2;
  v12[3] = &unk_1E8428A28;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  v14 = v8;
  v10 = v7;
  objc_msgSend(v9, "enumerateConsolidatedChanges:", v12);

}

void __71__PGManager_People__mePersonContactIdentifierDidChangeWithGraphUpdate___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = (void *)MEMORY[0x1CAA4EB2C]();
  if (objc_msgSend(v9, "type") == 6)
  {
    v6 = v9;
    objc_msgSend(v6, "personLocalIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32))
      && objc_msgSend(v8, "containsObject:", CFSTR("cnid")))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }

  }
  objc_autoreleasePoolPop(v5);

}

void __63__PGManager_People__assetIdentifiersForPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifiers:inGraph:", v3, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "socialGroupNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuids");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __63__PGManager_People__assetIdentifiersForPersonLocalIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CD1698], "uuidFromLocalIdentifier:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __63__PGManager_People__assetCollectionsForPersonLocalIdentifiers___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "graph");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForLocalIdentifiers:inGraph:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    if (v7 == 1)
    {
      objc_msgSend(v6, "socialGroupNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "momentNodes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v14, "momentNodesForPersonNodes:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "temporarySet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "momentsForMomentNodes:inPhotoLibrary:sortChronologically:", v10, a1[5], 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

void __74__PGManager_People__maximalSocialGroupsOverlappingMemberLocalIdentifiers___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "graph");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "maximalSocialGroupsOverlappingMemberLocalIdentifiers:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  +[PGPeopleUtilities validateSocialGroups:withPhotoLibrary:graph:](PGPeopleUtilities, "validateSocialGroups:withPhotoLibrary:graph:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5], v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __67__PGManager_People__socialGroupsOverlappingMemberLocalIdentifiers___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "graph");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "socialGroupsOverlappingMemberLocalIdentifiers:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  +[PGPeopleUtilities validateSocialGroups:withPhotoLibrary:graph:](PGPeopleUtilities, "validateSocialGroups:withPhotoLibrary:graph:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5], v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __69__PGManager_People__allSocialGroupsForMemberLocalIdentifier_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "graph");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allSocialGroupsForMemberLocalIdentifier:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D72208]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  +[PGPeopleUtilities validateSocialGroups:withPhotoLibrary:graph:usePersonMoments:](PGPeopleUtilities, "validateSocialGroups:withPhotoLibrary:graph:usePersonMoments:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48), v11, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __58__PGManager_People__sortedArrayForPersonLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personNodesForPersonLocalIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortedArrayUsingComparator:", PGManagerPersonNodeComparisonBlock);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)requestGraleSemanticLabelPropagationWithError:(id *)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)blockedFeatures
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[PGManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = objc_claimAutoreleasedReturnValue();

  v31 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0CD1630], "fetchBlockedMemoriesWithOptions:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "blacklistedFeature");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v9);
  }
  v29 = v7;

  -[PGManager photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchPropertySets:", v15);

  v28 = v14;
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithUserFeedbackWithOptions:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v21, "userFeedbackProperties");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "userFeedback");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "type") == 2 || objc_msgSend(v23, "type") == 3)
        {
          v24 = (void *)MEMORY[0x1E0CD1648];
          objc_msgSend(v21, "localIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "peopleMemoryFeatureWithPersonLocalIdentifier:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            objc_msgSend(v6, "addObject:", v26);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v18);
  }

  return v6;
}

- (id)graphUpdateForContactsChangesWithProgressReporter:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PGGraphUpdate *v11;
  void *v12;
  PGGraphUpdate *v13;
  id v14;
  PGGraphUpdate *v15;
  int v16;
  PGGraphUpdate *v17;
  id v18;
  NSObject *v19;
  PGGraphUpdate *v20;
  uint8_t v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  PGGraphUpdate *v25;
  uint64_t v27;
  uint32_t denom;
  uint32_t numer;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  NSObject *v35;
  PGGraphUpdate *v36;
  uint8_t *v37;
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  char v41;
  mach_timebase_info info;
  uint8_t v43[4];
  _BYTE v44[18];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "GetGraphUpdateForContactChanges", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v32 = mach_absolute_time();
  -[PGManager workingContext](self, "workingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [PGGraphUpdate alloc];
  -[PGManager photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGGraphUpdate initWithPhotoLibrary:updateType:](v11, "initWithPhotoLibrary:updateType:", v12, 1);

  v14 = v4;
  v15 = v13;
  *(_QWORD *)buf = 0;
  v39 = buf;
  v40 = 0x2020000000;
  v41 = 0;
  v16 = objc_msgSend(v14, "isCancelledWithProgress:", 0.0);
  v39[24] = v16;
  if (!v16)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke;
    v33[3] = &unk_1E842D5B0;
    v33[4] = self;
    v37 = buf;
    v18 = v14;
    v34 = v18;
    v19 = v10;
    v35 = v19;
    v20 = v15;
    v36 = v20;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v33);
    if (v39[24])
    {
      v39[24] = 1;
    }
    else
    {
      v21 = objc_msgSend(v18, "isCancelledWithProgress:", 1.0);
      v39[24] = v21;
      if ((v21 & 1) == 0)
      {
        v27 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v30 = v8;
        v31 = v30;
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)v43 = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_END, v6, "GetGraphUpdateForContactChanges", ", v43, 2u);
        }

        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v43 = 136315394;
          *(_QWORD *)v44 = "GetGraphUpdateForContactChanges";
          *(_WORD *)&v44[8] = 2048;
          *(double *)&v44[10] = (float)((float)((float)((float)(v27 - v32) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v43, 0x16u);
        }
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          goto LABEL_14;
        *(_WORD *)v43 = 0;
        v23 = "PGManager (Contacts): finished proceeding with the graph update from Contacts";
        v22 = v19;
        v24 = 2;
        goto LABEL_13;
      }
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
LABEL_14:
      v25 = v20;

      goto LABEL_15;
    }
    *(_DWORD *)v43 = 67109378;
    *(_DWORD *)v44 = 92;
    *(_WORD *)&v44[4] = 2080;
    *(_QWORD *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Core/PGManager+Contacts.m";
    v22 = MEMORY[0x1E0C81028];
    v23 = "Cancelled at line %d in file %s";
    v24 = 18;
LABEL_13:
    _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, v23, v43, v24);
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v43 = 67109378;
    *(_DWORD *)v44 = 34;
    *(_WORD *)&v44[4] = 2080;
    *(_QWORD *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Core/PGManager+Contacts.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v43, 0x12u);
  }
  v17 = v15;
LABEL_15:
  _Block_object_dispose(buf, 8);

  return v15;
}

- (id)_homeWorkNodesByPersonNodeForContactIdentifiers:(id)a3 inGraph:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a4;
  objc_msgSend(v5, "setWithArray:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNodeCollection personNodesForContactIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForContactIdentifiers:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphPersonNode homeOrWorkOfPerson](PGGraphPersonNode, "homeOrWorkOfPerson");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adjacencyWithSources:relation:targetsClass:", v8, v10, objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 *p_buf;
  uint64_t v27;
  double v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  __int128 buf;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNodeCollection personNodesIncludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesIncludingMeInGraph:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "contactIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke_2;
    v29[3] = &unk_1E84301E0;
    v31 = *(_QWORD *)(a1 + 64);
    v30 = *(id *)(a1 + 40);
    objc_msgSend(v6, "clsPersonByContactIdentifierWithPersonContactIdentifiers:progressBlock:", v7, v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      v10 = *(NSObject **)(a1 + 48);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "PGManager (Contacts): people in Contacts: %@", (uint8_t *)&buf, 0xCu);
      }
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v9, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_homeWorkNodesByPersonNodeForContactIdentifiers:inGraph:", v12, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v33 = 0x2020000000;
      v34 = 0x3FE3333333333333;
      v14 = 1.0 / (double)(unint64_t)objc_msgSend(v5, "count");
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke_172;
      v19[3] = &unk_1E842B4A0;
      v15 = v9;
      v16 = *(_QWORD *)(a1 + 32);
      v20 = v15;
      v21 = v16;
      v17 = v13;
      v22 = v17;
      v23 = v4;
      v24 = *(id *)(a1 + 56);
      v28 = v14;
      v18 = *(_QWORD *)(a1 + 64);
      p_buf = &buf;
      v27 = v18;
      v25 = *(id *)(a1 + 40);
      objc_msgSend(v5, "enumerateNodesUsingBlock:", v19);

      _Block_object_dispose(&buf, 8);
    }

  }
}

uint64_t __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.1);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v4 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

void __73__PGManager_Contacts__graphUpdateForContactsChangesWithProgressReporter___block_invoke_172(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PGGraphPersonChange *v10;
  void *v11;
  void *v12;
  void *v13;
  PGGraphPersonChange *v14;
  uint64_t v15;
  char v16;
  id v17;

  v17 = a2;
  v5 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v17, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v17, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[PGGraphPersonNode propertiesWithPerson:](PGGraphPersonNode, "propertiesWithPerson:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "changingPropertiesWithProperties:", v9);
      v10 = (PGGraphPersonChange *)objc_claimAutoreleasedReturnValue();
      if (-[PGGraphPersonChange count](v10, "count")
        || objc_msgSend(*(id *)(a1 + 40), "homeWorkAddressesDidChangeForPersonInContact:andPersonNode:withHomeWorkNodesByPersonNode:graph:", v8, v17, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56)))
      {
        v11 = (void *)MEMORY[0x1E0C99E60];
        -[PGGraphPersonChange allKeys](v10, "allKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = -[PGGraphPersonChange initWithPersonLocalIdentifier:contactIdentifier:propertyNames:]([PGGraphPersonChange alloc], "initWithPersonLocalIdentifier:contactIdentifier:propertyNames:", v7, v6, v13);
        objc_msgSend(*(id *)(a1 + 64), "addChange:", v14);

      }
    }
    else
    {
      +[PGGraphPersonNode changedPropertyNamesForContactsChange](PGGraphPersonNode, "changedPropertyNamesForContactsChange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PGGraphPersonChange initWithPersonLocalIdentifier:contactIdentifier:propertyNames:]([PGGraphPersonChange alloc], "initWithPersonLocalIdentifier:contactIdentifier:propertyNames:", v7, v6, v9);
      objc_msgSend(*(id *)(a1 + 64), "addChange:", v10);
    }

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(double *)(a1 + 96)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                            + 24);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (*(_BYTE *)(v15 + 24))
    {
      v16 = 1;
    }
    else
    {
      v16 = objc_msgSend(*(id *)(a1 + 72), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    }
    *(_BYTE *)(v15 + 24) = v16;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      *a3 = 1;

  }
  objc_autoreleasePoolPop(v5);

}

- (id)memoryDebugInformationWithMoments:(id)a3 meaningLabels:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__24631;
  v23 = __Block_byref_object_dispose__24632;
  v24 = 0;
  -[PGManager serviceManager](self, "serviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__PGManager_Diagnostics__memoryDebugInformationWithMoments_meaningLabels___block_invoke;
  v14[3] = &unk_1E84340C0;
  v9 = v6;
  v15 = v9;
  v18 = &v19;
  v10 = v7;
  v16 = v10;
  v11 = v8;
  v17 = v11;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v14);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)highlightDebugInformationWithHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  PGManager *v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__PGManager_Diagnostics__highlightDebugInformationWithHighlight___block_invoke;
  v12[3] = &unk_1E8435410;
  v13 = v4;
  v14 = v6;
  v7 = v5;
  v15 = v7;
  v16 = self;
  v8 = v6;
  v9 = v4;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v10 = v7;

  return v10;
}

- (id)_sanitizeGraphDataDictionaryForArchiving:(id)a3 referencedMemory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("backingMoments"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("collectionsInfo"));
    v9 = objc_claimAutoreleasedReturnValue();
    v40 = v7;
    v43 = (void *)v9;
    if (!v8 || !v9)
    {
      -[PGManager photoLibrary](self, "photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "librarySpecificFetchOptions");
      v11 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v11;
      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsBackingMemory:options:", v7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchedObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("info"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("meaningLabels"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGManager memoryDebugInformationWithMoments:meaningLabels:](self, "memoryDebugInformationWithMoments:meaningLabels:", v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("backingMoments"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v8 || !v18)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "loggingConnection");
        v22 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v13;
          _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "Memory backing moments debug information is not available for moments: %@", buf, 0xCu);
        }

      }
      else
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("backingMoments"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("collectionsInfo"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43 || !v23)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "loggingConnection");
        v25 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v52 = v13;
          v53 = 2112;
          v54 = v26;
          _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "Memory graph collections debug information is not available for moments: '%@' and meanings: '%@'", buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("collectionsInfo"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v42 = v6;
    v39 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v28 = v8;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v47 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v33, "objectForKey:", CFSTR("keywords"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __84__PGManager_Diagnostics___sanitizeGraphDataDictionaryForArchiving_referencedMemory___block_invoke;
            v44[3] = &unk_1E842B620;
            v45 = v35;
            v36 = v35;
            objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v44);
            v37 = (void *)objc_msgSend(v33, "mutableCopy");
            objc_msgSend(v37, "setObject:forKey:", v36, CFSTR("keywords"));
            objc_msgSend(v27, "addObject:", v37);

          }
          else
          {
            objc_msgSend(v27, "addObject:", v33);
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v30);
    }

    v20 = v39;
    objc_msgSend(v39, "setObject:forKey:", v27, CFSTR("backingMoments"));
    if (v43)
      objc_msgSend(v39, "setObject:forKey:", v43, CFSTR("collectionsInfo"));

    v7 = v40;
    v6 = v42;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)_extractDatesAndAssetCountsFromMemory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = v8;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__24631;
    v25 = __Block_byref_object_dispose__24632;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__24631;
    v19 = __Block_byref_object_dispose__24632;
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__PGManager_Diagnostics___extractDatesAndAssetCountsFromMemory___block_invoke;
    v14[3] = &unk_1E842B648;
    v14[4] = &v21;
    v14[5] = &v15;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
    v10 = v22[5];
    if (v10)
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("startDate"));
    v11 = v16[5];
    if (v11)
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("endDate"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("estimatedAssetCount"));

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

  }
  return v4;
}

- (id)_diagnosticSummaryInfoForMemory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v4, "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("title"));

  }
  v9 = objc_msgSend(v4, "assetCollectionType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("assetCollectionType"));

  v11 = objc_msgSend(v4, "assetCollectionSubtype");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("assetCollectionSubType"));

  objc_msgSend(v4, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("creationDate"));

  }
  objc_msgSend(v4, "localIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "localIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("localIdentifier"));

  }
  v17 = objc_msgSend(v4, "isRejected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("rejected"));

  v19 = objc_msgSend(v4, "isFavorite");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("favorite"));

  v21 = objc_msgSend(v4, "pendingState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("pendingState"));

  v23 = objc_msgSend(v4, "photosGraphVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("photoGraphVersion"));

  objc_msgSend(v4, "photosGraphProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[PGManager _sanitizeGraphDataDictionaryForArchiving:referencedMemory:](self, "_sanitizeGraphDataDictionaryForArchiving:referencedMemory:", v25, v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("photosGraphProperties"));

  }
  objc_msgSend(v4, "movieData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("movieData"));
  objc_msgSend(v4, "score");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("score"));

  objc_msgSend(v4, "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v5, "setObject:forKey:", v29, CFSTR("uuid"));
  objc_msgSend(v4, "lastViewedDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("lastViewedDate"));
  objc_msgSend(v4, "lastMoviePlayedDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("lastMoviePlayedDate"));
  v32 = objc_msgSend(v4, "category");
  objc_msgSend(MEMORY[0x1E0CD1630], "stringForCategory:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v33, CFSTR("category"));
  v34 = objc_msgSend(v4, "subcategory");
  objc_msgSend(MEMORY[0x1E0CD1630], "stringForSubcategory:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v35, CFSTR("subCategory"));
  -[PGManager _extractDatesAndAssetCountsFromMemory:](self, "_extractDatesAndAssetCountsFromMemory:", v4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v36);

  return v5;
}

- (id)diagnosticsSummaryInfoOnExistingMemoriesForCurrentPhotoLibrary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[PGManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIncludePendingMemories:", 0);
  objc_msgSend(v4, "setIncludeRejectedMemories:", 0);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  objc_msgSend(v4, "setFetchLimit:", 15);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PGManager _diagnosticSummaryInfoForMemory:](self, "_diagnosticSummaryInfoForMemory:", v14, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setValue:forKey:", v15, v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (unint64_t)medianValueFromUnsignedItegerArray:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "unsignedIntegerValue");
    }
    else
    {
      objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "count");
      v7 = (unint64_t)objc_msgSend(v4, "count") >> 1;
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v4, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v8, "unsignedIntegerValue");
      }
      else
      {
        objc_msgSend(v4, "objectAtIndex:", v7 - 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v8;
        objc_msgSend(v4, "objectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueForKeyPath:", CFSTR("@avg.self"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v11, "unsignedIntegerValue");

      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_momentsStatisticsForCurrentPhotoLibrary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v25;
  PGManager *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = self;
  -[PGManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1CAA4EB2C]();
        v16 = objc_msgSend(v14, "estimatedAssetCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v17);

        v10 += v16;
        if (v16 == 1)
          ++v11;
        objc_autoreleasePoolPop(v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  v18 = v10 / v25;
  v19 = -[PGManager medianValueFromUnsignedItegerArray:](v26, "medianValueFromUnsignedItegerArray:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v20, CFSTR("numberOfMoments"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v21, CFSTR("averageNumberOfAssetsInMoments"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v22, CFSTR("medianNumberOfAssetsInMoments"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v23, CFSTR("numberOfMomentsWithSingleAsset"));

  return v28;
}

- (id)_collectionStatisticsForCurrentPhotoLibrary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v29;
  id obj;
  void *v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[PGManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSortDescriptors:", v4);

  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchMomentListsWithSubtype:options:", 1, v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v7 = 0;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v11, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        v34 = &v33;
        v35 = 0x2020000000;
        v36 = 0;
        objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsInMomentList:options:", v11, v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __69__PGManager_Diagnostics___collectionStatisticsForCurrentPhotoLibrary__block_invoke;
        v32[3] = &unk_1E842B670;
        v32[4] = &v33;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v32);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
          v15 = (void *)v14;
        else
          v15 = &unk_1E84E38A8;
        v16 = objc_msgSend(v15, "unsignedIntegerValue");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34[3] + v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v12);

        v18 = v34[3];
        _Block_object_dispose(&v33, 8);

        v7 += v18;
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v8);
  }

  v19 = objc_msgSend(v6, "count");
  v20 = v19;
  if (v19)
    v21 = v7 / v19;
  else
    v21 = 0;
  objc_msgSend(v6, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PGManager medianValueFromUnsignedItegerArray:](self, "medianValueFromUnsignedItegerArray:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKey:", v24, CFSTR("numberOfCollections"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKey:", v25, CFSTR("averageNumberOfAssetsInCollections"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKey:", v26, CFSTR("medianNumberOfAssetsInCollections"));

  return v29;
}

- (id)_extractYearStatsFromOrderedCollectionFetchResults:(id)a3 fetchOptions:(id)a4 yearEntryKey:(id)a5 numberOfYearsEntryKey:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id obj;
  id v25;
  id v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v26 = a4;
  v23 = a5;
  v25 = a6;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v10)
  {
    v12 = 0;
    v11 = 0;
    v18 = -1;
    v17 = obj;
    goto LABEL_18;
  }
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v33 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsInMomentList:options:", v15, v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v31 = 0;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __125__PGManager_Diagnostics___extractYearStatsFromOrderedCollectionFetchResults_fetchOptions_yearEntryKey_numberOfYearsEntryKey___block_invoke;
      v27[3] = &unk_1E842B670;
      v27[4] = &v28;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v27);
      if (v29[3])
      {
        if (!v12)
        {
          objc_msgSend(v15, "startDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (!v25)
        {
          _Block_object_dispose(&v28, 8);

          goto LABEL_15;
        }
        ++v11;
      }
      _Block_object_dispose(&v28, 8);

    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
      continue;
    break;
  }
LABEL_15:

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "component:fromDate:", 4, v12);
LABEL_18:

    goto LABEL_20;
  }
  v18 = -1;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, v23);

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v21, v25);

  }
  return v19;
}

- (id)_yearsStatisticsForCurrentPhotoLibrary
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
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchMomentListsWithSubtype:options:", 2, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager _extractYearStatsFromOrderedCollectionFetchResults:fetchOptions:yearEntryKey:numberOfYearsEntryKey:](self, "_extractYearStatsFromOrderedCollectionFetchResults:fetchOptions:yearEntryKey:numberOfYearsEntryKey:", v8, v5, CFSTR("startYear"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v9);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v11);

  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchMomentListsWithSubtype:options:", 2, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager _extractYearStatsFromOrderedCollectionFetchResults:fetchOptions:yearEntryKey:numberOfYearsEntryKey:](self, "_extractYearStatsFromOrderedCollectionFetchResults:fetchOptions:yearEntryKey:numberOfYearsEntryKey:", v12, v5, CFSTR("endYear"), CFSTR("numberOfYearsWithAsset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v13);

  return v3;
}

- (id)libraryStatisticsForCurrentPhotoLibrary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager _momentsStatisticsForCurrentPhotoLibrary](self, "_momentsStatisticsForCurrentPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  -[PGManager _collectionStatisticsForCurrentPhotoLibrary](self, "_collectionStatisticsForCurrentPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", v5);
  -[PGManager _yearsStatisticsForCurrentPhotoLibrary](self, "_yearsStatisticsForCurrentPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", v6);

  return v3;
}

uint64_t __125__PGManager_Diagnostics___extractYearStatsFromOrderedCollectionFetchResults_fetchOptions_yearEntryKey_numberOfYearsEntryKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "estimatedAssetCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;
  return result;
}

uint64_t __69__PGManager_Diagnostics___collectionStatisticsForCurrentPhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "estimatedAssetCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __64__PGManager_Diagnostics___extractDatesAndAssetCountsFromMemory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  objc_msgSend(a2, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = v3;
  if (*(_QWORD *)(v5 + 40))
  {
    if (objc_msgSend(v3, "compare:") != -1)
      goto LABEL_5;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = obj;
  }
  objc_storeStrong((id *)(v5 + 40), v4);
LABEL_5:
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_QWORD *)(v6 + 40))
  {
LABEL_8:
    objc_storeStrong((id *)(v6 + 40), obj);
    goto LABEL_9;
  }
  if (objc_msgSend(obj, "compare:") == 1)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    goto LABEL_8;
  }
LABEL_9:

}

void __84__PGManager_Diagnostics___sanitizeGraphDataDictionaryForArchiving_referencedMemory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "stringValue");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);

}

void __65__PGManager_Diagnostics__highlightDebugInformationWithHighlight___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PGNeighborScoreComputer *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  PGNeighborScoreComputer *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  PGNeighborScoreComputer *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  PGNeighborScoreComputer *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphHighlightNodeCollection highlightNodeForUUID:inGraph:](PGGraphHighlightNodeCollection, "highlightNodeForUUID:inGraph:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v30 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "nonDefaultCurationScorePercentageForPhotoLibrary:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("curationScorePercentage"));

    objc_msgSend(*(id *)(a1 + 32), "faceAnalysisProgressForPhotoLibrary:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("faceAnalysisProgress"));

    objc_msgSend(*(id *)(a1 + 32), "sceneAnalysisProgressForPhotoLibrary:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("sceneAnalysisProgress"));

    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, CFSTR("collectionsInfo"));
    v11 = objc_alloc_init(PGNeighborScoreComputer);
    if ((objc_msgSend(v6, "isTrip") & 1) != 0)
      v12 = 0;
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "collection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "momentNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __65__PGManager_Diagnostics__highlightDebugInformationWithHighlight___block_invoke_2;
    v35[3] = &unk_1E842B5F8;
    v16 = v11;
    v36 = v16;
    v37 = v3;
    v17 = *(id *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 56);
    v38 = v17;
    v39 = v18;
    v19 = v13;
    v40 = v19;
    v20 = v12;
    v41 = v20;
    objc_msgSend(v15, "enumerateNodesUsingBlock:", v35);

    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v19, CFSTR("backingMoments"));
    if (objc_msgSend(v20, "count"))
    {
      v28 = v16;
      v29 = v7;
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v32 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (objc_msgSend(v20, "containsObject:", v27))
              objc_msgSend(v21, "addObject:", v27);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
        }
        while (v24);
      }
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v21, CFSTR("sortedMeaningLabels"));

      v7 = v29;
      v3 = v30;
      v16 = v28;
    }

  }
}

void __65__PGManager_Diagnostics__highlightDebugInformationWithHighlight___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a2;
  v3 = (void *)MEMORY[0x1CAA4EB2C]();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfAssets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfAssets"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v24, "graphScore");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("graphScore"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "neighborScoreWithMomentNode:", v24);
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("neighborScore"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v24, "contentScore");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("curationScore"));

  objc_msgSend(v24, "keywordsForRelatedType:focusOnNodes:", 63, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "momentForMomentNode:inPhotoLibrary:", v24, *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", &unk_1E84E3890);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = (id)objc_msgSend(v15, "mutableCopy");
    v17 = v16;
    v18 = (void *)MEMORY[0x1E0CB3940];
    MEMORY[0x1CAA4E400](objc_msgSend(v14, "processedLocation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("[processedLocationType] %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, &unk_1E84E3890);
  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "exportableDictionaryFromKeywords:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("keywords"));

  }
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v4);
  v22 = *(void **)(a1 + 72);
  objc_msgSend(v24, "meaningLabels");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "unionSet:", v23);

  objc_autoreleasePoolPop(v3);
}

void __74__PGManager_Diagnostics__memoryDebugInformationWithMoments_meaningLabels___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "uuid", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "graph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMemoryDebugConvenience memoryDebugInformationWithMomentNodes:meaningLabels:serviceManager:](PGMemoryDebugConvenience, "memoryDebugInformationWithMomentNodes:meaningLabels:serviceManager:", v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (PGManager)initWithPhotoLibrary:(id)a3 analytics:(id)a4 progressBlock:(id)a5
{
  id v9;
  PGManager *v10;
  PGManager *v11;

  v9 = a4;
  v10 = -[PGManager initWithPhotoLibrary:progressBlock:](self, "initWithPhotoLibrary:progressBlock:", a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_analytics, a4);

  return v11;
}

- (PGManager)initWithPhotoLibrary:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  PGManager *v8;
  PGManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGManager;
  v8 = -[PGManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[PGManager commonInitWithPhotoLibrary:progressBlock:](v8, "commonInitWithPhotoLibrary:progressBlock:", v6, v7);

  return v9;
}

- (PGManager)initWithGraphPersistentStoreURL:(id)a3 photoLibrary:(id)a4 analytics:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PGManager *v14;
  PGManager *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PGManager;
  v14 = -[PGManager init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_analytics, a5);
    -[PGManager setGraphPersistentStoreURL:](v15, "setGraphPersistentStoreURL:", v10);
    -[PGManager commonInitWithPhotoLibrary:progressBlock:](v15, "commonInitWithPhotoLibrary:progressBlock:", v11, v13);
  }

  return v15;
}

- (PGManager)initWithReadonlyPhotoLibrary:(id)a3
{
  PGManager *result;

  result = -[PGManager initWithPhotoLibrary:progressBlock:](self, "initWithPhotoLibrary:progressBlock:", a3, &__block_literal_global_179);
  if (result)
    result->_photoLibraryIsReadonly = 1;
  return result;
}

- (PGManager)initWithGraph:(id)a3 readonlyPhotoLibrary:(id)a4
{
  PGManager *result;

  result = -[PGManager initWithGraph:photoLibrary:](self, "initWithGraph:photoLibrary:", a3, a4);
  if (result)
    result->_photoLibraryIsReadonly = 1;
  return result;
}

- (PGManager)init
{
  -[PGManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)initForTesting
{
  PGManager *v2;
  PGManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGManager;
  v2 = -[PGManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PGManager commonInitWithPhotoLibrary:progressBlock:](v2, "commonInitWithPhotoLibrary:progressBlock:", 0, 0);
  return v3;
}

- (PGManager)initWithGraph:(id)a3
{
  return -[PGManager initWithGraph:photoLibrary:](self, "initWithGraph:photoLibrary:", a3, 0);
}

- (PGManager)initWithImmutableGraph:(id)a3
{
  return -[PGManager initWithImmutableGraph:photoLibrary:](self, "initWithImmutableGraph:photoLibrary:", a3, 0);
}

- (PGManager)initWithImmutableGraph:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  PGManager *v8;
  PGManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGManager;
  v8 = -[PGManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PGManager setGraph:](v8, "setGraph:", v6);
    -[PGManager commonInitWithPhotoLibrary:progressBlock:](v9, "commonInitWithPhotoLibrary:progressBlock:", v7, 0);
  }

  return v9;
}

- (PGManager)initWithGraph:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  PGManager *v8;
  PGManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGManager;
  v8 = -[PGManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PGManager setMutableGraph:](v8, "setMutableGraph:", v6);
    -[PGManager commonInitWithPhotoLibrary:progressBlock:](v9, "commonInitWithPhotoLibrary:progressBlock:", v7, 0);
  }

  return v9;
}

- (BOOL)graphIsUsable:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  PGEventLabelingConfiguration *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  int v37;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "version");
  if (v8 == 615)
  {
    objc_msgSend(v6, "infoNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "curationAlgorithmsVersion") == 11)
    {
      if (objc_msgSend(v9, "meaningAlgorithmsVersion") == 5)
      {
        v10 = objc_alloc_init(PGEventLabelingConfiguration);
        v11 = -[PGEventLabelingConfiguration modelVersion](v10, "modelVersion");
        if (objc_msgSend(v9, "eventLabelingV2ModelVersion") == v11)
        {
          if (_os_feature_enabled_impl())
          {
            v12 = objc_alloc_init(MEMORY[0x1E0D77EE8]);
            v13 = objc_msgSend(v12, "configurationVersion");

          }
          else
          {
            v13 = 0;
          }
          if (objc_msgSend(v9, "personalTraitsEntityNamesVersion") == v13)
          {
            objc_msgSend(v9, "localeIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "localeIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v23, "isEqualToString:", v25);

            if ((v26 & 1) != 0)
            {
              v27 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setWithArray:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              v30 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v9, "languageIdentifiers");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setWithArray:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v32, "isEqualToSet:", v29) & 1) != 0)
              {
                if (!+[PGManager geoServiceProviderDidChangeForGraph:](PGManager, "geoServiceProviderDidChangeForGraph:", v6))
                {
                  v36 = objc_msgSend(MEMORY[0x1E0D4B258], "canAccessContactsStore");
                  v37 = v36 ^ objc_msgSend(v9, "canAccessContactsStore");
                  if (v37 == 1)
                  {
                    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                    {
                      LOWORD(v39) = 0;
                      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging contacts store access permission", (uint8_t *)&v39, 2u);
                    }
                    if (a4)
                    {
                      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 35);
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                    }
                  }
                  v15 = v37 ^ 1;
                  goto LABEL_57;
                }
                if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v39) = 0;
                  _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging geo service provider id", (uint8_t *)&v39, 2u);
                }
                if (a4)
                {
                  v33 = (void *)MEMORY[0x1E0CB35C8];
                  v34 = 34;
LABEL_49:
                  objc_msgSend(v33, "pl_analysisErrorWithCode:", v34);
                  v15 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

                  goto LABEL_58;
                }
              }
              else
              {
                if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v39) = 0;
                  _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging keyboard languages", (uint8_t *)&v39, 2u);
                }
                if (a4)
                {
                  v33 = (void *)MEMORY[0x1E0CB35C8];
                  v34 = 33;
                  goto LABEL_49;
                }
              }
              v15 = 0;
              goto LABEL_57;
            }
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v39) = 0;
              _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging locale", (uint8_t *)&v39, 2u);
            }
            if (a4)
            {
              v21 = (void *)MEMORY[0x1E0CB35C8];
              v22 = 32;
              goto LABEL_43;
            }
LABEL_44:
            v15 = 0;
            goto LABEL_58;
          }
          v35 = v7;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v39 = 134218240;
            v40 = objc_msgSend(v9, "personalTraitsEntityNamesVersion");
            v41 = 2048;
            v42 = v13;
            _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging graph personalTraitsEntityNames version (%ld vs expected %ld)", (uint8_t *)&v39, 0x16u);
          }

          if (!a4)
            goto LABEL_44;
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = 36;
        }
        else
        {
          v20 = v7;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v39 = 134218240;
            v40 = objc_msgSend(v9, "eventLabelingV2ModelVersion");
            v41 = 2048;
            v42 = v11;
            _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging graph eventLabelingV2 model version (%ld vs expected %ld)", (uint8_t *)&v39, 0x16u);
          }

          if (!a4)
            goto LABEL_44;
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = 31;
        }
LABEL_43:
        objc_msgSend(v21, "pl_analysisErrorWithCode:", v22);
        v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

        goto LABEL_59;
      }
      v19 = v7;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 134218240;
        v40 = objc_msgSend(v9, "meaningAlgorithmsVersion");
        v41 = 1024;
        LODWORD(v42) = 5;
        _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging graph meaning inference algorithm version (%lu vs expected %d)", (uint8_t *)&v39, 0x12u);
      }

      if (a4)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = 30;
        goto LABEL_20;
      }
    }
    else
    {
      v16 = v7;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v39 = 134218240;
        v40 = objc_msgSend(v9, "curationAlgorithmsVersion");
        v41 = 1024;
        LODWORD(v42) = 11;
        _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging curation algorithms version (%lu vs expected %d)", (uint8_t *)&v39, 0x12u);
      }

      if (a4)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = 29;
LABEL_20:
        objc_msgSend(v17, "pl_analysisErrorWithCode:", v18);
        v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_59:

        goto LABEL_60;
      }
    }
    v15 = 0;
    goto LABEL_59;
  }
  v14 = v8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 134218240;
    v40 = v14;
    v41 = 1024;
    LODWORD(v42) = 615;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Graph cannot be used because of diverging graph versions (%lu vs expected %d)", (uint8_t *)&v39, 0x12u);
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 28);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_60:

  return v15;
}

- (void)loadGraphWithProgressBlock:(id)a3
{
  OS_os_log *v5;
  id v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void (**v11)(void *, _BYTE *, double);
  double v12;
  double v13;
  void *v14;
  void *v15;
  NSObject *loggingConnection;
  double Current;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint32_t denom;
  uint32_t numer;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  char v30;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v33[18];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = self->_graphLoggingConnection;
  v6 = a3;
  v7 = os_signpost_id_generate((os_log_t)v5);
  v8 = v5;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "GraphLoading", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v10 = mach_absolute_time();
  v11 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);

  v12 = 0.0;
  if (!v11 || (v13 = CFAbsoluteTimeGetCurrent(), v13 < 0.01))
  {
LABEL_10:
    -[PGManager graphPersistentStoreURL](self, "graphPersistentStoreURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14 || !+[PGGraph graphExistsAtURL:](PGGraph, "graphExistsAtURL:", v14))
    {
LABEL_30:
      v20 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v23 = v9;
      v24 = v23;
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_END, v7, "GraphLoading", " enableTelemetry=YES ", buf, 2u);
      }

      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v33 = "GraphLoading";
        *(_WORD *)&v33[8] = 2048;
        *(double *)&v33[10] = (float)((float)((float)((float)(v20 - v10) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0D42A38], "humanReadableMemoryFootprint");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v33 = "GraphLoading";
        *(_WORD *)&v33[8] = 2112;
        *(_QWORD *)&v33[10] = v26;
        _os_log_debug_impl(&dword_1CA237000, v25, OS_LOG_TYPE_DEBUG, "[Memory Footprint] %s : %@", buf, 0x16u);

      }
      if (v11)
      {
        if (CFAbsoluteTimeGetCurrent() - v12 >= 0.01)
        {
          v30 = 0;
          v11[2](v11, &v30, 1.0);
          if (v30)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v33 = 464;
              *(_WORD *)&v33[4] = 2080;
              *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Core/PGManager.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_42;
    }
    v29 = 0;
    v15 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "graphClass")), "initWithURL:persistenceOptions:error:", v14, 36, &v29);
    v27 = v29;
    if (!v15
      && (loggingConnection = self->_loggingConnection,
          os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v33 = v27;
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "Error loading existing graph due to internal error, graph database is corrupt or missing, rebuild required and will occur next time we attempt to open it: %@", buf, 0xCu);
      if (v11)
      {
LABEL_15:
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v12 >= 0.01)
        {
          v30 = 0;
          v11[2](v11, &v30, 0.5);
          if (v30)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v33 = 434;
              *(_WORD *)&v33[4] = 2080;
              *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Core/PGManager.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

LABEL_42:
            goto LABEL_43;
          }
          v12 = Current;
        }
      }
    }
    else if (v11)
    {
      goto LABEL_15;
    }
    if (v15)
    {
      v28 = v27;
      v18 = -[PGManager graphIsUsable:error:](self, "graphIsUsable:error:", v15, &v28);
      v19 = v28;

      if (!v18)
      {
        objc_msgSend(v15, "closePersistentStore");

        if (objc_msgSend(v19, "code") == 34)
        {
          -[PGManager _invalidatePersistentCachesForGeoServiceProviderChange](self, "_invalidatePersistentCachesForGeoServiceProviderChange");
        }
        else
        {
          -[PGManager _invalidateTransientCaches](self, "_invalidateTransientCaches");
          -[PGManager _invalidatePersistentCaches](self, "_invalidatePersistentCaches");
        }
        v15 = 0;
      }
      -[PGManager setGraph:](self, "setGraph:", v15);

    }
    else
    {
      v19 = v27;
    }

    goto LABEL_30;
  }
  v30 = 0;
  v11[2](v11, &v30, 0.0);
  if (!v30)
  {
    v12 = v13;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v33 = 418;
    *(_WORD *)&v33[4] = 2080;
    *(_QWORD *)&v33[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Core/PGManager.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_43:

}

- (void)_unloadGraph
{
  PGGraph *graph;
  PGMutableGraph *mutableGraph;

  if (self->_graph)
  {
    -[MAGraph savePersistentStore](self->_mutableGraph, "savePersistentStore");
    -[MAGraph closePersistentStore](self->_graph, "closePersistentStore");
    graph = self->_graph;
    self->_graph = 0;

    mutableGraph = self->_mutableGraph;
    self->_mutableGraph = 0;

  }
}

- (void)unloadGraph
{
  NSObject *graphAccessQueue;
  _QWORD block[5];

  graphAccessQueue = self->_graphAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__PGManager_unloadGraph__block_invoke;
  block[3] = &unk_1E8435668;
  block[4] = self;
  dispatch_barrier_sync(graphAccessQueue, block);
}

- (unint64_t)currentGraphVersion
{
  return -[MAGraph version](self->_graph, "version");
}

- (NSDate)dateOfLastIncrementalUpdateInvocation
{
  void *v2;
  void *v3;

  -[PGGraph infoNode](self->_graph, "infoNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateOfLastIncrementalUpdateInvocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)commonInitWithPhotoLibrary:(id)a3 progressBlock:(id)a4
{
  id v7;
  OS_os_log *v8;
  OS_os_log *loggingConnection;
  OS_os_log *v10;
  OS_os_log *memoriesLoggingConnection;
  OS_os_log *v12;
  OS_os_log *relatedLoggingConnection;
  OS_os_log *v14;
  OS_os_log *ingestLoggingConnection;
  OS_os_log *v16;
  OS_os_log *graphLoggingConnection;
  OS_os_log *v18;
  OS_os_log *enrichmentLoggingConnection;
  OS_os_log *v20;
  OS_os_log *suggestionsLoggingConnection;
  OS_os_log *v22;
  OS_os_log *guessWhoLoggingConnection;
  OS_os_log *v24;
  OS_os_log *metricsLoggingConnection;
  OS_os_log *v26;
  OS_os_log *upNextLoggingConnection;
  OS_os_log *v28;
  OS_os_log *externalRelevanceLoggingConnection;
  OS_os_log *v30;
  OS_os_log *graphConsistencyCheckLoggingConnection;
  void *v32;
  PGCurationManager *v33;
  PGCurationManager *curationManager;
  id v35;
  void *v36;
  CLSLocationCache *v37;
  CLSLocationCache *locationCache;
  CLSServiceManager *v39;
  CLSServiceManager *serviceManager;
  id v41;
  void *v42;
  CLSAOICache *v43;
  CLSAOICache *aoiCache;
  id v45;
  void *v46;
  CLSPOICache *v47;
  CLSPOICache *poiCache;
  id v49;
  void *v50;
  CLSROICache *v51;
  CLSROICache *roiCache;
  id v53;
  void *v54;
  CLSNatureCache *v55;
  CLSNatureCache *natureCache;
  CLSPublicEventManager *v57;
  CLSPublicEventManager *publicEventManager;
  NSObject *v59;
  NSObject *v60;
  OS_dispatch_queue *v61;
  OS_dispatch_queue *graphAccessQueue;
  NSObject *v63;
  NSObject *v64;
  OS_dispatch_queue *v65;
  OS_dispatch_queue *graphUpdateQueue;
  NSObject *v67;
  OS_dispatch_queue *v68;
  OS_dispatch_queue *notificationQueue;
  NSObject *v70;
  NSMutableArray *v71;
  NSMutableArray *coalescingGraphIsReady;
  id v73;
  _QWORD block[5];
  id v75;

  v73 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_photoLibrary, a3);
  v8 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "core");
  loggingConnection = self->_loggingConnection;
  self->_loggingConnection = v8;

  v10 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "memory");
  memoriesLoggingConnection = self->_memoriesLoggingConnection;
  self->_memoriesLoggingConnection = v10;

  v12 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "related");
  relatedLoggingConnection = self->_relatedLoggingConnection;
  self->_relatedLoggingConnection = v12;

  v14 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "ingest");
  ingestLoggingConnection = self->_ingestLoggingConnection;
  self->_ingestLoggingConnection = v14;

  v16 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "graph");
  graphLoggingConnection = self->_graphLoggingConnection;
  self->_graphLoggingConnection = v16;

  v18 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "enrichment");
  enrichmentLoggingConnection = self->_enrichmentLoggingConnection;
  self->_enrichmentLoggingConnection = v18;

  v20 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "suggestions");
  suggestionsLoggingConnection = self->_suggestionsLoggingConnection;
  self->_suggestionsLoggingConnection = v20;

  v22 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "guess");
  guessWhoLoggingConnection = self->_guessWhoLoggingConnection;
  self->_guessWhoLoggingConnection = v22;

  v24 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "metrics");
  metricsLoggingConnection = self->_metricsLoggingConnection;
  self->_metricsLoggingConnection = v24;

  v26 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "upNext");
  upNextLoggingConnection = self->_upNextLoggingConnection;
  self->_upNextLoggingConnection = v26;

  v28 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "externalAssetRelevance");
  externalRelevanceLoggingConnection = self->_externalRelevanceLoggingConnection;
  self->_externalRelevanceLoggingConnection = v28;

  v30 = (OS_os_log *)os_log_create("com.apple.PhotosGraph", "graphConsistencyCheck");
  graphConsistencyCheckLoggingConnection = self->_graphConsistencyCheckLoggingConnection;
  self->_graphConsistencyCheckLoggingConnection = v30;

  objc_msgSend((id)objc_opt_class(), "graphServicesURLWithPhotoLibrary:", v73);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PGCurationManager initWithPhotoLibrary:cacheURL:]([PGCurationManager alloc], "initWithPhotoLibrary:cacheURL:", v73, v32);
  curationManager = self->_curationManager;
  self->_curationManager = v33;

  v35 = objc_alloc(MEMORY[0x1E0D4B1C0]);
  objc_msgSend(MEMORY[0x1E0D4B1C0], "urlWithParentURL:", v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (CLSLocationCache *)objc_msgSend(v35, "initWithURL:", v36);
  locationCache = self->_locationCache;
  self->_locationCache = v37;

  v39 = (CLSServiceManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B258]), "initWithLocationCache:", self->_locationCache);
  serviceManager = self->_serviceManager;
  self->_serviceManager = v39;

  v41 = objc_alloc(MEMORY[0x1E0D4B100]);
  objc_msgSend(MEMORY[0x1E0D4B100], "urlWithParentURL:", v32);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (CLSAOICache *)objc_msgSend(v41, "initWithURL:", v42);
  aoiCache = self->_aoiCache;
  self->_aoiCache = v43;

  v45 = objc_alloc(MEMORY[0x1E0D4B208]);
  objc_msgSend(MEMORY[0x1E0D4B208], "urlWithParentURL:", v32);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (CLSPOICache *)objc_msgSend(v45, "initWithURL:", v46);
  poiCache = self->_poiCache;
  self->_poiCache = v47;

  v49 = objc_alloc(MEMORY[0x1E0D4B238]);
  objc_msgSend(MEMORY[0x1E0D4B238], "urlWithParentURL:", v32);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (CLSROICache *)objc_msgSend(v49, "initWithURL:", v50);
  roiCache = self->_roiCache;
  self->_roiCache = v51;

  v53 = objc_alloc(MEMORY[0x1E0D4B1E8]);
  objc_msgSend(MEMORY[0x1E0D4B1E8], "urlWithParentURL:", v32);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (CLSNatureCache *)objc_msgSend(v53, "initWithURL:", v54);
  natureCache = self->_natureCache;
  self->_natureCache = v55;

  v57 = (CLSPublicEventManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B230]), "initWithURL:", v32);
  publicEventManager = self->_publicEventManager;
  self->_publicEventManager = v57;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v59 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v59);
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PhotosGraph.graphAccessQueue", v60);
  graphAccessQueue = self->_graphAccessQueue;
  self->_graphAccessQueue = v61;

  dispatch_set_qos_class_floor((dispatch_object_t)self->_graphAccessQueue, QOS_CLASS_UTILITY, 0);
  dispatch_activate((dispatch_object_t)self->_graphAccessQueue);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v63 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v63);
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PhotosGraph.graphUpdateQueue", v64);
  graphUpdateQueue = self->_graphUpdateQueue;
  self->_graphUpdateQueue = v65;

  dispatch_set_qos_class_floor((dispatch_object_t)self->_graphUpdateQueue, QOS_CLASS_UTILITY, 0);
  dispatch_activate((dispatch_object_t)self->_graphUpdateQueue);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PhotosGraph.notificationQueue", v67);
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = v68;

  atomic_store(0, &self->_numberOfCurrentGraphAccesses);
  if (!self->_graph && self->_photoLibrary)
  {
    v70 = self->_graphAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PGManager_commonInitWithPhotoLibrary_progressBlock___block_invoke;
    block[3] = &unk_1E842BE60;
    block[4] = self;
    v75 = v7;
    dispatch_sync(v70, block);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  coalescingGraphIsReady = self->_coalescingGraphIsReady;
  self->_coalescingGraphIsReady = v71;

}

- (void)registerCoalescingBlockWhenGraphAnalysisFinishes:(id)a3
{
  PGManager *v4;
  NSMutableArray *coalescingGraphIsReady;
  void *v6;
  id aBlock;

  aBlock = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (aBlock)
  {
    if (-[PGManager libraryAnalysisState](v4, "libraryAnalysisState"))
    {
      coalescingGraphIsReady = v4->_coalescingGraphIsReady;
      v6 = _Block_copy(aBlock);
      -[NSMutableArray addObject:](coalescingGraphIsReady, "addObject:", v6);

    }
    else
    {
      (*((void (**)(id, BOOL, _QWORD))aBlock + 2))(aBlock, -[PGManager isReady](v4, "isReady"), 0);
    }
  }
  objc_sync_exit(v4);

}

- (void)notifyCoalescingBlocksGraphAnalysisFinished:(BOOL)a3 error:(id)a4
{
  id v5;
  PGManager *v6;
  NSMutableArray *v7;
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
  v5 = a4;
  v6 = self;
  objc_sync_enter(v6);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6->_coalescingGraphIsReady;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](v6->_coalescingGraphIsReady, "removeAllObjects", (_QWORD)v11);
  objc_sync_exit(v6);

}

- (id)graphPersistentStoreURL
{
  NSURL *cachedGraphPersistentStoreURL;
  void *v5;
  NSString *graphName;
  NSObject *v7;
  void *v8;
  NSURL *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  cachedGraphPersistentStoreURL = self->_cachedGraphPersistentStoreURL;
  if (cachedGraphPersistentStoreURL)
    return cachedGraphPersistentStoreURL;
  -[PGManager graphPersistenceParentDirectoryURL](self, "graphPersistenceParentDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    graphName = self->_graphName;
    if (!graphName)
      graphName = (NSString *)CFSTR("photosgraph");
    v7 = graphName;
    +[PGGraph graphURLForName:parentDirectoryURL:](PGGraph, "graphURLForName:parentDirectoryURL:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PGManager setGraphPersistentStoreURL:](self, "setGraphPersistentStoreURL:", v8);
      v9 = self->_cachedGraphPersistentStoreURL;
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "Unable to construct writable graph persistence store URL", v13, 2u);
      }

      v9 = 0;
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Unable to construct writable graph persistence store URL", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)setGraphPersistentStoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_cachedGraphPersistentStoreURL, a3);
}

- (NSURL)graphPersistenceParentDirectoryURL
{
  NSURL *cachedGraphPersistenceParentDirectoryURL;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  id *v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  NSURL **location;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  cachedGraphPersistenceParentDirectoryURL = self->_cachedGraphPersistenceParentDirectoryURL;
  if (cachedGraphPersistenceParentDirectoryURL)
    return cachedGraphPersistenceParentDirectoryURL;
  location = &self->_cachedGraphPersistenceParentDirectoryURL;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PGManager graphPersistenceParentDirectoryCandidateURLs](self, "graphPersistenceParentDirectoryCandidateURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v27;
    *(_QWORD *)&v8 = 138412290;
    v23 = v8;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      objc_msgSend(v13, "path", v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "fileExistsAtPath:", v14) & 1) == 0)
      {
        v25 = v10;
        v15 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v25);
        v16 = v25;

        if ((v15 & 1) == 0)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "loggingConnection");
          v18 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            v31 = v16;
            _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Unable to create graph cache directory: %@", buf, 0xCu);
          }

          v10 = v16;
          goto LABEL_16;
        }
        v10 = v16;
      }
      if ((objc_msgSend(v5, "isWritableFileAtPath:", v14) & 1) != 0)
      {
        v19 = v13;

        v20 = (id *)location;
        if (v19)
          goto LABEL_26;
        goto LABEL_23;
      }
LABEL_16:

      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_22;
      }
    }
  }
  v10 = 0;
LABEL_22:

  v20 = (id *)location;
LABEL_23:
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "loggingConnection");
  v22 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "Unable to find writable graph cache directory", buf, 2u);
  }

  v19 = 0;
LABEL_26:
  objc_storeStrong(v20, v19);

  return (NSURL *)v19;
}

- (id)graphPersistenceParentDirectoryCandidateURLs
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pg_urlForGraphApplicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  return v3;
}

- (id)processSubdirectoryName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (CPAnalytics)analytics
{
  CPAnalytics *analytics;
  NSObject *loggingConnection;
  uint8_t v6[16];

  analytics = self->_analytics;
  if (!analytics)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "PGManager: analytics instance is nil.", v6, 2u);
      return self->_analytics;
    }
    analytics = 0;
  }
  return analytics;
}

- (void)setGraph:(id)a3
{
  PGGraph *v4;
  PGGraph *graph;
  PGGraph *v6;

  v4 = (PGGraph *)a3;
  -[PGManager _unloadGraph](self, "_unloadGraph");
  graph = self->_graph;
  self->_graph = v4;
  v6 = v4;

  -[PGGraph setGraphQueue:](self->_graph, "setGraphQueue:", self->_graphAccessQueue);
}

- (void)setMutableGraph:(id)a3
{
  PGGraph *v5;
  PGGraph *graph;
  PGGraph *v7;

  v5 = (PGGraph *)a3;
  -[PGManager _unloadGraph](self, "_unloadGraph");
  objc_storeStrong((id *)&self->_mutableGraph, a3);
  graph = self->_graph;
  self->_graph = v5;
  v7 = v5;

  -[PGGraph setGraphQueue:](self->_graph, "setGraphQueue:", self->_graphAccessQueue);
}

- (void)setGraphInfoDateOfLastIncrementalUpdateInvocationWithDate:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PGManager_setGraphInfoDateOfLastIncrementalUpdateInvocationWithDate_completionBlock___block_invoke;
  v10[3] = &unk_1E842BE88;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PGManager performAsynchronousGraphWriteUsingBlock:](self, "performAsynchronousGraphWriteUsingBlock:", v10);

}

- (double)timeIntervalSinceLastGraphFullRebuild
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0x7FEFFFFFFFFFFFFFLL;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PGManager_timeIntervalSinceLastGraphFullRebuild__block_invoke;
  v4[3] = &unk_1E84355C8;
  v4[4] = &v5;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)instantiateMutableGraphWithError:(id *)a3
{
  PGMutableGraph *v5;
  void *v6;

  v5 = self->_mutableGraph;
  if (!v5)
  {
    -[PGManager graphPersistentStoreURL](self, "graphPersistentStoreURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PGGraph initWithURL:persistenceOptions:error:]([PGMutableGraph alloc], "initWithURL:persistenceOptions:error:", v6, 32, a3);

  }
  return v5;
}

- (void)performAsynchronousGraphWriteUsingBlock:(id)a3
{
  id v4;
  unint64_t *p_numberOfCurrentGraphAccesses;
  unint64_t v6;
  NSObject *graphAccessQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  p_numberOfCurrentGraphAccesses = &self->_numberOfCurrentGraphAccesses;
  do
    v6 = __ldaxr(p_numberOfCurrentGraphAccesses);
  while (__stlxr(v6 + 1, p_numberOfCurrentGraphAccesses));
  graphAccessQueue = self->_graphAccessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PGManager_performAsynchronousGraphWriteUsingBlock___block_invoke;
  v9[3] = &unk_1E842BE60;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(graphAccessQueue, v9);

}

- (void)performSynchronousConcurrentGraphReadUsingBlock:(id)a3
{
  id v4;
  unint64_t *p_numberOfCurrentGraphAccesses;
  unint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  PGManager *v13;
  id v14;

  v4 = a3;
  p_numberOfCurrentGraphAccesses = &self->_numberOfCurrentGraphAccesses;
  do
    v6 = __ldaxr(p_numberOfCurrentGraphAccesses);
  while (__stlxr(v6 + 1, p_numberOfCurrentGraphAccesses));
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __61__PGManager_performSynchronousConcurrentGraphReadUsingBlock___block_invoke;
  v12 = &unk_1E842BE60;
  v13 = self;
  v7 = v4;
  v14 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(&v9);
  if (-[PGGraph isOnGraphQueue](self->_graph, "isOnGraphQueue", v9, v10, v11, v12, v13))
    v8[2](v8);
  else
    dispatch_sync((dispatch_queue_t)self->_graphAccessQueue, v8);

}

- (void)performAsynchronousGraphBarrierUsingBlock:(id)a3
{
  id v4;
  unint64_t *p_numberOfCurrentGraphAccesses;
  unint64_t v6;
  NSObject *graphAccessQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  p_numberOfCurrentGraphAccesses = &self->_numberOfCurrentGraphAccesses;
  do
    v6 = __ldaxr(p_numberOfCurrentGraphAccesses);
  while (__stlxr(v6 + 1, p_numberOfCurrentGraphAccesses));
  graphAccessQueue = self->_graphAccessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__PGManager_performAsynchronousGraphBarrierUsingBlock___block_invoke;
  v9[3] = &unk_1E842BE60;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_barrier_async(graphAccessQueue, v9);

}

- (void)legacyPerformAsynchronousBarrierGraphWriteUsingBlock:(id)a3
{
  id v4;
  unint64_t *p_numberOfCurrentGraphAccesses;
  unint64_t v6;
  NSObject *graphAccessQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  p_numberOfCurrentGraphAccesses = &self->_numberOfCurrentGraphAccesses;
  do
    v6 = __ldaxr(p_numberOfCurrentGraphAccesses);
  while (__stlxr(v6 + 1, p_numberOfCurrentGraphAccesses));
  graphAccessQueue = self->_graphAccessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PGManager_legacyPerformAsynchronousBarrierGraphWriteUsingBlock___block_invoke;
  v9[3] = &unk_1E842BE60;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_barrier_async(graphAccessQueue, v9);

}

- (BOOL)hasPendingGraphAccess
{
  unint64_t v2;

  v2 = atomic_load(&self->_numberOfCurrentGraphAccesses);
  return v2 != 0;
}

- (void)performAsynchronousNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *notificationQueue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PGManager_performAsynchronousNotification___block_invoke;
    block[3] = &unk_1E842D378;
    v8 = v4;
    dispatch_async(notificationQueue, block);

  }
}

- (void)_invalidateTransientCaches
{
  -[CLSLocationCache invalidateMemoryCaches](self->_locationCache, "invalidateMemoryCaches");
  -[CLSPOICache invalidateMemoryCaches](self->_poiCache, "invalidateMemoryCaches");
  -[CLSROICache invalidateMemoryCaches](self->_roiCache, "invalidateMemoryCaches");
  -[CLSAOICache invalidateMemoryCaches](self->_aoiCache, "invalidateMemoryCaches");
  -[CLSNatureCache invalidateMemoryCaches](self->_natureCache, "invalidateMemoryCaches");
  -[CLSServiceManager invalidateMomentaryMemoryCaches](self->_serviceManager, "invalidateMomentaryMemoryCaches");
  -[PGCurationManager invalidateMemoryCaches](self->_curationManager, "invalidateMemoryCaches");
  -[CLSPublicEventManager invalidateMemoryCaches](self->_publicEventManager, "invalidateMemoryCaches");
}

- (void)_invalidatePersistentCachesForGeoServiceProviderChange
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D71A98], "currentRevGeoProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CLSLocationCache invalidateCacheForGeoServiceProviderChangeToProvider:](self->_locationCache, "invalidateCacheForGeoServiceProviderChangeToProvider:", v3);
  -[CLSPOICache invalidateCacheForGeoServiceProviderChangeToProvider:](self->_poiCache, "invalidateCacheForGeoServiceProviderChangeToProvider:", v3);
  -[CLSROICache invalidateCacheForGeoServiceProviderChangeToProvider:](self->_roiCache, "invalidateCacheForGeoServiceProviderChangeToProvider:", v3);
  -[CLSAOICache invalidateCacheForGeoServiceProviderChangeToProvider:](self->_aoiCache, "invalidateCacheForGeoServiceProviderChangeToProvider:", v3);
  -[CLSNatureCache invalidateCacheForGeoServiceProviderChangeToProvider:](self->_natureCache, "invalidateCacheForGeoServiceProviderChangeToProvider:", v3);
  -[CLSServiceManager invalidatePermanentMemoryCaches](self->_serviceManager, "invalidatePermanentMemoryCaches");
  -[CLSPublicEventManager invalidateDiskCaches](self->_publicEventManager, "invalidateDiskCaches");
  -[PGCurationManager invalidateDiskCaches](self->_curationManager, "invalidateDiskCaches");

}

- (void)_invalidatePersistentCachesBeforeDateWithTimestamp:(double)a3
{
  -[CLSLocationCache invalidateCacheItemsBeforeDateWithTimestamp:](self->_locationCache, "invalidateCacheItemsBeforeDateWithTimestamp:");
  -[CLSPOICache invalidateCacheItemsBeforeDateWithTimestamp:](self->_poiCache, "invalidateCacheItemsBeforeDateWithTimestamp:", a3);
  -[CLSROICache invalidateCacheItemsBeforeDateWithTimestamp:](self->_roiCache, "invalidateCacheItemsBeforeDateWithTimestamp:", a3);
  -[CLSAOICache invalidateCacheItemsBeforeDateWithTimestamp:](self->_aoiCache, "invalidateCacheItemsBeforeDateWithTimestamp:", a3);
  -[CLSNatureCache invalidateCacheItemsBeforeDateWithTimestamp:](self->_natureCache, "invalidateCacheItemsBeforeDateWithTimestamp:", a3);
  -[CLSServiceManager invalidateMePerson](self->_serviceManager, "invalidateMePerson");
  -[CLSServiceManager invalidatePermanentMemoryCaches](self->_serviceManager, "invalidatePermanentMemoryCaches");
  -[CLSPublicEventManager invalidateCacheItemsBeforeDateWithTimestamp:](self->_publicEventManager, "invalidateCacheItemsBeforeDateWithTimestamp:", a3);
}

- (void)_invalidatePersistentCaches
{
  -[CLSLocationCache invalidateDiskCaches](self->_locationCache, "invalidateDiskCaches");
  -[CLSPOICache invalidateDiskCaches](self->_poiCache, "invalidateDiskCaches");
  -[CLSROICache invalidateDiskCaches](self->_roiCache, "invalidateDiskCaches");
  -[CLSAOICache invalidateDiskCaches](self->_aoiCache, "invalidateDiskCaches");
  -[CLSNatureCache invalidateDiskCaches](self->_natureCache, "invalidateDiskCaches");
  -[CLSServiceManager invalidatePermanentMemoryCaches](self->_serviceManager, "invalidatePermanentMemoryCaches");
  -[CLSPublicEventManager invalidateDiskCaches](self->_publicEventManager, "invalidateDiskCaches");
  -[PGCurationManager invalidateDiskCaches](self->_curationManager, "invalidateDiskCaches");
}

- (void)invalidateTransientCaches
{
  -[PGManager performAsynchronousGraphBarrierUsingBlock:](self, "performAsynchronousGraphBarrierUsingBlock:", &__block_literal_global_280_27989);
}

- (void)invalidatePersistentCaches
{
  -[PGManager performAsynchronousGraphBarrierUsingBlock:](self, "performAsynchronousGraphBarrierUsingBlock:", &__block_literal_global_281);
}

- (id)clsPersonByContactIdentifierWithPersonContactIdentifiers:(id)a3 progressBlock:(id)a4
{
  return (id)-[CLSServiceManager personsInContactStoreForContactIdentifiers:needsRefetching:progressBlock:](self->_serviceManager, "personsInContactStoreForContactIdentifiers:needsRefetching:progressBlock:", a3, 1, a4);
}

- (BOOL)homeWorkAddressesDidChangeForPersonInContact:(id)a3 andPersonNode:(id)a4 withHomeWorkNodesByPersonNode:(id)a5 graph:(id)a6
{
  id v9;
  id v10;
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
  BOOL v32;
  id v34;
  void *v36;
  void *v37;

  v9 = a3;
  v34 = a6;
  v10 = a5;
  objc_msgSend(a4, "collection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "targetsForSources:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphHomeWorkNode homeFilter](PGGraphHomeWorkNode, "homeFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nodesMatchingFilter:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  v36 = v13;
  objc_msgSend(v13, "addressNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphHomeWorkNode workFilter](PGGraphHomeWorkNode, "workFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nodesMatchingFilter:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v19, "addressNodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "locations");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "locationsByAddressTypes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1E84E3C98);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "locationsByAddressTypes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1E84E3CB0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = -[PGManager _addressesDidChangeBetweenAddressesInGraph:andAddressesInContacts:addressType:person:graph:](self, "_addressesDidChangeBetweenAddressesInGraph:andAddressesInContacts:addressType:person:graph:", v17, v27, 0, v9, v34)|| -[PGManager _addressesDidChangeBetweenAddressesInGraph:andAddressesInContacts:addressType:person:graph:](self, "_addressesDidChangeBetweenAddressesInGraph:andAddressesInContacts:addressType:person:graph:", v23, v31, 1, v9, v34);
  return v32;
}

- (BOOL)_addressesDidChangeBetweenAddressesInGraph:(id)a3 andAddressesInContacts:(id)a4 addressType:(unint64_t)a5 person:(id)a6 graph:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = objc_msgSend(v11, "count");
  v16 = objc_msgSend(v12, "count");
  if (v15 | v16)
  {
    if (!v15 || v16)
    {
      if (v15 || !v16)
      {
        v24 = 0;
        v25 = &v24;
        v26 = 0x2020000000;
        v27 = 0;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __104__PGManager__addressesDidChangeBetweenAddressesInGraph_andAddressesInContacts_addressType_person_graph___block_invoke;
        v20[3] = &unk_1E842BF10;
        v22 = &v24;
        v23 = 0x4062C00000000000;
        v21 = v11;
        objc_msgSend(v13, "enumerateAddressesOfType:asCLLocationsWithBlock:", a5, v20);
        v17 = v25[3] != 0;

        _Block_object_dispose(&v24, 8);
      }
      else
      {
        +[PGGraphAddressNodeCollection addressNodesWithinDistance:ofLocations:inGraph:](PGGraphAddressNodeCollection, "addressNodesWithinDistance:ofLocations:inGraph:", v12, v14, 150.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v18, "count") != 0;

      }
    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)isReady
{
  return -[PGManager _isReadyWithError:](self, "_isReadyWithError:", 0);
}

- (BOOL)_isReadyWithError:(id *)a3
{
  PGGraph *graph;
  void *v6;
  void *v7;

  graph = self->_graph;
  if (a3 && !graph)
  {
    -[PGManager graphPersistentStoreURL](self, "graphPersistentStoreURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && +[PGGraph graphExistsAtURL:](PGGraph, "graphExistsAtURL:", v6))
    {
      v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "graphClass")), "initWithURL:persistenceOptions:error:", v6, 4, a3);
      if (v7)
        -[PGManager graphIsUsable:error:](self, "graphIsUsable:error:", v7, a3);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 27);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return graph != 0;
}

- (BOOL)isBusy
{
  return -[PGManager hasPendingGraphAccess](self, "hasPendingGraphAccess") || self->_libraryAnalysisState == 1;
}

- (BOOL)requiresReadOnly
{
  return 0;
}

- (void)_waitGraphUntilFinishedUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PGManager__waitGraphUntilFinishedUsingBlock___block_invoke;
  v6[3] = &unk_1E842BF38;
  v7 = v4;
  v5 = v4;
  -[PGManager performAsynchronousGraphBarrierUsingBlock:](self, "performAsynchronousGraphBarrierUsingBlock:", v6);

}

- (void)_waitLibraryUpdateUntilFinishedUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PGManager__waitLibraryUpdateUntilFinishedUsingBlock___block_invoke;
  block[3] = &unk_1E842BE60;
  block[4] = self;
  v11 = v4;
  v6 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __55__PGManager__waitLibraryUpdateUntilFinishedUsingBlock___block_invoke_2;
  v8[3] = &unk_1E842BF38;
  v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v7 = v9;
  -[PGManager performAsynchronousGraphBarrierUsingBlock:](self, "performAsynchronousGraphBarrierUsingBlock:", v8);

}

- (void)waitUntilFinishedUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PGManager_waitUntilFinishedUsingBlock___block_invoke;
  v6[3] = &unk_1E842BE60;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PGManager _waitLibraryUpdateUntilFinishedUsingBlock:](self, "_waitLibraryUpdateUntilFinishedUsingBlock:", v6);

}

- (void)matchWithVisualFormat:(id)a3 elements:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PGManager_matchWithVisualFormat_elements_usingBlock___block_invoke;
  v14[3] = &unk_1E8436320;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v14);

}

- (void)matchWithVisualFormat:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__PGManager_matchWithVisualFormat_usingBlock___block_invoke;
  v10[3] = &unk_1E842BF60;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v10);

}

- (BOOL)saveGraphToURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__PGManager_saveGraphToURL___block_invoke;
  v7[3] = &unk_1E8435578;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)copyGraphToURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__PGManager_copyGraphToURL___block_invoke;
  v7[3] = &unk_1E8435578;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)stampFullGraphRebuild
{
  unint64_t *p_fullGraphRebuildStamp;
  unint64_t v3;

  p_fullGraphRebuildStamp = &self->_fullGraphRebuildStamp;
  do
    v3 = __ldaxr(p_fullGraphRebuildStamp);
  while (__stlxr(v3 + 1, p_fullGraphRebuildStamp));
}

- (unint64_t)currentFullGraphRebuildStamp
{
  return atomic_load(&self->_fullGraphRebuildStamp);
}

- (BOOL)canProceedWithFullGraphRebuildStamp:(unint64_t)a3
{
  unint64_t v3;

  v3 = atomic_load(&self->_fullGraphRebuildStamp);
  return v3 == a3;
}

- (id)assetFingerprintsWithVersion:(int64_t)a3 forAssets:(id)a4 withTransformers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a4;
  v11 = a5;
  if (-[PGManager isReady](self, "isReady"))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__27952;
    v31 = __Block_byref_object_dispose__27953;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__27952;
    v25 = __Block_byref_object_dispose__27953;
    v26 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__PGManager_assetFingerprintsWithVersion_forAssets_withTransformers_error___block_invoke;
    v15[3] = &unk_1E842C348;
    v18 = &v27;
    v20 = a3;
    v16 = v10;
    v17 = v11;
    v19 = &v21;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v15);
    v12 = (void *)v28[5];
    if (a6 && !v12)
    {
      *a6 = objc_retainAutorelease((id)v22[5]);
      v12 = (void *)v28[5];
    }
    v13 = v12;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

  }
  else
  {
    +[PGFingerprint assetFingerprintsWithVersion:forAssets:withGraph:withTransformers:error:](PGFingerprint, "assetFingerprintsWithVersion:forAssets:withGraph:withTransformers:error:", a3, v10, 0, v11, a6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)assetCollectionFingerprintsWithVersion:(int64_t)a3 forAssetCollections:(id)a4 withTransformers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a4;
  v11 = a5;
  if (-[PGManager isReady](self, "isReady"))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__27952;
    v31 = __Block_byref_object_dispose__27953;
    v32 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__27952;
    v25 = __Block_byref_object_dispose__27953;
    v26 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__PGManager_assetCollectionFingerprintsWithVersion_forAssetCollections_withTransformers_error___block_invoke;
    v15[3] = &unk_1E842C348;
    v18 = &v27;
    v20 = a3;
    v16 = v10;
    v17 = v11;
    v19 = &v21;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v15);
    v12 = (void *)v28[5];
    if (a6 && !v12)
    {
      *a6 = objc_retainAutorelease((id)v22[5]);
      v12 = (void *)v28[5];
    }
    v13 = v12;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

  }
  else
  {
    +[PGFingerprint assetCollectionFingerprintsWithVersion:forAssetCollections:withGraph:withTransformers:error:](PGFingerprint, "assetCollectionFingerprintsWithVersion:forAssetCollections:withGraph:withTransformers:error:", a3, v10, 0, v11, a6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (int64_t)validatePHObject:(id)a3 graphRelationsFeatureValidator:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a3;
  v9 = a4;
  if (-[PGManager isReady](self, "isReady"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__27952;
    v21 = __Block_byref_object_dispose__27953;
    v22 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__PGManager_validatePHObject_graphRelationsFeatureValidator_error___block_invoke;
    v12[3] = &unk_1E842BF88;
    v15 = &v23;
    v13 = v9;
    v14 = v8;
    v16 = &v17;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
    v10 = v24[3];
    if (a5 && !v10)
    {
      *a5 = objc_retainAutorelease((id)v18[5]);
      v10 = v24[3];
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v10 = objc_msgSend(v9, "isValidEntity:graph:error:", v8, 0, a5);
  }

  return v10;
}

- (int64_t)validatePHObject:(id)a3 featureAggregationValidator:(id)a4 assetFetchOptionPropertySet:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  int64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[PGManager isReady](self, "isReady"))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__27952;
    v25 = __Block_byref_object_dispose__27953;
    v26 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __92__PGManager_validatePHObject_featureAggregationValidator_assetFetchOptionPropertySet_error___block_invoke;
    v15[3] = &unk_1E842BFB0;
    v19 = &v27;
    v16 = v11;
    v17 = v10;
    v18 = v12;
    v20 = &v21;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v15);
    v13 = v28[3];
    if (a6 && !v13)
    {
      *a6 = objc_retainAutorelease((id)v22[5]);
      v13 = v28[3];
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v13 = objc_msgSend(v11, "isValidEntity:graph:assetFetchOptionPropertySet:error:", v10, 0, v12, a6);
  }

  return v13;
}

- (id)workingContext
{
  return -[PGManagerWorkingContext initWithManager:loggingConnection:]([PGManagerWorkingContext alloc], "initWithManager:loggingConnection:", self, self->_loggingConnection);
}

- (id)workingContextForMemories
{
  return -[PGManagerWorkingContext initWithManager:loggingConnection:]([PGManagerWorkingContext alloc], "initWithManager:loggingConnection:", self, self->_memoriesLoggingConnection);
}

- (id)workingContextForRelated
{
  return -[PGManagerWorkingContext initWithManager:loggingConnection:]([PGManagerWorkingContext alloc], "initWithManager:loggingConnection:", self, self->_relatedLoggingConnection);
}

- (id)workingContextForEnrichment
{
  return -[PGManagerWorkingContext initWithManager:loggingConnection:]([PGManagerWorkingContext alloc], "initWithManager:loggingConnection:", self, self->_enrichmentLoggingConnection);
}

- (id)workingContextForSuggestions
{
  return -[PGManagerWorkingContext initWithManager:loggingConnection:]([PGManagerWorkingContext alloc], "initWithManager:loggingConnection:", self, self->_suggestionsLoggingConnection);
}

- (id)workingContextForMetrics
{
  return -[PGManagerWorkingContext initWithManager:loggingConnection:]([PGManagerWorkingContext alloc], "initWithManager:loggingConnection:", self, self->_metricsLoggingConnection);
}

- (id)workingContextForUpNext
{
  return -[PGManagerWorkingContext initWithManager:loggingConnection:]([PGManagerWorkingContext alloc], "initWithManager:loggingConnection:", self, self->_upNextLoggingConnection);
}

- (id)workingContextForExternalRelevance
{
  return -[PGManagerWorkingContext initWithManager:loggingConnection:]([PGManagerWorkingContext alloc], "initWithManager:loggingConnection:", self, self->_externalRelevanceLoggingConnection);
}

- (id)workingContextForGraphConsistencyCheck
{
  return -[PGManagerWorkingContext initWithManager:loggingConnection:]([PGManagerWorkingContext alloc], "initWithManager:loggingConnection:", self, self->_graphConsistencyCheckLoggingConnection);
}

- (NSString)graphName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (OS_dispatch_queue)graphUpdateQueue
{
  return self->_graphUpdateQueue;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unint64_t)libraryAnalysisState
{
  return self->_libraryAnalysisState;
}

- (void)setLibraryAnalysisState:(unint64_t)a3
{
  self->_libraryAnalysisState = a3;
}

- (PGCurationManager)curationManager
{
  return self->_curationManager;
}

- (CLSServiceManager)serviceManager
{
  return self->_serviceManager;
}

- (NSURL)metadataSnapshotOutputPathURL
{
  return self->_metadataSnapshotOutputPathURL;
}

- (void)setMetadataSnapshotOutputPathURL:(id)a3
{
  objc_storeStrong((id *)&self->_metadataSnapshotOutputPathURL, a3);
}

- (BOOL)photoLibraryIsReadonly
{
  return self->_photoLibraryIsReadonly;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (OS_os_log)memoriesLoggingConnection
{
  return self->_memoriesLoggingConnection;
}

- (OS_os_log)relatedLoggingConnection
{
  return self->_relatedLoggingConnection;
}

- (OS_os_log)ingestLoggingConnection
{
  return self->_ingestLoggingConnection;
}

- (OS_os_log)graphLoggingConnection
{
  return self->_graphLoggingConnection;
}

- (OS_os_log)enrichmentLoggingConnection
{
  return self->_enrichmentLoggingConnection;
}

- (OS_os_log)guessWhoLoggingConnection
{
  return self->_guessWhoLoggingConnection;
}

- (OS_os_log)suggestionsLoggingConnection
{
  return self->_suggestionsLoggingConnection;
}

- (OS_os_log)metricsLoggingConnection
{
  return self->_metricsLoggingConnection;
}

- (OS_os_log)upNextLoggingConnection
{
  return self->_upNextLoggingConnection;
}

- (OS_os_log)externalRelevanceLoggingConnection
{
  return self->_externalRelevanceLoggingConnection;
}

- (OS_os_log)graphConsistencyCheckLoggingConnection
{
  return self->_graphConsistencyCheckLoggingConnection;
}

- (NSProgress)rebuildProgress
{
  return self->_rebuildProgress;
}

- (void)setRebuildProgress:(id)a3
{
  objc_storeStrong((id *)&self->_rebuildProgress, a3);
}

- (CLSLocationCache)locationCache
{
  return self->_locationCache;
}

- (CLSAOICache)aoiCache
{
  return self->_aoiCache;
}

- (CLSPOICache)poiCache
{
  return self->_poiCache;
}

- (CLSROICache)roiCache
{
  return self->_roiCache;
}

- (CLSNatureCache)natureCache
{
  return self->_natureCache;
}

- (CLSPublicEventManager)publicEventManager
{
  return self->_publicEventManager;
}

- (PGMusicBag)musicBag
{
  return self->_musicBag;
}

- (void)setMusicBag:(id)a3
{
  objc_storeStrong((id *)&self->_musicBag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicBag, 0);
  objc_storeStrong((id *)&self->_publicEventManager, 0);
  objc_storeStrong((id *)&self->_natureCache, 0);
  objc_storeStrong((id *)&self->_roiCache, 0);
  objc_storeStrong((id *)&self->_poiCache, 0);
  objc_storeStrong((id *)&self->_aoiCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_rebuildProgress, 0);
  objc_storeStrong((id *)&self->_graphConsistencyCheckLoggingConnection, 0);
  objc_storeStrong((id *)&self->_externalRelevanceLoggingConnection, 0);
  objc_storeStrong((id *)&self->_upNextLoggingConnection, 0);
  objc_storeStrong((id *)&self->_metricsLoggingConnection, 0);
  objc_storeStrong((id *)&self->_suggestionsLoggingConnection, 0);
  objc_storeStrong((id *)&self->_guessWhoLoggingConnection, 0);
  objc_storeStrong((id *)&self->_enrichmentLoggingConnection, 0);
  objc_storeStrong((id *)&self->_graphLoggingConnection, 0);
  objc_storeStrong((id *)&self->_ingestLoggingConnection, 0);
  objc_storeStrong((id *)&self->_relatedLoggingConnection, 0);
  objc_storeStrong((id *)&self->_memoriesLoggingConnection, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_metadataSnapshotOutputPathURL, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_coalescingGraphIsReady, 0);
  objc_storeStrong((id *)&self->_graphName, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_graphUpdateQueue, 0);
  objc_storeStrong((id *)&self->_graphAccessQueue, 0);
  objc_storeStrong((id *)&self->_mutableGraph, 0);
  objc_storeStrong((id *)&self->_musicCache, 0);
  objc_storeStrong((id *)&self->_cachedGraphPersistentStoreURL, 0);
  objc_storeStrong((id *)&self->_cachedGraphPersistenceParentDirectoryURL, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __92__PGManager_validatePHObject_featureAggregationValidator_assetFetchOptionPropertySet_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id obj;

  v3 = (void *)a1[4];
  v4 = a1[5];
  objc_msgSend(a2, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[6];
  v7 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v3, "isValidEntity:graph:assetFetchOptionPropertySet:error:", v4, v5, v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v8;

}

void __67__PGManager_validatePHObject_graphRelationsFeatureValidator_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id obj;

  v3 = (void *)a1[4];
  v4 = a1[5];
  objc_msgSend(a2, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v3, "isValidEntity:graph:error:", v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v7;

}

void __95__PGManager_assetCollectionFingerprintsWithVersion_forAssetCollections_withTransformers_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v3 = a1[8];
  v4 = a1[4];
  objc_msgSend(a2, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[5];
  v7 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v7 + 40);
  +[PGFingerprint assetCollectionFingerprintsWithVersion:forAssetCollections:withGraph:withTransformers:error:](PGFingerprint, "assetCollectionFingerprintsWithVersion:forAssetCollections:withGraph:withTransformers:error:", v3, v4, v5, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __75__PGManager_assetFingerprintsWithVersion_forAssets_withTransformers_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v3 = a1[8];
  v4 = a1[4];
  objc_msgSend(a2, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[5];
  v7 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v7 + 40);
  +[PGFingerprint assetFingerprintsWithVersion:forAssets:withGraph:withTransformers:error:](PGFingerprint, "assetFingerprintsWithVersion:forAssets:withGraph:withTransformers:error:", v3, v4, v5, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __28__PGManager_copyGraphToURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  v5 = objc_msgSend(v3, "copyPersistentStoreToURL:error:", v4, &v10);
  v6 = v10;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v7 = 1;
  else
    v7 = v6 == 0;
  if (!v7)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "requested graph copy failed: %@", buf, 0xCu);
    }

  }
}

void __28__PGManager_saveGraphToURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "graph");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "saveToURL:", *(_QWORD *)(a1 + 32));

}

void __46__PGManager_matchWithVisualFormat_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  id obj;
  id obja;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
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
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _BYTE v79[128];
  void *v80;
  _BYTE v81[128];
  _QWORD v82[2];
  _QWORD v83[2];
  _BYTE v84[128];
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = a1;
  v4 = *(_QWORD *)(a1 + 32);
  v76 = 0;
  objc_msgSend(v3, "matchWithVisualFormat:elements:error:", v4, MEMORY[0x1E0C9AA70], &v76);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v76;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v5;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v5, "nodesNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
  if (v52)
  {
    v50 = *(_QWORD *)v73;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v73 != v50)
          objc_enumerationMutation(obj);
        v54 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v6);
        v56 = v6;
        objc_msgSend(v59, "nodesForName:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sortedArrayUsingDescriptors:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v69;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v69 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v16);
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "identifier"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("identifier"));

              objc_msgSend(v17, "label");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("label"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v17, "domain"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("domain"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "inEdgesCount"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("inEdgesCount"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "outEdgesCount"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("outEdgesCount"));

              objc_msgSend(v17, "propertyDictionary");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("properties"));

              objc_msgSend(v11, "addObject:", v18);
              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
          }
          while (v14);
        }

        v82[0] = CFSTR("count");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v82[1] = CFSTR("nodes");
        v83[0] = v25;
        v83[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v26, v54);

        v6 = v56 + 1;
      }
      while (v56 + 1 != v52);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
    }
    while (v52);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v59, "edgesNames");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
  if (v53)
  {
    v51 = *(_QWORD *)v65;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v65 != v51)
          objc_enumerationMutation(obja);
        v55 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v27);
        v57 = v27;
        objc_msgSend(v59, "edgesForName:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sortedArrayUsingDescriptors:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v31, "count"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v33 = v31;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v61;
          do
          {
            v37 = 0;
            do
            {
              if (*(_QWORD *)v61 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v37);
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v38, "identifier"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, CFSTR("identifier"));

              objc_msgSend(v38, "label");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v41, CFSTR("label"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v38, "domain"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v42, CFSTR("domain"));

              objc_msgSend(v38, "propertyDictionary");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v43, CFSTR("properties"));

              objc_msgSend(v32, "addObject:", v39);
              ++v37;
            }
            while (v35 != v37);
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
          }
          while (v35);
        }

        v77[0] = CFSTR("count");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v77[1] = CFSTR("edges");
        v78[0] = v44;
        v78[1] = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v45, v55);

        v27 = v57 + 1;
      }
      while (v57 + 1 != v53);
      v53 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
    }
    while (v53);
  }

  (*(void (**)(void))(*(_QWORD *)(v47 + 40) + 16))();
}

void __55__PGManager_matchWithVisualFormat_elements_usingBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = a1[5];
  v8 = 0;
  objc_msgSend(v3, "matchWithVisualFormat:elements:error:", v4, v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  (*(void (**)(void))(a1[6] + 16))();
}

void __41__PGManager_waitUntilFinishedUsingBlock___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__PGManager_waitUntilFinishedUsingBlock___block_invoke_2;
  v2[3] = &unk_1E842D378;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_waitGraphUntilFinishedUsingBlock:", v2);

}

uint64_t __41__PGManager_waitUntilFinishedUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__PGManager__waitLibraryUpdateUntilFinishedUsingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_waitGraphUntilFinishedUsingBlock:", *(_QWORD *)(a1 + 40));
}

void __55__PGManager__waitLibraryUpdateUntilFinishedUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  dispatch_async(*(dispatch_queue_t *)(a2 + 72), *(dispatch_block_t *)(a1 + 32));
}

void __47__PGManager__waitGraphUntilFinishedUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__PGManager__waitGraphUntilFinishedUsingBlock___block_invoke_2;
  v3[3] = &unk_1E842D378;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "performAsynchronousNotification:", v3);

}

uint64_t __47__PGManager__waitGraphUntilFinishedUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104__PGManager__addressesDidChangeBetweenAddressesInGraph_andAddressesInContacts_addressType_person_graph___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "coordinate");
  v6 = v5;
  v8 = v7;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = *(id *)(a1 + 32);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "coordinate", (_QWORD)v16);
        if (+[PGLocationUtility coordinate:isCloseToCoordinate:threshold:](PGLocationUtility, "coordinate:isCloseToCoordinate:threshold:", v6, v8, v14, v15, *(double *)(a1 + 48)))
        {

          return;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *a3 = 1;
}

void __39__PGManager_invalidatePersistentCaches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "_invalidatePersistentCaches");
  objc_msgSend(v4, "invalidateMemoryCaches");

  objc_msgSend(v5, "_invalidateTransientCaches");
}

void __38__PGManager_invalidateTransientCaches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(a3, "invalidateMemoryCaches");
  objc_msgSend(v4, "_invalidateTransientCaches");

}

uint64_t __45__PGManager_performAsynchronousNotification___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__PGManager_legacyPerformAsynchronousBarrierGraphWriteUsingBlock___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 184));
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 184);
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Perform Graph Transaction Barrier", ", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 64);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 - 1, v5));
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 184);
  v8 = v7;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_END, v2, "Perform Graph Transaction Barrier", ", v9, 2u);
  }

}

void __55__PGManager_performAsynchronousGraphBarrierUsingBlock___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 184));
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 184);
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Perform Graph Barrier", ", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(MEMORY[0x1E0D42990], "drainBitsetPool");
  v5 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 64);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 - 1, v5));
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 184);
  v8 = v7;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_END, v2, "Perform Graph Barrier", ", v9, 2u);
  }

}

void __61__PGManager_performSynchronousConcurrentGraphReadUsingBlock___block_invoke(uint64_t a1)
{
  id v2;
  unint64_t *v3;
  unint64_t v4;
  PGGraphEnabler *v5;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v2, "enableInTransactionCheck");
  objc_msgSend(v2, "enterBatch");
  v5 = -[PGGraphEnabler initWithGraph:]([PGGraphEnabler alloc], "initWithGraph:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v2, "leaveBatch");
  objc_msgSend(MEMORY[0x1E0D42990], "drainBitsetPool");
  v3 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 64);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 - 1, v3));

}

void __53__PGManager_performAsynchronousGraphWriteUsingBlock___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = os_signpost_id_generate(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 184));
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 184);
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Perform Graph Transaction", ", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(MEMORY[0x1E0D42990], "drainBitsetPool");
  v5 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 64);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 - 1, v5));
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 184);
  v8 = v7;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_END, v2, "Perform Graph Transaction", ", v9, 2u);
  }

}

void __50__PGManager_timeIntervalSinceLastGraphFullRebuild__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a2, "graph");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "infoNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;

  }
}

void __87__PGManager_setGraphInfoDateOfLastIncrementalUpdateInvocationWithDate_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = (void *)a1[4];
  v5 = 0;
  objc_msgSend(v2, "instantiateMutableGraphWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  if (v3)
  {
    objc_msgSend(v3, "enableInTransactionCheck");
    objc_msgSend(v3, "enterBatch");
    +[PGGraphBuilder setLastIncrementalUpdateInvocationDate:inGraph:](PGGraphBuilder, "setLastIncrementalUpdateInvocationDate:inGraph:", a1[5], v3);
    objc_msgSend(v3, "leaveBatch");
  }
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __54__PGManager_commonInitWithPhotoLibrary_progressBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadGraphWithProgressBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __24__PGManager_unloadGraph__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unloadGraph");
}

+ (void)initialize
{
  if (initialize_onceToken_28132 != -1)
    dispatch_once(&initialize_onceToken_28132, &__block_literal_global_28133);
}

+ (id)graphServicesURLWithPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  id v22;
  char v23;
  id v24;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("photoanalysisd")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("LifeCipher"))
    || (objc_msgSend(v3, "urlForApplicationDataFolderIdentifier:", 1),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v24 = 0;
    objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v24;
    if (!v8)
    {
      v6 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v8, "URLByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v3, "databaseUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v6, "URLByAppendingPathComponent:", v12);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
    }
    v23 = 0;
    objc_msgSend(v6, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v15, &v23);

    if ((v16 & 1) != 0)
    {
      v17 = v9;
      if (v23)
      {
        v17 = v9;
LABEL_16:
        v9 = v17;
LABEL_17:

        if (!v6)
        {
          v19 = (void *)MEMORY[0x1E0C99E98];
          NSTemporaryDirectory();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "fileURLWithPath:isDirectory:", v20, 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_19;
      }
    }
    else
    {
      v22 = v9;
      v18 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v22);
      v17 = v22;

      if ((v18 & 1) != 0)
        goto LABEL_16;
    }

    v6 = 0;
    goto LABEL_16;
  }
LABEL_19:

  return v6;
}

+ (BOOL)geoServiceProviderDidChangeForGraph:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "infoNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geoServiceProviderID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D71A98], "currentRevGeoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5) ^ 1;

  return v6;
}

+ (Class)graphClass
{
  return (Class)objc_opt_class();
}

+ (id)stringFromPGDuration:(unint64_t)a3
{
  if (a3 > 0x17)
    return CFSTR("invalid");
  else
    return off_1E842BFD0[a3];
}

+ (BOOL)photosChallengeIsEnabled
{
  return +[PGUserDefaults isPhotosChallengeEnabled](PGUserDefaults, "isPhotosChallengeEnabled");
}

- (id)titleTupleForPersonLocalIdentifiers:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  const __CFString *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = v8;
  if (!a4)
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = CFSTR("Undefined format");
      goto LABEL_11;
    }
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = CFSTR("No person identifiers given. Need at least one person identifier.");
LABEL_11:
      objc_msgSend(v13, "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -101, v14);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__28758;
  v32 = __Block_byref_object_dispose__28759;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__28758;
  v26 = __Block_byref_object_dispose__28759;
  v27 = 0;
  -[PGManager serviceManager](self, "serviceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PGManager_TitleSupport__titleTupleForPersonLocalIdentifiers_format_error___block_invoke;
  v16[3] = &unk_1E842C348;
  v17 = v9;
  v19 = &v22;
  v11 = v10;
  v20 = &v28;
  v21 = a4;
  v18 = v11;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
  if (a5)
    *a5 = objc_retainAutorelease((id)v23[5]);
  v12 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

LABEL_13:
  return v12;
}

- (id)titleTupleForMomentList:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  PGTitleTuple *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v10 = objc_msgSend(v8, "collectionListType");
    v11 = objc_msgSend(v9, "collectionListSubtype");
    if (v10 != 1)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "localIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Unsupported collection list type \"%lu\" for collection list \"%@\"."), v10, v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v15;
        goto LABEL_10;
      }
LABEL_11:

      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -101, v15);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_14;
    }
    v12 = v11;
    if ((unint64_t)(v11 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Unsupported collection list sub type \"%lu\" for collection list \"%@\"."), v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v15;
LABEL_10:
        _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    -[PGManager photoLibrary](self, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "librarySpecificFetchOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSortDescriptors:", v23);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsInMomentList:options:", v9, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v24;
    objc_msgSend(v24, "lastObject");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v25 && v26)
    {
      objc_msgSend(v25, "cls_localStartDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "cls_localEndDate");
      v29 = objc_claimAutoreleasedReturnValue();
      v62 = v27;
      if (v12 == 2)
      {
        v30 = objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v28);
        if (v30 == objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v29)
          || (unint64_t)objc_msgSend(v65, "count") < 3)
        {
          v27 = v62;
        }
        else
        {
          v59 = v21;
          v31 = (void *)v29;
          v60 = v25;
          v32 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v28);
          v33 = objc_msgSend(MEMORY[0x1E0D4B130], "dayFromDate:", v28);
          v63 = objc_msgSend(v65, "count");
          v34 = v63 - 2;
          v35 = 2;
          while (v32 == 12 && v33 == 31)
          {
            objc_msgSend(v65, "objectAtIndex:", v35 - 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "cls_localEndDate");
            v37 = objc_claimAutoreleasedReturnValue();

            v32 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v37);
            v33 = objc_msgSend(MEMORY[0x1E0D4B130], "dayFromDate:", v37);

            ++v35;
            v28 = (void *)v37;
            if (v63 == v35)
              goto LABEL_33;
          }
          v37 = (uint64_t)v28;
LABEL_33:
          v43 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v31);
          v44 = objc_msgSend(MEMORY[0x1E0D4B130], "dayFromDate:", v31);
          while (v43 == 1 && v44 == 1)
          {
            objc_msgSend(v65, "objectAtIndex:", v34);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "cls_localStartDate");
            v46 = objc_claimAutoreleasedReturnValue();

            v43 = objc_msgSend(MEMORY[0x1E0D4B130], "monthFromDate:", v46);
            v44 = objc_msgSend(MEMORY[0x1E0D4B130], "dayFromDate:", v46);
            --v34;

            v31 = (void *)v46;
            if (!v34)
            {
              v29 = v46;
              v28 = (void *)v37;
              v21 = v59;
              v25 = v60;
              v27 = v62;
              goto LABEL_39;
            }
          }
          v28 = (void *)v37;
          v21 = v59;
          v25 = v60;
          v27 = v62;
          v29 = (uint64_t)v31;
LABEL_39:
          v12 = 2;
        }
      }
      +[PGTimeUtility dateIntervalWithStartDate:endDate:](PGTimeUtility, "dateIntervalWithStartDate:endDate:", v28, v29);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (void *)v29;
      if (v12 == 2)
      {
        v48 = v21;
        +[PGTimeTitleUtility timeTitleWithDateInterval:allowedFormats:](PGTimeTitleUtility, "timeTitleWithDateInterval:allowedFormats:", v47, 4);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v49, 5);
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = a4 == 3;
        if (a4 == 3)
          v52 = 0;
        else
          v52 = (void *)v50;
        if (v51)
          v53 = (void *)v50;
        else
          v53 = 0;
      }
      else
      {
        objc_msgSend(v9, "localizedTitle");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v54;
        if (a4 != 2 && v54 && objc_msgSend(v54, "length"))
        {
          v48 = v21;
          if (a4 == 3)
          {
            v52 = 0;
          }
          else
          {
            +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v49, 4);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
          }
          +[PGTimeTitleUtility timeTitleWithDateInterval:allowedFormats:](PGTimeTitleUtility, "timeTitleWithDateInterval:allowedFormats:", v47, 7);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v55, 5);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v61 = v25;
          v48 = v21;
          +[PGTimeTitleUtility splitTimeTitleWithDateInterval:allowedFormats:](PGTimeTitleUtility, "splitTimeTitleWithDateInterval:allowedFormats:", v47, 7);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "firstObject");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v56, 5);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v55, "count") < 2)
          {
            v53 = 0;
          }
          else
          {
            objc_msgSend(v55, "objectAtIndexedSubscript:", 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v57, 5);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v25 = v61;
        }
        v27 = v62;

      }
      v17 = -[PGTitleTuple initWithWithTitle:subtitle:]([PGTitleTuple alloc], "initWithWithTitle:subtitle:", v52, v53);

      v21 = v48;
    }
    else
    {
      v38 = (void *)v26;
      v39 = v25;
      v40 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "localIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("Missing moments in collection list \"%@\"."), v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v28;
        _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -101, v28);
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      v25 = v39;
      v27 = v38;
    }

  }
  else
  {
    if (!a5)
    {
LABEL_14:
      v17 = 0;
      goto LABEL_61;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -101, CFSTR("Undefined format"));
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_61:

  return v17;
}

- (id)titleTupleForAssetCollection:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(v8, "assetCollectionType");
  if (v9 == 3)
  {
    -[PGManager titleTupleForMoment:format:error:](self, "titleTupleForMoment:format:error:", v8, a4, a5);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v10;
    goto LABEL_11;
  }
  v11 = v9;
  if ((unint64_t)(v9 - 1) <= 1)
  {
    -[PGManager titleTupleForAlbum:format:error:](self, "titleTupleForAlbum:format:error:", v8, a4, a5);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "localIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Unsupported asset collection type \"%lu\" for asset collection \"%@\"), v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v15;
    _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -101, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v12 = 0;
LABEL_11:

  return v12;
}

- (id)titleTupleForMoment:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  PGManager *v14;
  uint64_t *v15;
  uint64_t *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__28758;
    v28 = __Block_byref_object_dispose__28759;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__28758;
    v22 = __Block_byref_object_dispose__28759;
    v23 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__PGManager_TitleSupport__titleTupleForMoment_format_error___block_invoke;
    v12[3] = &unk_1E842C348;
    v13 = v8;
    v14 = self;
    v16 = &v18;
    v17 = a4;
    v15 = &v24;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
    if (a5)
      *a5 = objc_retainAutorelease((id)v19[5]);
    v10 = (id)v25[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -101, CFSTR("Undefined format"));
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)titleTupleForAlbum:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  PGTitleTuple *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4)
  {
    -[PGManager photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortDescriptors:", v12);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v8, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localCreationDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v14 == v15)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v15, "localCreationDate");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v37 = v18;
      +[PGTimeUtility dateIntervalWithStartDate:endDate:](PGTimeUtility, "dateIntervalWithStartDate:endDate:", v17, v18);
      v22 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v22;
      if (a4 == 2)
        goto LABEL_15;
      objc_msgSend(v8, "localizedTitle");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_15;
      v24 = (void *)v23;
      objc_msgSend(v8, "localizedTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      v22 = (uint64_t)v38;
      if (v26)
      {
        if (a4 == 3)
        {
          v27 = 0;
        }
        else
        {
          objc_msgSend(v8, "localizedTitle");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v35, 4);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        +[PGTimeTitleUtility timeTitleWithDateInterval:allowedFormats:](PGTimeTitleUtility, "timeTitleWithDateInterval:allowedFormats:", v38, 7);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v30, 5);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_15:
        v36 = v14;
        v28 = v17;
        v29 = v15;
        +[PGTimeTitleUtility splitTimeTitleWithDateInterval:allowedFormats:](PGTimeTitleUtility, "splitTimeTitleWithDateInterval:allowedFormats:", v22, 7);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v31, 5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v30, "count") < 2)
        {
          v33 = 0;
        }
        else
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v32, 5);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v15 = v29;
        v17 = v28;
        v14 = v36;
      }

      v19 = -[PGTitleTuple initWithWithTitle:subtitle:]([PGTitleTuple alloc], "initWithWithTitle:subtitle:", v27, v33);
    }
    else
    {
      if (!a5)
      {
        v19 = 0;
        goto LABEL_21;
      }
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "localIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Cannot create title from asset collection \"%@\" with no assets."), v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -101, v14);
      v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_21:
    goto LABEL_22;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -101, CFSTR("Undefined format"));
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_22:

  return v19;
}

void __60__PGManager_TitleSupport__titleTupleForMoment_format_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PGTimeTitleOptions *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PGTitleTuple *v25;
  uint64_t v26;
  void *v27;
  id obj;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (*(_QWORD *)(a1 + 64) == 2)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v16, "length") == 0;

      }
      else
      {
        v5 = 1;
      }

    }
    v17 = objc_alloc_init(PGTimeTitleOptions);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTimeTitleOptions setMomentNodes:](v17, "setMomentNodes:", v18);

    if (v5)
    {
      +[PGTimeTitleUtility splitTimeTitleWithOptions:](PGTimeTitleUtility, "splitTimeTitleWithOptions:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v20, 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v19, "count") < 2)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v22, 5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (*(_QWORD *)(a1 + 64) == 3)
      {
        v21 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v24, 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v19, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v25 = -[PGTitleTuple initWithWithTitle:subtitle:]([PGTitleTuple alloc], "initWithWithTitle:subtitle:", v21, v23);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "graphLoggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v7;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "Cannot find node for moment \"%@\". Generating without graph access.", buf, 0xCu);

    }
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v11 + 40);
    objc_msgSend(v8, "titleTupleForAlbum:format:error:", v9, v10, &obj);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v11 + 40), obj);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

void __76__PGManager_TitleSupport__titleTupleForPersonLocalIdentifiers_format_error___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  PGPeopleMemoryTitleGenerator *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  PGPeopleMemoryTitleGenerator *v16;
  void *v17;
  void *v18;
  PGTitleGenerationContext *v19;
  void *v20;
  PGTitleGenerationContext *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  PGTitleTuple *v27;
  uint64_t v28;
  void *v29;
  id v30;

  v3 = a2;
  v4 = a1[4];
  v30 = v3;
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Information Mismatch. Cannot find people for person id's %@."), a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -102, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(PGPeopleMemoryTitleGenerator **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    objc_msgSend(v30, "graph");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "momentNodesForPersonNodes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEmpty"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Information Mismatch. Cannot find moments for people nodes with id's %@."), a1[4]);
      v10 = (PGPeopleMemoryTitleGenerator *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:localizedDescription:", CFSTR("PGErrorDomain"), -102, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;
    }
    else
    {
      v15 = 2 * ((unint64_t)objc_msgSend((id)a1[4], "count") > 1);
      v16 = [PGPeopleMemoryTitleGenerator alloc];
      objc_msgSend(v7, "temporarySet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "temporarySet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = [PGTitleGenerationContext alloc];
      objc_msgSend(v30, "graph");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[PGTitleGenerationContext initWithGraph:serviceManager:](v19, "initWithGraph:serviceManager:", v20, a1[5]);
      v10 = -[PGPeopleMemoryTitleGenerator initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:](v16, "initWithMomentNodes:personNodes:timeTitleOptions:type:titleGenerationContext:", v17, v18, 0, v15, v21);

      -[PGTitleGenerator subtitle](v10, "subtitle");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = a1[8];
      if (v24 == 2)
      {
        v25 = 0;
        v14 = (void *)v22;
      }
      else
      {
        if (v24 == 3)
        {
          v14 = 0;
        }
        else
        {
          -[PGTitleGenerator title](v10, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v25 = v23;
      }
      v26 = v23;
      v27 = -[PGTitleTuple initWithWithTitle:subtitle:]([PGTitleTuple alloc], "initWithWithTitle:subtitle:", v14, v25);

      v28 = *(_QWORD *)(a1[7] + 8);
      v29 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v27;

    }
  }

}

- (id)newSearchComputationCache
{
  void *v3;
  PGSearchComputationCache *v4;
  void *v5;
  PGSearchComputationCache *v6;

  +[PGSearchComputationCache persistentStoreURLWithManager:](PGSearchComputationCache, "persistentStoreURLWithManager:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PGSearchComputationCache alloc];
  -[PGManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGSearchComputationCache initWithPersistentStoreURL:photoLibrary:](v4, "initWithPersistentStoreURL:photoLibrary:", v3, v5);

  return v6;
}

- (id)zeroKeywordsWithOptions:(id)a3 progressReporter:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__29702;
  v32 = __Block_byref_object_dispose__29703;
  v33 = 0;
  v8 = -[PGManager newSearchComputationCache](self, "newSearchComputationCache");
  -[PGManager photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager curationManager](self, "curationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __62__PGManager_Search__zeroKeywordsWithOptions_progressReporter___block_invoke;
  v21 = &unk_1E84356E0;
  v11 = v9;
  v22 = v11;
  v12 = v10;
  v23 = v12;
  v13 = v8;
  v24 = v13;
  v27 = &v28;
  v14 = v6;
  v25 = v14;
  v15 = v7;
  v26 = v15;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", &v18);
  objc_msgSend(v13, "save", v18, v19, v20, v21);
  v16 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v16;
}

- (id)searchMetadataWithOptions:(id)a3 progressReporter:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isCancelledWithProgress:", 0.0) & 1) != 0)
  {
    v8 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__29702;
    v19 = __Block_byref_object_dispose__29703;
    v20 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__PGManager_Search__searchMetadataWithOptions_progressReporter___block_invoke;
    v11[3] = &unk_1E842DCB8;
    v9 = v7;
    v12 = v9;
    v14 = &v15;
    v13 = v6;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v11);
    if ((objc_msgSend(v9, "isCancelled") & 1) != 0 || (objc_msgSend(v9, "isCancelledWithProgress:", 1.0) & 1) != 0)
      v8 = (id)MEMORY[0x1E0C9AA70];
    else
      v8 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }

  return v8;
}

- (id)searchKeywordsByEventWithUUIDs:(id)a3 ofType:(unint64_t)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  PGManager *v22;
  id v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__29702;
  v30 = __Block_byref_object_dispose__29703;
  v31 = 0;
  v10 = -[PGManager newSearchComputationCache](self, "newSearchComputationCache");
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __76__PGManager_Search__searchKeywordsByEventWithUUIDs_ofType_progressReporter___block_invoke;
  v19 = &unk_1E842C7E8;
  v11 = v10;
  v20 = v11;
  v24 = &v26;
  v12 = v8;
  v25 = a4;
  v21 = v12;
  v22 = self;
  v13 = v9;
  v23 = v13;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", &v16);
  objc_msgSend(v11, "save", v16, v17, v18, v19);
  v14 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v14;
}

- (id)assetSearchKeywordsByMomentUUIDWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__29702;
  v26 = __Block_byref_object_dispose__29703;
  v27 = 0;
  v10 = -[PGManager newSearchComputationCache](self, "newSearchComputationCache");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__PGManager_Search__assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_progressReporter___block_invoke;
  v16[3] = &unk_1E842C810;
  v11 = v10;
  v17 = v11;
  v20 = &v22;
  v12 = v8;
  v18 = v12;
  v21 = a4;
  v13 = v9;
  v19 = v13;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
  objc_msgSend(v11, "save");
  v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (id)searchableAssetUUIDsBySocialGroupWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 isFullAnalysis:(BOOL)a5 progressReporter:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  PGManager *v21;
  id v22;
  uint64_t *v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__29702;
  v30 = __Block_byref_object_dispose__29703;
  v31 = 0;
  v12 = -[PGManager newSearchComputationCache](self, "newSearchComputationCache");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __108__PGManager_Search__searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_isFullAnalysis_progressReporter___block_invoke;
  v18[3] = &unk_1E842C838;
  v13 = v12;
  v19 = v13;
  v23 = &v26;
  v14 = v10;
  v24 = a4;
  v20 = v14;
  v21 = self;
  v25 = a5;
  v15 = v11;
  v22 = v15;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v18);
  objc_msgSend(v13, "save");
  v16 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (id)searchSynonymsDictionariesWithProgressReporter:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  if ((objc_msgSend(v4, "isCancelledWithProgress:", 0.0) & 1) != 0)
  {
    v5 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__29702;
    v18 = __Block_byref_object_dispose__29703;
    v19 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __68__PGManager_Search__searchSynonymsDictionariesWithProgressReporter___block_invoke;
    v11 = &unk_1E8435578;
    v6 = v4;
    v12 = v6;
    v13 = &v14;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", &v8);
    if ((objc_msgSend(v6, "isCancelled", v8, v9, v10, v11) & 1) != 0
      || (objc_msgSend(v6, "isCancelledWithProgress:", 1.0) & 1) != 0)
    {
      v5 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v5 = (id)v15[5];
    }

    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

void __68__PGManager_Search__searchSynonymsDictionariesWithProgressReporter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.1) & 1) == 0)
  {
    objc_msgSend(v7, "graph");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphSynonymSupportHelper synonymsByIndexCategoryMaskForGraph:](PGGraphSynonymSupportHelper, "synonymsByIndexCategoryMaskForGraph:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __108__PGManager_Search__searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_isFullAnalysis_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PGSearchKeywordComputer *v4;
  void *v5;
  PGSearchKeywordComputer *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = [PGSearchKeywordComputer alloc];
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PGSearchKeywordComputer initWithGraph:searchComputationCache:](v4, "initWithGraph:searchComputationCache:", v5, *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned __int8 *)(a1 + 80);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __108__PGManager_Search__searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_isFullAnalysis_progressReporter___block_invoke_2;
  v14[3] = &unk_1E842C7C0;
  v15 = *(id *)(a1 + 56);
  -[PGSearchKeywordComputer searchableAssetUUIDsBySocialGroupWithEventUUIDs:ofType:inPhotoLibrary:isFullAnalysis:progressBlock:](v6, "searchableAssetUUIDsBySocialGroupWithEventUUIDs:ofType:inPhotoLibrary:isFullAnalysis:progressBlock:", v8, v7, v9, v10, v14);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

uint64_t __108__PGManager_Search__searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_isFullAnalysis_progressReporter___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

void __91__PGManager_Search__assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PGSearchKeywordComputer *v4;
  void *v5;
  PGSearchKeywordComputer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = [PGSearchKeywordComputer alloc];
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PGSearchKeywordComputer initWithGraph:searchComputationCache:](v4, "initWithGraph:searchComputationCache:", v5, *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 64);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__PGManager_Search__assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_progressReporter___block_invoke_2;
  v12[3] = &unk_1E842C7C0;
  v8 = *(_QWORD *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  -[PGSearchKeywordComputer assetSearchKeywordsByMomentUUIDWithEventUUIDs:ofType:progressBlock:](v6, "assetSearchKeywordsByMomentUUIDWithEventUUIDs:ofType:progressBlock:", v8, v7, v12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __91__PGManager_Search__assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_progressReporter___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

void __76__PGManager_Search__searchKeywordsByEventWithUUIDs_ofType_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PGSearchKeywordComputer *v4;
  void *v5;
  PGSearchKeywordComputer *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = [PGSearchKeywordComputer alloc];
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PGSearchKeywordComputer initWithGraph:searchComputationCache:](v4, "initWithGraph:searchComputationCache:", v5, *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__PGManager_Search__searchKeywordsByEventWithUUIDs_ofType_progressReporter___block_invoke_2;
  v13[3] = &unk_1E842C7C0;
  v14 = *(id *)(a1 + 56);
  -[PGSearchKeywordComputer searchKeywordsByEventWithEventUUIDs:ofType:photoLibrary:progressBlock:](v6, "searchKeywordsByEventWithEventUUIDs:ofType:photoLibrary:progressBlock:", v8, v7, v9, v13);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

uint64_t __76__PGManager_Search__searchKeywordsByEventWithUUIDs_ofType_progressReporter___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

void __64__PGManager_Search__searchMetadataWithOptions_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  PGSearchMetadataComputer *v3;
  void *v4;
  PGSearchMetadataComputer *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.1) & 1) == 0)
  {
    v3 = [PGSearchMetadataComputer alloc];
    objc_msgSend(v9, "graph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PGSearchMetadataComputer initWithGraph:](v3, "initWithGraph:", v4);

    -[PGSearchMetadataComputer searchMetadataWithOptions:](v5, "searchMetadataWithOptions:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __62__PGManager_Search__zeroKeywordsWithOptions_progressReporter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PGZeroKeywordComputer *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = -[PGZeroKeywordComputer initWithPhotoLibrary:curationManager:searchComputationCache:]([PGZeroKeywordComputer alloc], "initWithPhotoLibrary:curationManager:searchComputationCache:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PGManager_Search__zeroKeywordsWithOptions_progressReporter___block_invoke_2;
  v11[3] = &unk_1E842C7C0;
  v7 = *(_QWORD *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  -[PGZeroKeywordComputer zeroKeywordsWithGraph:curationContext:options:progressBlock:](v4, "zeroKeywordsWithGraph:curationContext:options:progressBlock:", v6, v5, v7, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __62__PGManager_Search__zeroKeywordsWithOptions_progressReporter___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (NSArray)availableMetricEvents
{
  void *v3;
  PGCuratedLibraryIntelligenceMetricEvent *v4;
  PGGraphStatisticsMetricEvent *v5;
  PGGuessWhoRelationshipMetricEvent *v6;
  PGGraphSyndicatedAssetsMetricEvent *v7;
  void *v8;
  PGGraphSyndicatedAssetsMetricEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = -[PGCuratedLibraryIntelligenceMetricEvent initWithGraphManager:]([PGCuratedLibraryIntelligenceMetricEvent alloc], "initWithGraphManager:", self);
  v16[0] = v4;
  v5 = -[PGGraphStatisticsMetricEvent initWithGraphManager:]([PGGraphStatisticsMetricEvent alloc], "initWithGraphManager:", self);
  v16[1] = v5;
  v6 = -[PGGuessWhoRelationshipMetricEvent initWithGraphManager:]([PGGuessWhoRelationshipMetricEvent alloc], "initWithGraphManager:", self);
  v16[2] = v6;
  v7 = [PGGraphSyndicatedAssetsMetricEvent alloc];
  -[PGManager workingContext](self, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGGraphSyndicatedAssetsMetricEvent initWithWorkingContext:](v7, "initWithWorkingContext:", v8);
  v16[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphHolidayMetricEvent celebratedHolidayMetricEventsWithGraphManager:](PGGraphHolidayMetricEvent, "celebratedHolidayMetricEventsWithGraphManager:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);
  if (PGIsAppleInternal_onceToken != -1)
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8044);
  if (PGIsAppleInternal_isAppleInternal && objc_msgSend((id)objc_opt_class(), "photosChallengeIsEnabled"))
  {
    +[PGPhotosChallengeMetricEvent allMetricEventsWithGraphManager:](PGPhotosChallengeMetricEvent, "allMetricEventsWithGraphManager:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v13);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (BOOL)updateGraph:(id)a3 withGraphUpdate:(id)a4 withRecipe:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  char v16;
  BOOL v17;
  PGGraphBuilder *v18;
  uint64_t v19;
  id v20;
  id v21;
  double Current;
  char v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _Block_copy(v13);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x2020000000;
  v39 = 0;
  if (v14
    && (v15 = CFAbsoluteTimeGetCurrent(), v15 - v37[3] >= 0.01)
    && (v37[3] = v15,
        v35 = 0,
        (*((void (**)(void *, char *, double))v14 + 2))(v14, &v35, 0.0),
        v16 = *((_BYTE *)v41 + 24) | v35,
        (*((_BYTE *)v41 + 24) = v16) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v45 = 451;
      v46 = 2080;
      v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGManager+Analysis.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v17 = 0;
  }
  else
  {
    v18 = -[PGGraphBuilder initWithGraph:manager:]([PGGraphBuilder alloc], "initWithGraph:manager:", v10, self);
    v19 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __84__PGManager_Analysis_Private__updateGraph_withGraphUpdate_withRecipe_progressBlock___block_invoke;
    v30[3] = &unk_1E8434F30;
    v20 = v14;
    v31 = v20;
    v32 = &v36;
    v33 = &v40;
    v34 = 0x3F847AE147AE147BLL;
    -[PGManager _precachePersonsInformationFromGraph:progressBlock:](self, "_precachePersonsInformationFromGraph:progressBlock:", v10, v30);
    if (*((_BYTE *)v41 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v45 = 459;
        v46 = 2080;
        v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGM"
              "anager+Analysis.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v17 = 0;
    }
    else
    {
      v25[0] = v19;
      v25[1] = 3221225472;
      v25[2] = __84__PGManager_Analysis_Private__updateGraph_withGraphUpdate_withRecipe_progressBlock___block_invoke_194;
      v25[3] = &unk_1E8434F30;
      v21 = v20;
      v26 = v21;
      v27 = &v36;
      v28 = &v40;
      v29 = 0x3F847AE147AE147BLL;
      -[PGGraphBuilder performBatchUpdatesWithGraphUpdate:withRecipe:progressBlock:](v18, "performBatchUpdatesWithGraphUpdate:withRecipe:progressBlock:", v11, v12, v25);
      -[PGManager _invalidateTransientCaches](self, "_invalidateTransientCaches");
      if (*((_BYTE *)v41 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v45 = 468;
          v46 = 2080;
          v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/P"
                "GManager+Analysis.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v17 = 0;
      }
      else if (v14)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v37[3] >= 0.01
          && (v37[3] = Current,
              v35 = 0,
              (*((void (**)(id, char *, double))v21 + 2))(v21, &v35, 1.0),
              v24 = *((_BYTE *)v41 + 24) | v35,
              (*((_BYTE *)v41 + 24) = v24) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v45 = 470;
            v46 = 2080;
            v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core"
                  "/PGManager+Analysis.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v17 = 0;
        }
        else
        {
          v17 = 1;
        }
      }
      else
      {
        v17 = 1;
      }

    }
  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v17;
}

- (void)startGraphUpdate:(id)a3 progressBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  PGManager *v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PGManager ingestLoggingConnection](self, "ingestLoggingConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__PGManager_Analysis_Private__startGraphUpdate_progressBlock_completionBlock___block_invoke;
  v16[3] = &unk_1E842D350;
  v20 = v9;
  v21 = v10;
  v17 = v8;
  v18 = self;
  v19 = v11;
  v12 = v11;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  -[PGManager performAsynchronousGraphWriteUsingBlock:](self, "performAsynchronousGraphWriteUsingBlock:", v16);

}

- (void)updateGraphWithRecipe:(id)a3 keepExistingGraph:(BOOL)a4 progressBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD aBlock[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[PGManager setLibraryAnalysisState:](self, "setLibraryAnalysisState:", 1);
  if (!a4)
    -[PGManager _unloadGraph](self, "_unloadGraph");
  -[PGManager stampFullGraphRebuild](self, "stampFullGraphRebuild");
  v13 = -[PGManager currentFullGraphRebuildStamp](self, "currentFullGraphRebuildStamp");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke;
  aBlock[3] = &unk_1E842D450;
  v22 = v11;
  v23 = v13;
  aBlock[4] = self;
  v20 = v10;
  v21 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  v17 = _Block_copy(aBlock);
  -[PGManager graphUpdateQueue](self, "graphUpdateQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v18, v17);

}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  dispatch_semaphore_t v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  NSObject *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  unint64_t v49;
  id v50;
  _QWORD v51[4];
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = atomic_load((unint64_t *)(a1 + 64));
  if ((objc_msgSend(v2, "canProceedWithFullGraphRebuildStamp:", v3) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "graphPersistenceParentDirectoryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("construction-photosgraph");
    +[PGGraph graphURLForName:parentDirectoryURL:](PGGraph, "graphURLForName:parentDirectoryURL:", CFSTR("construction-photosgraph"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("validation-photosgraph");
    +[PGGraph graphURLForName:parentDirectoryURL:](PGGraph, "graphURLForName:parentDirectoryURL:", CFSTR("validation-photosgraph"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)objc_opt_class(), "graphConsistencyCheckIsEnabled"))
      objc_msgSend(*(id *)(a1 + 32), "copyGraphToURL:", v8);
    objc_msgSend(*(id *)(a1 + 32), "ingestLoggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Start performing library analysis", buf, 2u);
    }

    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = MEMORY[0x1E0C809B0];
    v50 = 0;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_199;
    v47[3] = &unk_1E842D3B0;
    v13 = *(id *)(a1 + 56);
    v47[4] = *(_QWORD *)(a1 + 32);
    v48 = v13;
    v14 = atomic_load((unint64_t *)(a1 + 64));
    v49 = v14;
    v15 = objc_msgSend(v10, "performLibraryAnalysisWithGraphURL:withRecipe:processedGraphUpdate:progressBlock:", v6, v11, &v50, v47);
    v16 = v50;
    objc_msgSend(*(id *)(a1 + 32), "ingestLoggingConnection");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v54 = v15;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Finished performing library analysis with analysis result=%ld", buf, 0xCu);
    }

    if (v15 == 2)
    {
      v25 = dispatch_semaphore_create(0);
      v26 = *(void **)(a1 + 32);
      v37[0] = v12;
      v37[1] = 3221225472;
      v37[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_203;
      v37[3] = &unk_1E842D428;
      v27 = v6;
      v38 = v27;
      v28 = v8;
      v39 = v28;
      v29 = v25;
      v40 = v29;
      objc_msgSend(v26, "performAsynchronousGraphBarrierUsingBlock:", v37);
      dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(*(id *)(a1 + 32), "ingestLoggingConnection");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v27, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "path");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v54 = (uint64_t)v31;
        v55 = 2112;
        v56 = v32;
        _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Successfully destroy the two databases=%@ and %@", buf, 0x16u);

      }
    }
    else if (!v15)
    {
      v18 = dispatch_semaphore_create(0);
      v19 = *(void **)(a1 + 32);
      v41[0] = v12;
      v41[1] = 3221225472;
      v41[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_200;
      v41[3] = &unk_1E842D400;
      v42 = v6;
      v45 = *(id *)(a1 + 56);
      v46 = *(id *)(a1 + 48);
      v43 = v16;
      v20 = v18;
      v44 = v20;
      objc_msgSend(v19, "performAsynchronousGraphBarrierUsingBlock:", v41);
      dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(*(id *)(a1 + 32), "ingestLoggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Successfully perform a graph full rebuild", buf, 2u);
      }

      goto LABEL_23;
    }
    objc_msgSend(*(id *)(a1 + 32), "setLibraryAnalysisState:", 0);
    v33 = *(void **)(a1 + 48);
    if (!v33)
    {
LABEL_24:

      return;
    }
    v34 = *(void **)(a1 + 32);
    v35[0] = v12;
    v35[1] = 3221225472;
    v35[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_204;
    v35[3] = &unk_1E842D378;
    v36 = v33;
    objc_msgSend(v34, "performAsynchronousNotification:", v35);
    v20 = v36;
LABEL_23:

    goto LABEL_24;
  }
  v22 = *(void **)(a1 + 48);
  if (v22)
  {
    v23 = *(void **)(a1 + 32);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_2;
    v51[3] = &unk_1E842D378;
    v52 = v22;
    objc_msgSend(v23, "performAsynchronousNotification:", v51);

  }
  objc_msgSend(*(id *)(a1 + 32), "ingestLoggingConnection");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "[PGManager][updateGraphWithRecipe] Unable to proceed with the full graph rebuild stamp", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setLibraryAnalysisState:", 0);
}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[PGError errorForCode:](PGError, "errorForCode:", -4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v1 + 16))(v1, 0, v2, 0);

}

uint64_t __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_199(_QWORD *a1, _BYTE *a2, double a3)
{
  void *v5;
  unint64_t v6;
  uint64_t result;

  (*(void (**)(double))(a1[5] + 16))(a3 * 0.95);
  v5 = (void *)a1[4];
  v6 = atomic_load(a1 + 6);
  result = objc_msgSend(v5, "canProceedWithFullGraphRebuildStamp:", v6);
  if ((result & 1) == 0)
    *a2 = 1;
  return result;
}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_200(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v17 = 0;
  v6 = objc_msgSend(v3, "swapInGraphAtURL:progressBlock:error:", v4, v5, &v17);
  v7 = v17;
  objc_msgSend(v3, "setLibraryAnalysisState:", 0);
  v8 = *(void **)(a1 + 64);
  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_2_201;
    v11[3] = &unk_1E842D3D8;
    v15 = v8;
    v16 = v6;
    v12 = v7;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v3, "performAsynchronousNotification:", v11);

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Failed swapping the updated graph in: %@", buf, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_203(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v3 = +[MAGraph destroyPersistentStoreAtURL:error:](PGGraph, "destroyPersistentStoreAtURL:error:", v2, &v13);
  v4 = v13;
  if (!v3)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "An error occurred while destroying working (and possibly corrupt) database \"%@\", buf, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v4;
  v8 = +[MAGraph destroyPersistentStoreAtURL:error:](PGGraph, "destroyPersistentStoreAtURL:error:", v7, &v12);
  v9 = v12;

  if (!v8)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "An error occurred while destroying validation graph database \"%@\", buf, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_204(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[PGError errorForCode:](PGError, "errorForCode:", -4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v1 + 16))(v1, 0, v2, 0);

}

intptr_t __101__PGManager_Analysis_Private__updateGraphWithRecipe_keepExistingGraph_progressBlock_completionBlock___block_invoke_2_201(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __78__PGManager_Analysis_Private__startGraphUpdate_progressBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, uint8_t *, double);
  double Current;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  PGGraphIngestRecipe *v11;
  void *v12;
  PGGraphIngestRecipe *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[4];
  void (**v20)(void *, uint8_t *, double);
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, uint8_t *, double))_Block_copy(*(const void **)(a1 + 56));
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (!v4)
    goto LABEL_6;
  Current = CFAbsoluteTimeGetCurrent();
  if (Current - v26[3] >= 0.01)
  {
    v26[3] = Current;
    buf[0] = 0;
    v4[2](v4, buf, 0.0);
    v8 = (*((_BYTE *)v30 + 24) | buf[0]);
    *((_BYTE *)v30 + 24) |= buf[0];
    if (v8)
      goto LABEL_4;
LABEL_6:
    v9 = *(void **)(a1 + 40);
    v24 = 0;
    objc_msgSend(v9, "instantiateMutableGraphWithError:", &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    if (v10)
    {
      objc_msgSend(v10, "enableInTransactionCheck");
      objc_msgSend(v10, "enterBatch");
      v11 = [PGGraphIngestRecipe alloc];
      objc_msgSend(v3, "photoLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PGGraphIngestRecipe initWithPhotoLibrary:](v11, "initWithPhotoLibrary:", v12);

      v14 = *(_QWORD *)(a1 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __78__PGManager_Analysis_Private__startGraphUpdate_progressBlock_completionBlock___block_invoke_2;
      v19[3] = &unk_1E8434F30;
      v20 = v4;
      v21 = &v25;
      v22 = &v29;
      v23 = 0x3F847AE147AE147BLL;
      if ((objc_msgSend(v3, "updateGraph:withGraphUpdate:withRecipe:progressBlock:", v10, v14, v13, v19) & 1) != 0)
      {

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphBuilder setLastIncrementalUpdateInvocationDate:inGraph:](PGGraphBuilder, "setLastIncrementalUpdateInvocationDate:inGraph:", v15, v10);
        v16 = *(NSObject **)(a1 + 48);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_DEFAULT, "Live update succeeded", buf, 2u);
        }
        objc_msgSend(v10, "leaveBatch");

LABEL_15:
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

        goto LABEL_16;
      }
      +[PGError errorForCode:](PGError, "errorForCode:", -4);
      v17 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v17;
    }
    v18 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v7;
      _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Live update failed, rolling back: %@", buf, 0xCu);
    }
    objc_msgSend(v10, "rollbackBatch");
    goto LABEL_15;
  }
  if (!*((_BYTE *)v30 + 24))
    goto LABEL_6;
LABEL_4:
  v6 = *(_QWORD *)(a1 + 64);
  +[PGError errorForCode:](PGError, "errorForCode:", -4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v6 + 16))(v6, 0, v7, *(_QWORD *)(a1 + 32));
LABEL_16:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

}

void __78__PGManager_Analysis_Private__startGraphUpdate_progressBlock_completionBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.8 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __84__PGManager_Analysis_Private__updateGraph_withGraphUpdate_withRecipe_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __84__PGManager_Analysis_Private__updateGraph_withGraphUpdate_withRecipe_progressBlock___block_invoke_194(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.9 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

- (void)_precachePersonsInformationFromGraph:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  double Current;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  uint8_t v31[128];
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(a4);
  v8 = 0.0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v30 = 0;
      v7[2](v7, &v30, 0.0);
      if (v30)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v33 = 56;
          v34 = 2080;
          v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/P"
                "GManager+Analysis.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_30;
      }
      v8 = Current;
    }
  }
  -[PGManager photoLibrary](self, "photoLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNodeCollection personNodesIncludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesIncludingMeInGraph:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v24 = v6;
    v11 = objc_msgSend(v10, "count");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v10, "localIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 1.0 / (double)v11;
      v16 = *(_QWORD *)v27;
      v17 = 0.0;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v17 = v15 + v17;
          if (v7)
          {
            v20 = CFAbsoluteTimeGetCurrent();
            if (v20 - v8 >= 0.01)
            {
              v30 = 0;
              v7[2](v7, &v30, v17);
              if (v30)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v33 = 69;
                  v34 = 2080;
                  v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Core/PGManager+Analysis.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                v6 = v24;
                goto LABEL_29;
              }
              v8 = v20;
            }
          }
          if (objc_msgSend(v19, "length"))
          {
            v21 = (void *)MEMORY[0x1E0D4B190];
            -[PGManager serviceManager](self, "serviceManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "clueWithPersonLocalIdentifier:inPhotoLibrary:serviceManager:", v19, v25, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "prepareIfNeeded");
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v14)
          continue;
        break;
      }
    }

    v6 = v24;
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        v30 = 0;
        v7[2](v7, &v30, 1.0);
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v33 = 76;
            v34 = 2080;
            v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core"
                  "/PGManager+Analysis.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
  }
LABEL_29:

LABEL_30:
}

- (id)graphForLibraryFullAnalysisAtURL:(id)a3 alreadyIngestedMomentIdentifiers:(id *)a4 alreadyIngestedHighlightIdentifiers:(id *)a5 progressBlock:(id)a6 error:(id *)a7
{
  id v12;
  void (**v13)(void *, _BYTE *, double);
  double v14;
  double Current;
  PGMutableGraph *v16;
  PGMutableGraph *v17;
  BOOL v18;
  PGMutableGraph *v19;
  double v20;
  PGMutableGraph *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  _BOOL4 v36;
  void *v37;
  NSObject *v38;
  BOOL v39;
  id v40;
  PGMutableGraph *v41;
  double v42;
  void *v43;
  void *v44;
  NSObject *v45;
  _QWORD *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  char v54;
  uint8_t buf[4];
  _DWORD v56[7];

  *(_QWORD *)&v56[5] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (void (**)(void *, _BYTE *, double))_Block_copy(a6);
  v14 = 0.0;
  if (v13)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v54 = 0;
      v13[2](v13, &v54, 0.0);
      if (v54)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v56[0] = 82;
          LOWORD(v56[1]) = 2080;
          *(_QWORD *)((char *)&v56[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Core/PGManager+Analysis.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_16;
      }
      v14 = Current;
    }
  }
  v16 = -[PGGraph initWithURL:persistenceOptions:error:]([PGMutableGraph alloc], "initWithURL:persistenceOptions:error:", v12, 32, a7);
  if (v16)
  {
    v17 = v16;
    if (!-[MAGraph version](v16, "version")
      || -[PGManager graphIsUsable:error:](self, "graphIsUsable:error:", v17, 0))
    {
      goto LABEL_64;
    }
    -[MAGraph closePersistentStore](v17, "closePersistentStore");

    v53 = 0;
    v18 = +[MAGraph destroyPersistentStoreAtURL:error:](PGGraph, "destroyPersistentStoreAtURL:error:", v12, &v53);
    v17 = (PGMutableGraph *)v53;
    if (!v18)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "loggingConnection");
      v23 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v56 = v17;
        _os_log_error_impl(&dword_1CA237000, v23, OS_LOG_TYPE_ERROR, "An error occurred while destroying temporary database \"%@\", buf, 0xCu);
      }

      if (a7)
      {
        v17 = objc_retainAutorelease(v17);
        v21 = 0;
        *a7 = v17;
LABEL_60:

        goto LABEL_61;
      }
LABEL_21:
      v21 = 0;
      goto LABEL_60;
    }
    v19 = -[PGGraph initWithURL:persistenceOptions:error:]([PGMutableGraph alloc], "initWithURL:persistenceOptions:error:", v12, 0, a7);

    v17 = v19;
    if (v19)
    {
LABEL_64:
      if (v13)
      {
        v20 = CFAbsoluteTimeGetCurrent();
        if (v20 - v14 >= 0.01)
        {
          buf[0] = 0;
          v13[2](v13, buf, 0.5);
          if (buf[0])
          {
            -[MAGraph closePersistentStore](v17, "closePersistentStore");
            goto LABEL_21;
          }
          v14 = v20;
        }
      }
      -[PGGraph momentNodes](v17, "momentNodes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localIdentifiers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "mutableCopy");

      +[PGGraphHighlightNodeCollection dayHighlightNodesInGraph:](PGGraphHighlightNodeCollection, "dayHighlightNodesInGraph:", v17);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localIdentifiers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (id)objc_msgSend(v27, "mutableCopy");

      if (v13)
      {
        v28 = CFAbsoluteTimeGetCurrent();
        if (v28 - v14 >= 0.01)
        {
          buf[0] = 0;
          v13[2](v13, buf, 0.6);
          if (buf[0])
          {
            -[MAGraph closePersistentStore](v17, "closePersistentStore");
            v21 = 0;
            v29 = v50;
LABEL_59:

            goto LABEL_60;
          }
          v14 = v28;
        }
      }
      v49 = v24;
      if (!objc_msgSend(v26, "count", a5) && !objc_msgSend(v51, "count"))
      {
        v36 = 1;
LABEL_38:
        *a4 = objc_retainAutorelease(v26);
        *v47 = objc_retainAutorelease(v51);
        if (v13)
        {
          v42 = CFAbsoluteTimeGetCurrent();
          v24 = v49;
          v29 = v50;
          if (v42 - v14 >= 0.01)
          {
            buf[0] = 0;
            v13[2](v13, buf, 0.8);
            if (buf[0])
            {
LABEL_48:
              -[MAGraph closePersistentStore](v17, "closePersistentStore");
LABEL_58:
              v21 = 0;
              goto LABEL_59;
            }
            v14 = v42;
          }
        }
        else
        {
          v24 = v49;
          v29 = v50;
        }
        if (v36)
        {
          +[PGGraphBuilder prepareGraphForRebuild:](PGGraphBuilder, "prepareGraphForRebuild:", v17);
          -[PGManager curationManager](self, "curationManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "invalidateMemoryCaches");
          objc_msgSend(v43, "invalidateDiskCaches");

        }
        if (!v13 || CFAbsoluteTimeGetCurrent() - v14 < 0.01 || (buf[0] = 0, v13[2](v13, buf, 1.0), !buf[0]))
        {
          v17 = v17;
          v21 = v17;
          goto LABEL_59;
        }
        goto LABEL_48;
      }
      v48 = v26;
      -[PGGraph infoNode](v17, "infoNode");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "creationDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "timeIntervalSinceDate:", v32);
      v34 = v33;

      v35 = -v34;
      if (v34 >= 0.0)
        v35 = v34;
      v36 = v35 > 172800.0;
      if (v35 > 172800.0)
      {
        -[MAGraph closePersistentStore](v17, "closePersistentStore");
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "loggingConnection");
        v38 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v56 = v12;
          _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_DEFAULT, "Invalidating graph (%@), because it needs to be rebuilt", buf, 0xCu);
        }

        v52 = 0;
        v39 = +[MAGraph destroyPersistentStoreAtURL:error:](PGGraph, "destroyPersistentStoreAtURL:error:", v12, &v52);
        v40 = v52;
        if (v39)
        {
          objc_msgSend(v48, "removeAllObjects");
          objc_msgSend(v51, "removeAllObjects");
          v41 = -[PGGraph initWithURL:persistenceOptions:error:]([PGMutableGraph alloc], "initWithURL:persistenceOptions:error:", v12, 32, a7);

          v17 = v41;
          if (v41)
            goto LABEL_37;
          v26 = v48;
          v24 = v49;
          v29 = v50;
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "loggingConnection");
          v45 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v56 = v40;
            _os_log_error_impl(&dword_1CA237000, v45, OS_LOG_TYPE_ERROR, "An error occurred while destroying temporary database \"%@\", buf, 0xCu);
          }

          v24 = v49;
          v29 = v50;
          if (a7)
            *a7 = objc_retainAutorelease(v40);

          v26 = v48;
        }

        goto LABEL_58;
      }
LABEL_37:

      v26 = v48;
      goto LABEL_38;
    }
  }
LABEL_16:
  v21 = 0;
LABEL_61:

  return v21;
}

- (void)performFullLibraryAnalysisInGraph:(id)a3 withRecipe:(id)a4 withAlreadyIngestedMomentIdentifiers:(id)a5 alreadyIngestedHighlightIdentifiers:(id)a6 processedGraphUpdate:(id *)a7 progressBlock:(id)a8
{
  double v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  PGGraphUpdate *v24;
  void *v25;
  PGGraphMomentsInsertion *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  PGGraphHighlightsInsertion *v37;
  PGGraphBuilder *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  double Current;
  char v51;
  NSObject *v52;
  id v53;
  int v54;
  int v55;
  char v56;
  NSObject *v57;
  id v58;
  int v59;
  int v60;
  NSObject *v61;
  id v62;
  int v63;
  int v64;
  id *v65;
  id v66;
  void *v67;
  PGGraphUpdate *v69;
  id v70;
  id v71;
  id v72;
  id obj;
  id v74;
  id v75;
  _QWORD v76[4];
  NSObject *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t v80;
  _QWORD v81[4];
  id v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  char v94;
  uint64_t v95;
  double *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  char v102;
  _BYTE v103[128];
  uint8_t v104[128];
  uint8_t buf[4];
  int v106;
  __int16 v107;
  _BYTE v108[10];
  __int16 v109;
  const char *v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v70 = a4;
  v75 = a5;
  v74 = a6;
  v66 = a8;
  v99 = 0;
  v100 = &v99;
  v101 = 0x2020000000;
  v102 = 0;
  v95 = 0;
  v96 = (double *)&v95;
  v97 = 0x2020000000;
  v98 = 0;
  v67 = _Block_copy(v66);
  if (v67
    && (v13 = CFAbsoluteTimeGetCurrent(), v13 - v96[3] >= 0.01)
    && ((v96[3] = v13,
         v94 = 0,
         (*((void (**)(void *, char *, double))v67 + 2))(v67, &v94, 0.0),
         v56 = *((_BYTE *)v100 + 24) | v94,
         (*((_BYTE *)v100 + 24) = v56) != 0)
     || (objc_msgSend(v71, "noFatalError") & 1) == 0))
  {
    v57 = MEMORY[0x1E0C81028];
    v58 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      v59 = *((unsigned __int8 *)v100 + 24);
      v60 = objc_msgSend(v71, "noFatalError");
      *(_DWORD *)buf = 67109890;
      v106 = v59;
      v107 = 1024;
      *(_DWORD *)v108 = v60 ^ 1;
      *(_WORD *)&v108[4] = 1024;
      *(_DWORD *)&v108[6] = 202;
      v109 = 2080;
      v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGMa"
             "nager+Analysis.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
    }

  }
  else
  {
    objc_msgSend(v70, "momentsToIngest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = a7;
    v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    obj = v14;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v91 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          objc_msgSend(v20, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v75, "containsObject:", v21);

          if (v22)
            v23 = v16;
          else
            v23 = v15;
          objc_msgSend(v23, "addObject:", v20);
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
      }
      while (v17);
    }

    v24 = [PGGraphUpdate alloc];
    -[PGManager photoLibrary](self, "photoLibrary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = -[PGGraphUpdate initWithPhotoLibrary:](v24, "initWithPhotoLibrary:", v25);

    if (objc_msgSend(v15, "count"))
    {
      v26 = -[PGGraphMomentsInsertion initWithMoments:]([PGGraphMomentsInsertion alloc], "initWithMoments:", v15);
      -[PGGraphUpdate addChange:](v69, "addChange:", v26);

    }
    objc_msgSend(v70, "highlightsToIngest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v72 = v27;
    v30 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v87 != v31)
            objc_enumerationMutation(v72);
          v33 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          objc_msgSend(v33, "uuid");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v74, "containsObject:", v34);

          if (v35)
            v36 = v29;
          else
            v36 = v28;
          objc_msgSend(v36, "addObject:", v33);
        }
        v30 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
      }
      while (v30);
    }

    if (objc_msgSend(v28, "count"))
    {
      v37 = -[PGGraphHighlightsInsertion initWithHighlights:]([PGGraphHighlightsInsertion alloc], "initWithHighlights:", v28);
      -[PGGraphUpdate addChange:](v69, "addChange:", v37);

    }
    -[PGGraphUpdate setIsResumingFullAnalysis:](v69, "setIsResumingFullAnalysis:", 1);
    v38 = -[PGGraphBuilder initWithGraph:manager:]([PGGraphBuilder alloc], "initWithGraph:manager:", v71, self);
    v39 = MEMORY[0x1E0C809B0];
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __185__PGManager_Analysis_Internal__performFullLibraryAnalysisInGraph_withRecipe_withAlreadyIngestedMomentIdentifiers_alreadyIngestedHighlightIdentifiers_processedGraphUpdate_progressBlock___block_invoke;
    v81[3] = &unk_1E8434F30;
    v40 = v67;
    v82 = v40;
    v83 = &v95;
    v84 = &v99;
    v85 = 0x3F847AE147AE147BLL;
    -[PGManager _precachePersonsInformationFromGraph:progressBlock:](self, "_precachePersonsInformationFromGraph:progressBlock:", v71, v81);
    if (*((_BYTE *)v100 + 24) || (objc_msgSend(v71, "noFatalError") & 1) == 0)
    {
      v52 = MEMORY[0x1E0C81028];
      v53 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        v54 = *((unsigned __int8 *)v100 + 24);
        v55 = objc_msgSend(v71, "noFatalError");
        *(_DWORD *)buf = 67109890;
        v106 = v54;
        v107 = 1024;
        *(_DWORD *)v108 = v55 ^ 1;
        *(_WORD *)&v108[4] = 1024;
        *(_DWORD *)&v108[6] = 259;
        v109 = 2080;
        v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PG"
               "Manager+Analysis.m";
        _os_log_impl(&dword_1CA237000, v52, OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
      }
    }
    else
    {
      v76[0] = v39;
      v76[1] = 3221225472;
      v76[2] = __185__PGManager_Analysis_Internal__performFullLibraryAnalysisInGraph_withRecipe_withAlreadyIngestedMomentIdentifiers_alreadyIngestedHighlightIdentifiers_processedGraphUpdate_progressBlock___block_invoke_182;
      v76[3] = &unk_1E8434F30;
      v41 = v40;
      v77 = v41;
      v78 = &v95;
      v79 = &v99;
      v80 = 0x3F847AE147AE147BLL;
      -[PGGraphBuilder performBatchUpdatesWithGraphUpdate:withRecipe:progressBlock:](v38, "performBatchUpdatesWithGraphUpdate:withRecipe:progressBlock:", v69, v70, v76);
      if (*((_BYTE *)v100 + 24) || (objc_msgSend(v71, "noFatalError") & 1) == 0)
      {
        v61 = MEMORY[0x1E0C81028];
        v62 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v63 = *((unsigned __int8 *)v100 + 24);
          v64 = objc_msgSend(v71, "noFatalError");
          *(_DWORD *)buf = 67109890;
          v106 = v63;
          v107 = 1024;
          *(_DWORD *)v108 = v64 ^ 1;
          *(_WORD *)&v108[4] = 1024;
          *(_DWORD *)&v108[6] = 267;
          v109 = 2080;
          v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/"
                 "PGManager+Analysis.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled (%d) or fatal (%d) at line %d in file %s", buf, 0x1Eu);
        }

      }
      else
      {
        if (v65)
          *v65 = objc_retainAutorelease(v69);
        v42 = objc_msgSend(v71, "numberOfMomentNodes");
        v43 = objc_msgSend(v16, "count");
        v44 = objc_msgSend(v15, "count") + v43;
        if (v42 != v44)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "loggingConnection");
          v46 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            v106 = v42;
            v107 = 1024;
            *(_DWORD *)v108 = v44;
            _os_log_error_impl(&dword_1CA237000, v46, OS_LOG_TYPE_ERROR, "Moment nodes count & moment asset collections count are different %u - %u", buf, 0xEu);
          }

        }
        -[PGManager analytics](self, "analytics");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGManager photoLibrary](self, "photoLibrary");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGManager serviceManager](self, "serviceManager");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "reportMetricsLogsWithAnalytics:photoLibrary:serviceManager:", v47, v48, v49);

        if (v67)
        {
          Current = CFAbsoluteTimeGetCurrent();
          if (Current - v96[3] >= 0.01)
          {
            v96[3] = Current;
            v94 = 0;
            ((void (*)(NSObject *, char *, double))v41[2].isa)(v41, &v94, 1.0);
            v51 = *((_BYTE *)v100 + 24) | v94;
            *((_BYTE *)v100 + 24) = v51;
            if (v51)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v106 = 283;
                v107 = 2080;
                *(_QWORD *)v108 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Core/PGManager+Analysis.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
          }
        }
      }
      v52 = v77;
    }

  }
  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);

}

- (int64_t)performLibraryAnalysisWithGraphURL:(id)a3 withRecipe:(id)a4 processedGraphUpdate:(id *)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  char v14;
  int64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  double Current;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  id v42;
  id v43;
  char v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[4];
  int v54;
  __int16 v55;
  const char *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v30 = a4;
  v11 = a6;
  v12 = _Block_copy(v11);
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x2020000000;
  v48 = 0;
  if (!v12
    || (v13 = CFAbsoluteTimeGetCurrent(), v13 - v46[3] < 0.01)
    || (v46[3] = v13,
        v44 = 0,
        (*((void (**)(void *, char *, double))v12 + 2))(v12, &v44, 0.0),
        v14 = *((_BYTE *)v50 + 24) | v44,
        (*((_BYTE *)v50 + 24) = v14) == 0))
  {
    v42 = 0;
    v43 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __113__PGManager_Analysis_Internal__performLibraryAnalysisWithGraphURL_withRecipe_processedGraphUpdate_progressBlock___block_invoke;
    v37[3] = &unk_1E8434F30;
    v17 = v12;
    v38 = v17;
    v39 = &v45;
    v40 = &v49;
    v41 = 0x3F847AE147AE147BLL;
    v36 = 0;
    -[PGManager graphForLibraryFullAnalysisAtURL:alreadyIngestedMomentIdentifiers:alreadyIngestedHighlightIdentifiers:progressBlock:error:](self, "graphForLibraryFullAnalysisAtURL:alreadyIngestedMomentIdentifiers:alreadyIngestedHighlightIdentifiers:progressBlock:error:", v10, &v43, &v42, v37, &v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v43;
    v29 = v42;
    v27 = v36;
    if (*((_BYTE *)v50 + 24))
    {
      objc_msgSend(v18, "closePersistentStore", v27);
LABEL_9:
      v15 = 1;
LABEL_23:

      goto LABEL_24;
    }
    if (v18)
    {
      if ((objc_msgSend(v18, "noFatalError", v27) & 1) != 0)
      {
        if (v12)
        {
          Current = CFAbsoluteTimeGetCurrent();
          if (Current - v46[3] >= 0.01)
          {
            v46[3] = Current;
            buf[0] = 0;
            (*((void (**)(id, uint8_t *, double))v17 + 2))(v17, buf, 0.05);
            *((_BYTE *)v50 + 24) |= buf[0];
          }
        }
        if (*((_BYTE *)v50 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v54 = 318;
            v55 = 2080;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core"
                  "/PGManager+Analysis.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSince1970");
          v23 = v22;

          -[PGManager _invalidatePersistentCachesBeforeDateWithTimestamp:](self, "_invalidatePersistentCachesBeforeDateWithTimestamp:", v23 + -7776000.0);
          if (v12)
          {
            v24 = CFAbsoluteTimeGetCurrent();
            if (v24 - v46[3] >= 0.01)
            {
              v46[3] = v24;
              buf[0] = 0;
              (*((void (**)(id, uint8_t *, double))v17 + 2))(v17, buf, 0.09);
              *((_BYTE *)v50 + 24) |= buf[0];
            }
          }
          if (!*((_BYTE *)v50 + 24))
          {
            v31[0] = v16;
            v31[1] = 3221225472;
            v31[2] = __113__PGManager_Analysis_Internal__performLibraryAnalysisWithGraphURL_withRecipe_processedGraphUpdate_progressBlock___block_invoke_183;
            v31[3] = &unk_1E8434F30;
            v25 = v17;
            v32 = v25;
            v33 = &v45;
            v34 = &v49;
            v35 = 0x3F847AE147AE147BLL;
            -[PGManager performFullLibraryAnalysisInGraph:withRecipe:withAlreadyIngestedMomentIdentifiers:alreadyIngestedHighlightIdentifiers:processedGraphUpdate:progressBlock:](self, "performFullLibraryAnalysisInGraph:withRecipe:withAlreadyIngestedMomentIdentifiers:alreadyIngestedHighlightIdentifiers:processedGraphUpdate:progressBlock:", v18, v30, v28, v29, a5, v31);
            -[PGManager _invalidateTransientCaches](self, "_invalidateTransientCaches");
            if (*((_BYTE *)v50 + 24))
            {
              objc_msgSend(v18, "closePersistentStore");
              v15 = 1;
            }
            else if ((objc_msgSend(v18, "noFatalError") & 1) != 0)
            {
              objc_msgSend(v18, "closePersistentStore");
              if (v12)
              {
                v26 = CFAbsoluteTimeGetCurrent();
                if (v26 - v46[3] >= 0.01)
                {
                  v46[3] = v26;
                  buf[0] = 0;
                  (*((void (**)(id, uint8_t *, double))v25 + 2))(v25, buf, 1.0);
                  *((_BYTE *)v50 + 24) |= buf[0];
                }
              }
              if (*((_BYTE *)v50 + 24))
              {
                v15 = 1;
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v54 = 355;
                  v55 = 2080;
                  v56 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Core/PGManager+Analysis.m";
                  v15 = 1;
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
              }
              else
              {
                v15 = 0;
              }
            }
            else
            {
              objc_msgSend(v18, "closePersistentStore");
              v15 = 2;
            }

            goto LABEL_23;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v54 = 328;
            v55 = 2080;
            v56 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core"
                  "/PGManager+Analysis.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        objc_msgSend(v18, "closePersistentStore");
        goto LABEL_9;
      }
      objc_msgSend(v18, "closePersistentStore");
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = 2;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not get a valid graph to perform full analysis, aborting", buf, 2u);
      goto LABEL_23;
    }
    v15 = 2;
    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v54 = 291;
    v55 = 2080;
    v56 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Core/PGManager+Analysis.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v15 = 1;
LABEL_24:
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  return v15;
}

- (BOOL)swapInGraphAtURL:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  id v8;
  void (**v9)(void *, mach_timebase_info *, double);
  double v10;
  char v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  double Current;
  char v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v25;
  BOOL v26;
  id v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  BOOL v37;
  void *v38;
  NSObject *v39;
  double v40;
  char v41;
  NSObject *v42;
  BOOL v43;
  id v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint32_t denom;
  uint32_t numer;
  NSObject *v52;
  NSObject *v53;
  double v54;
  char v55;
  void (**v56)(void *, mach_timebase_info *, double);
  NSObject *v57;
  double v59;
  char v60;
  uint64_t v61;
  os_signpost_id_t spid;
  unint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  id v67;
  __CFString *v68;
  void *v69;
  _QWORD v70[4];
  void (**v71)(void *, mach_timebase_info *, double);
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  id v75;
  char v76;
  id v77;
  id v78;
  id v79;
  mach_timebase_info info;
  uint64_t v81;
  double *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  uint8_t buf[4];
  _BYTE v90[18];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v8 = a4;
  v9 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v8);
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  v81 = 0;
  v82 = (double *)&v81;
  v83 = 0x2020000000;
  v84 = 0;
  v66 = v8;
  if (!v9
    || (v10 = CFAbsoluteTimeGetCurrent(), v10 - v82[3] < 0.01)
    || (v82[3] = v10,
        LOBYTE(info.numer) = 0,
        v9[2](v9, &info, 0.0),
        v11 = *((_BYTE *)v86 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v86 + 24) = v11) == 0))
  {
    -[PGManager graphName](self, "graphName");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("photosgraph");
    if (v13)
      v15 = (__CFString *)v13;
    v68 = v15;

    -[PGManager graphPersistenceParentDirectoryURL](self, "graphPersistenceParentDirectoryURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraph graphURLForName:parentDirectoryURL:](PGGraph, "graphURLForName:parentDirectoryURL:", v68, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraph graphURLForName:parentDirectoryURL:](PGGraph, "graphURLForName:parentDirectoryURL:", CFSTR("photosgraph-tmp"), v16);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v82[3] >= 0.01)
      {
        v82[3] = Current;
        LOBYTE(info.numer) = 0;
        v9[2](v9, &info, 0.2);
        v19 = *((_BYTE *)v86 + 24) | LOBYTE(info.numer);
        *((_BYTE *)v86 + 24) = v19;
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v90 = 372;
            *(_WORD *)&v90[4] = 2080;
            *(_QWORD *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Core/PGManager+Analysis.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_30:
          LOBYTE(v12) = 0;
LABEL_71:

          goto LABEL_72;
        }
      }
    }
    if (!v69 || !v17)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "loggingConnection");
      v34 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v90 = v69;
        *(_WORD *)&v90[8] = 2112;
        *(_QWORD *)&v90[10] = v17;
        _os_log_error_impl(&dword_1CA237000, v34, OS_LOG_TYPE_ERROR, "Cannot access URLs: %@, %@", buf, 0x16u);
      }

      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManager graphLoggingConnection](self, "graphLoggingConnection");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);
    v22 = v20;
    v23 = v22;
    spid = v21;
    v63 = v21 - 1;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "SwapGraph", ", buf, 2u);
    }
    v64 = v23;

    info = 0;
    mach_timebase_info(&info);
    v61 = mach_absolute_time();
    -[PGManager _unloadGraph](self, "_unloadGraph");
    objc_msgSend(v17, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v65, "fileExistsAtPath:", v24);

    if (v25)
    {
      v79 = 0;
      v26 = +[MAGraph migratePersistentStoreFromURL:toURL:error:](PGGraph, "migratePersistentStoreFromURL:toURL:error:", v17, v69, &v79);
      v27 = v79;
      if (!v26)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "loggingConnection");
        v29 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v90 = v27;
          _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "Error when renaming previous graph library: \"%@\", buf, 0xCu);
        }

      }
    }
    v78 = 0;
    v12 = +[MAGraph migratePersistentStoreFromURL:toURL:error:](PGGraph, "migratePersistentStoreFromURL:toURL:error:", v67, v17, &v78);
    v30 = v78;
    v31 = v30;
    if (v12)
    {
      v32 = v30;
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "loggingConnection");
      v36 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v90 = v31;
        _os_log_error_impl(&dword_1CA237000, v36, OS_LOG_TYPE_ERROR, "Error when moving new graph to Library directory, trying to rollback the old one \"%@\", buf, 0xCu);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v31);
      v77 = v31;
      v37 = +[MAGraph migratePersistentStoreFromURL:toURL:error:](PGGraph, "migratePersistentStoreFromURL:toURL:error:", v69, v17, &v77);
      v32 = v77;

      if (!v37)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "loggingConnection");
        v39 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v90 = v32;
          _os_log_error_impl(&dword_1CA237000, v39, OS_LOG_TYPE_ERROR, "Error when rolling back the previous graph library \"%@\", buf, 0xCu);
        }

      }
    }

    if (v9)
    {
      v40 = CFAbsoluteTimeGetCurrent();
      if (v40 - v82[3] >= 0.01)
      {
        v82[3] = v40;
        v76 = 0;
        v9[2](v9, (mach_timebase_info *)&v76, 0.6);
        v41 = *((_BYTE *)v86 + 24) | v76;
        *((_BYTE *)v86 + 24) = v41;
        if (v41)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v90 = 415;
            *(_WORD *)&v90[4] = 2080;
            *(_QWORD *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Core/PGManager+Analysis.m";
            v42 = MEMORY[0x1E0C81028];
LABEL_62:
            _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_63;
          }
          goto LABEL_63;
        }
      }
    }
    if (v12)
    {
      v75 = 0;
      v43 = +[MAGraph destroyPersistentStoreAtURL:error:](PGGraph, "destroyPersistentStoreAtURL:error:", v69, &v75);
      v44 = v75;
      if (!v43)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "loggingConnection");
        v46 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v90 = v44;
          _os_log_error_impl(&dword_1CA237000, v46, OS_LOG_TYPE_ERROR, "Error when destroying temporary library \"%@\", buf, 0xCu);
        }

      }
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "loggingConnection");
      v48 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "Updated graph successfully!", buf, 2u);
      }

    }
    v49 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v52 = v64;
    v53 = v52;
    if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v53, OS_SIGNPOST_INTERVAL_END, spid, "SwapGraph", ", buf, 2u);
    }

    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v90 = "SwapGraph";
      *(_WORD *)&v90[8] = 2048;
      *(double *)&v90[10] = (float)((float)((float)((float)(v49 - v61) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v53, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (v9)
    {
      v54 = CFAbsoluteTimeGetCurrent();
      if (v54 - v82[3] >= 0.01)
      {
        v82[3] = v54;
        v76 = 0;
        v9[2](v9, (mach_timebase_info *)&v76, 0.8);
        v55 = *((_BYTE *)v86 + 24) | v76;
        *((_BYTE *)v86 + 24) = v55;
        if (v55)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v90 = 429;
            *(_WORD *)&v90[4] = 2080;
            *(_QWORD *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Core/PGManager+Analysis.m";
            v42 = MEMORY[0x1E0C81028];
            goto LABEL_62;
          }
LABEL_63:
          LOBYTE(v12) = 0;
LABEL_70:

          goto LABEL_71;
        }
      }
    }
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __69__PGManager_Analysis_Internal__swapInGraphAtURL_progressBlock_error___block_invoke;
    v70[3] = &unk_1E8434F30;
    v56 = v9;
    v71 = v56;
    v72 = &v81;
    v73 = &v85;
    v74 = 0x3F847AE147AE147BLL;
    -[PGManager loadGraphWithProgressBlock:](self, "loadGraphWithProgressBlock:", v70);
    if (*((_BYTE *)v86 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v90 = 434;
        *(_WORD *)&v90[4] = 2080;
        *(_QWORD *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Core/PGManager+Analysis.m";
        v57 = MEMORY[0x1E0C81028];
LABEL_67:
        _os_log_impl(&dword_1CA237000, v57, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v9)
        goto LABEL_69;
      v59 = CFAbsoluteTimeGetCurrent();
      if (v59 - v82[3] < 0.01)
        goto LABEL_69;
      v82[3] = v59;
      v76 = 0;
      v56[2](v56, (mach_timebase_info *)&v76, 1.0);
      v60 = *((_BYTE *)v86 + 24) | v76;
      *((_BYTE *)v86 + 24) = v60;
      if (!v60)
        goto LABEL_69;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v90 = 436;
        *(_WORD *)&v90[4] = 2080;
        *(_QWORD *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Core/PGManager+Analysis.m";
        v57 = MEMORY[0x1E0C81028];
        goto LABEL_67;
      }
    }
    LOBYTE(v12) = 0;
LABEL_69:

    goto LABEL_70;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v90 = 365;
    *(_WORD *)&v90[4] = 2080;
    *(_QWORD *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Core/PGManager+Analysis.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  LOBYTE(v12) = 0;
LABEL_72:
  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v85, 8);

  return v12;
}

void __69__PGManager_Analysis_Internal__swapInGraphAtURL_progressBlock_error___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __113__PGManager_Analysis_Internal__performLibraryAnalysisWithGraphURL_withRecipe_processedGraphUpdate_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.05);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __113__PGManager_Analysis_Internal__performLibraryAnalysisWithGraphURL_withRecipe_processedGraphUpdate_progressBlock___block_invoke_183(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.8 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __185__PGManager_Analysis_Internal__performFullLibraryAnalysisInGraph_withRecipe_withAlreadyIngestedMomentIdentifiers_alreadyIngestedHighlightIdentifiers_processedGraphUpdate_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __185__PGManager_Analysis_Internal__performFullLibraryAnalysisInGraph_withRecipe_withAlreadyIngestedMomentIdentifiers_alreadyIngestedHighlightIdentifiers_processedGraphUpdate_progressBlock___block_invoke_182(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.7 + 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

- (void)startLibraryAnalysis:(id)a3 keepExistingGraph:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PGGraphIngestRecipe *v10;
  void *v11;
  PGGraphIngestRecipe *v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = [PGGraphIngestRecipe alloc];
  -[PGManager photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PGGraphIngestRecipe initWithPhotoLibrary:](v10, "initWithPhotoLibrary:", v11);

  -[PGManager startLibraryAnalysisWithRecipe:progressBlock:keepExistingGraph:completionBlock:](self, "startLibraryAnalysisWithRecipe:progressBlock:keepExistingGraph:completionBlock:", v12, v9, v5, v8);
}

- (void)startLibraryAnalysisWithRecipe:(id)a3 progressBlock:(id)a4 keepExistingGraph:(BOOL)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PGManager *v20;
  id v21;
  id v22;
  BOOL v23;
  _QWORD aBlock[5];
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v11)
    v13 = v11;
  else
    v13 = &__block_literal_global_33548;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 10000);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager setRebuildProgress:](self, "setRebuildProgress:", v14);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_2;
  aBlock[3] = &unk_1E842D498;
  aBlock[4] = self;
  v25 = v13;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_3;
  v18[3] = &unk_1E842D4E8;
  v23 = a5;
  v19 = v10;
  v20 = self;
  v21 = _Block_copy(aBlock);
  v22 = v12;
  v15 = v12;
  v16 = v21;
  v17 = v10;
  -[PGManager performAsynchronousGraphBarrierUsingBlock:](self, "performAsynchronousGraphBarrierUsingBlock:", v18);

}

void __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_2(uint64_t a1, double a2)
{
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "rebuildProgress");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompletedUnitCount:", (int)(a2 * 10000.0));

}

void __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  v3 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_4;
  v6[3] = &unk_1E842D4C0;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(a2, "updateGraphWithRecipe:keepExistingGraph:progressBlock:completionBlock:", v4, v3, v5, v6);

}

void __102__PGManager_Analysis__startLibraryAnalysisWithRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setRebuildProgress:", 0);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id, id))(v8 + 16))(v8, a2, v9, v7);
  objc_msgSend(*(id *)(a1 + 32), "notifyCoalescingBlocksGraphAnalysisFinished:error:", a2, v9);

}

- (id)curatedKeyAssetForAssetCollection:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 curationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[PGManager curationManager](self, "curationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__33935;
  v31 = __Block_byref_object_dispose__33936;
  v32 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __104__PGManager_Curation__curatedKeyAssetForAssetCollection_curatedAssetCollection_options_curationContext___block_invoke;
  v21[3] = &unk_1E842D5B0;
  v26 = &v27;
  v15 = v14;
  v22 = v15;
  v16 = v10;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v21);
  objc_msgSend(v15, "curatedKeyAssetForAssetCollection:curatedAssetCollection:options:criteria:curationContext:", v16, v11, v17, v28[5], v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v27, 8);
  return v19;
}

- (double)graphScoreForMoment:(id)a3
{
  id v4;
  id v5;
  double v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PGManager_Curation__graphScoreForMoment___block_invoke;
  v8[3] = &unk_1E8435578;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (double)neighborScoreForMoment:(id)a3
{
  id v4;
  id v5;
  double v6;
  _QWORD v8[4];
  id v9;
  PGManager *v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PGManager_Curation__neighborScoreForMoment___block_invoke;
  v8[3] = &unk_1E842DCB8;
  v5 = v4;
  v10 = self;
  v11 = &v12;
  v9 = v5;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v8);
  v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (BOOL)isSmartInterestingForMoment:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  PGManager *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PGManager_Curation__isSmartInterestingForMoment___block_invoke;
  v7[3] = &unk_1E842DCB8;
  v5 = v4;
  v9 = self;
  v10 = &v11;
  v8 = v5;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (BOOL)isInterestingForMoment:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  PGManager *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PGManager_Curation__isInterestingForMoment___block_invoke;
  v7[3] = &unk_1E842DCB8;
  v5 = v4;
  v9 = self;
  v10 = &v11;
  v8 = v5;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (id)curationDebugInformationForAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PGCurationOptions *v17;
  void *v18;
  uint64_t v19;
  _BOOL8 v20;
  void *v21;
  int v22;
  _BOOL8 v23;
  PGKeyCurator *v24;
  void *v25;
  void *v26;
  PGKeyCurator *v27;
  id v28;
  void *v29;
  void *v30;
  PGKeyAssetCurationOptions *v31;
  void *v32;
  void *v33;
  PGCurator_PHAsset *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  PGCurationOptions *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  PGCurator_PHAsset *v56;
  void *v57;
  void *v58;
  PGCurationOptions *v59;
  void *v60;
  void *v61;
  id v63;
  void *context;
  id v65;
  PGCurator_PHAsset *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  id v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v72 = a4;
  v71 = a5;
  v73 = v8;
  v9 = objc_msgSend(v8, "assetCollectionType");
  if (v9 == 6)
  {
    -[PGManager _curationDebugInformationForHighlight:options:](self, "_curationDebugInformationForHighlight:options:", v8, v72);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v9;
    objc_msgSend(v8, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addFetchPropertySets:", v14);

    objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPersonsPrefetchMode:", 2);
    objc_msgSend(v15, "setFaceInformationPrefetchMode:", 2);
    v68 = v15;
    v69 = v13;
    objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v8, v13, v15, v71);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", 12);
    objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("includeAllFaces"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v18;
    if (v18)
      v19 = objc_msgSend(v18, "BOOLValue");
    else
      v19 = 1;
    -[PGCurationOptions setIncludesAllFaces:](v17, "setIncludesAllFaces:", v19);
    v20 = v11 == 4
       && -[PGManager _supportsSemanticalDedupingForMemory:](self, "_supportsSemanticalDedupingForMemory:", v8);
    -[PGCurationOptions setSemanticalDedupingEnabled:](v17, "setSemanticalDedupingEnabled:", v20);
    -[PGCurationOptions setMovieDedupingEnabled:](v17, "setMovieDedupingEnabled:", v11 == 4);
    objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("includeKeyAsset"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22)
    {
      v23 = v11 == 4;
      v24 = [PGKeyCurator alloc];
      -[PGManager curationManager](self, "curationManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "curationCriteriaFactory");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[PGKeyCurator initWithCurationCriteriaFactory:](v24, "initWithCurationCriteriaFactory:", v26);

      v28 = objc_alloc(MEMORY[0x1E0D4B140]);
      objc_msgSend(v16, "allItems");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithItems:", v29);

      v31 = objc_alloc_init(PGKeyAssetCurationOptions);
      -[PGKeyAssetCurationOptions setIsForMemories:](v31, "setIsForMemories:", v23);
      -[PGKeyCurator keyItemWithFeeder:options:criteria:debugInfo:progressBlock:](v27, "keyItemWithFeeder:options:criteria:debugInfo:progressBlock:", v16, v31, 0, v30, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "dictionaryRepresentationWithAppendExtraItemInfoBlock:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v33, CFSTR("keyAsset"));

    }
    v34 = objc_alloc_init(PGCurator_PHAsset);
    -[PGManager curationManager](self, "curationManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "curationLoggingConnection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCurator setLoggingConnection:](v34, "setLoggingConnection:", v36);

    objc_msgSend(v16, "allItems");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B140]), "initWithItems:", v37);
    -[PGCurator_PHAsset bestAssetsForFeeder:options:debugInfo:progressBlock:](v34, "bestAssetsForFeeder:options:debugInfo:progressBlock:", v16, v17, v38, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      v65 = v39;
      context = (void *)MEMORY[0x1CAA4EB2C]();
      v66 = v34;
      v40 = objc_alloc_init(MEMORY[0x1E0D77E18]);
      objc_msgSend(v8, "photoLibrary");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "librarySpecificFetchOptions");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v77[0] = *MEMORY[0x1E0CD1B50];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setFetchPropertySets:", v43);

      objc_msgSend(v42, "setIncludedDetectionTypes:", &unk_1E84E9C88);
      objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v37, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __90__PGManager_Curation__curationDebugInformationForAssetCollection_options_curationContext___block_invoke;
      v74[3] = &unk_1E842D5F8;
      v75 = v40;
      v76 = v44;
      v45 = v44;
      v63 = v40;
      objc_msgSend(v38, "dictionaryRepresentationWithAppendExtraItemInfoBlock:", v74);
      v46 = v16;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v47, "mutableCopy");
      -[PGCurationOptions dictionaryRepresentation](v17, "dictionaryRepresentation");
      v49 = v17;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v50, CFSTR("curationOptions"));

      v17 = v49;
      v34 = v66;
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v48, CFSTR("summary"));

      v16 = v46;
      objc_autoreleasePoolPop(context);
      v39 = v65;
    }

    v51 = objc_alloc(MEMORY[0x1E0D4B140]);
    objc_msgSend(v16, "allItems");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v51, "initWithItems:", v52);

    v54 = (void *)-[PGCurationOptions copy](v17, "copy");
    objc_msgSend(v54, "setDuration:", 16);
    objc_msgSend(v54, "setFocusOnInterestingItems:", 0);
    -[PGCurator_PHAsset bestAssetsForFeeder:options:debugInfo:progressBlock:](v34, "bestAssetsForFeeder:options:debugInfo:progressBlock:", v16, v54, v53, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v70;
    if (v55)
    {
      objc_msgSend(v53, "dictionaryRepresentationWithAppendExtraItemInfoBlock:", 0);
      v56 = v34;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend(v57, "mutableCopy");
      objc_msgSend(v54, "dictionaryRepresentation");
      v59 = v17;
      v60 = v16;
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v61, CFSTR("curationOptions"));

      v16 = v60;
      v17 = v59;
      objc_msgSend(v70, "setObject:forKeyedSubscript:", v58, CFSTR("extended"));

      v34 = v56;
    }

  }
  return v10;
}

- (id)_curationDebugInformationForHighlight:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  PGHighlightTailor *v8;
  void *v9;
  PGHighlightTailor *v10;
  void *v11;
  uint64_t v12;
  PGDejunkerDeduperOptions *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  PGCompleteEnrichmentProfile *v25;
  id v26;
  void *v27;
  PGHighlightTailor *v28;
  void *v29;
  PGCompleteEnrichmentProfile *v30;
  PGHighlightTailorHighlightInfo *v31;
  void *v32;
  PGHighlightTailorHighlightInfo *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  id v40;
  void *v41;
  PGDejunkerDeduperOptions *v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  PGHighlightTailor *v50;
  id v51;
  id v52;
  id v53;
  PGManager *v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [PGHighlightTailor alloc];
  -[PGManager workingContextForEnrichment](self, "workingContextForEnrichment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PGHighlightTailor initWithWorkingContext:](v8, "initWithWorkingContext:", v9);

  -[PGHighlightTailor bestEnrichmentProfileForHighlight:options:](v10, "bestEnrichmentProfileForHighlight:options:", v6, 255);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCollectsDebugInfo:", 1);
  if (v11)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("extendedCurationOptions"));
    v12 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v12;
    if (v12)
      v13 = -[PGDejunkerDeduperOptions initWithDictionaryRepresentation:]([PGDejunkerDeduperOptions alloc], "initWithDictionaryRepresentation:", v12);
    else
      v13 = 0;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("setGlobally"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      -[PGDejunkerDeduperOptions dictionaryRepresentationRestrictingToGlobalOptions:](v13, "dictionaryRepresentationRestrictingToGlobalOptions:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGUserDefaults setExtendedCurationOptions:](PGUserDefaults, "setExtendedCurationOptions:", v17);

    }
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PGManager photoLibrary](self, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManager serviceManager](self, "serviceManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManager enrichmentLoggingConnection](self, "enrichmentLoggingConnection");
    v42 = v13;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __69__PGManager_Curation___curationDebugInformationForHighlight_options___block_invoke;
    v45[3] = &unk_1E842D640;
    v46 = v19;
    v47 = v20;
    v48 = v21;
    v49 = v7;
    v50 = v10;
    v22 = v6;
    v51 = v22;
    v52 = v11;
    v23 = v18;
    v53 = v23;
    v54 = self;
    v41 = v11;
    v24 = v21;
    v40 = v20;
    v39 = v19;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v45);
    v25 = [PGCompleteEnrichmentProfile alloc];
    -[PGManager curationManager](self, "curationManager");
    v44 = v7;
    v26 = v6;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManager enrichmentLoggingConnection](self, "enrichmentLoggingConnection");
    v28 = v10;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PGDefaultEnrichmentProfile initWithCurationManager:loggingConnection:](v25, "initWithCurationManager:loggingConnection:", v27, v29);

    -[PGDefaultEnrichmentProfile setCollectsDebugInfo:](v30, "setCollectsDebugInfo:", 1);
    v31 = [PGHighlightTailorHighlightInfo alloc];
    -[PGManager serviceManager](self, "serviceManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PGHighlightTailorHighlightInfo initWithHighlight:serviceManager:loggingConnection:](v31, "initWithHighlight:serviceManager:loggingConnection:", v22, v32, v24);

    -[PGHighlightTailorHighlightInfo setPromotionScore:](v33, "setPromotionScore:", 0.4);
    -[PGDefaultEnrichmentProfile summaryCurationWithHighlightInfo:sharingFilter:progressBlock:](v30, "summaryCurationWithHighlightInfo:sharingFilter:progressBlock:", v33, 2, &__block_literal_global_306);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGDefaultEnrichmentProfile debugInfos](v30, "debugInfos");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("curation"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v36, CFSTR("onDemandCuration"));

    v10 = v28;
    v6 = v26;
    v7 = v44;

    v14 = v23;
    v11 = v41;

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "uuid");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v38;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not find enrichment profile for highlight %@", buf, 0xCu);

    }
    v14 = (id)MEMORY[0x1E0C9AA70];
  }

  return v14;
}

- (BOOL)_supportsSemanticalDedupingForMemory:(id)a3
{
  uint64_t v3;
  BOOL v4;

  v3 = objc_msgSend(a3, "subcategory");
  v4 = v3 != 401;
  if (v3 == 217)
    v4 = 0;
  return v3 != 212 && v4;
}

void __69__PGManager_Curation___curationDebugInformationForHighlight_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  PGHighlightTailorContext *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
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
  void *v34;
  void *v35;
  PGHighlightTailorContext *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[3];
  _QWORD v44[3];
  _BYTE v45[128];
  _QWORD v46[3];
  _QWORD v47[5];

  v47[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PGHighlightTailorContext initWithPhotoLibrary:graph:serviceManager:loggingConnection:]([PGHighlightTailorContext alloc], "initWithPhotoLibrary:graph:serviceManager:loggingConnection:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("includeCuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    v7 = 1073742079;
  else
    v7 = 1073742063;
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("includeKeyAsset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
    v10 = v7;
  else
    v10 = v7 & 0x400000F7;
  objc_msgSend(*(id *)(a1 + 64), "enrichmentValuesForHighlight:usingEnrichmentProfile:graph:options:reportChangedValuesOnly:highlightTailorContext:progressBlock:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v3, v10, 1, v4, &__block_literal_global_296);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 80), "debugInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEntriesFromDictionary:", v13);

  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("includeDetailedHighlightInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "BOOLValue");

  if ((_DWORD)v13)
  {
    v35 = v11;
    v36 = v4;
    v38 = v3;
    v46[0] = CFSTR("startDate");
    objc_msgSend(*(id *)(a1 + 72), "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v15;
    v46[1] = CFSTR("endDate");
    objc_msgSend(*(id *)(a1 + 72), "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v16;
    v46[2] = CFSTR("estimatedAssetCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 72), "estimatedAssetCount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "setObject:forKeyedSubscript:", v18, CFSTR("detailedHighlightInfo"));

    objc_msgSend(*(id *)(a1 + 96), "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "librarySpecificFetchOptions");
    v20 = objc_claimAutoreleasedReturnValue();

    v37 = a1;
    v34 = (void *)v20;
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsInHighlight:options:", *(_QWORD *)(a1 + 72), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v43[0] = CFSTR("startDate");
          objc_msgSend(v28, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = v29;
          v43[1] = CFSTR("endDate");
          objc_msgSend(v28, "endDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v44[1] = v30;
          v43[2] = CFSTR("estimatedAssetCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v28, "estimatedAssetCount"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v44[2] = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "uuid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, v33);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v25);
    }

    objc_msgSend(*(id *)(v37 + 88), "setObject:forKeyedSubscript:", v22, CFSTR("momentsInHighlightInfo"));
    v3 = v38;
    v11 = v35;
    v4 = v36;
  }

}

void __90__PGManager_Curation__curationDebugInformationForAssetCollection_options_curationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t i;
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
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  _QWORD v83[2];
  _QWORD v84[2];
  _BYTE v85[128];
  _QWORD v86[2];
  _QWORD v87[4];
  CLLocationCoordinate2D v88;

  v87[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "curationScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("persistedCurationScore"));

  objc_msgSend(v5, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("creationDate"));

  objc_msgSend(v5, "localCreationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("localCreationDate"));

  objc_msgSend(v5, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v11;
  if (v11)
  {
    objc_msgSend(v11, "coordinate");
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v13 = *MEMORY[0x1E0C9E500];
    v15 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }
  v88.latitude = v13;
  v88.longitude = v15;
  if (CLLocationCoordinate2DIsValid(v88))
  {
    v86[0] = CFSTR("latitude");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = CFSTR("longitude");
    v87[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("location"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E84EB5E0, CFSTR("location"));
  }
  objc_msgSend(v5, "clsSceneprint");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v82 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, &v82);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("sceneprint"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingVideo", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("isInterestingVideo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingLivePhoto"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("isInterestingLivePhoto"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingPanorama"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("isInterestingPanorama"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingSDOF"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("isInterestingSDOF"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInterestingHDR"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("isInterestingHDR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsHasInterestingAudioClassification"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("hasInterestingAudioClassification"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsHasCustomPlaybackVariation"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("hasCustomPlaybackVariation"));

  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsSharpnessScore");
  objc_msgSend(v28, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("sharpnessScore"));

  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsExposureScore");
  objc_msgSend(v30, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("exposureScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsBlurry"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("isBlurry"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsInhabited"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("isInhabited"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsHasInterestingScenes"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("hasInterestingScenes"));

  objc_msgSend(v5, "clsPersonLocalIdentifiers");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("peopleNames"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isVideo"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("isVideo"));

  +[PGCurationManager sceneInfoWithAsset:curationSession:](PGCurationManager, "sceneInfoWithAsset:curationSession:", v5, *(_QWORD *)(a1 + 32));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("scenes"));

  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsBehavioralScore");
  objc_msgSend(v38, "numberWithFloat:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("behavioralScore"));

  v40 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsInteractionScore");
  objc_msgSend(v40, "numberWithFloat:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("interactionScore"));

  v42 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsHighlightVisibilityScore");
  objc_msgSend(v42, "numberWithDouble:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("highlightVisibilityScore"));

  v44 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsAutoplaySuggestionScore");
  objc_msgSend(v44, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, CFSTR("autoplaySuggestionScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isShinyGem"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, CFSTR("isShinyGem"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isRegularGem"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, CFSTR("isRegularGem"));

  v48 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsFaceScore");
  objc_msgSend(v48, "numberWithDouble:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("faceScore"));

  v50 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsDuration");
  objc_msgSend(v50, "numberWithDouble:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v51, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsNonMemorable"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v52, CFSTR("isNonMemorable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsLoopOrBounce"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, CFSTR("isLoopOrBounce"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "clsIsLongExposure"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("isLongExposure"));

  v55 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "clsSquareCropScore");
  objc_msgSend(v55, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v56, CFSTR("squareCropScore"));

  objc_msgSend(v5, "clsFaceInformationSummary");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "dictionaryRepresentation");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v6;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("faceInformationSummary"));

  v59 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v60 = *(void **)(a1 + 40);
  v77 = v5;
  objc_msgSend(v5, "localIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectForKeyedSubscript:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v64; ++i)
      {
        if (*(_QWORD *)v79 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v67, "personLocalIdentifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (v68)
        {
          objc_msgSend(v67, "faceClusteringProperties");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "faceprint");
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          if (v70)
          {
            v83[0] = CFSTR("faceprintData");
            objc_msgSend(v70, "faceprintData");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v83[1] = CFSTR("faceprintVersion");
            v84[0] = v71;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v70, "faceprintVersion"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v84[1] = v72;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setObject:forKeyedSubscript:", v73, v68);

          }
        }

      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    }
    while (v64);
  }

  objc_msgSend(v76, "setObject:forKeyedSubscript:", v59, CFSTR("faceprints"));
}

void __46__PGManager_Curation__isInterestingForMoment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "isInteresting");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "graphLoggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

void __51__PGManager_Curation__isSmartInterestingForMoment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "isSmartInteresting");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "graphLoggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

void __46__PGManager_Curation__neighborScoreForMoment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  PGNeighborScoreComputer *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PGNeighborScoreComputer);
  objc_msgSend(v3, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PGNeighborScoreComputer neighborScoreWithMomentNode:](v4, "neighborScoreWithMomentNode:", v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "graphLoggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

void __43__PGManager_Curation__graphScoreForMoment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    objc_msgSend(v6, "graphScore");
    v4 = v6;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }

}

void __104__PGManager_Curation__curatedKeyAssetForAssetCollection_curatedAssetCollection_options_curationContext___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = a1[5];
  objc_msgSend(a2, "graph");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "criteriaForKeyAssetCurationWithAssetCollection:graph:options:curationContext:", v4, v8, a1[6], a1[7]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[8] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (id)summaryCurationForHighlight:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  PGCurationManager *v13;
  void *v14;
  uint64_t v15;
  PGCompleteEnrichmentProfile *v16;
  PGHighlightTailorHighlightInfo *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint32_t denom;
  uint32_t numer;
  id v29;
  NSObject *v30;
  void *v31;
  os_signpost_id_t spid;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  double v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = MEMORY[0x1E0C81028];
  v5 = MEMORY[0x1E0C81028];
  v6 = v4;
  v7 = os_signpost_id_generate(v4);
  info = 0;
  mach_timebase_info(&info);
  v8 = v4;
  v9 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v7, "SummaryCuration", ", buf, 2u);
  }
  spid = v7;
  v10 = MEMORY[0x1E0C81028];

  v34 = mach_absolute_time();
  objc_msgSend(v3, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGManager graphServicesURLWithPhotoLibrary:](PGManager, "graphServicesURLWithPhotoLibrary:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = [PGCurationManager alloc];
  objc_msgSend(v3, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v12;
  v15 = -[PGCurationManager initWithPhotoLibrary:cacheURL:](v13, "initWithPhotoLibrary:cacheURL:", v14, v12);

  v35 = (void *)v15;
  v16 = -[PGDefaultEnrichmentProfile initWithCurationManager:loggingConnection:]([PGCompleteEnrichmentProfile alloc], "initWithCurationManager:loggingConnection:", v15, v10);
  v17 = -[PGHighlightTailorHighlightInfo initWithHighlight:serviceManager:loggingConnection:]([PGHighlightTailorHighlightInfo alloc], "initWithHighlight:serviceManager:loggingConnection:", v3, 0, v10);
  -[PGHighlightTailorHighlightInfo setPromotionScore:](v17, "setPromotionScore:", 0.4);
  -[PGDefaultEnrichmentProfile summaryCurationWithHighlightInfo:sharingFilter:progressBlock:](v16, "summaryCurationWithHighlightInfo:sharingFilter:progressBlock:", v17, 2, &__block_literal_global_33939);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v24), "uuid", spid);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v22);
  }

  v26 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v29 = MEMORY[0x1E0C81028];
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, spid, "SummaryCuration", ", buf, 2u);
  }
  v30 = MEMORY[0x1E0C81028];

  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "SummaryCuration";
    v44 = 2048;
    v45 = (float)((float)((float)((float)(v26 - v34) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  v31 = (void *)MEMORY[0x1E0C81028];
  return v19;
}

- (id)momentLocalIdentifiersInDateInterval:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PGManager_KnowledgeSPI__momentLocalIdentifiersInDateInterval_error___block_invoke;
  v12[3] = &unk_1E8435640;
  v13 = v5;
  v7 = v6;
  v14 = v7;
  v8 = v5;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)summaryOfInferencesPerMomentByLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  PGManager *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CD1670], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__36746;
  v23 = __Block_byref_object_dispose__36747;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__PGManager_KnowledgeSPI__summaryOfInferencesPerMomentByLocalIdentifiers_error___block_invoke;
  v15[3] = &unk_1E842DCB8;
  v12 = v6;
  v17 = self;
  v18 = &v19;
  v16 = v12;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v15);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (id)summaryOfInferencesPerMomentInDateInterval:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  PGManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__36746;
  v17 = __Block_byref_object_dispose__36747;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PGManager_KnowledgeSPI__summaryOfInferencesPerMomentInDateInterval_error___block_invoke;
  v9[3] = &unk_1E842DCB8;
  v6 = v5;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)_summaryOfInferencesForMomentNodes:(id)a3 inGraph:(id)a4
{
  objc_class *v5;
  id v6;
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
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[4];

  v68[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v55 = a4;
  v6 = a3;
  v54 = objc_alloc_init(v5);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v55);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", v6, v8, objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode publicEventOfMoment](PGGraphMomentNode, "publicEventOfMoment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adjacencyWithSources:relation:targetsClass:", v6, v10, objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v12;
  +[PGGraphROINode natureFilter](PGGraphROINode, "natureFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "relation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chain:", v15);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v6, v53, objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v17;
  +[PGGraphROINode mountainFilter](PGGraphROINode, "mountainFilter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "relation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chain:", v20);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v6, v51, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v23;
  +[PGGraphROINode beachFilter](PGGraphROINode, "beachFilter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "relation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "chain:", v26);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v6, v46, objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode frequentLocationOfMoment](PGGraphMomentNode, "frequentLocationOfMoment");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "adjacencyWithSources:relation:targetsClass:", v6, v29, objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode celebratedHolidayOfMoment](PGGraphMomentNode, "celebratedHolidayOfMoment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "adjacencyWithSources:relation:targetsClass:", v6, v32, objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke;
  v56[3] = &unk_1E842DCE0;
  v57 = v45;
  v58 = v27;
  v59 = v21;
  v60 = v52;
  v61 = v30;
  v62 = v33;
  v63 = v47;
  v64 = v49;
  v65 = v34;
  v35 = v34;
  v50 = v49;
  v48 = v47;
  v36 = v33;
  v37 = v30;
  v38 = v52;
  v39 = v21;
  v40 = v27;
  v41 = v45;
  objc_msgSend(v6, "enumerateNodesSortedByFloatPropertyForName:usingBlock:", CFSTR("utcs"), v56);

  objc_msgSend(v54, "setObject:forKeyedSubscript:", v35, CFSTR("events"));
  objc_msgSend(v55, "infoNode");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "creationDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setObject:forKeyedSubscript:", v43, CFSTR("graphCreationDate"));

  return v54;
}

- (BOOL)suggestsToStartSharedLibraryWithError:(id *)a3
{
  void *v3;
  BOOL v4;

  -[PGManager suggestedPersonsForSharedLibraryParticipants](self, "suggestedPersonsForSharedLibraryParticipants", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

void __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
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
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v29 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v29, "hasMeanings"))
  {
    objc_msgSend(v29, "meaningLabelsIncludingParents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

  }
  if (objc_msgSend(v29, "isTrip"))
    objc_msgSend(v4, "addObject:", CFSTR("trip"));
  if (objc_msgSend(v29, "petIsPresent"))
    objc_msgSend(v4, "addObject:", CFSTR("pet"));
  v6 = objc_msgSend(v29, "identifier");
  objc_msgSend(*(id *)(a1 + 32), "targetsForSourceIdentifier:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count"))
    objc_msgSend(v4, "addObject:", CFSTR("nature"));
  objc_msgSend(*(id *)(a1 + 40), "targetsForSourceIdentifier:", v6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count"))
    objc_msgSend(v4, "addObject:", CFSTR("beach"));
  objc_msgSend(*(id *)(a1 + 48), "targetsForSourceIdentifier:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "count"))
    objc_msgSend(v4, "addObject:", CFSTR("mountain"));
  if (objc_msgSend(v29, "happensPartiallyAtHomeOfPersonNodes:", *(_QWORD *)(a1 + 56)))
    objc_msgSend(v4, "addObject:", CFSTR("home"));
  if (objc_msgSend(v29, "happensPartiallyAtWorkOfPersonNodes:", *(_QWORD *)(a1 + 56)))
    objc_msgSend(v4, "addObject:", CFSTR("work"));
  objc_msgSend(*(id *)(a1 + 64), "targetsForSourceIdentifier:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
    objc_msgSend(v4, "addObject:", CFSTR("frequentLocation"));
  objc_msgSend(*(id *)(a1 + 72), "targetsForSourceIdentifier:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "holidayNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("holidays"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 80), "targetsForSourceIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke_2;
  v33[3] = &unk_1E8432110;
  v12 = v9;
  v34 = v12;
  v23 = v10;
  objc_msgSend(v10, "enumerateNodesUsingBlock:", v33);
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("publicEvents"));
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 88), "targetsForSourceIdentifier:", objc_msgSend(v29, "identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  v30[1] = 3221225472;
  v30[2] = __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke_3;
  v30[3] = &unk_1E8435398;
  v15 = v4;
  v31 = v15;
  v16 = v13;
  v32 = v16;
  objc_msgSend(v14, "enumerateNodesUsingBlock:", v30);
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("persons"));
  v17 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v29, "universalStartDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "universalEndDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:", v18, v19);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("eventUniversalDateInterval"));
  objc_msgSend(v29, "localIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("localIdentifier"));

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("inferences"));

  }
  objc_msgSend(*(id *)(a1 + 96), "addObject:", v3);

}

void __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  objc_msgSend(v11, "performers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("performers"));

  }
  objc_msgSend(v11, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "businessNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "businessNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("venue"));

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __70__PGManager_KnowledgeSPI___summaryOfInferencesForMomentNodes_inGraph___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v8 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("localIdentifier"));
  objc_msgSend(v8, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("contactIdentifier"));
  objc_msgSend(v8, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("name"));
  if ((objc_msgSend(v8, "isMemberOfMyFamily") & 1) != 0)
  {
    v7 = CFSTR("confirmed");
  }
  else
  {
    if (!objc_msgSend(v8, "isInferredMemberOfMyFamily"))
      goto LABEL_12;
    v7 = CFSTR("inferred");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("family"));
LABEL_12:
  if (objc_msgSend(v8, "ageCategory") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("baby"));
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __76__PGManager_KnowledgeSPI__summaryOfInferencesPerMomentInDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "graph");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodesInUniversalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesInUniversalDateInterval:inGraph:", *(_QWORD *)(a1 + 32), v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_summaryOfInferencesForMomentNodes:inGraph:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __80__PGManager_KnowledgeSPI__summaryOfInferencesPerMomentByLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "graph");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", *(_QWORD *)(a1 + 32), v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_summaryOfInferencesForMomentNodes:inGraph:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __70__PGManager_KnowledgeSPI__momentLocalIdentifiersInDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "graph");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodesInUniversalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesInUniversalDateInterval:inGraph:", *(_QWORD *)(a1 + 32), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PGManager_KnowledgeSPI__momentLocalIdentifiersInDateInterval_error___block_invoke_2;
  v5[3] = &unk_1E8436408;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateNodesSortedByFloatPropertyForName:usingBlock:", CFSTR("utcs"), v5);

}

void __70__PGManager_KnowledgeSPI__momentLocalIdentifiersInDateInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (double)libraryDuration
{
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__PGManager_MoodKeywords__libraryDuration__block_invoke;
  v4[3] = &unk_1E84355C8;
  v4[4] = &v5;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __42__PGManager_MoodKeywords__libraryDuration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  objc_msgSend(a2, "graph");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryDuration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;

}

- (id)musicCuratorContextWithRecentlyUsedSongAdamIDs:(id)a3 error:(id *)a4
{
  id v6;
  PGManager *v7;
  void *v8;
  uint64_t v9;
  PGMusicCache *musicCache;
  void *v11;
  PGMusicBag *v12;
  uint64_t v13;
  void *v14;
  PGMusicCache *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (v7->_musicCache)
    goto LABEL_3;
  -[PGManager photoLibrary](v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMusicCache cacheWithPhotoLibrary:error:](PGMusicCache, "cacheWithPhotoLibrary:error:", v8, a4);
  v9 = objc_claimAutoreleasedReturnValue();
  musicCache = v7->_musicCache;
  v7->_musicCache = (PGMusicCache *)v9;

  if (v7->_musicCache)
  {
LABEL_3:
    -[PGManager musicBag](v7, "musicBag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = -[PGMusicBag initWithCache:]([PGMusicBag alloc], "initWithCache:", v7->_musicCache);
      -[PGManager setMusicBag:](v7, "setMusicBag:", v12);

    }
    if (+[PGUserDefaults musicCurationAllowExplicitMusicContent](PGUserDefaults, "musicCurationAllowExplicitMusicContent"))
    {
      v13 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      v13 = MEMORY[0x1E0C9AAA0];
    }
    -[PGManager photoLibrary](v7, "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7->_musicCache;
    -[PGManager musicBag](v7, "musicBag");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMusicCuratorContext contextWithPhotoLibrary:adamIDsWithNegativeUserFeedback:allowExplicitMusicContent:cache:musicBag:recentlyUsedSongs:genre:configuration:error:](PGMusicCuratorContext, "contextWithPhotoLibrary:adamIDsWithNegativeUserFeedback:allowExplicitMusicContent:cache:musicBag:recentlyUsedSongs:genre:configuration:error:", v14, 0, v13, v15, v16, 0, 0, 0, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v17, "recentlyUsedSongs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSongIDs:date:", v6, v19);

    }
  }
  else
  {
    v17 = 0;
  }
  objc_sync_exit(v7);

  return v17;
}

- (id)musicCuratorContextWithCurationOptions:(id)a3 error:(id *)a4
{
  id v6;
  PGManager *v7;
  void *v8;
  uint64_t v9;
  PGMusicCache *musicCache;
  void *v11;
  PGMusicBag *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PGMusicCache *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (v7->_musicCache)
    goto LABEL_3;
  -[PGManager photoLibrary](v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMusicCache cacheWithPhotoLibrary:error:](PGMusicCache, "cacheWithPhotoLibrary:error:", v8, a4);
  v9 = objc_claimAutoreleasedReturnValue();
  musicCache = v7->_musicCache;
  v7->_musicCache = (PGMusicCache *)v9;

  if (v7->_musicCache)
  {
LABEL_3:
    -[PGManager musicBag](v7, "musicBag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = -[PGMusicBag initWithCache:]([PGMusicBag alloc], "initWithCache:", v7->_musicCache);
      -[PGManager setMusicBag:](v7, "setMusicBag:", v12);

    }
    if (+[PGUserDefaults musicCurationAllowExplicitMusicContent](PGUserDefaults, "musicCurationAllowExplicitMusicContent"))
    {
      v13 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      v13 = MEMORY[0x1E0C9AAA0];
    }
    objc_msgSend(v6, "musicCurationSpecificationOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v6, "musicCurationSpecificationOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "genre");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v6, "useMemoryCreationMusicCuratorConfiguration"))
    {
      +[PGMusicCuratorConfigurationWrapper memoryCreationConfiguration](PGMusicCuratorConfigurationWrapper, "memoryCreationConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    -[PGManager photoLibrary](v7, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7->_musicCache;
    -[PGManager musicBag](v7, "musicBag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMusicCuratorContext contextWithPhotoLibrary:adamIDsWithNegativeUserFeedback:allowExplicitMusicContent:cache:musicBag:recentlyUsedSongs:genre:configuration:error:](PGMusicCuratorContext, "contextWithPhotoLibrary:adamIDsWithNegativeUserFeedback:allowExplicitMusicContent:cache:musicBag:recentlyUsedSongs:genre:configuration:error:", v17, 0, v13, v18, v19, 0, v14, v16, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGManager _recentlyUsedSongAdamIDsFromCurationOptions:](v7, "_recentlyUsedSongAdamIDsFromCurationOptions:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v20, "recentlyUsedSongs");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSongIDs:date:", v21, v23);

    }
    objc_msgSend(v20, "setUseOnlyMusicForTopicInTopPickSuggestions:", objc_msgSend(v6, "useOnlyMusicForTopicInTopPickSuggestions"));
    objc_msgSend(v20, "setAllowChillMixElection:", objc_msgSend(v6, "includeChillMixInMusicForYou"));
    objc_msgSend(v20, "setAllowGetUpMixElection:", objc_msgSend(v6, "includeGetUpMixInMusicForYou"));
    objc_msgSend(v20, "setRefreshSongMetadata:", objc_msgSend(v6, "shouldRefreshSongMetadata"));
    objc_msgSend(v20, "setForceShareableInBestSuggestions:", objc_msgSend(v6, "shouldForceShareableInBestSuggestions"));

  }
  else
  {
    v20 = 0;
  }
  objc_sync_exit(v7);

  return v20;
}

- (id)musicCurationInflationContextWithInflationOptions:(id)a3 error:(id *)a4
{
  id v6;
  PGManager *v7;
  void *v8;
  uint64_t v9;
  PGMusicCache *musicCache;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (v7->_musicCache)
    goto LABEL_3;
  -[PGManager photoLibrary](v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMusicCache cacheWithPhotoLibrary:error:](PGMusicCache, "cacheWithPhotoLibrary:error:", v8, a4);
  v9 = objc_claimAutoreleasedReturnValue();
  musicCache = v7->_musicCache;
  v7->_musicCache = (PGMusicCache *)v9;

  if (v7->_musicCache)
  {
LABEL_3:
    +[PGMusicCurationInflationOptions stringFromInflationActionSource:](PGMusicCurationInflationOptions, "stringFromInflationActionSource:", objc_msgSend(v6, "inflationActionSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMusicCurationInflationContext contextWithMusicCache:actionSource:shouldForceMetadataRefetch:](PGMusicCurationInflationContext, "contextWithMusicCache:actionSource:shouldForceMetadataRefetch:", v7->_musicCache, v11, objc_msgSend(v6, "shouldForceMetadataRefetch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_sync_exit(v7);

  return v12;
}

- (id)_recentlyUsedSongAdamIDsFromCurationOptions:(id)a3
{
  void *v4;
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
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = a3;
  objc_msgSend(v5, "recentlyUsedSongAdamIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "rootMemoryLocalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PGManager photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setIncludeLocalMemories:", 1);
    v11 = (void *)MEMORY[0x1E0CD1630];
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchAssetCollectionsWithLocalIdentifiers:options:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[PGKeySongExtractor appleMusicKeySongIDFromMemory:](PGKeySongExtractor, "appleMusicKeySongIDFromMemory:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v7, "addObject:", v15);

    }
  }
  objc_msgSend(v7, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  PGOneUpRelatedRequestHandler *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = -[PGOneUpRelatedRequestHandler initWithGraphManager:error:]([PGOneUpRelatedRequestHandler alloc], "initWithGraphManager:error:", self, 0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__46177;
  v18 = __Block_byref_object_dispose__46178;
  v19 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__PGManager_OneUpRelated__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke;
  v11[3] = &unk_1E842F4C0;
  v13 = &v14;
  v8 = v7;
  v12 = v8;
  -[PGOneUpRelatedRequestHandler requestAssetLocalIdentifiersTakenNearCoordinatesFromAssetLocalIdentifier:error:](v6, "requestAssetLocalIdentifiersTakenNearCoordinatesFromAssetLocalIdentifier:error:", v5, v11);
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  PGOneUpRelatedRequestHandler *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = -[PGOneUpRelatedRequestHandler initWithGraphManager:error:]([PGOneUpRelatedRequestHandler alloc], "initWithGraphManager:error:", self, 0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__46177;
  v18 = __Block_byref_object_dispose__46178;
  v19 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__PGManager_OneUpRelated__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke;
  v11[3] = &unk_1E842F4C0;
  v13 = &v14;
  v8 = v7;
  v12 = v8;
  -[PGOneUpRelatedRequestHandler requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:error:](v6, "requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:error:", v5, v11);
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __102__PGManager_OneUpRelated__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __104__PGManager_OneUpRelated__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)keywordsForAssetCollection:(id)a3 relatedType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = v6;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__47860;
  v19 = __Block_byref_object_dispose__47861;
  v20 = 0;
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__PGManager_Debug__keywordsForAssetCollection_relatedType___block_invoke;
    v11[3] = &unk_1E842F8A8;
    v12 = v6;
    v13 = &v15;
    v14 = a4;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v11);
    v8 = v12;
  }
  else
  {
    v8 = 0;
    v20 = (id)MEMORY[0x1E0C9AA70];
  }

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)keywordsForMomentNodeName:(id)a3 relatedType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = v6;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__47860;
  v19 = __Block_byref_object_dispose__47861;
  v20 = 0;
  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PGManager_Debug__keywordsForMomentNodeName_relatedType___block_invoke;
    v11[3] = &unk_1E842F8A8;
    v12 = v6;
    v13 = &v15;
    v14 = a4;
    -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v11);
    v8 = v12;
  }
  else
  {
    v8 = 0;
    v20 = (id)MEMORY[0x1E0C9AA70];
  }

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)keywordsForAsset:(id)a3 relatedType:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__47860;
  v18 = __Block_byref_object_dispose__47861;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PGManager_Debug__keywordsForAsset_relatedType___block_invoke;
  v10[3] = &unk_1E842F8A8;
  v7 = v6;
  v11 = v7;
  v12 = &v14;
  v13 = a4;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)UUIDForMoment:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__47860;
  v15 = __Block_byref_object_dispose__47861;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__PGManager_Debug__UUIDForMoment___block_invoke;
  v8[3] = &unk_1E8435578;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (unsigned)identifierForMoment:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = *MEMORY[0x1E0D42A90];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PGManager_Debug__identifierForMoment___block_invoke;
  v7[3] = &unk_1E8435578;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v7);
  LODWORD(self) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return self;
}

- (id)graphAndAlgorithmVersionsWithGraph:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "infoNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Graph Date creation: %@\n"), v7);

  v8 = objc_msgSend(v4, "version");
  objc_msgSend(v5, "appendFormat:", CFSTR("Graph Version: %lu\n"), v8);
  objc_msgSend(v5, "appendFormat:", CFSTR("Graph Curation Algorithms Version: %lu\n"), objc_msgSend(v6, "curationAlgorithmsVersion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("Graph Memories Algorithms Version: %lu\n"), objc_msgSend(v6, "memoriesAlgorithmsVersion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("Graph Meanings Algorithms Version: %lu\n"), objc_msgSend(v6, "meaningAlgorithmsVersion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("Graph EventLabelingV2 Model Version: %ld\n"), objc_msgSend(v6, "eventLabelingV2ModelVersion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("Graph Personal Traits Entity Names Version: %ld\n"), objc_msgSend(v6, "personalTraitsEntityNamesVersion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("Graph Memories Algorithms Version: %lu\n"), objc_msgSend(v6, "memoriesAlgorithmsVersion"));

  return v5;
}

- (id)statisticsWithTypeStrings:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double Current;
  void *v13;
  id v14;
  double v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  id v22;
  _QWORD v23[4];
  id v24;
  PGManager *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v8 = 2;
    goto LABEL_64;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, buf, 16);
  if (v6)
  {
    v7 = v6;
    v22 = v4;
    v8 = 0;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("default")))
          v8 |= 2uLL;
        v8 |= objc_msgSend(v11, "isEqualToString:", CFSTR("diagnostics"));
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("verbose")))
          v8 |= 4uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("mood")))
          v8 |= 8uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("title")))
          v8 |= 0x10uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("highlighttitle")))
          v8 |= 0x1000000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("mobility")))
          v8 |= 0x20uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("interesting")))
          v8 |= 0x40uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("partofday")))
          v8 |= 0x80uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("highlightestimates")))
          v8 |= 0x100uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("relationships")))
          v8 |= 0x800uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("relationshipsdebug")))
          v8 |= 0x1000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("dayofweek")))
          v8 |= 0x8000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("publicevents")))
          v8 |= 0x2000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("businessitems")))
          v8 |= 0x4000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("poi")))
          v8 |= 0x2000000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("locations")))
          v8 |= 0x10000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("languages")))
          v8 |= 0x8000000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("pets")))
          v8 |= 0x20000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("behavioral")))
          v8 |= 0x400000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("music")))
          v8 |= 0x200000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("domainlabelcounts")))
          v8 |= 0x800000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("peopleattributes")))
          v8 |= 0x4000000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("socialgroups")))
          v8 |= 0x10000000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("socialgroupsdebug")))
          v8 |= 0x20000000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("sharedlibrary")))
          v8 |= 0x40000000uLL;
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("entityTags")))
          v8 |= 0xFFFFFFFF80000000;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, buf, 16);
    }
    while (v7);

    if (v8 == 4)
    {
      v8 = 6;
      v4 = v22;
LABEL_64:

LABEL_65:
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __46__PGManager_Debug__statisticsWithTypeStrings___block_invoke;
      v23[3] = &unk_1E842F8D0;
      v14 = v13;
      v25 = self;
      v26 = v8;
      v24 = v14;
      -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v23);
      v15 = CFAbsoluteTimeGetCurrent();
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "loggingConnection");
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v32 = (v15 - Current) * 1000.0;
        _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Generating statistics took %.2f ms", buf, 0xCu);
      }

      v18 = v14;
      v19 = (__CFString *)v18;
      goto LABEL_73;
    }

    v4 = v22;
    if (v8)
      goto LABEL_65;
  }
  else
  {

  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "loggingConnection");
  v18 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v32 = *(double *)&v5;
    _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "No valid type specified for statistics. Input: \"%@\", buf, 0xCu);
  }
  v19 = &stru_1E8436F28;
LABEL_73:

  return v19;
}

- (id)_defaultStatisticsWithGraph:(id)a3 verbose:(BOOL)a4 forDiagnostics:(BOOL)a5
{
  unsigned int v5;
  unsigned int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t mm;
  void *v29;
  void *v30;
  unsigned int v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t m;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  id v98;
  os_signpost_id_t v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t ii;
  void *v109;
  void *v110;
  void *v111;
  unint64_t jj;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t kk;
  NSObject *v122;
  void *v123;
  void *v124;
  char v125;
  const __CFString *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t nn;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  const __CFString *v141;
  uint64_t v142;
  void *v143;
  __CFString *v144;
  uint64_t v145;
  const __CFString *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t i1;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  PGTitleGenerationContext *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t i2;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  double v201;
  double v202;
  double v203;
  void *v204;
  int v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  _BOOL4 v210;
  void *v211;
  void *v212;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t i3;
  uint64_t v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  unint64_t v225;
  void *v226;
  id v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t i4;
  uint64_t v231;
  void *v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t i5;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  void *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  uint64_t v256;
  void *v257;
  uint64_t v258;
  void *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  PGNeighborScoreComputer *v285;
  void *v286;
  uint64_t v287;
  PGNeighborScoreComputer *v288;
  void *v289;
  id v290;
  uint64_t v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  id v302;
  void *v303;
  void *v304;
  id v305;
  id v306;
  void *v307;
  void *v308;
  id v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  id v315;
  void *v316;
  id v317;
  id v318;
  uint64_t v320;
  uint32_t numer;
  uint32_t denom;
  id v323;
  NSObject *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  void *v331;
  void *v332;
  uint64_t v333;
  void *v334;
  void *spid;
  os_signpost_id_t spida;
  void *v337;
  unint64_t v338;
  unsigned int v339;
  uint64_t v340;
  void *v341;
  uint64_t v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  id v347;
  id v348;
  id v349;
  id v350;
  void *v351;
  PGEventLabelingConfiguration *v352;
  id v353;
  id v354;
  id v355;
  id v356;
  id v357;
  id v358;
  id v359;
  id v360;
  id obj;
  id obja;
  void *v363;
  PGTitleGenerationContext *v364;
  void *v365;
  id v366;
  id v367;
  uint64_t v368;
  void *v369;
  void *v370;
  uint64_t v371;
  id v372;
  unint64_t v373;
  void *v374;
  void *v375;
  unint64_t v376;
  void *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t n;
  uint64_t v381;
  id v382;
  id v383;
  char *v384;
  unsigned int v385;
  uint64_t v386;
  void *context;
  void *contexta;
  void *contextb;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  id v398;
  id v399;
  id v400;
  unint64_t v401;
  id v402;
  id v403;
  void *v404;
  _QWORD v405[4];
  id v406;
  _QWORD v407[4];
  id v408;
  _QWORD v409[4];
  id v410;
  _QWORD v411[4];
  id v412;
  _QWORD v413[4];
  id v414;
  _QWORD v415[4];
  id v416;
  _QWORD v417[4];
  id v418;
  _QWORD v419[4];
  PGNeighborScoreComputer *v420;
  _BYTE *v421;
  mach_timebase_info *v422;
  mach_timebase_info info;
  mach_timebase_info *p_info;
  uint64_t v425;
  uint64_t v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  _QWORD v455[4];
  id v456;
  id v457;
  void *v458;
  _QWORD v459[4];
  id v460;
  _QWORD v461[4];
  id v462;
  _QWORD v463[9];
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  _QWORD aBlock[9];
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  uint64_t v497;
  uint64_t *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t *v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t *v514;
  uint64_t v515;
  uint64_t v516;
  void *v517;
  void *v518;
  void *v519;
  _BYTE buf[32];
  void *v521;
  _BYTE v522[128];
  _BYTE v523[128];
  _BYTE v524[128];
  _BYTE v525[128];
  _BYTE v526[128];
  _BYTE v527[128];
  void *v528;
  _BYTE v529[128];
  _BYTE v530[128];
  _BYTE v531[128];
  _BYTE v532[128];
  _BYTE v533[128];
  void *v534;
  _BYTE v535[128];
  _BYTE v536[128];
  _BYTE v537[128];
  _BYTE v538[128];
  _QWORD v539[4];

  MEMORY[0x1E0C80A78](self);
  v385 = v5;
  v339 = v6;
  v365 = v7;
  v539[1] = *MEMORY[0x1E0C80C00];
  v348 = v8;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v365, "_checkConsistencyOfGraph:", v348);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "length"))
    objc_msgSend(v404, "appendFormat:", CFSTR("Critical - Graph has inconsistencies:\n%@\n\n"), v11);

  objc_autoreleasePoolPop(v9);
  objc_msgSend(v348, "infoNode");
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v345, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("Graph Date creation: %@\n"), v13);

  if (objc_msgSend(v345, "canUseLocationDomain"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v404, "appendFormat:", CFSTR("Can Use Domain Location: %@\n"), v14);
  if (objc_msgSend(v345, "canAccessContactsStore"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v404, "appendFormat:", CFSTR("Can Use Contacts Store: %@\n"), v15);
  objc_msgSend(v404, "appendFormat:", CFSTR("Graph Version: %lu\n"), objc_msgSend(v348, "version"));
  objc_autoreleasePoolPop(v12);
  v16 = objc_msgSend(v348, "nodesCount");
  v17 = objc_msgSend(v348, "edgesCount");
  v18 = v17;
  if (v16)
    v19 = (double)v17 / (double)v16;
  else
    v19 = 0.0;
  objc_msgSend(v404, "appendFormat:", CFSTR("Node Count: %lu\n"), v16);
  objc_msgSend(v404, "appendFormat:", CFSTR("Edge Count: %lu\n"), v18);
  objc_msgSend(v404, "appendFormat:", CFSTR("Average Edge by Node: %0.2f\n"), *(_QWORD *)&v19);
  v347 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v350 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v349 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v365, "photoLibrary");
  v346 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = "MusicKitRequestFactoryError";
  if ((v385 & 1) == 0)
  {
    obja = (id)MEMORY[0x1CAA4EB2C]();
    v513 = 0;
    v514 = &v513;
    v515 = 0x2020000000;
    v516 = 0;
    v509 = 0;
    v510 = &v509;
    v511 = 0x2020000000;
    v512 = 0;
    v505 = 0;
    v506 = &v505;
    v507 = 0x2020000000;
    v508 = 0;
    v501 = 0;
    v502 = &v501;
    v503 = 0x2020000000;
    v504 = 0;
    v497 = 0;
    v498 = &v497;
    v499 = 0x2020000000;
    v500 = 0;
    objc_msgSend(v346, "librarySpecificFetchOptions");
    contexta = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v539[0] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v539, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(contexta, "setSortDescriptors:", v54);

    objc_msgSend(contexta, "setChunkSizeForFetch:", 100);
    v393 = (void *)MEMORY[0x1CAA4EB2C](objc_msgSend(contexta, "setCacheSizeForFetch:", objc_msgSend(contexta, "chunkSizeForFetch")));
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, contexta);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v359 = (id)objc_msgSend(v55, "count");
    v56 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v496 = 0u;
    v495 = 0u;
    v494 = 0u;
    v493 = 0u;
    v399 = v55;
    v57 = objc_msgSend(v399, "countByEnumeratingWithState:objects:count:", &v493, v538, 16);
    if (v57)
    {
      v58 = *(_QWORD *)v494;
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v494 != v58)
            objc_enumerationMutation(v399);
          v60 = *(void **)(*((_QWORD *)&v493 + 1) + 8 * i);
          v61 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v60, "uuid");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v350, "addObject:", v62);

          objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsInHighlight:options:", v60, 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v492 = 0u;
          v491 = 0u;
          v490 = 0u;
          v489 = 0u;
          v64 = v63;
          v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v489, v537, 16);
          if (v65)
          {
            v66 = *(_QWORD *)v490;
            do
            {
              for (j = 0; j != v65; ++j)
              {
                if (*(_QWORD *)v490 != v66)
                  objc_enumerationMutation(v64);
                objc_msgSend(*(id *)(*((_QWORD *)&v489 + 1) + 8 * j), "uuid");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "addObject:", v68);

              }
              v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v489, v537, 16);
            }
            while (v65);
          }

          objc_autoreleasePoolPop(v61);
        }
        v57 = objc_msgSend(v399, "countByEnumeratingWithState:objects:count:", &v493, v538, 16);
      }
      while (v57);
    }

    v357 = (id)objc_msgSend(v56, "count");
    objc_autoreleasePoolPop(v393);
    v394 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000304, contexta);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v355 = (id)objc_msgSend(v69, "count");
    v70 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v488 = 0u;
    v487 = 0u;
    v486 = 0u;
    v485 = 0u;
    v400 = v69;
    v71 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v485, v536, 16);
    if (v71)
    {
      v72 = *(_QWORD *)v486;
      do
      {
        for (k = 0; k != v71; ++k)
        {
          if (*(_QWORD *)v486 != v72)
            objc_enumerationMutation(v400);
          v74 = *(void **)(*((_QWORD *)&v485 + 1) + 8 * k);
          v75 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v74, "uuid");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v349, "addObject:", v76);

          objc_msgSend(MEMORY[0x1E0CD1708], "fetchChildDayGroupHighlightsForHighlight:options:", v74, contexta);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v484 = 0u;
          v483 = 0u;
          v482 = 0u;
          v481 = 0u;
          v78 = v77;
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v481, v535, 16);
          if (v79)
          {
            v80 = *(_QWORD *)v482;
            do
            {
              for (m = 0; m != v79; ++m)
              {
                if (*(_QWORD *)v482 != v80)
                  objc_enumerationMutation(v78);
                objc_msgSend(*(id *)(*((_QWORD *)&v481 + 1) + 8 * m), "uuid");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "addObject:", v82);

              }
              v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v481, v535, 16);
            }
            while (v79);
          }

          objc_autoreleasePoolPop(v75);
        }
        v71 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v485, v536, 16);
      }
      while (v71);
    }

    v342 = objc_msgSend(v70, "count");
    objc_autoreleasePoolPop(v394);
    objc_msgSend(v346, "librarySpecificFetchOptions");
    v363 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v534 = v83;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v534, 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v363, "setSortDescriptors:", v84);

    objc_msgSend(v363, "setChunkSizeForFetch:", 100);
    objc_msgSend(v363, "setCacheSizeForFetch:", objc_msgSend(v363, "chunkSizeForFetch"));
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v363);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "firstObject");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "cls_localStartDateComponents");
    v353 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v85, "lastObject");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "cls_localEndDateComponents");
    v351 = (void *)objc_claimAutoreleasedReturnValue();

    v340 = objc_msgSend(v85, "count");
    objc_msgSend(v345, "topTierAestheticScore");
    v89 = v88;
    +[PGGraphBuilder topTierAestheticScoreForRatio:inPhotoLibrary:](PGGraphBuilder, "topTierAestheticScoreForRatio:inPhotoLibrary:", v346, 0.01);
    v91 = v90;
    objc_msgSend(v345, "topTierAestheticScoreForTripKeyAsset");
    v93 = v92;
    +[PGGraphBuilder topTierAestheticScoreForRatio:inPhotoLibrary:](PGGraphBuilder, "topTierAestheticScoreForRatio:inPhotoLibrary:", v346, 0.05);
    v95 = v94;
    objc_msgSend(v346, "librarySpecificFetchOptions");
    v370 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v370, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore > 0.0"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v370, "setInternalPredicate:", v96);

    objc_msgSend(v370, "setChunkSizeForFetch:", 1000);
    objc_msgSend(v370, "setCacheSizeForFetch:", 1000);
    v97 = MEMORY[0x1E0C81028];
    v98 = MEMORY[0x1E0C81028];
    v99 = os_signpost_id_generate(v97);
    v100 = v97;
    spida = v99;
    v338 = v99 - 1;
    if (v99 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_BEGIN, v99, "AssetScoreStatistics", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v333 = mach_absolute_time();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke;
    aBlock[3] = &unk_1E842F8F8;
    aBlock[4] = &v497;
    aBlock[5] = &v501;
    aBlock[6] = &v505;
    aBlock[7] = &v513;
    aBlock[8] = &v509;
    v101 = _Block_copy(aBlock);
    v390 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v346);
    v479 = 0u;
    v478 = 0u;
    v477 = 0u;
    v476 = 0u;
    v366 = v85;
    v102 = objc_msgSend(v366, "countByEnumeratingWithState:objects:count:", &v476, v533, 16);
    if (v102)
    {
      v378 = 0;
      v368 = *(_QWORD *)v477;
      do
      {
        for (n = 0; n != v102; ++n)
        {
          if (*(_QWORD *)v477 != v368)
            objc_enumerationMutation(v366);
          v382 = *(id *)(*((_QWORD *)&v476 + 1) + 8 * n);
          v374 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v382, "uuid");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v347, "addObject:", v103);

          objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v382, v370);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v376 = objc_msgSend(v104, "count");
          v475 = 0u;
          v474 = 0u;
          v473 = 0u;
          v472 = 0u;
          v105 = v104;
          v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v472, v532, 16);
          if (v106)
          {
            v107 = *(_QWORD *)v473;
            do
            {
              for (ii = 0; ii != v106; ++ii)
              {
                if (*(_QWORD *)v473 != v107)
                  objc_enumerationMutation(v105);
                (*((void (**)(void *, _QWORD, _QWORD))v101 + 2))(v101, *(_QWORD *)(*((_QWORD *)&v472 + 1) + 8 * ii), 0);
              }
              v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v472, v532, 16);
            }
            while (v106);
          }

          v97 = MEMORY[0x1E0C81028];
          v378 += v376;
          v373 = objc_msgSend(v382, "estimatedAssetCount");
          if (v376 < v373)
          {
            objc_msgSend(v346, "librarySpecificFetchOptions");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "setIncludeGuestAssets:", 1);
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore == 0.0"));
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "setInternalPredicate:", v110);

            +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "setFetchPropertySets:", v111);

            objc_msgSend(v109, "setChunkSizeForFetch:", 1000);
            objc_msgSend(v109, "setCacheSizeForFetch:", 1000);
            objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v382, v109);
            v395 = (void *)objc_claimAutoreleasedReturnValue();
            v401 = objc_msgSend(v395, "count");
            if (v401)
            {
              for (jj = 0; jj < v401; jj += 1000)
              {
                v113 = (void *)MEMORY[0x1CAA4EB2C]();
                if (v401 - jj >= 0x3E8)
                  v114 = 1000;
                else
                  v114 = v401 - jj;
                objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", jj, v114);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v395, "objectsAtIndexes:", v115);
                v116 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CD1390], "prefetchOnAssets:options:curationContext:", v116, 31, v390);
                v117 = v102;
                v471 = 0u;
                v470 = 0u;
                v469 = 0u;
                v468 = 0u;
                v118 = v116;
                v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v468, v531, 16);
                if (v119)
                {
                  v120 = *(_QWORD *)v469;
                  do
                  {
                    for (kk = 0; kk != v119; ++kk)
                    {
                      if (*(_QWORD *)v469 != v120)
                        objc_enumerationMutation(v118);
                      (*((void (**)(void *, _QWORD, uint64_t))v101 + 2))(v101, *(_QWORD *)(*((_QWORD *)&v468 + 1) + 8 * kk), 1);
                    }
                    v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v468, v531, 16);
                  }
                  while (v119);
                }

                v102 = v117;
                v97 = MEMORY[0x1E0C81028];

                objc_autoreleasePoolPop(v113);
              }
            }
            if (v401 + v376 != v373)
            {
              v122 = v97;
              if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)&buf[4] = v376;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v401;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v373;
                *(_WORD *)&buf[20] = 2112;
                *(_QWORD *)&buf[22] = v382;
                _os_log_error_impl(&dword_1CA237000, v97, OS_LOG_TYPE_ERROR, "Numbers of fetched assets with curation score %d and without curation score %d don't match expected number of assets %d for moment %@", buf, 0x1Eu);
              }

            }
            v378 += v401;
          }

          objc_autoreleasePoolPop(v374);
        }
        v102 = objc_msgSend(v366, "countByEnumeratingWithState:objects:count:", &v476, v533, 16);
      }
      while (v102);
    }
    else
    {
      v378 = 0;
    }

    v320 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v323 = MEMORY[0x1E0C81028];
    if (v338 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E0C81028]))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_SIGNPOST_INTERVAL_END, spida, "AssetScoreStatistics", ", buf, 2u);
    }

    v324 = v97;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AssetScoreStatistics";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v320 - v333) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    objc_msgSend(v404, "appendFormat:", CFSTR("Photo Count: %lu\n"), v378);
    objc_msgSend(v404, "appendFormat:", CFSTR("Moment Count: %lu\n"), v340);
    objc_msgSend(v404, "appendFormat:", CFSTR("Highlight Count: %lu, covering %lu moments\n"), v359, v357);
    objc_msgSend(v404, "appendFormat:", CFSTR("Highlight Group Count: %lu, covering %lu highlights\n"), v355, v342);
    objc_msgSend(v404, "appendFormat:", CFSTR("Date Range: %lu - %lu\n\n"), objc_msgSend(v353, "year"), objc_msgSend(v351, "year"));
    v325 = *((unsigned int *)v502 + 6);
    v326 = objc_msgSend(v345, "numberOfBetterAssets");
    v327 = *((unsigned int *)v506 + 6);
    v328 = objc_msgSend(v345, "numberOfImprovedAssets");
    v329 = *((unsigned int *)v510 + 6);
    v330 = objc_msgSend(v345, "numberOfDefaultAssets");
    objc_msgSend(v404, "appendFormat:", CFSTR("Assets Counts:\n\tBetter: %d (graph: %d)\n\tImproved: %d (graph: %d)\n\tDefault: %d (graph: %d)\n\tUtility: %d (graph: %d)\nTotal: %d (graph: %d)\n"), v325, v326, v327, v328, v329, v330, *((unsigned int *)v514 + 6), objc_msgSend(v345, "numberOfUtilityAssets"), v378, objc_msgSend(v345, "numberOfAssets"));
    objc_msgSend(v404, "appendFormat:", CFSTR("Current Graph Top-tier Aesthetic Score: %f\n"), v89);
    objc_msgSend(v404, "appendFormat:", CFSTR("Library Top-tier Aesthetic Score: %f\n\n"), v91);
    objc_msgSend(v404, "appendFormat:", CFSTR("Current Graph Top-tier Aesthetic Score for Trip Key Asset: %f\n"), v93);
    objc_msgSend(v404, "appendFormat:", CFSTR("Library Top-tier Aesthetic Score for Trip Key Asset: %f\n\n"), v95);

    _Block_object_dispose(&v497, 8);
    _Block_object_dispose(&v501, 8);
    _Block_object_dispose(&v505, 8);
    _Block_object_dispose(&v509, 8);
    _Block_object_dispose(&v513, 8);

    objc_autoreleasePoolPop(obja);
    v20 = "MusicKitRequestFactoryError";
  }
  v372 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v513 = 0;
  v514 = &v513;
  v21 = *((_QWORD *)v20 + 250);
  v515 = v21;
  v516 = 0;
  v509 = 0;
  v510 = &v509;
  v511 = v21;
  v512 = 0;
  v505 = 0;
  v506 = &v505;
  v507 = v21;
  v508 = 0;
  v501 = 0;
  v502 = &v501;
  v503 = v21;
  v504 = 0;
  v497 = 0;
  v498 = &v497;
  v499 = v21;
  v500 = 0;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v348, "momentNodesSortedByDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v398 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v467 = 0u;
  v466 = 0u;
  v465 = 0u;
  v464 = 0u;
  obj = v22;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v464, v530, 16);
  v25 = 0;
  v26 = 0;
  if (v24)
  {
    v27 = *(_QWORD *)v465;
    do
    {
      for (mm = 0; mm != v24; ++mm)
      {
        if (*(_QWORD *)v465 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v464 + 1) + 8 * mm);
        objc_msgSend(v29, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v372, "addObject:", v30);

        if (objc_msgSend(v29, "isInteresting"))
          objc_msgSend(v398, "addObject:", v29);
        if (objc_msgSend(v29, "isSmartInteresting"))
          objc_msgSend(v392, "addObject:", v29);
        v31 = objc_msgSend(v29, "isInterestingForMemories");
        objc_msgSend(v29, "contentScore");
        v33 = v32;
        v463[0] = MEMORY[0x1E0C809B0];
        v463[1] = 3221225472;
        v463[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_299;
        v463[3] = &unk_1E842F920;
        v463[4] = &v513;
        v463[5] = &v509;
        v463[6] = &v505;
        v463[7] = &v501;
        v463[8] = &v497;
        objc_msgSend(v29, "enumerateAddressEdgesAndNodesUsingBlock:", v463);
        v26 += v31;
        if (v33 < 0.5)
          ++v25;
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v464, v530, 16);
    }
    while (v24);
  }

  v34 = (void *)objc_msgSend(v398, "mutableCopy");
  objc_msgSend(v34, "intersectSet:", v392);
  v35 = (void *)objc_msgSend(v398, "mutableCopy");
  objc_msgSend(v35, "minusSet:", v392);
  v36 = (void *)objc_msgSend(v392, "mutableCopy");
  objc_msgSend(v36, "minusSet:", v398);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", obj);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minusSet:", v398);
  objc_msgSend(v37, "minusSet:", v392);
  objc_msgSend(v404, "appendFormat:", CFSTR("Moment nodes count: %lu\n"), v23);
  objc_msgSend(v404, "appendFormat:", CFSTR("\tInteresting: %.lu\n"), objc_msgSend(v398, "count"));
  objc_msgSend(v404, "appendFormat:", CFSTR("\tSmart: %.lu\n"), objc_msgSend(v392, "count"));
  objc_msgSend(v404, "appendFormat:", CFSTR("\tInteresting and smart: %.lu\n"), objc_msgSend(v34, "count"));
  objc_msgSend(v404, "appendFormat:", CFSTR("\tInteresting and not smart: %.lu\n"), objc_msgSend(v35, "count"));
  objc_msgSend(v404, "appendFormat:", CFSTR("\tSmart and not interesting: %.lu\n"), objc_msgSend(v36, "count"));
  objc_msgSend(v404, "appendFormat:", CFSTR("\tNot smart and not interesting: %.lu\n"), objc_msgSend(v37, "count"));
  objc_msgSend(v404, "appendFormat:", CFSTR("\tInteresting for Memories: %.lu\n"), v26);
  objc_msgSend(v404, "appendFormat:", CFSTR("\tJunk (contentScore < 0.5): %.lu\n\n"), v25);

  objc_autoreleasePoolPop(context);
  if ((v385 & 1) == 0)
  {
    v38 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v404, "appendFormat:", CFSTR("Graph <-> Library Matching\n"));
    v39 = (void *)objc_msgSend(v372, "mutableCopy");
    objc_msgSend(v39, "intersectSet:", v347);
    v40 = objc_msgSend(v39, "count");
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Moments: %lu\n"), objc_msgSend(v347, "count"));
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Moment nodes: %lu\n"), objc_msgSend(v372, "count"));
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Moment nodes matching moments: %lu\n"), v40);
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Moment nodes without moment: %lu\n"), objc_msgSend(v372, "count") - v40);
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Moments without moment nodes: %lu\n\n"), objc_msgSend(v347, "count") - v40);
    v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v42 = MEMORY[0x1E0C809B0];
    v461[0] = MEMORY[0x1E0C809B0];
    v461[1] = 3221225472;
    v461[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_2;
    v461[3] = &unk_1E842F948;
    v43 = v41;
    v462 = v43;
    objc_msgSend(v348, "enumerateDayHighlightNodesWithBlock:", v461);
    v44 = (void *)objc_msgSend(v43, "mutableCopy");
    objc_msgSend(v44, "intersectSet:", v350);
    v45 = objc_msgSend(v44, "count");
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlights: %lu\n"), objc_msgSend(v350, "count"));
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlight nodes: %lu\n"), objc_msgSend(v43, "count"));
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlight nodes matching highlights: %lu\n"), v45);
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlight nodes without highlights: %lu\n"), objc_msgSend(v43, "count") - v45);
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlights without highlight nodes: %lu\n\n"), objc_msgSend(v350, "count") - v45);
    v46 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v459[0] = v42;
    v459[1] = 3221225472;
    v459[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_3;
    v459[3] = &unk_1E842F970;
    v47 = v46;
    v460 = v47;
    objc_msgSend(v348, "enumerateHighlightGroupNodesWithBlock:", v459);
    v48 = (void *)objc_msgSend(v47, "mutableCopy");
    objc_msgSend(v48, "intersectSet:", v349);
    v49 = objc_msgSend(v48, "count");
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlight groups: %lu\n"), objc_msgSend(v349, "count"));
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlight group nodes: %lu\n"), objc_msgSend(v47, "count"));
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlight group nodes matching highlight groups: %lu\n"), v49);
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlight group nodes without highlight groups: %lu\n"), objc_msgSend(v47, "count") - v49);
    objc_msgSend(v404, "appendFormat:", CFSTR("\tNumber of Highlight groups without highlight group nodes: %lu\n\n"), objc_msgSend(v349, "count") - v49);

    objc_autoreleasePoolPop(v38);
  }
  objc_msgSend(v404, "appendFormat:", CFSTR("People: %lu\n"), objc_msgSend(v348, "numberOfPersonNodesIncludingMe:", 0));
  objc_msgSend(v365, "_socialGroupsStatistics:", v348);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("%@\n"), v50);

  objc_msgSend(v348, "meNode");
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v337, "localIdentifier");
  spid = (void *)objc_claimAutoreleasedReturnValue();
  if (v337)
  {
    objc_msgSend(v365, "_stringDescriptionForMeNode:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v404, "appendString:", v51);

    objc_msgSend(v348, "nodesForLabel:domain:", CFSTR("Me"), 300);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v455[0] = MEMORY[0x1E0C809B0];
    v455[1] = 3221225472;
    v455[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_4;
    v455[3] = &unk_1E8433768;
    v456 = v337;
    v457 = v404;
    v458 = v365;
    objc_msgSend(v52, "enumerateObjectsUsingBlock:", v455);

  }
  else
  {
    objc_msgSend(v404, "appendFormat:", CFSTR("No Me node!!!\n"));
  }
  objc_msgSend(v348, "meNode");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "inferredPersonNode");
  v341 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v341)
  {
    v126 = CFSTR("No Suggested Me node.\n\n");
    goto LABEL_101;
  }
  objc_msgSend(v341, "localIdentifier");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(spid, "isEqualToString:", v124);

  if ((v125 & 1) != 0)
  {
    v126 = CFSTR("### Suggested Me node matches Me node.\n\n");
LABEL_101:
    objc_msgSend(v404, "appendFormat:", v126);
    goto LABEL_105;
  }
  if (objc_msgSend(spid, "length"))
    objc_msgSend(v404, "appendFormat:", CFSTR("### Suggested Me node mismatch.\n\n"));
  objc_msgSend(v341, "localIdentifier");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "name");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v341, "contactIdentifier");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("Suggested Me node found: id:'%@', name:'%@', contact:'%@'\n\n"), v127, v128, v129);

LABEL_105:
  objc_msgSend(v365, "_dateFormatter");
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("Persons with age category child:\n"));
  objc_msgSend(v348, "personNodesIncludingMe:", 0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNode personSortDescriptors](PGGraphPersonNode, "personSortDescriptors");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "sortedArrayUsingDescriptors:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v454 = 0u;
  v453 = 0u;
  v452 = 0u;
  v451 = 0u;
  v360 = v132;
  v133 = objc_msgSend(v360, "countByEnumeratingWithState:objects:count:", &v451, v529, 16);
  if (v133)
  {
    v134 = *(_QWORD *)v452;
    do
    {
      for (nn = 0; nn != v133; ++nn)
      {
        if (*(_QWORD *)v452 != v134)
          objc_enumerationMutation(v360);
        v136 = *(void **)(*((_QWORD *)&v451 + 1) + 8 * nn);
        if (objc_msgSend(v136, "ageCategory") == 2)
        {
          objc_msgSend(v136, "birthdayDate");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          if (v137)
          {
            objc_msgSend(v391, "stringFromDate:", v137);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "name");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v404, "appendFormat:", CFSTR("\t%@, with birthday:%@\n"), v139, v138);

          }
          else
          {
            objc_msgSend(v136, "name");
            v140 = objc_claimAutoreleasedReturnValue();
            v138 = (void *)v140;
            if (v140)
              v141 = (const __CFString *)v140;
            else
              v141 = CFSTR("Unnamed child");
            objc_msgSend(v404, "appendFormat:", CFSTR("\t%@\n"), v141);
          }

        }
      }
      v133 = objc_msgSend(v360, "countByEnumeratingWithState:objects:count:", &v451, v529, 16);
    }
    while (v133);
  }

  v142 = objc_msgSend(v404, "appendString:", CFSTR("\n"));
  if ((v385 & 1) == 0)
  {
    v143 = (void *)MEMORY[0x1CAA4EB2C](v142);
    objc_msgSend(v365, "blockedFeatures");
    v144 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v145 = -[__CFString count](v144, "count");
    v146 = CFSTR("none");
    if (v145)
      v146 = v144;
    objc_msgSend(v404, "appendFormat:", CFSTR("Blocked Memory Features: %@\n\n"), v146);

    objc_autoreleasePoolPop(v143);
  }
  v147 = (void *)MEMORY[0x1CAA4EB2C](v142);
  objc_msgSend(v365, "_stringDescriptionForPeopleEventsWithGraph:", v348);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("%@\n"), v148);

  objc_autoreleasePoolPop(v147);
  v149 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = (void *)objc_opt_class();
  objc_msgSend(v150, "dateByAddingTimeInterval:", 604800.0);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v365, "serviceManager");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v365, "locationCache");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "_calendarEventsBetweenDate:andDate:atLocation:withPersonLocalIdentifiers:inPhotoLibrary:serviceManager:locationCache:", v152, v150, 0, 0, 0, v153, v154);
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v404, "appendFormat:", CFSTR("Number of significant calendar events in the past week: %d\n\n"), objc_msgSend(v155, "count"));
  objc_autoreleasePoolPop(v149);
  v396 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v348, "supersets");
  v402 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("\nSupersets: %zu\n"), objc_msgSend(v402, "count"));
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalDateInterval"), 1);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v528 = v156;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v528, 1);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v402, "sortedArrayUsingDescriptors:", v157);
  v158 = (void *)objc_claimAutoreleasedReturnValue();

  v450 = 0u;
  v449 = 0u;
  v448 = 0u;
  v447 = 0u;
  v159 = v158;
  v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v447, v527, 16);
  if (v160)
  {
    v161 = *(_QWORD *)v448;
    do
    {
      for (i1 = 0; i1 != v160; ++i1)
      {
        if (*(_QWORD *)v448 != v161)
          objc_enumerationMutation(v159);
        v163 = *(void **)(*((_QWORD *)&v447 + 1) + 8 * i1);
        objc_msgSend(v163, "addressNode");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "keywordDescription");
        v165 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v163, "universalStartDate");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v391, "stringFromDate:", v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v163, "universalEndDate");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v391, "stringFromDate:", v168);
        v169 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v163, "collection");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "momentNodes");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v404, "appendFormat:", CFSTR("\t%@ from %@ to %@ (%lu moments)\n"), v165, v167, v169, objc_msgSend(v171, "count"));

      }
      v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v447, v527, 16);
    }
    while (v160);
  }

  objc_autoreleasePoolPop(v396);
  v172 = [PGTitleGenerationContext alloc];
  objc_msgSend(v365, "serviceManager");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v364 = -[PGTitleGenerationContext initWithGraph:serviceManager:](v172, "initWithGraph:serviceManager:", v348, v173);

  v174 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v348, "longTripNodes");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v176;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf[8] = v177;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf[16] = v178;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v175, "sortedArrayUsingDescriptors:", v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v404, "appendFormat:", CFSTR("\nTrips: %lu\n"), objc_msgSend(v180, "count"));
  objc_msgSend(v365, "_stringDescriptionForMeaningfulEvents:isTrip:forDiagnostics:titleGenerationContext:", v180, 1, v385, v364);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("%@\n"), v181);

  objc_autoreleasePoolPop(v174);
  v182 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v348, "shortTripNodes");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v184;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf[8] = v185;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf[16] = v186;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v187 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v183, "sortedArrayUsingDescriptors:", v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v404, "appendFormat:", CFSTR("Weekends: %lu\n"), objc_msgSend(v188, "count"));
  objc_msgSend(v365, "_stringDescriptionForMeaningfulEvents:isTrip:forDiagnostics:titleGenerationContext:", v188, 1, v385, v364);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("%@\n"), v189);

  objc_autoreleasePoolPop(v182);
  v331 = (void *)MEMORY[0x1CAA4EB2C]();
  +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v348, "edgesForLabel:domain:", CFSTR("MEANING"), 700);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  contextb = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v403 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v348, "meaningfulEvents");
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v343, "count"));
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v352 = objc_alloc_init(PGEventLabelingConfiguration);
  if (+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v344);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGEventLabelingConfiguration meaningLabels](v352, "meaningLabels");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "unionSet:", v192);

    objc_msgSend(v191, "allObjects");
    v193 = objc_claimAutoreleasedReturnValue();

    v344 = (void *)v193;
  }
  v446 = 0u;
  v445 = 0u;
  v444 = 0u;
  v443 = 0u;
  v358 = v190;
  v194 = objc_msgSend(v358, "countByEnumeratingWithState:objects:count:", &v443, v526, 16);
  if (v194)
  {
    v195 = *(_QWORD *)v444;
    do
    {
      for (i2 = 0; i2 != v194; ++i2)
      {
        if (*(_QWORD *)v444 != v195)
          objc_enumerationMutation(v358);
        v197 = *(void **)(*((_QWORD *)&v443 + 1) + 8 * i2);
        objc_msgSend(v197, "meaningLabel");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "sourceNode");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        if (!+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled")|| (-[PGEventLabelingConfiguration thresholdsBy:](v352, "thresholdsBy:", v198), v200 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v200, "highPrecisionThreshold"), v202 = v201, v200, objc_msgSend(v197, "confidence"), v203 >= v202))
        {
          objc_msgSend(v199, "alternativeMeaningLabels");
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          v205 = objc_msgSend(v204, "containsObject:", v198);

          if (v205)
          {
            v206 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v377, "objectForKeyedSubscript:", v198);
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v206, "numberWithInteger:", objc_msgSend(v207, "integerValue") + 1);
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v377, "setObject:forKeyedSubscript:", v208, v198);

          }
          objc_msgSend(v397, "objectForKeyedSubscript:", v198);
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          v210 = v209 == 0;

          if (v210)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v397, "setObject:forKeyedSubscript:", v211, v198);

          }
          objc_msgSend(v397, "objectForKeyedSubscript:", v198);
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v212, "addObject:", v199);

          objc_msgSend(v375, "addObject:", v199);
        }

      }
      v194 = objc_msgSend(v358, "countByEnumeratingWithState:objects:count:", &v443, v526, 16);
    }
    while (v194);
  }

  objc_msgSend(v344, "sortedArrayUsingSelector:", sel_compare_);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("\nMeaningful Events: %lu events, %lu meanings\n"), objc_msgSend(v343, "count"), objc_msgSend(v348, "edgesCountForLabel:domain:", CFSTR("MEANING"), 700));
  v441 = 0u;
  v442 = 0u;
  v439 = 0u;
  v440 = 0u;
  v383 = v213;
  v214 = objc_msgSend(v383, "countByEnumeratingWithState:objects:count:", &v439, v525, 16);
  if (v214)
  {
    v215 = *(_QWORD *)v440;
    do
    {
      for (i3 = 0; i3 != v214; ++i3)
      {
        if (*(_QWORD *)v440 != v215)
          objc_enumerationMutation(v383);
        v217 = *(_QWORD *)(*((_QWORD *)&v439 + 1) + 8 * i3);
        objc_msgSend(v397, "objectForKeyedSubscript:", v217);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v218, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v219;
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf[8] = v220;
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf[16] = v221;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
          v222 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v218, "sortUsingDescriptors:", v222);
          objc_msgSend(v404, "appendFormat:", CFSTR("%@: %lu\n"), v217, objc_msgSend(v218, "count"));
          objc_msgSend(v365, "_stringDescriptionForMeaningfulEvents:isTrip:forDiagnostics:titleGenerationContext:", v218, 0, v385, v364);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v404, "appendFormat:", CFSTR("%@\n"), v223);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v218, "count"));
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(contextb, "setObject:forKeyedSubscript:", v224, v217);

      }
      v214 = objc_msgSend(v383, "countByEnumeratingWithState:objects:count:", &v439, v525, 16);
    }
    while (v214);
  }

  v225 = objc_msgSend(v375, "count");
  if (v225 < objc_msgSend(v343, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v437 = 0u;
    v438 = 0u;
    v435 = 0u;
    v436 = 0u;
    v227 = v343;
    v228 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v435, v524, 16);
    if (v228)
    {
      v229 = *(_QWORD *)v436;
      do
      {
        for (i4 = 0; i4 != v228; ++i4)
        {
          if (*(_QWORD *)v436 != v229)
            objc_enumerationMutation(v227);
          v231 = *(_QWORD *)(*((_QWORD *)&v435 + 1) + 8 * i4);
          if ((objc_msgSend(v375, "containsObject:", v231) & 1) == 0)
            objc_msgSend(v226, "addObject:", v231);
        }
        v228 = objc_msgSend(v227, "countByEnumeratingWithState:objects:count:", &v435, v524, 16);
      }
      while (v228);
    }

    objc_msgSend(v404, "appendFormat:", CFSTR("Other meaningful events:\n"));
    objc_msgSend(v365, "_stringDescriptionForMeaningfulEvents:isTrip:forDiagnostics:titleGenerationContext:", v226, 0, v385, v364);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v404, "appendFormat:", CFSTR("%@\n"), v232);

  }
  objc_msgSend(v404, "appendFormat:", CFSTR("Number of alternative meanings: %lu \n"), objc_msgSend(v348, "edgesCountForLabel:domain:", CFSTR("MEANING"), 702));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v348, "edgesForLabel:domain:", CFSTR("MEANING"), 702);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  v433 = 0u;
  v434 = 0u;
  v431 = 0u;
  v432 = 0u;
  v356 = v233;
  v234 = objc_msgSend(v356, "countByEnumeratingWithState:objects:count:", &v431, v523, 16);
  if (v234)
  {
    v235 = *(_QWORD *)v432;
    do
    {
      for (i5 = 0; i5 != v234; ++i5)
      {
        if (*(_QWORD *)v432 != v235)
          objc_enumerationMutation(v356);
        v237 = *(void **)(*((_QWORD *)&v431 + 1) + 8 * i5);
        objc_msgSend(v237, "meaningLabel");
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        v239 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v403, "objectForKeyedSubscript:", v238);
        v240 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v239, "numberWithInteger:", objc_msgSend(v240, "integerValue") + 1);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v403, "setObject:forKeyedSubscript:", v241, v238);

        objc_msgSend(v237, "sourceNode");
        v242 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v369, "addObject:", v242);

      }
      v234 = objc_msgSend(v356, "countByEnumeratingWithState:objects:count:", &v431, v523, 16);
    }
    while (v234);
  }

  objc_msgSend(v404, "appendFormat:", CFSTR("Number of moments connected with alternative meanings: %lu\n"), objc_msgSend(v369, "count"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@|   A   |   B   |  A\\B  |  B\\A  |  A⋂B  |  A⋃B  |"), CFSTR("Meaning (A) / Alternative (B) "));
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_1E8436F28, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v334, "length"), CFSTR("_"), 0);
  v243 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("%@\n%@\n"), v334, v243);
  v332 = (void *)v243;
  v429 = 0u;
  v430 = 0u;
  v427 = 0u;
  v428 = 0u;
  v354 = v383;
  v244 = objc_msgSend(v354, "countByEnumeratingWithState:objects:count:", &v427, v522, 16);
  if (v244)
  {
    v386 = 0;
    v245 = 0;
    v246 = 0;
    v247 = 0;
    v248 = 0;
    v249 = 0;
    v367 = *(id *)v428;
    do
    {
      v250 = 0;
      v371 = v244;
      do
      {
        if (*(id *)v428 != v367)
          objc_enumerationMutation(v354);
        v381 = v249;
        v384 = v246;
        v251 = *(void **)(*((_QWORD *)&v427 + 1) + 8 * v250);
        objc_msgSend(contextb, "objectForKeyedSubscript:", v251);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        v253 = objc_msgSend(v252, "unsignedLongValue");
        v379 = v248;
        v254 = v245;

        objc_msgSend(v403, "objectForKeyedSubscript:", v251);
        v255 = (void *)objc_claimAutoreleasedReturnValue();
        v256 = objc_msgSend(v255, "unsignedLongValue");

        objc_msgSend(v377, "objectForKeyedSubscript:", v251);
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        v258 = objc_msgSend(v257, "unsignedLongValue");

        objc_msgSend(v251, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(CFSTR("Meaning (A) / Alternative (B) "), "length"), CFSTR(" "), 0);
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        v260 = v253 - v258;
        v261 = v256 - v258;
        v262 = v256 - v258 + v253;
        objc_msgSend(v404, "appendFormat:", CFSTR("%@|%7lu|%7lu|%7lu|%7lu|%7lu|%7lu|\n"), v259, v253, v256, v253 - v258, v256 - v258, v258, v262);

        v386 += v253;
        v245 = v256 + v254;
        v246 = &v384[v258];
        v249 = v262 + v381;
        v247 += v260;
        v248 = v261 + v379;
        ++v250;
      }
      while (v371 != v250);
      v244 = objc_msgSend(v354, "countByEnumeratingWithState:objects:count:", &v427, v522, 16);
    }
    while (v244);
  }
  else
  {
    v386 = 0;
    v245 = 0;
    v246 = 0;
    v247 = 0;
    v248 = 0;
    v249 = 0;
  }
  v263 = v249;

  objc_msgSend(CFSTR("Totals"), "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(CFSTR("Meaning (A) / Alternative (B) "), "length"), CFSTR(" "), 0);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("%@\n%@|%7lu|%7lu|%7lu|%7lu|%7lu|%7lu|\n"), v332, v264, v386, v245, v247, v248, v246, v263);

  objc_autoreleasePoolPop(v331);
  v265 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v348, "mainUrbanCityNodes");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("\n\nMain Urban Cities: %lu\n"), objc_msgSend(v266, "count"));
  objc_msgSend(v365, "_stringDescriptionForUrbanCities:", v266);
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("%@\n"), v267);

  objc_autoreleasePoolPop(v265);
  v268 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v348, "interestingCityNodes");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "set");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v521 = v271;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v521, 1);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "sortedArrayUsingDescriptors:", v272);
  v273 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v404, "appendFormat:", CFSTR("Interesting Cities: %lu\n"), objc_msgSend(v273, "count"));
  objc_msgSend(v365, "_stringDescriptionForInterestingCities:", v273);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("%@\n"), v274);

  objc_autoreleasePoolPop(v268);
  v275 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v348, "edgesForLabel:domain:", CFSTR("CELEBRATING"), 401);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "valueForKeyPath:", CFSTR("targetNode.name"));
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v277, "allObjects");
  v278 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v404, "appendFormat:", CFSTR("Celebrated Events: %lu\n"), objc_msgSend(v278, "count"));
  if (objc_msgSend(v278, "count"))
  {
    objc_msgSend(v278, "componentsJoinedByString:", CFSTR(", "));
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v404, "appendFormat:", CFSTR("%@\n"), v279);

  }
  objc_autoreleasePoolPop(v275);
  v280 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v365, "_stringDescriptionForPetsWithGraph:", v348);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendString:", v281);

  objc_autoreleasePoolPop(v280);
  v282 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v365, "_stringDescriptionForMusicWithGraph:summaryOnly:", v348, 1);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendString:", v283);

  objc_autoreleasePoolPop(v282);
  v284 = (void *)MEMORY[0x1CAA4EB2C]();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = v21;
  *(_QWORD *)&buf[24] = 0;
  info = 0;
  p_info = &info;
  v425 = v21;
  v426 = 0;
  v285 = objc_alloc_init(PGNeighborScoreComputer);
  objc_msgSend(v348, "momentNodes");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v287 = MEMORY[0x1E0C809B0];
  v419[0] = MEMORY[0x1E0C809B0];
  v419[1] = 3221225472;
  v419[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_5;
  v419[3] = &unk_1E842F998;
  v288 = v285;
  v420 = v288;
  v421 = buf;
  v422 = &info;
  objc_msgSend(v286, "enumerateNodesUsingBlock:", v419);

  objc_msgSend(v404, "appendFormat:", CFSTR("[Neighbor] Interesting Events: %lu\n"), *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
  objc_msgSend(v404, "appendFormat:", CFSTR("[Neighbor] Highly Interesting Events: %lu\n"), *(_QWORD *)&p_info[3]);

  _Block_object_dispose(&info, 8);
  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(v284);
  v289 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v417[0] = v287;
  v417[1] = 3221225472;
  v417[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_6;
  v417[3] = &unk_1E8433B00;
  v290 = (id)objc_claimAutoreleasedReturnValue();
  v418 = v290;
  objc_msgSend(v348, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Area"), 201, v417);
  objc_msgSend(v290, "sortUsingSelector:", sel_localizedCompare_);
  v291 = objc_msgSend(v290, "count");
  objc_msgSend(v290, "componentsJoinedByString:", CFSTR("\n"));
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendFormat:", CFSTR("\nBlocked AOIs: %lu %@"), v291, v292);

  objc_autoreleasePoolPop(v289);
  objc_msgSend(v404, "appendFormat:", CFSTR("\nNumber of Default Addresses: %lu"), v514[3]);
  objc_msgSend(v404, "appendFormat:", CFSTR("\nNumber of Improved Addresses: %lu"), v510[3]);
  objc_msgSend(v404, "appendFormat:", CFSTR("\nNumber of Coarse Addresses: %lu"), v506[3]);
  v293 = (void *)MEMORY[0x1CAA4EB2C](objc_msgSend(v404, "appendFormat:", CFSTR("\nNumber of Ocean Addresses: %lu (far away from projection: %lu)"), v502[3], v498[3]));
  objc_msgSend(v365, "_stringDescriptionForDisambiguatedLocationsWithGraph:", v348);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendString:", v294);

  objc_autoreleasePoolPop(v293);
  v295 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v365, "_stringDescriptionForDisambiguatedPOIsInMomentNodes:", obj);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendString:", v296);

  objc_autoreleasePoolPop(v295);
  v297 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v365, "_stringDescriptionForBusinessItemsWithGraph:includingInferredThroughPublicEvents:verbose:", v348, 0, v339);
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendString:", v298);

  objc_autoreleasePoolPop(v297);
  v299 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v365, "_stringDescriptionForPublicEventsWithGraph:verbose:", v348, v339);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v404, "appendString:", v300);

  objc_autoreleasePoolPop(v299);
  v301 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v404, "appendFormat:", CFSTR("\n\nPlaces:\n"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v415[0] = v287;
  v415[1] = 3221225472;
  v415[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_7;
  v415[3] = &unk_1E8432098;
  v302 = (id)objc_claimAutoreleasedReturnValue();
  v416 = v302;
  objc_msgSend(v348, "enumerateNodesWithLabel:domain:usingBlock:", 0, 501, v415);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("label"), 1);
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  v519 = v303;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v519, 1);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v302, "sortUsingDescriptors:", v304);

  v413[0] = v287;
  v413[1] = 3221225472;
  v413[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_8;
  v413[3] = &unk_1E842F9C0;
  v305 = v404;
  v414 = v305;
  objc_msgSend(v302, "enumerateObjectsUsingBlock:", v413);
  objc_msgSend(v305, "appendString:", CFSTR("\n"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v411[0] = v287;
  v411[1] = 3221225472;
  v411[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_9;
  v411[3] = &unk_1E84320C0;
  v306 = (id)objc_claimAutoreleasedReturnValue();
  v412 = v306;
  objc_msgSend(v348, "enumerateNodesWithLabel:domain:usingBlock:", 0, 502, v411);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("label"), 1);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  v518 = v307;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v518, 1);
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v306, "sortUsingDescriptors:", v308);

  v409[0] = v287;
  v409[1] = 3221225472;
  v409[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_10;
  v409[3] = &unk_1E842F9E8;
  v309 = v305;
  v410 = v309;
  objc_msgSend(v306, "enumerateObjectsUsingBlock:", v409);

  objc_autoreleasePoolPop(v301);
  v310 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v309, "appendFormat:", CFSTR("\n\nScene:\n"));
  +[PGGraphNodeCollection nodesInGraph:](PGGraphSceneNodeCollection, "nodesInGraph:", v348);
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("label"), 1);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  v517 = v312;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v517, 1);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v311, "sortedArrayUsingDescriptors:", v313);
  v314 = (void *)objc_claimAutoreleasedReturnValue();

  v407[0] = v287;
  v407[1] = 3221225472;
  v407[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_11;
  v407[3] = &unk_1E842FA10;
  v315 = v309;
  v408 = v315;
  objc_msgSend(v314, "enumerateObjectsUsingBlock:", v407);
  +[PGGraphNodeCollection nodesInGraph:](PGGraphVisualLookupSceneNodeCollection, "nodesInGraph:", v348);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v315, "appendFormat:", CFSTR("\n\nVisual Lookup Scenes: %lu \n"), objc_msgSend(v316, "count"));
  v405[0] = v287;
  v405[1] = 3221225472;
  v405[2] = __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_12;
  v405[3] = &unk_1E842FA38;
  v317 = v315;
  v406 = v317;
  objc_msgSend(v316, "enumerateNodesUsingBlock:", v405);

  objc_autoreleasePoolPop(v310);
  objc_msgSend(v317, "appendFormat:", CFSTR("\n\nGraph Description:\n%@"), v348);
  v318 = v317;

  _Block_object_dispose(&v497, 8);
  _Block_object_dispose(&v501, 8);
  _Block_object_dispose(&v505, 8);
  _Block_object_dispose(&v509, 8);
  _Block_object_dispose(&v513, 8);

  return v318;
}

- (id)_checkConsistencyOfGraph:(id)a3
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  void *v73;
  id v74;
  id obj;
  _QWORD v76[4];
  id v77;
  uint64_t *v78;
  _QWORD v79[4];
  id v80;
  uint64_t *v81;
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  id v92;
  uint64_t *v93;
  _QWORD v94[4];
  id v95;
  id v96;
  uint64_t *v97;
  _QWORD v98[5];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  __CFString *v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = __Block_byref_object_copy__47860;
  v119 = __Block_byref_object_dispose__47861;
  v120 = &stru_1E8436F28;
  objc_msgSend(v3, "nodesLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v112;
    v8 = (unsigned __int16)*MEMORY[0x1E0D42A88];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v112 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(v3, "nodesForLabel:domain:", *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * i), v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "intersectsSet:", v5))
        {
          v11 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v11, "intersectSet:", v5);
          v12 = (void *)objc_msgSend(v5, "mutableCopy");
          objc_msgSend(v12, "intersectSet:", v10);
          objc_msgSend((id)v116[5], "stringByAppendingFormat:", CFSTR("Some nodes are registered for two labels:\n%@\n%@"), v11, v12);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v116[5];
          v116[5] = v13;

        }
        objc_msgSend(v5, "unionSet:", v10);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
    }
    while (v6);
  }

  v15 = objc_msgSend(v5, "count");
  if (v15 != objc_msgSend(v3, "nodesCount"))
  {
    objc_msgSend((id)v116[5], "stringByAppendingFormat:", CFSTR("(nodesForLabel:@).count found %d, nodesCount found %d\n"), objc_msgSend(v5, "count"), objc_msgSend(v3, "nodesCount"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v116[5];
    v116[5] = v16;

  }
  objc_msgSend(v3, "edgesLabels");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v74 = v18;
  v20 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v108;
    v22 = (unsigned __int16)*MEMORY[0x1E0D42A88];
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v108 != v21)
          objc_enumerationMutation(v74);
        objc_msgSend(v3, "edgesForLabel:domain:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j), v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "intersectsSet:", v19))
        {
          v25 = (void *)objc_msgSend(v24, "mutableCopy");
          objc_msgSend(v25, "intersectSet:", v19);
          v26 = (void *)objc_msgSend(v19, "mutableCopy");
          objc_msgSend(v26, "intersectSet:", v24);
          objc_msgSend((id)v116[5], "stringByAppendingFormat:", CFSTR("Some edges are registered for two labels:\n%@\n%@"), v25, v26);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v116[5];
          v116[5] = v27;

        }
        objc_msgSend(v19, "unionSet:", v24);

      }
      v20 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
    }
    while (v20);
  }

  v29 = objc_msgSend(v19, "count");
  if (v29 != objc_msgSend(v3, "edgesCount"))
  {
    objc_msgSend((id)v116[5], "stringByAppendingFormat:", CFSTR("(edgesForLabel:@).count found %d, edgesCount found %d\n"), objc_msgSend(v19, "count"), objc_msgSend(v3, "edgesCount"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v116[5];
    v116[5] = v30;

  }
  v32 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v33 = v5;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v104;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v104 != v35)
          objc_enumerationMutation(v33);
        v37 = objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * k), "identifier");
        if (objc_msgSend(v32, "containsIdentifier:", v37))
        {
          objc_msgSend((id)v116[5], "stringByAppendingFormat:", CFSTR("Identifier %u is being used by more than one node\n"), v37);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v116[5];
          v116[5] = v38;

        }
        objc_msgSend(v32, "addIdentifier:", v37);
      }
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
    }
    while (v34);
  }

  v40 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v41 = v19;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v100;
    do
    {
      for (m = 0; m != v42; ++m)
      {
        if (*(_QWORD *)v100 != v43)
          objc_enumerationMutation(v41);
        v45 = objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * m), "identifier");
        if (objc_msgSend(v40, "containsIdentifier:", v45))
        {
          objc_msgSend((id)v116[5], "stringByAppendingFormat:", CFSTR("Identifier %u is being used by more than one edge\n"), v45);
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = (void *)v116[5];
          v116[5] = v46;

        }
        objc_msgSend(v40, "addIdentifier:", v45);
      }
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v99, v122, 16);
    }
    while (v42);
  }

  objc_msgSend(v3, "momentNodes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke;
  v98[3] = &unk_1E842FA68;
  v98[4] = &v115;
  objc_msgSend(v48, "enumerateNodesUsingBlock:", v98);

  v49 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v50 = objc_msgSend(v3, "nodesCountForLabel:domain:", CFSTR("Me"), 300);
  v51 = MEMORY[0x1E0C809B0];
  if (v50 >= 2)
  {
    objc_msgSend((id)v116[5], "stringByAppendingFormat:", CFSTR("Graph has %d Me nodes!\n"), v50);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = (void *)v116[5];
    v116[5] = v52;

  }
  v94[0] = v51;
  v94[1] = 3221225472;
  v94[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_2;
  v94[3] = &unk_1E842FA90;
  v54 = v49;
  v95 = v54;
  v55 = v3;
  v96 = v55;
  v97 = &v115;
  objc_msgSend(v55, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Me"), 300, v94);
  v91[0] = v51;
  v91[1] = 3221225472;
  v91[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_3;
  v91[3] = &unk_1E84341D8;
  v93 = &v115;
  v56 = v54;
  v92 = v56;
  objc_msgSend(v55, "enumeratePersonNodesIncludingMe:withBlock:", 0, v91);
  v73 = v55;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v57 = v56;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v87, v121, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v88;
    do
    {
      for (n = 0; n != v58; ++n)
      {
        if (*(_QWORD *)v88 != v59)
          objc_enumerationMutation(v57);
        v61 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * n);
        v62 = objc_msgSend(v57, "countForObject:", v61);
        if (v62 >= 2)
        {
          objc_msgSend((id)v116[5], "stringByAppendingFormat:", CFSTR("%lu people nodes found for local identifier %@\n"), v62, v61);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = (void *)v116[5];
          v116[5] = v63;

        }
      }
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v87, v121, 16);
    }
    while (v58);
  }

  v65 = MEMORY[0x1E0C809B0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_4;
  v86[3] = &unk_1E8433C10;
  v86[4] = &v115;
  objc_msgSend(v73, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("SocialGroup"), 302, v86);
  v85[0] = v65;
  v85[1] = 3221225472;
  v85[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_5;
  v85[3] = &unk_1E842FAB8;
  v85[4] = &v115;
  objc_msgSend(v73, "enumerateNodesWithLabel:domain:usingBlock:", 0, 200, v85);
  v84[0] = v65;
  v84[1] = 3221225472;
  v84[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_6;
  v84[3] = &unk_1E842FAE0;
  v84[4] = &v115;
  objc_msgSend(v73, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Area"), 201, v84);
  v83[0] = v65;
  v83[1] = 3221225472;
  v83[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_7;
  v83[3] = &unk_1E84307D8;
  v83[4] = &v115;
  objc_msgSend(v73, "enumerateNodesWithLabel:domain:usingBlock:", 0, 400, v83);
  v82[0] = v65;
  v82[1] = 3221225472;
  v82[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_8;
  v82[3] = &unk_1E84307D8;
  v82[4] = &v115;
  objc_msgSend(v73, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Holiday"), 401, v82);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMemoryNodeCollection, "nodesInGraph:", v73);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_9;
  v79[3] = &unk_1E842FB10;
  v68 = v66;
  v80 = v68;
  v81 = &v115;
  objc_msgSend(v67, "enumerateNodesUsingBlock:", v79);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_10;
  v76[3] = &unk_1E842FB38;
  v70 = v69;
  v77 = v70;
  v78 = &v115;
  objc_msgSend(v73, "enumerateNodesWithBlock:", v76);
  v71 = (id)v116[5];

  _Block_object_dispose(&v115, 8);
  return v71;
}

- (id)_socialGroupsStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *context;
  void *v42;
  void *v43;
  PGManager *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42 = (void *)objc_opt_new();
  v37 = objc_msgSend(v4, "numberOfSocialGroupNodes");
  context = (void *)MEMORY[0x1CAA4EB2C]();
  v43 = v4;
  objc_msgSend(v4, "socialGroupNodesSortedByImportance");
  v44 = self;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager _stringDescriptionForSocialGroups:includeImportance:](self, "_stringDescriptionForSocialGroups:includeImportance:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v5;
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasPrefix:", CFSTR("\t[")))
        {
          objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("] "));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(" ("));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(", "));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setWithArray:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v19);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v9);
  }

  -[PGManager _socialGroupsDebugStringIncludingMeNode:withGraph:](v44, "_socialGroupsDebugStringIncludingMeNode:withGraph:", 0, v43);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v20;
  objc_msgSend(v20, "componentsSeparatedByCharactersInSet:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v48 != v26)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        if (objc_msgSend(v28, "hasPrefix:", CFSTR("\t[")))
        {
          objc_msgSend(v28, "componentsSeparatedByString:", CFSTR("] "));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "lastObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "componentsSeparatedByString:", CFSTR(" ("));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v32, "componentsSeparatedByString:", CFSTR(", "));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setWithArray:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v35);

        }
        else
        {
          if (v25 > 1)
            goto LABEL_21;
          ++v25;
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v24);
  }
LABEL_21:

  if ((objc_msgSend(v46, "isEqualToSet:", v45) & 1) == 0)
  {
    objc_msgSend(v42, "appendFormat:", CFSTR("Social Groups in graph: %lu\n"), v37);
    objc_msgSend(v42, "appendFormat:", CFSTR("%@\n"), v39);
  }
  objc_msgSend(v42, "appendFormat:", CFSTR("%@\n"), v38);

  objc_autoreleasePoolPop(context);
  return v42;
}

- (id)_socialGroupsDebugStatistics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PGManager _socialGroupsDebugStringIncludingMeNode:withGraph:](self, "_socialGroupsDebugStringIncludingMeNode:withGraph:", 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v6);
  -[PGManager _socialGroupsDebugStringWithGraph:](self, "_socialGroupsDebugStringWithGraph:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v7);
  return v5;
}

- (id)_sharedLibraryStatistics:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subsetWithOnlyPrivateAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v5, "subsetWithOnlySharedAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v5, "subsetWithBothPrivateAndSharedAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_msgSend(v4, "appendFormat:", CFSTR("Moment nodes with both private and shared assets:\t%lu\nMoment nodes with only private assets:\t%lu\nMoment nodes with only shared assets:\t%lu\n\n"), v11, v7, v9);
  +[PGGraphPersonNodeCollection personNodesForSharedLibraryParticipantsInGraph:](PGGraphPersonNodeCollection, "personNodesForSharedLibraryParticipantsInGraph:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendFormat:", CFSTR("Person nodes for share participants in the graph: %lu\n"), objc_msgSend(v12, "count"));
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__PGManager_Debug___sharedLibraryStatistics___block_invoke;
  v15[3] = &unk_1E8434020;
  v13 = v4;
  v16 = v13;
  objc_msgSend(v12, "enumerateNodesUsingBlock:", v15);

  return v13;
}

- (id)_entityTagsStatistics:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPersonRelationshipTagNodeCollection, "nodesInGraph:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendFormat:", CFSTR("Number of person relationship tags %lu\n"), objc_msgSend(v5, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PGManager_Debug___entityTagsStatistics___block_invoke;
  v8[3] = &unk_1E8431BE8;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v8);

  return v6;
}

- (id)_socialGroupsDebugStringIncludingMeNode:(BOOL)a3 withGraph:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, float, double, uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  float v22;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37A0];
  v6 = a4;
  objc_msgSend(v5, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = 0.0;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__PGManager_Debug___socialGroupsDebugStringIncludingMeNode_withGraph___block_invoke;
  v20[3] = &unk_1E842FBB0;
  v21 = v8;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __70__PGManager_Debug___socialGroupsDebugStringIncludingMeNode_withGraph___block_invoke_2;
  v18 = &unk_1E842FBB0;
  v9 = v19;
  v10 = v8;
  objc_msgSend(v6, "enumerateSocialGroupsIncludingMeNode:socialGroupsVersion:simulateMeNodeNotSet:validGroupsBlock:invalidGroupsBlock:averageWeight:", v4, 1, 0, v20, &v15, &v22);

  v11 = CFSTR("Including MeNode ");
  if (!v4)
    v11 = &stru_1E8436F28;
  objc_msgSend(v7, "appendFormat:", CFSTR("Social Groups from current algorithm %@with thresholds: [avgWeight=%.2f, minCohesion=%.2f]\n"), v11, v22, 0x3FD3333333333333, v15, v16, v17, v18);
  objc_msgSend(v7, "appendFormat:", CFSTR("Valid Social Groups: %ld\n"), objc_msgSend(v10, "count"));
  objc_msgSend(v10, "componentsJoinedByString:", &stru_1E8436F28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v12);

  objc_msgSend(v7, "appendFormat:", CFSTR("Candidate Social Groups: %ld\n"), objc_msgSend(v9, "count"));
  objc_msgSend(v9, "componentsJoinedByString:", &stru_1E8436F28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v13);

  return v7;
}

- (id)_socialGroupsDebugStringWithGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  float v16;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0.0;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__PGManager_Debug___socialGroupsDebugStringWithGraph___block_invoke;
  v14[3] = &unk_1E842FBD8;
  v15 = v6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PGManager_Debug___socialGroupsDebugStringWithGraph___block_invoke_2;
  v12[3] = &unk_1E842FBD8;
  v7 = v13;
  v8 = v6;
  +[PGSocialGroupsQuestionFactory enumerateSocialGroupsWithGraph:withLinkage:validGroupsBlock:invalidGroupsBlock:averageWeight:](PGSocialGroupsQuestionFactory, "enumerateSocialGroupsWithGraph:withLinkage:validGroupsBlock:invalidGroupsBlock:averageWeight:", v4, 4, v14, v12, &v16);

  objc_msgSend(v5, "appendFormat:", CFSTR("Social Groups from new algorithm with thresholds: [avgWeight=%.2f, minCohesion=%.2f]\n"), v16, 0x3FD3333333333333);
  objc_msgSend(v5, "appendFormat:", CFSTR("Valid Social Groups: %ld\n"), objc_msgSend(v8, "count"));
  objc_msgSend(v8, "componentsJoinedByString:", &stru_1E8436F28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v9);

  objc_msgSend(v5, "appendFormat:", CFSTR("Candidate Social Groups: %ld\n"), objc_msgSend(v7, "count"));
  objc_msgSend(v7, "componentsJoinedByString:", &stru_1E8436F28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v10);

  return v5;
}

- (id)_stringDescriptionForMemoriesNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;

  v3 = (void *)objc_opt_new();
  -[PGManager _dateFormatter](self, "_dateFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMemoryNotificationHelper lastTriggeredNotificationDateWithPhotoLibrary:](PGMemoryNotificationHelper, "lastTriggeredNotificationDateWithPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tLast notification triggered: %@\n"), v7);

  -[PGManager photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMemoryNotificationHelper nextPossibleNotificationDateWithPhotoLibrary:](PGMemoryNotificationHelper, "nextPossibleNotificationDateWithPhotoLibrary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tNext possible notification: %@\n"), v10);

  v11 = -[PGManager memoriesOfTheDayAreWorthNotifying](self, "memoriesOfTheDayAreWorthNotifying");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tToday's Memories are worth notifying: %@\n"), v12);

  return v3;
}

- (id)_moodStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _BYTE v80[128];
  _QWORD v81[3];

  v81[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__47860;
  v78 = __Block_byref_object_dispose__47861;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v79 = (id)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__47860;
  v72 = __Block_byref_object_dispose__47861;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v73 = (id)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__47860;
  v66 = __Block_byref_object_dispose__47861;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v67 = (id)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__47860;
  v60 = __Block_byref_object_dispose__47861;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  -[PGManager photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setSortDescriptors:", v9);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager workingContext](self, "workingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke;
  v42[3] = &unk_1E842FC28;
  v12 = v4;
  v43 = v12;
  v13 = v11;
  v44 = v13;
  v47 = &v74;
  v48 = &v68;
  v49 = &v62;
  v50 = &v56;
  v36 = v5;
  v45 = v36;
  v51 = &v52;
  v37 = v6;
  v46 = v37;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v42);
  v14 = v53[3];
  if (v14 >= 2)
    objc_msgSend(v37, "multiplyByWeight:", 1.0 / ((double)v14 + -1.0));
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Moods:\nMood Suggested Possible Recommended Forbidden Mean Stddev"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v10;
  v33 = v13;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v16 = objc_msgSend(&unk_1E84EA318, "countByEnumeratingWithState:objects:count:", &v38, v80, 16);
  if (v16)
  {
    v17 = 0;
    v35 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(&unk_1E84EA318);
        v19 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v15, "appendFormat:", CFSTR("\n%@"), v19);
        v20 = (void *)v57[5];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendFormat:", CFSTR(" %lu"), objc_msgSend(v20, "countForObject:", v21));

        v22 = (void *)v63[5];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendFormat:", CFSTR(" %lu"), objc_msgSend(v22, "countForObject:", v23));

        v24 = (void *)v75[5];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendFormat:", CFSTR(" %lu"), objc_msgSend(v24, "countForObject:", v25));

        v26 = (void *)v69[5];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendFormat:", CFSTR(" %lu"), objc_msgSend(v26, "countForObject:", v27));

        v28 = 1 << (v17 + i);
        objc_msgSend(v36, "valueForMood:", v28);
        objc_msgSend(v15, "appendFormat:", CFSTR(" %.2f"), v29);
        objc_msgSend(v37, "valueForMood:", v28);
        objc_msgSend(v15, "appendFormat:", CFSTR(" %.2f"), sqrt(v30));
      }
      v16 = objc_msgSend(&unk_1E84EA318, "countByEnumeratingWithState:objects:count:", &v38, v80, 16);
      v17 += i;
    }
    while (v16);
  }
  objc_msgSend(v15, "appendString:", CFSTR("\n\n"));

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  return v15;
}

- (id)_interestingStatisticsWithGraph:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id obj;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  -[PGManager photoLibrary](self, "photoLibrary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "librarySpecificFetchOptions");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v41);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "momentNodesSortedByDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
  if (v6)
  {
    v52 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v76 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "isInteresting");
        if (objc_msgSend(v10, "isSmartInteresting"))
        {
          objc_msgSend(v43, "momentForMomentNode:inPhotoLibrary:", v10, v44);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v42, "addObject:", v12);

          ++v52;
        }
        objc_msgSend(v10, "isInterestingForMemories");
        objc_msgSend(v10, "contentScore");
        v7 += v11;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    }
    while (v6);
  }
  else
  {
    v52 = 0;
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addIndex:", 4);
  objc_msgSend(v51, "addIndex:", 10);
  v48 = (void *)objc_opt_new();
  v50 = (void *)objc_opt_new();
  objc_msgSend(v44, "librarySpecificFetchOptions");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addFetchPropertySets:", v13);

  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v44);
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v45 = v4;
  v14 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v72 != v15)
          objc_enumerationMutation(v45);
        v17 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
        v18 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v17, v49, v19, v47);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "allItems");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __52__PGManager_Debug___interestingStatisticsWithGraph___block_invoke;
        v66[3] = &unk_1E842FC50;
        v67 = v21;
        v68 = v48;
        v69 = v50;
        v70 = v17;
        v22 = v21;
        objc_msgSend(v51, "enumerateIndexesUsingBlock:", v66);

        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Interesting Moments Analysis:\n\n"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("Total Smart Interesting Moments %lu/%lu\n"), v52, v40);
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__47860;
  v64 = __Block_byref_object_dispose__47861;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v42);
  v65 = (id)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v61[5];
  objc_msgSend(v50, "objectForKey:", &unk_1E84E4628);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "intersectSet:", v25);

  objc_msgSend(v23, "appendFormat:", CFSTR("Total Current (Related) Interesting Moments %lu/%lu (%lu)\n"), v7, v40, objc_msgSend((id)v61[5], "count"));
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v42);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v61[5];
  v61[5] = v26;

  v28 = (void *)v61[5];
  objc_msgSend(v50, "objectForKey:", &unk_1E84E4640);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "intersectSet:", v29);

  objc_msgSend(v48, "objectForKey:", &unk_1E84E4640);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v45, "count");
  objc_msgSend(v23, "appendFormat:", CFSTR("Total Current (Memories) Interesting Moments %@/%lu (%lu)\n\n"), v30, v31, objc_msgSend((id)v61[5], "count"));

  objc_msgSend(v23, "appendFormat:", CFSTR("Total Interesting Moments:\n"));
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __52__PGManager_Debug___interestingStatisticsWithGraph___block_invoke_747;
  v53[3] = &unk_1E842FC78;
  v59 = &v60;
  v32 = v42;
  v54 = v32;
  v33 = v50;
  v55 = v33;
  v34 = v23;
  v56 = v34;
  v35 = v48;
  v57 = v35;
  v36 = v45;
  v58 = v36;
  objc_msgSend(v51, "enumerateIndexesUsingBlock:", v53);
  v37 = v58;
  v38 = v34;

  _Block_object_dispose(&v60, 8);
  return v38;
}

- (id)_partOfDayStatisticsWithGraph:(id)a3 titleGenerationContext:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PGTitleGenerator *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  id obj;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v5;
  objc_msgSend(v5, "momentNodesSortedByDate");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v22 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        v11 = -[PGTitleGenerator initWithMomentNode:type:titleGenerationContext:]([PGTitleGenerator alloc], "initWithMomentNode:type:titleGenerationContext:", v10, 0, v23);
        -[PGTitleGenerator title](v11, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[PGTitleGenerator subtitle](v11, "subtitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "appendFormat:", CFSTR("%@ - %@: "), v14, v17);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __73__PGManager_Debug___partOfDayStatisticsWithGraph_titleGenerationContext___block_invoke;
        v24[3] = &unk_1E842FCA0;
        v18 = v6;
        v25 = v18;
        objc_msgSend(v10, "enumeratePartOfDayEdgesAndNodesUsingBlock:", v24);
        objc_msgSend(v18, "appendString:", CFSTR("\n"));

        ++v9;
      }
      while (v8 != v9);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)_peopleRelationshipsStatisticsWithGraph:(id)a3 includingDebugInfo:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  id v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  __CFString *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  id v86;
  id obj;
  void *v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  PGManager *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[4];
  id v103;
  id v104;
  BOOL v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _QWORD v111[2];
  _QWORD v112[2];
  _BYTE v113[128];
  _QWORD v114[13];
  _QWORD v115[16];

  v4 = a4;
  v115[13] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "meNode");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (v88)
  {
    v81 = v5;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("PEOPLE RELATIONSHIPS:\n\n"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = CFSTR("PARTNER");
    v114[1] = CFSTR("FAMILY");
    v115[0] = &unk_1E84E4658;
    v115[1] = &unk_1E84E4670;
    v114[2] = CFSTR("PARENT");
    v114[3] = CFSTR("CHILD");
    v115[2] = &unk_1E84E4688;
    v115[3] = &unk_1E84E46A0;
    v114[4] = CFSTR("FRIEND");
    v114[5] = CFSTR("COWORKER");
    v115[4] = &unk_1E84E46B8;
    v115[5] = &unk_1E84E46D0;
    v114[6] = CFSTR("PARTNER");
    v114[7] = CFSTR("MOTHER");
    v115[6] = &unk_1E84E4658;
    v115[7] = &unk_1E84E46E8;
    v114[8] = CFSTR("FATHER");
    v114[9] = CFSTR("SISTER");
    v115[8] = &unk_1E84E4700;
    v115[9] = &unk_1E84E4718;
    v114[10] = CFSTR("BROTHER");
    v114[11] = CFSTR("DAUGHTER");
    v115[10] = &unk_1E84E4730;
    v115[11] = &unk_1E84E4748;
    v114[12] = CFSTR("SON");
    v115[12] = &unk_1E84E4760;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v4;
    v106 = 0u;
    v107 = 0u;
    if (v4)
      v8 = 7;
    else
      v8 = 3;
    v108 = 0uLL;
    v109 = 0uLL;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v107 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v102[0] = MEMORY[0x1E0C809B0];
          v102[1] = 3221225472;
          v102[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke;
          v102[3] = &unk_1E842FCC8;
          v18 = v16;
          v103 = v18;
          v105 = v83;
          v19 = v17;
          v104 = v19;
          objc_msgSend(v88, "enumeratePersonNodesWithRelationship:matchingQuery:usingBlock:", v15, v8, v102);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:\n"), v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", v20);

          v21 = objc_msgSend(v18, "count");
          if (!(v21 + objc_msgSend(v19, "count")))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("None\n"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendString:", v22);
LABEL_16:

            goto LABEL_17;
          }
          if (objc_msgSend(v18, "count"))
          {
            v23 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n\t"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringWithFormat:", CFSTR("\t%@\n"), v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendString:", v25);

          }
          if (objc_msgSend(v19, "count"))
          {
            objc_msgSend(v19, "keysSortedByValueUsingSelector:", sel_compare_);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "reverseObjectEnumerator");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "allObjects");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n\t"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stringWithFormat:", CFSTR("\t%@\n"), v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendString:", v30);

            goto LABEL_16;
          }
LABEL_17:

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\nSOCIAL GROUPS RELATIONSHIPS:\n"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v111[0] = CFSTR("FAMILY");
    v111[1] = CFSTR("COWORKER");
    v112[0] = &unk_1E84E4670;
    v112[1] = &unk_1E84E46D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v86 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v99;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v99 != v33)
            objc_enumerationMutation(v86);
          v35 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "objectForKeyedSubscript:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "unsignedIntegerValue");

          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_2;
          v95[3] = &unk_1E842FCF0;
          v39 = v36;
          v96 = v39;
          v97 = self;
          objc_msgSend(v88, "enumerateSocialGroupNodesWithRelationship:usingBlock:", v38, v95);
          v40 = objc_msgSend(v39, "count");
          v41 = (void *)MEMORY[0x1E0CB3940];
          if (v40)
          {
            objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n\t\t"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("%@ SG:\n\t\t%@\n"), v35, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "appendString:", v43);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tNo %@ Social Group\n"), v35);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "appendString:", v42);
          }

        }
        v32 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
      }
      while (v32);
    }

    objc_msgSend(v88, "collection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "ownedPetNodes");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\nPETS\n"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v47);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The user currently has %lu pets, based on the important entities inference\n"), objc_msgSend(v45, "count"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v48);

    v93[0] = MEMORY[0x1E0C809B0];
    v93[1] = 3221225472;
    v93[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_3;
    v93[3] = &unk_1E842FD18;
    v49 = v6;
    v94 = v49;
    objc_msgSend(v45, "enumerateNodesUsingBlock:", v93);
    if (v83)
    {
      v5 = v81;
      v50 = -[PGManager _numberOfFamilyHolidayMomentsWithGraph:](self, "_numberOfFamilyHolidayMomentsWithGraph:", v81);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nMISCELLANEOUS:\nNumber of family holiday moments: %lu"), v50);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[PGManager _numberOfNightOutMomentsWithGraph:](self, "_numberOfNightOutMomentsWithGraph:", v81);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nNumber of night out moments: %lu"), v51);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGManager _oneOnOneTripsWithGraph:](self, "_oneOnOneTripsWithGraph:", v81);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v78, "count");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nNumber of one on one trips not including short trips: %lu"), v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v81, "trips");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "weekends");
      v84 = v45;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "arrayByAddingObjectsFromArray:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setWithArray:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = v58;
      objc_msgSend(v58, "minusSet:", v78);
      v59 = objc_msgSend(v58, "count");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nNumber of non one on one trips including short trips: %lu"), v59);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = -[PGManager _numberOfMomentsOverWeekendsWithGraph:](self, "_numberOfMomentsOverWeekendsWithGraph:", v81);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nNumber of moments over weekends: %lu"), v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "momentNodes");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGPeopleInferencesConveniences momentNodesAtWorkInMomentNodes:](PGPeopleInferencesConveniences, "momentNodesAtWorkInMomentNodes:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = objc_msgSend(v63, "count");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nNumber of moments at work: %lu"), v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v82;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@"), v49, v82, v80, v79, v53, v76, v61, v65);
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v45 = v84;
      v46 = 0x1E0CB3000;

    }
    else
    {
      v67 = &stru_1E8436F28;
      v5 = v81;
      v66 = v82;
    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("STORYTELLING (HIGH RECALL) RELATIONSHIPS:\n\n"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphEdgeCollection edgesInGraph:](PGGraphStorytellingRelationshipEdgeCollection, "edgesInGraph:", v5);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v72 = MEMORY[0x1E0C809B0];
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_4;
    v91[3] = &unk_1E8430C98;
    v92 = v71;
    v73 = v71;
    objc_msgSend(v70, "enumerateEdgesUsingBlock:", v91);
    v89[0] = v72;
    v89[1] = 3221225472;
    v89[2] = __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_5;
    v89[3] = &unk_1E842FD40;
    v90 = v69;
    v74 = v69;
    objc_msgSend(v73, "enumerateKeysAndObjectsUsingBlock:", v89);
    objc_msgSend(*(id *)(v46 + 2368), "stringWithFormat:", CFSTR("%@\n\n%@\n\n%@\n\n%@"), v49, v66, v67, v74);
    v68 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v68 = CFSTR("There is no menode in the graph -> cannot generate relationship report");
  }

  return v68;
}

- (unint64_t)_numberOfMomentsOverWeekendsWithGraph:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "anyNodeForLabel:domain:properties:", CFSTR("Weekend"), 400, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "edgesCount");
  else
    v5 = 0;

  return v5;
}

- (unint64_t)_numberOfFamilyHolidayMomentsWithGraph:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PGManager_Debug___numberOfFamilyHolidayMomentsWithGraph___block_invoke;
  v6[3] = &unk_1E842FD68;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateCelebratedHolidayNodesUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (unint64_t)_numberOfNightOutMomentsWithGraph:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "momentNodesWithMeaning:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)_oneOnOneTripsWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  int v18;
  int v19;
  int v20;
  void *v22;
  uint64_t v23;
  PGGraphMomentNodeCollection *v24;
  PGGraphPersonNodeCollection *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t j;
  void *v32;
  id obj;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int128 v42;
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
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "trips");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v3;
  objc_msgSend(v3, "meNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v4;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v38)
  {
    v35 = *(_QWORD *)v51;
    v36 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v51 != v35)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        v39 = v7;
        if (v10)
        {
          v11 = v10;
          v12 = 0;
          v13 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v47 != v13)
                objc_enumerationMutation(v9);
              v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_msgSend(v15, "personNodes");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "count");
              v18 = objc_msgSend(v16, "containsObject:", v6);
              if (v17 == 1)
                v19 = v18;
              else
                v19 = 1;
              if (v17 == 2)
                v20 = v18;
              else
                v20 = 0;
              if (v19 == 1 && v20 == 0)
              {
                v23 = v17 > 1;
              }
              else
              {
                objc_msgSend(v16, "allObjects");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "addObjectsFromArray:", v22);

                objc_msgSend(v40, "addObject:", v15);
                v23 = 1;
              }
              v12 += v23;

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
          }
          while (v11);
        }
        else
        {
          v12 = 0;
        }

        v24 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v40, v37);
        v25 = -[MAElementCollection initWithSet:graph:]([PGGraphPersonNodeCollection alloc], "initWithSet:graph:", v41, v37);
        +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        v5 = v36;
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v43;
          v30 = (double)v12;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v43 != v29)
                objc_enumerationMutation(v26);
              v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              if ((objc_msgSend(v32, "isMeNode") & 1) == 0
                && (double)(unint64_t)objc_msgSend(v26, "countForObject:", v32) / v30 >= 0.75)
              {
                objc_msgSend(v36, "addObject:", v9);
              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
          }
          while (v28);
        }

        v7 = v39 + 1;
      }
      while (v39 + 1 != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v38);
  }

  return v5;
}

- (id)_peopleVisionAgeStatisticsWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  v39 = v3;
  objc_msgSend(v3, "personNodesIncludingMe:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v12, "stringDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "ageCategory");
        v14 = v4;
        switch((unint64_t)v4)
        {
          case 0uLL:
            v14 = v42;
            goto LABEL_12;
          case 1uLL:
            goto LABEL_12;
          case 2uLL:
            v14 = v5;
            goto LABEL_12;
          case 3uLL:
            v14 = v6;
            goto LABEL_12;
          case 4uLL:
            v14 = v40;
            goto LABEL_12;
          case 5uLL:
            v14 = v41;
LABEL_12:
            objc_msgSend(v14, "addObject:", v13);
            break;
          default:
            break;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v9);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("None"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v16 = v4;
  else
    v16 = v15;
  v17 = v16;
  v38 = v17;

  if (objc_msgSend(v5, "count"))
    v18 = v5;
  else
    v18 = v15;
  v19 = v18;
  v37 = v19;

  if (objc_msgSend(v6, "count"))
    v20 = v6;
  else
    v20 = v15;
  v21 = v20;
  v36 = v21;

  if (objc_msgSend(v40, "count"))
    v22 = v40;
  else
    v22 = v15;
  v23 = v22;
  v35 = v23;

  if (objc_msgSend(v41, "count"))
    v24 = v41;
  else
    v24 = v15;
  v25 = v24;

  if (objc_msgSend(v42, "count"))
    v26 = v42;
  else
    v26 = v15;
  v27 = v26;

  v43 = (id)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", CFSTR("Age from Vision\n\tBaby Age Category:\n\t\t%@\n\tChild Age Category:\n\t\t%@\n\tYoung Adult Age Category:\n\t\t%@\n\tAdult Age Category:\n\t\t%@\n\tSenior Age Category:\n\t\t%@\n\tUnspecified Age Category:\n\t\t%@\n"), v28, v29, v30, v31, v32, v33);
  v44 = (id)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)_peopleVisionBiologicalSexStatisticsWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personNodesIncludingMe:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "stringDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "sex");
        if (!v14)
        {
          v15 = v6;
LABEL_11:
          objc_msgSend(v15, "addObject:", v13);
          goto LABEL_12;
        }
        v15 = v4;
        if (v14 == 1)
          goto LABEL_11;
        v15 = v5;
        if (v14 == 2)
          goto LABEL_11;
LABEL_12:

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("BiologicalSex from Vision\n\tFemale BiologicalSex Type:\n\t\t%@\n\tMale BiologicalSex Type:\n\t\t%@\n\tUndefined BiologicalSex Type:\n\t\t%@\n"), v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)_sexHintForGivenNameOfContactForIdentifier:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v6 = a4;
  v7 = a3;
  -[PGManager serviceManager](self, "serviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "inferredUserLocales");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "sexHintForPerson:usingLocales:", v9, v10);
  return v11;
}

- (id)_peopleNameBiologicalSexStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "nodesForLabel:domain:", CFSTR("Contact"), 303);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithSet:", v7);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "contactIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[PGManager _sexHintForGivenNameOfContactForIdentifier:inGraph:](self, "_sexHintForGivenNameOfContactForIdentifier:inGraph:", v15, v4);

        objc_msgSend(v14, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v18 = v25;
LABEL_11:
          objc_msgSend(v18, "addObject:", v17);
          goto LABEL_12;
        }
        v18 = v5;
        if (v16 == 1)
          goto LABEL_11;
        v18 = v26;
        if (v16 == 2)
          goto LABEL_11;
LABEL_12:

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n\t\t"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("BiologicalSex from Name\n\tFemale BiologicalSex Type:\n\t\t%@\n\tMale BiologicalSex Type:\n\t\t%@\n\tUndefined BiologicalSex Type:\n\t\t%@\n"), v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_highlightEstimatesStatisticsWithCurationContext:(id)a3
{
  id v4;
  void *v5;
  PGHighlightStatisticsEstimator *v6;
  void *v7;

  v4 = a3;
  -[PGManager workingContext](self, "workingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGHighlightStatisticsEstimator initWithWorkingContext:]([PGHighlightStatisticsEstimator alloc], "initWithWorkingContext:", v5);
  -[PGHighlightStatisticsEstimator highlightEstimatesDescriptionWithCurationContext:](v6, "highlightEstimatesDescriptionWithCurationContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_stringDescriptionForSocialGroups:(id)a3 includeImportance:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "collection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "memberNodes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          objc_msgSend(v11, "importance");
          objc_msgSend(v6, "appendFormat:", CFSTR("\t[%.4f] "), v14);
        }
        objc_msgSend(v13, "names");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v16);

        objc_msgSend(v6, "appendString:", CFSTR("\n"));
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)_stringDescriptionForMeaningfulEvents:(id)a3 isTrip:(BOOL)a4 forDiagnostics:(BOOL)a5 titleGenerationContext:(id)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PGCollectionTitleGenerator *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  unint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  id obj;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _BOOL4 v50;
  _BOOL4 v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  PGCollectionTitleGenerator *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD *v70;
  _QWORD v71[3];
  char v72;
  _QWORD v73[5];
  _QWORD v74[5];
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  void *v91;
  uint8_t buf[4];
  void *v93;
  _BYTE v94[128];
  uint64_t v95;

  v50 = a4;
  v51 = a5;
  v95 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v54 = a6;
  v52 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v52, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setTimeZone:", v8);

  v55 = (id)objc_opt_new();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v7;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
  if (v53)
  {
    v49 = *(_QWORD *)v88;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v88 != v49)
        {
          v10 = v9;
          objc_enumerationMutation(obj);
          v9 = v10;
        }
        v56 = v9;
        v11 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v9);
        objc_msgSend(v11, "eventCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "eventMomentNodes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstAndLastMomentNodes");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v64, "firstObject");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "lastObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0;
        v82 = &v81;
        v83 = 0x3032000000;
        v84 = __Block_byref_object_copy__47860;
        v85 = __Block_byref_object_dispose__47861;
        v86 = 0;
        v75 = 0;
        v76 = &v75;
        v77 = 0x3032000000;
        v78 = __Block_byref_object_copy__47860;
        v79 = __Block_byref_object_dispose__47861;
        v80 = 0;
        v14 = MEMORY[0x1E0C809B0];
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke;
        v74[3] = &unk_1E842FD90;
        v74[4] = &v81;
        objc_msgSend(v63, "enumerateDateNodesUsingBlock:", v74);
        v73[0] = v14;
        v73[1] = 3221225472;
        v73[2] = __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_2;
        v73[3] = &unk_1E842FD90;
        v73[4] = &v75;
        objc_msgSend(v62, "enumerateDateNodesUsingBlock:", v73);
        v15 = [PGCollectionTitleGenerator alloc];
        objc_msgSend(v11, "enrichableEvent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[PGCollectionTitleGenerator initWithCollection:titleGenerationContext:](v15, "initWithCollection:titleGenerationContext:", v16, v54);

        -[PGCollectionTitleGenerator setForDiagnostics:](v60, "setForDiagnostics:", v51);
        -[PGCollectionTitleGenerator titleTuple](v60, "titleTuple");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v59, "subtitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringValue");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v63, "localStartDate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "localEndDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringFromDate:", v58);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringFromDate:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          objc_msgSend((id)v76[5], "timeIntervalSinceDate:", v82[5]);
          v24 = vcvtpd_u64_f64(v23 / 86400.0) + 1;
          if (v24 <= 1)
            v25 = &stru_1E8436F28;
          else
            v25 = CFSTR("s");
          objc_msgSend(v55, "appendFormat:", CFSTR("\t[%@ - %@] Legacy title: \"%@\", \"%@\" (%lu day%@)"), v21, v22, v57, v61, v24, v25);
          objc_msgSend(v11, "highlightGroupNode");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "collection");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "tripFeatureNodes");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v71[0] = 0;
            v71[1] = v71;
            v71[2] = 0x2020000000;
            v72 = 1;
            v68[0] = MEMORY[0x1E0C809B0];
            v68[1] = 3221225472;
            v68[2] = __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_3;
            v68[3] = &unk_1E8432FB8;
            v29 = v28;
            v69 = v29;
            v70 = v71;
            objc_msgSend(v48, "enumerateIdentifiersAsCollectionsWithBlock:", v68);
            objc_msgSend(v54, "locationHelper");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 0;
            +[PGTripTitleGenerator titleForTripNodeAsCollection:locationHelper:error:](PGTripTitleGenerator, "titleForTripNodeAsCollection:locationHelper:error:", v47, v30, &v67);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v67;

            v32 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            v33 = v32;
            if (v31)
            {
              objc_msgSend(v32, "appendFormat:", CFSTR("\n\t\tCurrent title: \"%@\", \"%@\" (%lu day%@)"), v31, v61, v24, v25);
            }
            else
            {
              v41 = MEMORY[0x1E0C81028];
              v42 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v46, "localizedDescription");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v93 = v43;
                _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

              }
            }
            if (v29)
              objc_msgSend(v33, "appendFormat:", CFSTR(", with featured location nodes: [%@]"), v29);
            objc_msgSend(v55, "appendString:", v33);

            _Block_object_dispose(v71, 8);
          }
          objc_msgSend(v55, "appendString:", CFSTR("\n"));
        }
        else
        {
          objc_msgSend(v11, "meaningfulEvent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v65[0] = MEMORY[0x1E0C809B0];
            v65[1] = 3221225472;
            v65[2] = __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_867;
            v65[3] = &unk_1E842FDB8;
            v35 = v34;
            v66 = v35;
            objc_msgSend(v27, "enumerateMeaningEdgesAndNodesUsingBlock:", v65);
            objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_localizedCompare_);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = v36;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "sortedArrayUsingDescriptors:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "UUID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "componentsJoinedByString:", CFSTR(" "));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "appendFormat:", CFSTR("\t[%@ - %@] %@, \"%@\", \"%@\" %@\n"), v21, v22, v39, v57, v61, v40);

          }
          else
          {
            objc_msgSend(v55, "appendFormat:", CFSTR("\t[%@ - %@] \"%@\", \"%@\" Unknown event, not a trip nor a meaningful event\n"), v21, v22, v57, v61);
            v27 = 0;
          }
        }

        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(&v81, 8);

        v9 = v56 + 1;
      }
      while (v53 != v56 + 1);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
    }
    while (v53);
  }

  return v55;
}

- (id)_dateFormatter
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateStyle:", 1);
  objc_msgSend(v2, "setTimeStyle:", 0);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  return v2;
}

- (id)_stringDescriptionForUrbanCities:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = (id)objc_opt_new();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __53__PGManager_Debug___stringDescriptionForUrbanCities___block_invoke;
  v27[3] = &unk_1E842FDE0;
  v5 = v4;
  v28 = v5;
  objc_msgSend(v3, "enumerateIdentifiersAsCollectionsWithBlock:", v27);
  objc_msgSend(v3, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("\t%@: %@ moments\n"), v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "appendString:", v19);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v11);
  }

  return v22;
}

- (id)_stringDescriptionForInterestingCities:(id)a3
{
  id v3;
  id v4;
  id v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v28 = (id)objc_opt_new();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "collection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addressNodes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "momentNodes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v7);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        v21 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithFormat:", CFSTR("\t%@: %d moments\n"), v22, objc_msgSend(v24, "intValue"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "appendString:", v25);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v17);
  }

  return v28;
}

- (id)_stringDescriptionForInterestingAreas:(id)a3
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = (id)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "collection");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addressNodes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "momentNodes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "interestingForMemoriesSubset");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("\t%@: %d interesting moments (out of %d moments)\n"), v16, objc_msgSend(v14, "count"), objc_msgSend(v13, "count"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "appendString:", v17);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v19;
}

- (id)_stringDescriptionForPeopleEventsWithGraph:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD aBlock[4];
  id v69;
  id v70;
  id v71;
  id v72;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  objc_msgSend(v9, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke;
  aBlock[3] = &unk_1E842FE08;
  v12 = v5;
  v69 = v12;
  v70 = v9;
  v13 = v6;
  v71 = v13;
  v14 = v7;
  v72 = v14;
  v47 = v9;
  v66[0] = v11;
  v66[1] = 3221225472;
  v66[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_2;
  v66[3] = &unk_1E842FE30;
  v67 = _Block_copy(aBlock);
  v46 = v67;
  objc_msgSend(v4, "enumeratePersonNodesIncludingMe:withBlock:", 1, v66);
  v63[0] = v11;
  v63[1] = 3221225472;
  v63[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_3;
  v63[3] = &unk_1E8436610;
  v15 = v44;
  v64 = v15;
  v42 = v8;
  v65 = v42;
  objc_msgSend(v4, "enumerateEdgesWithLabel:domain:usingBlock:", 0, 301, v63);

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Birthday Dates: %ld\n"), objc_msgSend(v12, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v60[0] = v11;
  v60[1] = 3221225472;
  v60[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_4;
  v60[3] = &unk_1E8430C20;
  v61 = v12;
  v19 = v16;
  v62 = v19;
  v45 = v12;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v60);
  objc_msgSend(v15, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendFormat:", CFSTR("\nCelebrated Birthdays: %ld\n"), objc_msgSend(v21, "count"));

  objc_msgSend(v15, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v57[0] = v11;
  v57[1] = 3221225472;
  v57[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_5;
  v57[3] = &unk_1E8430C20;
  v58 = v15;
  v24 = v19;
  v59 = v24;
  v43 = v15;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v57);
  objc_msgSend(v24, "appendFormat:", CFSTR("\nPotential Birthday Dates: %ld\n"), objc_msgSend(v13, "count"));
  objc_msgSend(v13, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = v11;
  v54[1] = 3221225472;
  v54[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_6;
  v54[3] = &unk_1E8430C20;
  v55 = v13;
  v27 = v24;
  v56 = v27;
  v41 = v13;
  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v54);
  objc_msgSend(v27, "appendFormat:", CFSTR("\nAnniversary Dates: %ld\n"), objc_msgSend(v14, "count"));
  objc_msgSend(v14, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v51[0] = v11;
  v51[1] = 3221225472;
  v51[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_7;
  v51[3] = &unk_1E8430C20;
  v52 = v14;
  v30 = v27;
  v53 = v30;
  v31 = v14;
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v51);
  objc_msgSend(v42, "allValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendFormat:", CFSTR("\nCelebrated Anniversaries: %ld\n"), objc_msgSend(v33, "count"));

  objc_msgSend(v42, "allKeys");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v48[0] = v11;
  v48[1] = 3221225472;
  v48[2] = __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_8;
  v48[3] = &unk_1E8430C20;
  v49 = v42;
  v36 = v30;
  v50 = v36;
  v37 = v42;
  objc_msgSend(v35, "enumerateObjectsUsingBlock:", v48);
  v38 = v50;
  v39 = v36;

  return v39;
}

- (id)_stringDescriptionForMeNode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Me node information: localIdentifier:'%@', name:'%@', contact:'%@'"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__PGManager_Debug___stringDescriptionForMeNode___block_invoke;
  v20[3] = &unk_1E842FE58;
  v21 = v10;
  v22 = v9;
  v23 = v12;
  v24 = v11;
  v13 = v11;
  v14 = v12;
  v15 = v9;
  v16 = v10;
  objc_msgSend(v4, "enumerateHomeOrWorkAddressNodesUsingBlock:", v20);

  if (-[__CFString length](v15, "length"))
    v17 = v15;
  else
    v17 = CFSTR("–");
  objc_msgSend(v8, "appendFormat:", CFSTR("\n\tHome addresses: %@"), v17);
  if (-[__CFString length](v16, "length"))
    v18 = v16;
  else
    v18 = CFSTR("–");
  objc_msgSend(v8, "appendFormat:", CFSTR("\n\tWork addresses: %@\n\n"), v18);

  return v8;
}

- (id)_stringDescriptionForDisambiguatedLocationsWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v30;
  id obj;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v3, "infoNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "routineInfo");
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
  }

  v6 = CFSTR("YES");
  if (!(_BYTE)v45)
    v6 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n\nDisambiguated Locations Info:\nRoutine available %@ #LOI %lu, #Visits %lu, Pinning %.2f\n#Requests %lu, #timeMatches %lu, #closeByLocationMatches %lu, #remoteLocationMatches %lu\n\n"), v6, *((_QWORD *)&v45 + 1), (_QWORD)v46, *((_QWORD *)&v48 + 1), (_QWORD)v48, *((_QWORD *)&v46 + 1), v47);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke;
  v42[3] = &unk_1E842FF10;
  v9 = v7;
  v43 = v9;
  v10 = v8;
  v44 = v10;
  v30 = v3;
  objc_msgSend(v3, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Address"), 200, v42);
  v33 = v10;
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v13)
  {
    v14 = v13;
    v32 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(obj);
        objc_msgSend(v33, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v35 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v21, "sourceNode");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "photoCoordinate");
              v24 = v23;
              v26 = v25;
              objc_msgSend(v22, "name");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "appendFormat:", CFSTR("- Remote: %@ {%f, %f}\n"), v27, v24, v26);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
          }
          while (v18);
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v14);
  }

  objc_msgSend(v9, "appendString:", CFSTR("\n"));
  v28 = v9;

  return v28;
}

- (id)_stringDescriptionForDisambiguatedPOIsInMomentNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  void *v15;
  uint64_t *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __72__PGManager_Debug___stringDescriptionForDisambiguatedPOIsInMomentNodes___block_invoke;
        v13[3] = &unk_1E842FF38;
        v16 = &v21;
        v14 = v4;
        v15 = v10;
        objc_msgSend(v10, "enumeratePOIEdgesAndNodesUsingBlock:", v13);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n\nDisambiguated POI Info: %lu\n%@"), v22[3], v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (id)_stringDescriptionForLocationsWithGraph:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __60__PGManager_Debug___stringDescriptionForLocationsWithGraph___block_invoke;
  v26[3] = &unk_1E842FF60;
  v5 = v4;
  v27 = v5;
  v19 = v3;
  objc_msgSend(v3, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("City"), 200, v26);
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", CFSTR("CITIES: \n\n"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n\t"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("%@\n\t%@\n"), v13, v17);

        if ((unint64_t)objc_msgSend(v14, "count") >= 2)
          objc_msgSend(v20, "addObject:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "appendString:", CFSTR("POTIENTIAL DUPLICATES: \n\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@"), v20);

  return v8;
}

- (id)_stringDescriptionForLanguagesWithGraph:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "inferredUserLocales");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "localeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("\nUser Languages: %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_stringDescriptionForBusinessItemsWithGraph:(id)a3 includingInferredThroughPublicEvents:(BOOL)a4 verbose:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  _BOOL8 v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  uint64_t v40;
  id obj;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  BOOL v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[4];

  v5 = a5;
  v6 = a4;
  v53[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v8, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v9);

  v39 = v7;
  objc_msgSend(v7, "businessNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v10;
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v17 = v14;
  v18 = v8;
  v19 = v16;
  obj = v17;
  v42 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v42)
  {
    v20 = *(_QWORD *)v49;
    v40 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v49 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (!v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "publicEventNodes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count");

          if (v24)
            continue;
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __109__PGManager_Debug___stringDescriptionForBusinessItemsWithGraph_includingInferredThroughPublicEvents_verbose___block_invoke;
        v43[3] = &unk_1E842FF88;
        v44 = v15;
        v45 = v18;
        v47 = v5;
        v26 = v25;
        v46 = v26;
        objc_msgSend(v22, "enumerateMomentEdgesAndNodesUsingBlock:", v43);
        objc_msgSend(v26, "sortUsingSelector:", sel_localizedCompare_);
        objc_msgSend(v22, "keywordDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_msgSend(v22, "UUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByAppendingFormat:", CFSTR(" [muid:%@]"), v28);
          v29 = v19;
          v30 = v15;
          v31 = v5;
          v32 = v6;
          v33 = v18;
          v34 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v34;
          v18 = v33;
          v6 = v32;
          v5 = v31;
          v15 = v30;
          v19 = v29;
          v20 = v40;
        }
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendFormat:", CFSTR("\t%@ -> %@ \n"), v27, v35);

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v42);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nBusiness Items: %lu, Moments: %lu\n%@"), objc_msgSend(v38, "count"), objc_msgSend(v15, "count"), v19);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)_poiStatisticsWithGraph:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  objc_msgSend(v3, "poiNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __44__PGManager_Debug___poiStatisticsWithGraph___block_invoke;
  v17 = &unk_1E842FFB0;
  v20 = &v21;
  v8 = v6;
  v18 = v8;
  v9 = v4;
  v19 = v9;
  objc_msgSend(v7, "enumerateNodesUsingBlock:", &v14);
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_msgSend(v7, "count");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("\nPOI: %lu, Moments: %lu\n%@"), v11, v22[3], v8, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (id)_stringDescriptionForPublicEventsWithGraph:(id)a3 verbose:(BOOL)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char **v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t i;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
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
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  __CFString *v76;
  __CFString *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  id v84;
  id obj;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  __CFString *v96;
  void *v97;
  void *v98;
  char *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _BOOL4 v106;
  void *v107;
  uint64_t v108;
  uint64_t v110;
  id v111;
  uint64_t v112;
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  void *v136;
  void *v137;
  _BYTE v138[128];
  void *v139;
  _BYTE v140[128];
  void *v141;
  _BYTE v142[128];
  void *v143;
  void *v144;
  _BYTE v145[128];
  _QWORD v146[4];

  v106 = a4;
  v146[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v5;
  objc_msgSend(v5, "setTimeZone:", v6);

  v83 = v4;
  objc_msgSend(v4, "nodesForLabel:domain:", CFSTR("PublicEvent"), 900);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v7;
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v145, 16);
  v12 = &selRef_lastTriggeredNotificationDateWithPhotoLibrary_;
  if (v11)
  {
    v13 = v11;
    v112 = *(_QWORD *)v133;
    do
    {
      v14 = 0;
      v15 = v12[85];
      do
      {
        if (*(_QWORD *)v133 != v112)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v14);
        objc_msgSend(v16, "categories");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v144, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sortedArrayUsingDescriptors:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "count"))
        {
          objc_msgSend(v20, "firstObject");
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = CFSTR("No category");
        }
        v22 = v15;
        objc_msgSend(v89, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "setObject:forKeyedSubscript:", v23, v21);
        }
        objc_msgSend(v16, "businessNode");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "name");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v27 = CFSTR("No business");
        if (v25)
          v27 = (__CFString *)v25;
        v28 = v27;

        objc_msgSend(v23, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v28);
        }
        objc_msgSend(v29, "addObject:", v16);

        ++v14;
        v15 = v22;
      }
      while (v13 != v14);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v145, 16);
      v12 = &selRef_lastTriggeredNotificationDateWithPhotoLibrary_;
    }
    while (v13);
  }
  else
  {
    v15 = sel_localizedCompare_;
  }

  objc_msgSend(v89, "allKeys");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sortedArrayUsingDescriptors:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGManager publicEventManager](self, "publicEventManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v84 = v33;
  v87 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v128, v142, 16);
  if (v87)
  {
    v86 = *(_QWORD *)v129;
    v98 = v34;
    v99 = v15;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v129 != v86)
          objc_enumerationMutation(v84);
        v88 = v35;
        v36 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v35);
        objc_msgSend(v36, "stringByReplacingOccurrencesOfString:withString:", CFSTR("GEOSpatialEventLookupCategory"), &stru_1E8436F28);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "appendFormat:", CFSTR("[%@]\n"), v37);

        objc_msgSend(v89, "objectForKeyedSubscript:", v36);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "allKeys");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, v15);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "sortedArrayUsingDescriptors:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v90 = v41;
        v93 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v124, v140, 16);
        if (v93)
        {
          v91 = *(_QWORD *)v125;
          do
          {
            v42 = 0;
            do
            {
              if (*(_QWORD *)v125 != v91)
                objc_enumerationMutation(v90);
              v95 = v42;
              v43 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * v42);
              objc_msgSend(v111, "appendFormat:", CFSTR("\t%@\n"), v43);
              objc_msgSend(v92, "objectForKeyedSubscript:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v139 = v45;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v139, 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = v44;
              objc_msgSend(v44, "sortedArrayUsingDescriptors:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              v122 = 0u;
              v123 = 0u;
              v120 = 0u;
              v121 = 0u;
              v100 = v47;
              v110 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v120, v138, 16);
              if (v110)
              {
                v108 = *(_QWORD *)v121;
                do
                {
                  for (i = 0; i != v110; ++i)
                  {
                    if (*(_QWORD *)v121 != v108)
                      objc_enumerationMutation(v100);
                    v49 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
                    objc_msgSend(v34, "cachedPublicEventsForMuid:", objc_msgSend(v49, "muid"));
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend(v50, "count"))
                    {
                      v51 = objc_msgSend(v49, "muid");
                      objc_msgSend(v49, "keywordDescription");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v111, "appendFormat:", CFSTR("\t\t! Cannot find event %lu in cache: %@\n"), v51, v52);

                    }
                    objc_msgSend(MEMORY[0x1E0C99E20], "set");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "collection");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "momentNodes");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    v114[0] = MEMORY[0x1E0C809B0];
                    v114[1] = 3221225472;
                    v114[2] = __71__PGManager_Debug___stringDescriptionForPublicEventsWithGraph_verbose___block_invoke;
                    v114[3] = &unk_1E842FB60;
                    v115 = v105;
                    v116 = v107;
                    v57 = v54;
                    v117 = v57;
                    v113 = v50;
                    v118 = v113;
                    v58 = v53;
                    v119 = v58;
                    objc_msgSend(v56, "enumerateNodesUsingBlock:", v114);

                    objc_msgSend(v57, "sortUsingSelector:", v15);
                    objc_msgSend(v57, "componentsJoinedByString:", CFSTR(", "));
                    v59 = objc_claimAutoreleasedReturnValue();
                    v60 = (void *)v59;
                    if (v106)
                    {
                      v103 = (void *)v59;
                      objc_msgSend(v49, "localizedCategories");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, v15);
                      v62 = v58;
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      v137 = v63;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 1);
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v61, "sortedArrayUsingDescriptors:", v64);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v49, "performers");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, v15);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      v136 = v67;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v66, "sortedArrayUsingDescriptors:", v68);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v65, "componentsJoinedByString:", CFSTR(", "));
                      v70 = objc_claimAutoreleasedReturnValue();
                      v102 = v69;
                      objc_msgSend(v69, "componentsJoinedByString:", CFSTR(", "));
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      v104 = v62;
                      objc_msgSend(v62, "allObjects");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v72, "componentsJoinedByString:", &stru_1E8436F28);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();

                      v74 = objc_msgSend(v49, "expectedAttendance");
                      v75 = v74;
                      v101 = (void *)v70;
                      v76 = CFSTR("N/A");
                      if (v74 && v74 != 0x7FFFFFFFFFFFFFFFLL)
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v74);
                        v97 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v97, "stringValue");
                        v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        v76 = v96;
                      }
                      v77 = v76;
                      v78 = v98;
                      if (v75 && v75 != 0x7FFFFFFFFFFFFFFFLL)
                      {

                      }
                      objc_msgSend(v49, "name");
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v111, "appendFormat:", CFSTR("\t\t%@ %@\n\t\t\tattendance %@,\n\t\t\tcategories: %@,\n\t\t\tperformers: %@ -> %@ \n"), v79, v73, v77, v101, v71, v103);

                      v60 = v103;
                      v15 = v99;
                      v58 = v104;
                    }
                    else
                    {
                      v78 = v34;
                      objc_msgSend(v49, "name");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v111, "appendFormat:", CFSTR("\t\t%@ -> %@ \n"), v65, v60);
                    }

                    v34 = v78;
                  }
                  v110 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v120, v138, 16);
                }
                while (v110);
              }

              v42 = v95 + 1;
            }
            while (v95 + 1 != v93);
            v93 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v124, v140, 16);
          }
          while (v93);
        }

        v35 = v88 + 1;
      }
      while (v88 + 1 != v87);
      v87 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v128, v142, 16);
    }
    while (v87);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nPublic Events: %lu, Moments %lu\n%@"), objc_msgSend(v82, "count"), objc_msgSend(v105, "count"), v111);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  return v80;
}

- (id)_highlightTitleStatisticsWithGraph:(id)a3 titleGenerationContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PGHighlightTitleGenerator *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  PGHighlightTitleGenerator *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  id obj;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v42 = a4;
  v39 = v5;
  objc_msgSend(v5, "dayHighlightNodesSortedByDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v8);

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n\nHighlight Titles (%lu):"), objc_msgSend(v6, "count"));
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v12);
        v14 = -[PGHighlightTitleGenerator initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:]([PGHighlightTitleGenerator alloc], "initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:", v13, 0, 0, 0, v42);
        -[PGHighlightTitleGenerator titleTuple](v14, "titleTuple");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "localStartDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringFromDate:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "localEndDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringFromDate:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\t highlight:\t[%@ - %@]"), v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "appendFormat:", CFSTR("%@ \ttitle:\t\"%@\"), v22, v17);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v10);
  }

  objc_msgSend(v39, "highlightGroupNodesSortedByDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "appendFormat:", CFSTR("\n\nHighlight Group Titles (%lu):"), objc_msgSend(v23, "count"));
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v40 = v23;
  v24 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v45;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v45 != v26)
          objc_enumerationMutation(v40);
        v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v27);
        v29 = -[PGHighlightTitleGenerator initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:]([PGHighlightTitleGenerator alloc], "initWithCollection:curatedAssetCollection:keyAsset:createVerboseTitle:titleGenerationContext:", v28, 0, 0, 0, v42);
        -[PGHighlightTitleGenerator titleTuple](v29, "titleTuple");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "title");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "localStartDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringFromDate:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "localEndDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringFromDate:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\t highlight:\t[%@ - %@]"), v34, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "appendFormat:", CFSTR("%@ \ttitle:\t\"%@\"), v37, v32);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v25);
  }

  return v43;
}

- (id)_titleStatisticsWithGraph:(id)a3 titleGenerationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  float v14;
  uint64_t v15;
  void *v16;
  PGTitleGenerator *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  float v34;
  double v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  unint64_t v48;
  PGManager *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id obj;
  uint64_t v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v53 = v6;
  objc_msgSend(v6, "momentNodesSortedByDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v49 = self;
  -[PGManager photoLibrary](self, "photoLibrary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  v52 = v7;
  if (v10)
  {
    v11 = v10;
    v48 = v9;
    v12 = 0;
    v13 = 0;
    v57 = *(id *)v64;
    v14 = 0.0;
    do
    {
      v15 = 0;
      v54 = v11;
      do
      {
        if (*(id *)v64 != v57)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v15);
        v17 = -[PGTitleGenerator initWithMomentNode:type:titleGenerationContext:]([PGTitleGenerator alloc], "initWithMomentNode:type:titleGenerationContext:", v16, 0, v7);
        -[PGTitleGenerator title](v17, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringValue");
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        -[PGTitleGenerator subtitle](v17, "subtitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringValue");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v22 = -[__CFString length](v19, "length");
        if ((unint64_t)-[__CFString length](v19, "length") > 0x18)
          ++v13;
        if (objc_msgSend(v16, "isInteresting"))
        {
          v56 = v12 + 1;
          objc_msgSend(v53, "momentForMomentNode:inPhotoLibrary:", v16, v51);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGManager _dateFormatter](v49, "_dateFormatter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "startDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringFromDate:", v25);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizedTitle");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v28;
          if (v28)
            v30 = (const __CFString *)v28;
          else
            v30 = CFSTR("N/A");
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("assetCollectionTitle"));

          v11 = v54;
          if (v26)
            v31 = v26;
          else
            v31 = CFSTR("N/A");
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("assetCollectionStartDate"));
          if (v19)
            v32 = v19;
          else
            v32 = &stru_1E8436F28;
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v32, CFSTR("graphMomentTitle"));
          if (v21)
            v33 = v21;
          else
            v33 = &stru_1E8436F28;
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, CFSTR("graphMomentSubtitle"));
          objc_msgSend(v50, "addObject:", v27);

          v12 = v56;
          v7 = v52;

        }
        v14 = v14 + (float)v22;

        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v11);
    v34 = (float)v13;
    v9 = v48;
  }
  else
  {
    v12 = 0;
    v14 = 0.0;
    v34 = 0.0;
  }

  if (v9)
  {
    v14 = v14 / (float)v9;
    v35 = (float)((float)(1.0 - (float)(v34 / (float)v9)) * 100.0);
  }
  else
  {
    v35 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n\nInteresting Moment Titles (%lu):\nAverage #characters: %f, %.f%% <= %lu characters\n"), v12, v14, *(_QWORD *)&v35, 24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v58 = v50;
  v37 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v60 != v39)
          objc_enumerationMutation(v58);
        v41 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("assetCollectionTitle"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("graphMomentTitle"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("graphMomentSubtitle"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v42, "length");
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("assetCollectionStartDate"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "appendFormat:", CFSTR("\n\tMoment: \"%@\" (#%lu, %@)\n\t\ttitle: \"%@\" (#%lu)\n\t\tsubtitle: \"%@\" (#%lu)\n"), v42, v45, v46, v43, objc_msgSend(v43, "length"), v44, objc_msgSend(v44, "length"));

      }
      v38 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v38);
  }

  return v36;
}

- (id)_mobilityStatisticsWithGraph:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "momentNodesSortedByDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\nLocation Mobility:"));
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
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "locationMobilityType");
        if (v11)
        {
          if (v11 > 4)
            v12 = 0;
          else
            v12 = off_1E8427E50[v11];
          v13 = v12;
          objc_msgSend(v10, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("\n\tMoment \"%@\", mobility %@"), v14, v13, (_QWORD)v16);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_domainLabelCountStatisticsWithGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\nCounts by domain and label:\nnodes:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nodesDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nodesLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_1016);
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_2;
  v49[3] = &unk_1E84348D0;
  v9 = v3;
  v50 = v9;
  v10 = v4;
  v51 = v10;
  v37 = v5;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v49);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v46;
    v15 = (unsigned __int16)*MEMORY[0x1E0D42A88];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        v18 = objc_msgSend(v9, "nodesCountForLabel:domain:", v17, v15);
        if (v18)
          objc_msgSend(v10, "appendFormat:", CFSTR("\nlabel %@ %lu"), v17, v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v13);
  }

  objc_msgSend(v10, "appendString:", CFSTR("\nedges:"));
  objc_msgSend(v9, "edgesDomains");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "edgesLabels");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  objc_msgSend(v22, "sortUsingComparator:", &__block_literal_global_1023);
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_4;
  v42[3] = &unk_1E84348D0;
  v23 = v9;
  v43 = v23;
  v24 = v10;
  v44 = v24;
  v36 = v19;
  objc_msgSend(v19, "enumerateIndexesUsingBlock:", v42);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v25 = v22;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v39;
    v29 = (unsigned __int16)*MEMORY[0x1E0D42A88];
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(v25);
        v31 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        v32 = objc_msgSend(v23, "edgesCountForLabel:domain:", v31, v29);
        if (v32)
          objc_msgSend(v24, "appendFormat:", CFSTR("\nlabel %@ %lu"), v31, v32);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v27);
  }

  v33 = v44;
  v34 = v24;

  return v34;
}

- (id)relatedDebugInformationBetweenAsset:(id)a3 andRelatedAssetCollection:(id)a4 relatedType:(unint64_t)a5 curationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PGRelatedComputer *v14;
  void *v15;
  PGRelatedComputer *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[PGManager workingContextForRelated](self, "workingContextForRelated");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PGRelatedComputer alloc];
  -[PGManager blockedFeatures](self, "blockedFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PGRelatedComputer initWithWorkingContext:blockedFeatures:](v14, "initWithWorkingContext:blockedFeatures:", v13, v15);

  -[PGRelatedComputer relatedCollectionBetweenAsset:andAssetCollection:relatedType:needsDebugInfo:](v16, "relatedCollectionBetweenAsset:andAssetCollection:relatedType:needsDebugInfo:", v12, v11, a5, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager keywordsForAsset:relatedType:](self, "keywordsForAsset:relatedType:", v12, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGManager _debugInformationForRelated:referenceKeywords:andRelatedMoment:relatedType:curationContext:](self, "_debugInformationForRelated:referenceKeywords:andRelatedMoment:relatedType:curationContext:", v17, v18, v11, a5, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)relatedDebugInformationBetweenReferenceAssetCollection:(id)a3 andRelatedAssetCollection:(id)a4 relatedType:(unint64_t)a5 curationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PGRelatedComputer *v14;
  void *v15;
  PGRelatedComputer *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;

  v10 = a4;
  v11 = a6;
  v12 = a3;
  -[PGManager workingContextForRelated](self, "workingContextForRelated");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PGRelatedComputer alloc];
  -[PGManager blockedFeatures](self, "blockedFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PGRelatedComputer initWithWorkingContext:blockedFeatures:](v14, "initWithWorkingContext:blockedFeatures:", v13, v15);

  -[PGRelatedComputer relatedCollectionBetweenAssetCollection:andAssetCollection:relatedType:curationContext:needsDebugInfo:](v16, "relatedCollectionBetweenAssetCollection:andAssetCollection:relatedType:curationContext:needsDebugInfo:", v12, v10, a5, v11, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager keywordsForAssetCollection:relatedType:](self, "keywordsForAssetCollection:relatedType:", v12, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(v17, "keywords");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 512);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v25 = v13;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManager keywordsForMomentNodeName:relatedType:](self, "keywordsForMomentNodeName:relatedType:", v21, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v25;
  }
  -[PGManager _debugInformationForRelated:referenceKeywords:andRelatedMoment:relatedType:curationContext:](self, "_debugInformationForRelated:referenceKeywords:andRelatedMoment:relatedType:curationContext:", v17, v18, v10, a5, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_debugInformationForRelated:(id)a3 referenceKeywords:(id)a4 andRelatedMoment:(id)a5 relatedType:(unint64_t)a6 curationContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v38;
  uint64_t v39;
  void *v40;
  id v42;
  void *v43;
  void *v44;

  v12 = a3;
  v42 = a7;
  v13 = a5;
  v14 = a4;
  -[PGManager keywordsForAssetCollection:relatedType:](self, "keywordsForAssetCollection:relatedType:", v13, a6);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v44)
  {
    objc_msgSend(v12, "keywords");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 256);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManager keywordsForMomentNodeName:relatedType:](self, "keywordsForMomentNodeName:relatedType:", v18, a6);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PGManager curationManager](self, "curationManager", v42);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "score");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("relatedScore"));

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "matchingScore");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("matchingScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("relatedType"));

  objc_msgSend(v12, "debugDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("debugDescription"));

  objc_msgSend(v12, "keywords");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGManager exportableDictionaryFromKeywords:](PGManager, "exportableDictionaryFromKeywords:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, CFSTR("matchingKeywords"));

  +[PGGraph matchingWeightToDictionary](PGGraph, "matchingWeightToDictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, CFSTR("matchingWeight"));

  +[PGManager exportableDictionaryFromKeywords:](PGManager, "exportableDictionaryFromKeywords:", v14);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, CFSTR("referenceKeywords"));
  +[PGManager exportableDictionaryFromKeywords:](PGManager, "exportableDictionaryFromKeywords:", v44);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v31, CFSTR("relatedKeywords"));

  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v19, "contentScoreForAssetCollection:curationContext:", v13, v43);
  objc_msgSend(v32, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v33, CFSTR("curationScore"));

  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[PGManager neighborScoreForMoment:](self, "neighborScoreForMoment:", v13);
  objc_msgSend(v34, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v35, CFSTR("neighborScore"));

  v36 = (void *)MEMORY[0x1E0CB37E8];
  -[PGManager graphScoreForMoment:](self, "graphScoreForMoment:", v13);
  objc_msgSend(v36, "numberWithDouble:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v37, CFSTR("graphScore"));

  v38 = (void *)MEMORY[0x1E0CB37E8];
  v39 = objc_msgSend(v19, "isAssetCollectionInteresting:curationContext:", v13, v43);

  objc_msgSend(v38, "numberWithBool:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v40, CFSTR("isInteresting"));

  return v20;
}

- (id)sharingSuggestionDebugInformationForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  id v43;
  PGSharingManager *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  const __CFString *v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = objc_claimAutoreleasedReturnValue();

  v53 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchRepresentativeAssetsInAssetCollection:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v71 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "localIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentsForAssetsWithLocalIdentifiers:options:", v54, v53);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __67__PGManager_Debug__sharingSuggestionDebugInformationForSuggestion___block_invoke;
  v63[3] = &unk_1E8430060;
  v18 = v16;
  v64 = v18;
  v19 = v17;
  v65 = v19;
  v51 = v4;
  v66 = v51;
  v52 = v5;
  v67 = v52;
  v49 = v10;
  v68 = v49;
  v48 = v8;
  v69 = v48;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v63);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setSharingStream:", 1);
  -[PGManager workingContextForSuggestions](self, "workingContextForSuggestions");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[PGSharingManager initWithWorkingContext:]([PGSharingManager alloc], "initWithWorkingContext:", v46);
  v50 = v19;
  v47 = v20;
  -[PGSharingManager suggestionResultsForAssetLocalIdentifiers:momentLocalIdentifiers:options:](v45, "suggestionResultsForAssetLocalIdentifiers:momentLocalIdentifiers:options:", 0, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0C99E08];
  v76 = CFSTR("numberOfPeopleSuggestions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryWithDictionary:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v26 = v21;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
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
        v31 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
        objc_msgSend(v31, "sourceNames");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "person");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "keywordDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, v34);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
    }
    while (v28);
  }

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v25, CFSTR("people"));
  v35 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v36 = v18;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v56 != v39)
          objc_enumerationMutation(v36);
        -[PGManager keywordsForAssetCollection:relatedType:](self, "keywordsForAssetCollection:relatedType:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k), 63);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend((id)objc_opt_class(), "exportableDictionaryFromKeywords:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addEntriesFromDictionary:", v42);

        }
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
    }
    while (v38);
  }

  objc_msgSend(v52, "setObject:forKeyedSubscript:", v35, CFSTR("content"));
  v43 = v52;

  return v43;
}

- (id)utilityAssetInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *context;
  uint64_t v30;
  id v31;
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
  -[PGManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v2);
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeGuestAssets:", 1);
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  objc_msgSend(v4, "setFetchPropertySets:", v5);

  v23 = v2;
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 3, 0x7FFFFFFFFFFFFFFFLL);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v37;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v30 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v7, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1390], "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v33 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v13, "curationModel");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isUtilityWithAsset:", v13);
              objc_msgSend(v3, "userFeedbackCalculator");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v14, "isUtilityForMemoriesWithAsset:userFeedbackCalculator:", v13, v16);

              v18 = 4;
              if (!v17)
                v18 = 0;
              if (v18 | v15)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "uuid");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v19, v20);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v10);
        }

        objc_autoreleasePoolPop(context);
        v6 = v30 + 1;
      }
      while (v30 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v27);
  }

  return v31;
}

- (id)_getDefaultOutputPathForMetadataSnapshot
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGManager metadataSnapshotOutputPathURL](self, "metadataSnapshotOutputPathURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSTemporaryDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Caches/Internal/MemoriesRelated/Memories"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)defaultSnapshotRootPath
{
  return (id)objc_msgSend(CFSTR("/var/mobile/Media/PhotoData"), "stringByAppendingPathComponent:", CFSTR("Caches/Internal/MemoriesRelated/Memories"));
}

- (id)defaultGraphExportFullPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", CFSTR("/var/mobile/Media/PhotoData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Graph.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fastGraphExportFullPath
{
  void *v2;
  void *v3;
  void *v4;

  -[PGManager graphPersistenceParentDirectoryURL](self, "graphPersistenceParentDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Graph.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultPeopleClustersExportIntermediatePath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", CFSTR("/var/mobile/Media/PhotoData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PeopleClusters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_snapshotFilenameForLookupKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (_snapshotFilenameForLookupKey__onceToken != -1)
    dispatch_once(&_snapshotFilenameForLookupKey__onceToken, &__block_literal_global_1097);
  if (_snapshotFilenameForLookupKey__snapshotFilenameLookup)
  {
    objc_msgSend((id)_snapshotFilenameForLookupKey__snapshotFilenameLookup, "valueForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)snapshotOuputFilePathURLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PGManager defaultSnapshotRootPath](self, "defaultSnapshotRootPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager _snapshotFilenameForLookupKey:](self, "_snapshotFilenameForLookupKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_dayOfWeekStatisticsWithGraph:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v22;
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("Number of moments by day of week:\n"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = 0;
  v4 = objc_msgSend(&unk_1E84EA330, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(&unk_1E84EA330);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v28 = 0;
        objc_msgSend(v22, "dayOfWeekNodeForDayOfWeek:", objc_msgSend(v7, "integerValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __50__PGManager_Debug___dayOfWeekStatisticsWithGraph___block_invoke;
        v24[3] = &unk_1E842FD90;
        v24[4] = &v25;
        objc_msgSend(v8, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("DAYOFWEEK"), 400, v24);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26[3]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "appendFormat:", CFSTR("\t%@: %@ moments\n"), v9, v10);

        v11 = v26[3];
        v3 += v11;
        _Block_object_dispose(&v25, 8);
      }
      v4 = objc_msgSend(&unk_1E84EA330, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v4);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("\n\tTotal: %@ moments\n"), v12);

  objc_msgSend(v22, "anyNodeForLabel:domain:properties:", CFSTR("Weekend"), 400, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "edgesCount");
  else
    v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("\n\tWeekend: %@ moments\n"), v16);

  objc_msgSend(v22, "anyNodeForLabel:domain:properties:", CFSTR("Weekday"), 400, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    v19 = objc_msgSend(v17, "edgesCount");
  else
    v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("\tWeekday: %@ moments\n"), v20);

  return v23;
}

- (id)sharingMessageSuggestionDebugInformationForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  PGManager *v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__PGManager_Debug__sharingMessageSuggestionDebugInformationForAssetCollection___block_invoke;
  v10[3] = &unk_1E84354B0;
  v11 = v4;
  v6 = v5;
  v12 = v6;
  v13 = self;
  v7 = v4;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", v10);
  v8 = v6;

  return v8;
}

- (id)_sortedTextFeaturesFromTextFeatures:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a3;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("type"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("origin"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_stringDescriptionForPetsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGManager _dateFormatter](self, "_dateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPetNodeCollection, "nodesInGraph:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\nNumber of Pets: %lu\n"), objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__PGManager_Debug___stringDescriptionForPetsWithGraph___block_invoke;
  v21[3] = &unk_1E8430130;
  v9 = v5;
  v22 = v9;
  v10 = v8;
  v23 = v10;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v21);
  objc_msgSend(v10, "sortUsingSelector:", sel_caseInsensitiveCompare_);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
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
        objc_msgSend(v7, "appendString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v13);
  }

  return v7;
}

- (id)_fetchResultMatchingInternalPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIncludeGuestAssets:", 1);
  v10[0] = *MEMORY[0x1E0CD1978];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFetchPropertySets:", v7);

  objc_msgSend(v6, "setInternalPredicate:", v4);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)_numberOfAssetsMatchingInternalPredicate:(id)a3
{
  void *v3;
  unint64_t v4;

  -[PGManager _fetchResultMatchingInternalPredicate:](self, "_fetchResultMatchingInternalPredicate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)_behavioralStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;
  unint64_t v15;
  void *v16;
  float v17;
  void *v18;
  unint64_t v19;
  void *v20;
  PGBehavioralScoreProcessor *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t m;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  uint64_t n;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  uint64_t ii;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  uint64_t v90;
  void *v91;
  unint64_t v93;
  void *v94;
  unint64_t v95;
  void *v96;
  void *v97;
  PGBehavioralScoreProcessor *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  PGManager *v104;
  void *v105;
  void *v106;
  id v107;
  id obj;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", CFSTR("Personal Aesthetic Thresholds\n\n"));
  objc_msgSend(v4, "infoNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personalHighAestheticsThreshold");
  v8 = v7;
  v99 = v6;
  objc_msgSend(v6, "personalGoodAestheticsThreshold");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tHigh Threshold: %f"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tGood Threshold: %f"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v12);

  objc_msgSend(v5, "appendString:", CFSTR("\n\nInteraction Score Distribution\n\n"));
  v13 = 0.0;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(computedAttributes.interactionScore <= %f) AND (computedAttributes.interactionScore > %f) "), v13, (float)(v13 + -0.1));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PGManager _numberOfAssetsMatchingInternalPredicate:](self, "_numberOfAssetsMatchingInternalPredicate:", v14);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%0.2f < score <= %0.2f : %lu assets\n"), (float)(v13 + -0.1), v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v16);

    v13 = v13 + 0.1;
  }
  while (v13 <= 1.1);
  objc_msgSend(v5, "appendString:", CFSTR("\n\nBehavioral Score Distribution\n\n"));
  v17 = 0.0;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(computedAttributes.behavioralScore <= %f) AND (computedAttributes.behavioralScore > %f) "), v17, (float)(v17 + -0.1));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PGManager _numberOfAssetsMatchingInternalPredicate:](self, "_numberOfAssetsMatchingInternalPredicate:", v18);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%0.2f < score <= %0.2f : %lu assets\n"), (float)(v17 + -0.1), v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v20);

    v17 = v17 + 0.1;
  }
  while (v17 <= 1.1);
  v21 = -[PGBehavioralScoreProcessor initWithGraphManager:algorithm:]([PGBehavioralScoreProcessor alloc], "initWithGraphManager:algorithm:", self, 1);
  objc_msgSend(v5, "appendString:", CFSTR("\n\nGold and Gem Assets\n\n"));
  v22 = (void *)MEMORY[0x1E0CB3880];
  -[PGBehavioralScoreProcessor goldAssetUUIDs](v21, "goldAssetUUIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "predicateWithFormat:", CFSTR("uuid IN %@"), v23);
  v24 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(computedAttributes.behavioralScore < 1 AND computedAttributes.behavioralScore >= 0.9)"));
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(computedAttributes.behavioralScore < 0.9 AND computedAttributes.behavioralScore >= 0.7)"));
  v26 = objc_claimAutoreleasedReturnValue();
  v103 = (void *)v24;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tGold Assets : %lu"), -[PGManager _numberOfAssetsMatchingInternalPredicate:](self, "_numberOfAssetsMatchingInternalPredicate:", v24));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v27);

  v102 = (void *)v25;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tShiny Gems Assets : %lu"), -[PGManager _numberOfAssetsMatchingInternalPredicate:](self, "_numberOfAssetsMatchingInternalPredicate:", v25));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v28);

  v104 = self;
  v101 = (void *)v26;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\tRegular Gems Assets : %lu"), -[PGManager _numberOfAssetsMatchingInternalPredicate:](self, "_numberOfAssetsMatchingInternalPredicate:", v26));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v29);

  objc_msgSend(v5, "appendString:", CFSTR("\n\nPerson Features:\n"));
  -[PGBehavioralScoreProcessor peopleFeatures](v21, "peopleFeatures");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "keysSortedByValueUsingComparator:", &__block_literal_global_1191);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v4;
  +[PGGraphPersonNodeCollection personNodesForArrayOfLocalIdentifiers:inGraph:](PGGraphPersonNodeCollection, "personNodesForArrayOfLocalIdentifiers:inGraph:", v30, v4);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "personNodeByLocalIdentifier");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v30;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v129, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v124;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v124 != v33)
          objc_enumerationMutation(obj);
        v35 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * i);
        objc_msgSend(v114, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "objectForKeyedSubscript:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v37)
        {
          v39 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v37, "stringDescription");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("\t\t%@: %@\n"), v40, v36);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v41);

        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v129, 16);
    }
    while (v32);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\n\nScenes Features:\n"));
  v98 = v21;
  -[PGBehavioralScoreProcessor sceneFeatures](v21, "sceneFeatures");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "keysSortedByValueUsingComparator:", &__block_literal_global_1196);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E30]), "initForSceneNetOnly:", 1);
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v107 = v42;
  v43 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v120;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v120 != v45)
          objc_enumerationMutation(v107);
        v47 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
        objc_msgSend(v112, "objectForKeyedSubscript:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "nodeForIdentifier:", objc_msgSend(v47, "integerValue"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "name");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%@: %@\n"), v50, v48);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v51);

      }
      v44 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
    }
    while (v44);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\nCuration Scores among BC assets:\n"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v52);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\tCuration Score\t\t%%Gold Assets\t\t%%Shiny Gems\t\t%%Regular Gems"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v53);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager _fetchResultMatchingInternalPredicate:](v104, "_fetchResultMatchingInternalPredicate:", v103);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "count");
  if (v57)
  {
    for (k = 0; k != v57; ++k)
    {
      objc_msgSend(v56, "objectAtIndexedSubscript:", k);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v59, "curationScore");
      objc_msgSend(v60, "numberWithDouble:");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addObject:", v61);
      objc_msgSend(v54, "addObject:", v61);

    }
  }
  v95 = v57;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager _fetchResultMatchingInternalPredicate:](v104, "_fetchResultMatchingInternalPredicate:", v102);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "count");
  v106 = v63;
  if (v64)
  {
    for (m = 0; m != v64; ++m)
    {
      objc_msgSend(v63, "objectAtIndexedSubscript:", m);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v66, "curationScore");
      objc_msgSend(v67, "numberWithDouble:");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "addObject:", v68);
      objc_msgSend(v54, "addObject:", v68);

      v63 = v106;
    }
  }
  v93 = v64;
  v109 = v62;
  v110 = v55;
  v96 = v56;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManager _fetchResultMatchingInternalPredicate:](v104, "_fetchResultMatchingInternalPredicate:", v101);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "count");
  if (v71)
  {
    for (n = 0; n != v71; ++n)
    {
      objc_msgSend(v70, "objectAtIndexedSubscript:", n);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v73, "curationScore");
      objc_msgSend(v74, "numberWithDouble:");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addObject:", v75);
      objc_msgSend(v54, "addObject:", v75);

    }
  }
  v94 = v70;
  v105 = v54;
  objc_msgSend(v54, "allObjects");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "sortedArrayUsingSelector:", sel_compare_);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v78 = v77;
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v116;
    v82 = (double)v71;
    do
    {
      for (ii = 0; ii != v80; ++ii)
      {
        v84 = v5;
        if (*(_QWORD *)v116 != v81)
          objc_enumerationMutation(v78);
        v85 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * ii);
        v86 = (double)(unint64_t)objc_msgSend(v110, "countForObject:", v85) / (double)v95 * 100.0;
        v87 = (double)(unint64_t)objc_msgSend(v109, "countForObject:", v85) / (double)v93 * 100.0;
        v88 = (double)(unint64_t)objc_msgSend(v69, "countForObject:", v85) / v82 * 100.0;
        v89 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v85, "doubleValue");
        objc_msgSend(v89, "stringWithFormat:", CFSTR("\n\t%0.3f\t\t\t%0.3f\t\t\t%0.3f\t\t\t%0.3f"), v90, *(_QWORD *)&v86, *(_QWORD *)&v87, *(_QWORD *)&v88);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v84;
        objc_msgSend(v84, "appendString:", v91);

      }
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
    }
    while (v80);
  }

  return v5;
}

- (id)_stringDescriptionForMusicWithGraph:(id)a3 summaryOnly:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void (**v28)(void *, id, uint64_t);
  void *v30;
  id v31;
  void *v32;
  id obj;
  void *v34;
  uint64_t v35;
  uint64_t v37;
  _QWORD aBlock[4];
  id v39;
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
  v5 = a3;
  -[PGManager _dateFormatter](self, "_dateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "musicSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(v7, "appendFormat:", CFSTR("\nMusic Sessions: %lu\n"), v9);
  if (v9)
  {
    v30 = v8;
    v31 = v5;
    objc_msgSend(v8, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMusicSessionNode musicSessionDateSortDescriptors](PGGraphMusicSessionNode, "musicSessionDateSortDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v12;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v37)
    {
      v35 = *(_QWORD *)v45;
      v13 = 1;
      v32 = v6;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v15, "localStartDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localEndDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringFromDate:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringFromDate:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("\tSession %lu:\t[%@ - %@]\n"), v13, v18, v19);

          if (!a4)
          {
            objc_msgSend(v15, "trackNodes");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "allObjects");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGGraphMusicTrackNode musicTrackTitleSortDescriptors](PGGraphMusicTrackNode, "musicTrackTitleSortDescriptors");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sortedArrayUsingDescriptors:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v23 = v22;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v41;
              do
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v41 != v26)
                    objc_enumerationMutation(v23);
                  objc_msgSend(v7, "appendFormat:", CFSTR("\t\tTrack:\t%@\n"), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
              }
              while (v25);
            }

            v6 = v32;
          }
          ++v13;

        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v37);
    }

    v8 = v30;
    v5 = v31;
  }
  if (!a4)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("\n"));
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PGManager_Debug___stringDescriptionForMusicWithGraph_summaryOnly___block_invoke;
    aBlock[3] = &unk_1E84301B8;
    v39 = v7;
    v28 = (void (**)(void *, id, uint64_t))_Block_copy(aBlock);
    v28[2](v28, v5, 1);
    v28[2](v28, v5, 0);

  }
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));

  return v7;
}

void __68__PGManager_Debug___stringDescriptionForMusicWithGraph_summaryOnly___block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "musicGenreDistributionUsingTaggedGenres:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(v5, "count");
  v8 = CFSTR("original");
  if (a3)
    v8 = CFSTR("tagged");
  objc_msgSend(v6, "appendFormat:", CFSTR("\nMusic genre distribution for %lu %@ genre(s)"), v7, v8);
  objc_msgSend(v5, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v17 = *(void **)(a1 + 32);
        objc_msgSend(v5, "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appendFormat:", CFSTR("\n%@\t%@"), v16, v18, (_QWORD)v19);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v11, "count"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));

}

uint64_t __51__PGManager_Debug___behavioralStatisticsWithGraph___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __51__PGManager_Debug___behavioralStatisticsWithGraph___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __55__PGManager_Debug___stringDescriptionForPetsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
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
  _QWORD v59[5];

  v59[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ownerNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNode personSortDescriptors](PGGraphPersonNode, "personSortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphPetNode stringFromPetSpecies:](PGGraphPetNode, "stringFromPetSpecies:", objc_msgSend(v2, "petSpecies"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ with name \"%@\" and local identifier \"%@\" owned by:"), v8, v9, v10);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "name");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (const __CFString *)v16;
        else
          v18 = CFSTR("Unnamed owner");
        objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v13);
  }
  v46 = v11;

  v47 = v2;
  objc_msgSend(v2, "collection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "momentNodes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v22;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "sortedArrayUsingDescriptors:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localStartDate");
  v27 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localStartDate");
  v29 = objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v25, "count");
  v45 = (void *)v27;
  objc_msgSend(*(id *)(a1 + 32), "stringFromDate:", v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v29;
  objc_msgSend(*(id *)(a1 + 32), "stringFromDate:", v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t%lu moments from %@ to %@:\n"), v30, v31, v32);

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v33 = v25;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v50 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        v39 = *(void **)(a1 + 32);
        objc_msgSend(v38, "localStartDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringFromDate:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\t\t%@"), v41);

        objc_msgSend(v38, "bestAddressNode");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "keywordDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\t\t\t%@\n"), v43);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v35);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
}

void __79__PGManager_Debug__sharingMessageSuggestionDebugInformationForAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[7];
  _QWORD v23[7];
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "graph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphMomentNodeCollection momentNodeForUUID:inGraph:](PGGraphMomentNodeCollection, "momentNodeForUUID:inGraph:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v22[0] = CFSTR("title");
    objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E8436F28;
    if (v9)
      v11 = (const __CFString *)v9;
    v23[0] = v11;
    v23[1] = &unk_1E84E4868;
    v22[1] = CFSTR("numberOfMoments");
    v22[2] = CFSTR("numberOfHighlights");
    v23[2] = &unk_1E84E4880;
    v23[3] = &unk_1E84E4778;
    v22[3] = CFSTR("graphSchemaVersion");
    v22[4] = CFSTR("curationAlgorithmsVersion");
    v23[4] = &unk_1E84E4790;
    v23[5] = &unk_1E84E4628;
    v22[5] = CFSTR("relatedAlgorithmsVersion");
    v22[6] = CFSTR("memoriesAlgorithmsVersion");
    v23[6] = &unk_1E84E47A8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, CFSTR("info"));

    v13 = *(void **)(a1 + 48);
    objc_msgSend(v8, "naturalLanguageFeatures");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_sortedTextFeaturesFromTextFeatures:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79__PGManager_Debug__sharingMessageSuggestionDebugInformationForAssetCollection___block_invoke_1133;
    v20[3] = &unk_1E8430108;
    v21 = v16;
    v17 = v16;
    -[NSObject enumerateObjectsUsingBlock:](v15, "enumerateObjectsUsingBlock:", v20);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v17, CFSTR("textFeatures"));

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "No moment node found for %@", buf, 0xCu);
    }
  }

}

void __79__PGManager_Debug__sharingMessageSuggestionDebugInformationForAssetCollection___block_invoke_1133(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%lu"), a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
}

void __50__PGManager_Debug___dayOfWeekStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  objc_msgSend(a2, "collection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PGManager_Debug___dayOfWeekStatisticsWithGraph___block_invoke_2;
  v5[3] = &unk_1E842FA68;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateNodesUsingBlock:", v5);

}

uint64_t __50__PGManager_Debug___dayOfWeekStatisticsWithGraph___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __50__PGManager_Debug___snapshotFilenameForLookupKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Graph.plist"), CFSTR("snapshotFilenameForGraphState"), CFSTR("photosgraph.kgdb"), CFSTR("filenameForGraphKGDBSnapshot"), CFSTR("CurationResult.bundle"), CFSTR("snapshotFilenameForCurationResults"), CFSTR("DebugInfoForRelated.plist"), CFSTR("snapshotFilenameForDebugInfoForRelated"), CFSTR("Memories.plist"), CFSTR("snapshotFilenameForMemories"), CFSTR("LibraryStatistics.plist"), CFSTR("snapshotFilenameForLibraryStatistics"), CFSTR("Errors.txt"), CFSTR("snapshotFilenameForErrors"), CFSTR("GraphStatistics.txt"), CFSTR("snapshotFilenameForGraphStatistics"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_snapshotFilenameForLookupKey__snapshotFilenameLookup;
  _snapshotFilenameForLookupKey__snapshotFilenameLookup = v0;

}

void __67__PGManager_Debug__sharingSuggestionDebugInformationForSuggestion___block_invoke(uint64_t a1, void *a2)
{
  PGNeighborScoreComputer *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  PGNeighborScoreComputer *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  id v45;
  _QWORD v46[4];
  PGNeighborScoreComputer *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  double *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[24];
  _QWORD v68[24];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v45 = a2;
  v63 = 0;
  v64 = (double *)&v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v3 = objc_alloc_init(PGNeighborScoreComputer);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v52 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v9, "localIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        objc_msgSend(v9, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
    }
    while (v6);
  }

  objc_msgSend(v45, "graph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v4, v13);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __67__PGManager_Debug__sharingSuggestionDebugInformationForSuggestion___block_invoke_2;
  v46[3] = &unk_1E8430038;
  v30 = v3;
  v47 = v30;
  v48 = &v63;
  v49 = &v59;
  v50 = &v55;
  objc_msgSend(v44, "enumerateNodesUsingBlock:", v46);
  objc_msgSend(*(id *)(a1 + 48), "featuresProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("deviceInformation"));
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v67[0] = CFSTR("title");
  objc_msgSend(*(id *)(a1 + 48), "localizedTitle");
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = v43;
  if (!v43)
    v15 = &stru_1E8436F28;
  v68[0] = v15;
  v67[1] = CFSTR("subtitle");
  objc_msgSend(*(id *)(a1 + 48), "localizedSubtitle");
  v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = v42;
  if (!v42)
    v16 = &stru_1E8436F28;
  v68[1] = v16;
  v67[2] = CFSTR("creationDate");
  objc_msgSend(*(id *)(a1 + 48), "creationDate");
  v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = v41;
  if (!v41)
    v17 = &stru_1E8436F28;
  v68[2] = v17;
  v67[3] = CFSTR("activationDate");
  objc_msgSend(*(id *)(a1 + 48), "activationDate");
  v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v40;
  if (!v40)
    v18 = &stru_1E8436F28;
  v68[3] = v18;
  v67[4] = CFSTR("relevantUntilDate");
  objc_msgSend(*(id *)(a1 + 48), "relevantUntilDate");
  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = v39;
  if (!v39)
    v19 = &stru_1E8436F28;
  v68[4] = v19;
  v67[5] = CFSTR("expungeDate");
  objc_msgSend(*(id *)(a1 + 48), "expungeDate");
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = v38;
  if (!v38)
    v20 = &stru_1E8436F28;
  v68[5] = v20;
  v67[6] = CFSTR("type");
  objc_msgSend(*(id *)(a1 + 48), "type");
  PHSuggestionStringWithType();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v68[6] = v37;
  v67[7] = CFSTR("subtype");
  objc_msgSend(*(id *)(a1 + 48), "subtype");
  PHSuggestionStringWithSubtype();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v68[7] = v36;
  v67[8] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 48), "state"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v68[8] = v35;
  v67[9] = CFSTR("notificationState");
  objc_msgSend(*(id *)(a1 + 48), "notificationState");
  PHSuggestionNotificationStateStringWithNotificationState();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v68[9] = v34;
  v67[10] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "version"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v68[10] = v33;
  v67[11] = CFSTR("neighborScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v64[3]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v68[11] = v32;
  v67[12] = CFSTR("neighborScoreInteresting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64[3] > 0.43);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v68[12] = v21;
  v67[13] = CFSTR("neighborScoreHighlyInteresting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64[3] > 0.6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v68[13] = v22;
  v67[14] = CFSTR("isInteresting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v60 + 24));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v68[14] = v23;
  v67[15] = CFSTR("isSmartInteresting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v56 + 24));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v68[15] = v24;
  v67[16] = CFSTR("representativeAssetsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 64), "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v68[16] = v25;
  v67[17] = CFSTR("keyAssetsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 72), "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v68[17] = v26;
  v67[18] = CFSTR("numberOfMoments");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v68[18] = v27;
  v68[19] = &unk_1E84E4778;
  v67[19] = CFSTR("graphSchemaVersion");
  v67[20] = CFSTR("curationAlgorithmsVersion");
  v68[20] = &unk_1E84E4790;
  v68[21] = &unk_1E84E4628;
  v67[21] = CFSTR("relatedAlgorithmsVersion");
  v67[22] = CFSTR("memoriesAlgorithmsVersion");
  v67[23] = CFSTR("deviceInfo");
  v28 = v31;
  if (!v31)
    v28 = &stru_1E8436F28;
  v68[22] = &unk_1E84E47A8;
  v68[23] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v29, CFSTR("info"));

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

}

void __67__PGManager_Debug__sharingSuggestionDebugInformationForSuggestion___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  uint64_t v6;
  char v7;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "neighborScoreWithMomentNode:", v4);
  v6 = *(_QWORD *)(a1[5] + 8);
  if (v5 > *(double *)(v6 + 24))
    *(double *)(v6 + 24) = v5;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) |= objc_msgSend(v4, "isInteresting");
  v7 = objc_msgSend(v4, "isSmartInteresting");

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) |= v7;
}

uint64_t __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "nodesCountForDomain:", (unsigned __int16)a2);
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\ndomain %lu %lu"), a2, result);
  return result;
}

uint64_t __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "edgesCountForLabel:domain:", 0, (unsigned __int16)a2);
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\ndomain %lu %lu"), a2, result);
  return result;
}

uint64_t __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __57__PGManager_Debug___domainLabelCountStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __71__PGManager_Debug___stringDescriptionForPublicEventsWithGraph_verbose___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v12;
  void *v13;
  id v14;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "localStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  objc_msgSend(v3, "localEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 48);
  v29 = (void *)v9;
  v30 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\t\t\tmoment: [%@ - %@]"), v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(v3, "universalStartDate");
  v12 = objc_claimAutoreleasedReturnValue();
  v31 = v3;
  objc_msgSend(v3, "universalEndDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v12;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v12, v27);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = *(id *)(a1 + 56);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v18), "universalDateIntervalIncludingTime");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "intersectsDateInterval:", v19))
        {
          v20 = *(void **)(a1 + 40);
          objc_msgSend(v19, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringFromDate:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = *(void **)(a1 + 40);
          objc_msgSend(v19, "endDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringFromDate:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@ - %@]"), v22, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v26);

        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v16);
  }

}

void __44__PGManager_Debug___poiStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v6, "count");
  objc_msgSend(v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n%@: %lu\n"), v5, objc_msgSend(v6, "count"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PGManager_Debug___poiStatisticsWithGraph___block_invoke_2;
  v7[3] = &unk_1E84352A0;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v7);

}

void __44__PGManager_Debug___poiStatisticsWithGraph___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "localStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "localEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\tmoment:\t[%@ - %@]\n"), v9, v8);
}

void __109__PGManager_Debug___stringDescriptionForBusinessItemsWithGraph_includingInferredThroughPublicEvents_verbose___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "localStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 40);
  objc_msgSend(v5, "localEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v32, "universalStartDate");
    v12 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v12;
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "stringFromDate:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v32, "universalEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 40), "stringFromDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v17 = objc_msgSend(v32, "hasRoutineInfo");
    v18 = CFSTR("location cluster");
    if (v17)
      v18 = CFSTR("routine");
    v19 = v18;
    v30 = (void *)v13;
    v29 = v8;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v13, v16);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = CFSTR("N/A");
    }
    v21 = *(void **)(a1 + 40);
    objc_msgSend(v5, "universalStartDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringFromDate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = *(void **)(a1 + 40);
    objc_msgSend(v5, "universalEndDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringFromDate:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v32, "confidence");
    objc_msgSend(v27, "stringWithFormat:", CFSTR("\n\t\tmoment:\t[%@ - %@],\n\t\t\tconfidence %.2f,\n\t\t\tmoment (utc): [%@ - %@],\n\t\t\t%@ visit (utc): [%@]"), v29, v11, v28, v23, v26, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v29;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\t\tmoment:\t[%@ - %@]"), v8, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);

}

void __60__PGManager_Debug___stringDescriptionForLocationsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "fullname");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addressNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu: %@"), v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "addObject:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v7);
  }

}

void __72__PGManager_Debug___stringDescriptionForDisambiguatedPOIsInMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "poiIsImproved"))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v8, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("- Improved: %@ - %@\n"), v6, v7);

  }
}

void __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  v5 = objc_msgSend(v3, "isImproved");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    objc_msgSend(v3, "coordinate");
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("- Improved: {%f, %f}\n"), v7, v8);
    objc_msgSend(v3, "edgesForLabel:domain:", CFSTR("ADDRESS"), 200);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", 0, 1, &__block_literal_global_47857);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingDescriptors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_3;
    v15[3] = &unk_1E842FEC0;
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

  }
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_4;
  v13[3] = &unk_1E842FEE8;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("REMOTE_ADDRESS"), 200, v13);

  objc_autoreleasePoolPop(v4);
}

void __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "photoCoordinate");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "sourceNode");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v10, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("\t %@ {%f, %f}\n"), v9, v5, v7);

}

void __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "timestampUTCStart");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

uint64_t __73__PGManager_Debug___stringDescriptionForDisambiguatedLocationsWithGraph___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

void __48__PGManager_Debug___stringDescriptionForMeNode___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "streetNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyNode");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "cityNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%@, %@}"), v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Work"));
  v17 = 40;
  if (v16)
    v17 = 32;
  v18 = *(id *)(a1 + v17);
  if ((objc_msgSend(v18, "containsString:", v14) & 1) != 0)
  {
LABEL_6:
    if (!v13)
      goto LABEL_10;
    goto LABEL_7;
  }
  if (objc_msgSend(v18, "length"))
  {
    objc_msgSend(v18, "appendFormat:", CFSTR(", %@"), v14);
    goto LABEL_6;
  }
  objc_msgSend(v18, "appendString:", v14);
  if (!v13)
    goto LABEL_10;
LABEL_7:
  v19 = 56;
  if (v16)
    v19 = 48;
  objc_msgSend(*(id *)(a1 + v19), "addObject:", v13);
LABEL_10:

}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke(id *a1, void *a2)
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

  v3 = a2;
  objc_msgSend(v3, "stringDescription");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "birthdayDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anniversaryDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "potentialBirthdayDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "stringFromDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v8, v13);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v10, v13);

  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v12, v13);

  }
}

uint64_t __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "targetNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("BIRTHDAY"));

  if (v8)
  {
    v9 = (id *)(a1 + 32);
LABEL_5:
    v12 = *v9;
    goto LABEL_7;
  }
  objc_msgSend(v16, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ANNIVERSARY"));

  if (v11)
  {
    v9 = (id *)(a1 + 40);
    goto LABEL_5;
  }
  v12 = 0;
LABEL_7:
  objc_msgSend(v12, "objectForKeyedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v4);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v6);

}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\t%@: %@\n"), v4, v5);

}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\t%@: %@\n"), v4, v7);

}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\t%@: %@\n"), v4, v5);

}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\t%@: %@\n"), v4, v5);

}

void __63__PGManager_Debug___stringDescriptionForPeopleEventsWithGraph___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\t%@: %@\n"), v4, v7);

}

void __53__PGManager_Debug___stringDescriptionForUrbanCities___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "addressNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

void __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "localDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  v6 = v3;
  if (!v5)
    goto LABEL_4;
  if (objc_msgSend(v5, "compare:") == 1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v3 = v6;
LABEL_4:
    objc_storeStrong((id *)(v4 + 40), v3);
  }

}

void __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id obj;

  objc_msgSend(a2, "localDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  obj = v3;
  if (!v5)
    goto LABEL_4;
  v6 = objc_msgSend(v5, "compare:", v3);
  v3 = obj;
  if (v6 == -1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v4 + 40), v3);
    v3 = obj;
  }

}

void __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v5 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v6 = CFSTR("%@");
  else
    v6 = CFSTR(", %@");
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", v6, v7);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __103__PGManager_Debug___stringDescriptionForMeaningfulEvents_isTrip_forDiagnostics_titleGenerationContext___block_invoke_867(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a2;
  objc_msgSend(a3, "label");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(v5, "isReliable"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v5, "confidence");
  v10 = v9;

  objc_msgSend(v7, "stringWithFormat:", CFSTR("(%@, reliable %@, %.2f)"), v12, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

}

void __59__PGManager_Debug___numberOfFamilyHolidayMomentsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  v3 = a2;
  if (objc_msgSend(v3, "category") == 2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__PGManager_Debug___numberOfFamilyHolidayMomentsWithGraph___block_invoke_2;
    v4[3] = &unk_1E842FA68;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "enumerateCelebratingMomentNodesUsingBlock:", v4);
  }

}

uint64_t __59__PGManager_Debug___numberOfFamilyHolidayMomentsWithGraph___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(a2, "stringDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v18, "status");
  +[PGGraphRelationshipEdge relationshipSourceToString:](PGGraphRelationshipEdge, "relationshipSourceToString:", objc_msgSend(v18, "source"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v18, "confidence");
    v9 = v8;
    v10 = CFSTR("FILTERED OUT");
    if (v6 == 1)
      v10 = CFSTR("INFERRED");
    if (*(_BYTE *)(a1 + 48))
    {
      v11 = v10;
      objc_msgSend(v18, "description");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (%@ %0.2f) (Source: %@) : %@"), v5, v11, *(_QWORD *)&v9, v7, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v12 = v10;
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ (%@ %0.2f) (Source: %@)"), v5, v12, *(_QWORD *)&v9, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v17, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (GROUND TRUTH) (Source: %@)"), v5, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
  }

}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v8 = a2;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringDescriptionForSocialGroups:includeImportance:", v6, 0, v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "description");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\t%@\n"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v4);

}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_4(uint64_t a1, void *a2)
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
  id v12;
  void *v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "targetNode");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v14, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v5, CFSTR("n/a"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = v12;

  objc_msgSend(v13, "addObject:", v9);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v8);

}

void __79__PGManager_Debug___peopleRelationshipsStatisticsWithGraph_includingDebugInfo___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(a3, "allObjects");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ - %@\n"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendString:", v8);
}

void __73__PGManager_Debug___partOfDayStatisticsWithGraph_titleGenerationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  objc_msgSend(a3, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "ratio");
  v8 = v7;

  objc_msgSend(v6, "appendFormat:", CFSTR("[%@ %.2f] "), v9, v8);
}

void __52__PGManager_Debug___interestingStatisticsWithGraph___block_invoke(_QWORD *a1, uint64_t a2)
{
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

  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  if (+[PGCurationManager areAssetsInteresting:minimumNumberOfCuratedAssets:duration:](PGCurationManager, "areAssetsInteresting:minimumNumberOfCuratedAssets:duration:", a1[4], a2, 2))
  {
    v5 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, v10);

    v11 = (void *)a1[6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)a1[6];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v13, v15);

    }
    objc_msgSend(v13, "addObject:", a1[7]);

  }
  objc_autoreleasePoolPop(v4);
}

void __52__PGManager_Debug___interestingStatisticsWithGraph___block_invoke_747(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v8 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intersectSet:", v10);

  v11 = *(void **)(a1 + 48);
  v12 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("\tminimumCurated=%lu %@/%lu (%lu)\n"), a2, v13, objc_msgSend(*(id *)(a1 + 64), "count"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"));

}

void __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PGMoodGenerator *v5;
  void *v6;
  PGMoodGenerator *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *context;
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[7];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "momentNodeForMoment:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInteresting"))
  {
    context = (void *)MEMORY[0x1CAA4EB2C]();
    v5 = [PGMoodGenerator alloc];
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PGMoodGenerator initWithAssetCollection:photoLibrary:options:](v5, "initWithAssetCollection:photoLibrary:options:", v3, v6, 0);

    -[PGMoodGenerator positiveMoodVectorWithGraph:](v7, "positiveMoodVectorWithGraph:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMoodGenerator negativeMoodVectorWithGraph:](v7, "negativeMoodVectorWithGraph:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMoodGenerator positiveThreshold](v7, "positiveThreshold");
    v11 = v10;
    -[PGMoodGenerator negativeThreshold](v7, "negativeThreshold");
    v13 = v12;
    v14 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v14, "filterWithMoods:", ~objc_msgSend(v9, "moodsWithThreshold:", v13));
    v15 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_2;
    v25[3] = &unk_1E842FC00;
    v25[5] = v11;
    v25[4] = *(_QWORD *)(a1 + 64);
    objc_msgSend(v8, "enumerateWithBlock:", v25);
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_3;
    v24[3] = &unk_1E842FC00;
    *(double *)&v24[5] = v13;
    v24[4] = *(_QWORD *)(a1 + 72);
    objc_msgSend(v9, "enumerateWithBlock:", v24);
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_4;
    v23[3] = &unk_1E842FC00;
    v23[5] = v11;
    v23[4] = *(_QWORD *)(a1 + 80);
    objc_msgSend(v14, "enumerateWithBlock:", v23);
    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    -[PGMoodGenerator suggestedMoodWithGraph:](v7, "suggestedMoodWithGraph:", *(_QWORD *)(a1 + 32));
    PHStringForMemoryMood();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    v18 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v18, "substractMoodVector:", *(_QWORD *)(a1 + 48));
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v19, "multiplyByWeight:", 1.0 / ((double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + 1.0));
    objc_msgSend(*(id *)(a1 + 48), "addMoodVector:", v19);
    v20 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v20, "substractMoodVector:", *(_QWORD *)(a1 + 48));
    v21 = v18;

    objc_msgSend(v21, "multiplyMoodVector:", v20);
    objc_msgSend(*(id *)(a1 + 56), "addMoodVector:", v21);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    objc_autoreleasePoolPop(context);
  }

}

void __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_2(uint64_t a1, double a2)
{
  void *v2;
  id v3;

  if (*(double *)(a1 + 40) <= a2)
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    PHStringForMemoryMood();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_3(uint64_t a1, double a2)
{
  void *v2;
  id v3;

  if (*(double *)(a1 + 40) <= a2)
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    PHStringForMemoryMood();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void __45__PGManager_Debug___moodStatisticsWithGraph___block_invoke_4(uint64_t a1, double a2)
{
  void *v2;
  id v3;

  if (*(double *)(a1 + 40) <= a2)
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    PHStringForMemoryMood();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
}

void __54__PGManager_Debug___socialGroupsDebugStringWithGraph___block_invoke(uint64_t a1, void *a2, float a3, double a4, double a5, double a6, float a7, float a8, float a9, float a10, uint64_t a11, void *a12, void *a13, float a14, float a15)
{
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v26 = a12;
  v27 = a13;
  v44 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "sortedArrayUsingComparator:", PGManagerPersonNodeComparisonBlock);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v30 = v28;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v47;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v34);
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "length"))
        {
          if (!v36)
            goto LABEL_9;
LABEL_8:
          objc_msgSend(v29, "addObject:", v36);
          goto LABEL_9;
        }
        objc_msgSend(v35, "stringDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lowercaseString");
        v38 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)v38;
        if (v38)
          goto LABEL_8;
LABEL_9:

        ++v34;
      }
      while (v32 != v34);
      v39 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      v32 = v39;
    }
    while (v39);
  }

  v40 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR("%@ [wgt=%.4f, mom=%ld, supMom=%ld, excMomF=%.2f, supMomF=%.2f, familyF=%.2f, recF=%.2f, semCohF=%.2f, peoCohF=%.2f, rank=%.4f]"), v41, a3, objc_msgSend(v26, "count"), objc_msgSend(v27, "count"), a7, a8, a9, a14, a10, *(_QWORD *)&a4, a15);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "stringWithFormat:", CFSTR("\t%@\n"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v43);
}

void __54__PGManager_Debug___socialGroupsDebugStringWithGraph___block_invoke_2(uint64_t a1, void *a2, float a3, double a4, double a5, double a6, float a7, float a8, float a9, float a10, uint64_t a11, void *a12, void *a13, float a14, float a15)
{
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v26 = a12;
  v27 = a13;
  v44 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "sortedArrayUsingComparator:", PGManagerPersonNodeComparisonBlock);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v30 = v28;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v47;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v34);
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "length"))
        {
          if (!v36)
            goto LABEL_9;
LABEL_8:
          objc_msgSend(v29, "addObject:", v36);
          goto LABEL_9;
        }
        objc_msgSend(v35, "stringDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "lowercaseString");
        v38 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)v38;
        if (v38)
          goto LABEL_8;
LABEL_9:

        ++v34;
      }
      while (v32 != v34);
      v39 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      v32 = v39;
    }
    while (v39);
  }

  v40 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR("%@ [wgt=%.4f, mom=%ld, supMom=%ld, excMomF=%.2f, supMomF=%.2f, familyF=%.2f, recF=%.2f, semCohF=%.2f, peoCohF=%.2f, rank=%.4f]"), v41, a3, objc_msgSend(v26, "count"), objc_msgSend(v27, "count"), a7, a8, a9, a14, a10, *(_QWORD *)&a4, a15);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "stringWithFormat:", CFSTR("\t%@\n"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v43);
}

void __70__PGManager_Debug___socialGroupsDebugStringIncludingMeNode_withGraph___block_invoke(uint64_t a1, void *a2, float a3, double a4, uint64_t a5, void *a6)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "sortedArrayUsingComparator:", PGManagerPersonNodeComparisonBlock);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length"))
        {
          if (!v19)
            goto LABEL_9;
LABEL_8:
          objc_msgSend(v12, "addObject:", v19);
          goto LABEL_9;
        }
        objc_msgSend(v18, "stringDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lowercaseString");
        v21 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v21;
        if (v21)
          goto LABEL_8;
LABEL_9:

        ++v17;
      }
      while (v15 != v17);
      v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v15 = v22;
    }
    while (v22);
  }

  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ [moments=%ld, weight=%.4f, cohesion=%.2f]"), v24, objc_msgSend(v9, "count"), a3, *(_QWORD *)&a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", CFSTR("\t%@\n"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v26);
}

void __70__PGManager_Debug___socialGroupsDebugStringIncludingMeNode_withGraph___block_invoke_2(uint64_t a1, void *a2, float a3, double a4, uint64_t a5, void *a6)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "sortedArrayUsingComparator:", PGManagerPersonNodeComparisonBlock);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length"))
        {
          if (!v19)
            goto LABEL_9;
LABEL_8:
          objc_msgSend(v12, "addObject:", v19);
          goto LABEL_9;
        }
        objc_msgSend(v18, "stringDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lowercaseString");
        v21 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v21;
        if (v21)
          goto LABEL_8;
LABEL_9:

        ++v17;
      }
      while (v15 != v17);
      v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v15 = v22;
    }
    while (v22);
  }

  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ [moments=%ld, weight=%.4f, cohesion=%.2f]"), v24, objc_msgSend(v9, "count"), a3, *(_QWORD *)&a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", CFSTR("\t%@\n"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v26);
}

void __42__PGManager_Debug___entityTagsStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personNodes");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tTag: %@. Total number of persons: %lu. List of persons:\n"), v6, objc_msgSend(v7, "count"));

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PGManager_Debug___entityTagsStatistics___block_invoke_2;
  v8[3] = &unk_1E842FB88;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateNeighborEdgesAndNodesThroughInEdgesUsingBlock:", v8);

}

void __42__PGManager_Debug___entityTagsStatistics___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "confidence");
  v7 = v6;

  objc_msgSend(v4, "appendFormat:", CFSTR("\t\t%@, confidence: %.2f\n"), v8, v7);
}

void __45__PGManager_Debug___sharedLibraryStatistics___block_invoke(uint64_t a1, void *a2)
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "shareParticipantLocalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "appendFormat:", CFSTR("\tPerson with share participant identifier: %@, Description: %@\n"), v5, v6);
  objc_msgSend(v22, "authoredMomentNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tMoments authored: %lu"), objc_msgSend(v7, "count"));
  +[PGGraphPeoplePersonIsAroundEdge filter](PGGraphPeoplePersonIsAroundEdge, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "outRelation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", v22, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphPersonProximityEdge filter](PGGraphPersonProximityEdge, "filter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "outRelation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", v22, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphPersonPresentEdge filter](PGGraphPersonPresentEdge, "filter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "outRelation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", v22, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tMoments where pressent: CoreRoutine: %lu, PeopleProximity: %lu, Face Detection: %lu"), objc_msgSend(v10, "count"), objc_msgSend(v13, "count"), objc_msgSend(v16, "count"));
  objc_msgSend(v22, "momentNodesWithPresence");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tMoments where physically pressent: %lu"), objc_msgSend(v17, "count"));
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __45__PGManager_Debug___sharedLibraryStatistics___block_invoke_2;
  v23[3] = &unk_1E842FB60;
  v24 = v7;
  v25 = v10;
  v26 = v13;
  v27 = v16;
  v28 = *(id *)(a1 + 32);
  v18 = v16;
  v19 = v13;
  v20 = v10;
  v21 = v7;
  objc_msgSend(v17, "enumerateNodesUsingBlock:", v23);

}

void __45__PGManager_Debug___sharedLibraryStatistics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v9, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(*(id *)(a1 + 32), "intersectsCollection:", v4))
    objc_msgSend(v5, "addObject:", CFSTR("Author"));
  if (objc_msgSend(*(id *)(a1 + 40), "intersectsCollection:", v4))
    objc_msgSend(v5, "addObject:", CFSTR("CoreRoutine"));
  if (objc_msgSend(*(id *)(a1 + 48), "intersectsCollection:", v4))
    objc_msgSend(v5, "addObject:", CFSTR("PeopleProximity"));
  if (objc_msgSend(*(id *)(a1 + 56), "intersectsCollection:", v4))
    objc_msgSend(v5, "addObject:", CFSTR("FaceDetection"));
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("/"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("undefined");
  }
  v7 = *(void **)(a1 + 64);
  objc_msgSend(v9, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\t\t%@ - %@\n"), v8, v6);

  objc_autoreleasePoolPop(v3);
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *context;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v3, "edgesForLabel:domain:", CFSTR("NEXT"), 101);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "sourceNode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isSameNodeAsNode:", v3);

        objc_msgSend(v10, "targetNode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isSameNodeAsNode:", v3);

        if ((v12 & v7) == 1)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("Moment node can have at most one next edge, moment %@\n"), v3);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = v15;

        }
        if ((v14 & v6) == 1)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("Moment node can have at most one previous edge, moment %@\n"), v3);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v20 = *(void **)(v19 + 40);
          *(_QWORD *)(v19 + 40) = v18;

        }
        v7 |= v12;
        v6 |= v14;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v5);
  }
  objc_msgSend(v3, "dateNodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("Moment node is not linked to any date node, which is not supposed to happen\n%@\n"), v3, v25);
    goto LABEL_16;
  }
  if ((unint64_t)objc_msgSend(v21, "count") >= 3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("Moment node is linked to more than two date nodes, which is not supposed to happen\n%@ - %@\n"), v3, v21);
LABEL_16:
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
  objc_autoreleasePoolPop(context);

}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  objc_msgSend(*(id *)(a1 + 40), "infoNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canAccessContactsStore");

  objc_msgSend(v21, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = CFSTR("Me node has no name\n");
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = v6;
    v9 = CFSTR("Me node has a non-string name '%@'\n");
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "length"))
    v7 = 0;
  else
    v7 = v5;
  if (v7 == 1)
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = CFSTR("Me node has an empty name\n");
LABEL_12:
    objc_msgSend(v8, "stringByAppendingFormat:", v9, v20);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  objc_msgSend(v21, "contactIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v16 = CFSTR("Me node has no cnid\n");
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = v13;
    v16 = CFSTR("Me node has a non-string cnid '%@'\n");
    goto LABEL_22;
  }
  if (objc_msgSend(v13, "length"))
    v14 = 0;
  else
    v14 = v5;
  if (v14 == 1)
  {
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v16 = CFSTR("Me node has an empty cnid\n");
LABEL_22:
    objc_msgSend(v15, "stringByAppendingFormat:", v16, v20);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a2, "localIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = CFSTR("People node has no uuid\n");
LABEL_8:
    objc_msgSend(v3, "stringByAppendingFormat:", v4, v8);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", CFSTR("People node has a non-string uuid '%@'\n"), v9);
LABEL_9:
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    goto LABEL_10;
  }
  if (!objc_msgSend(v9, "length"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v4 = CFSTR("People node has an empty uuid\n");
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
LABEL_10:

}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(a2, "UUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v4 = CFSTR("Social Group node has no uuid\n");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v9;
    v4 = CFSTR("Social Group node has a non-string uuid '%@'\n");
    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "length"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v4 = CFSTR("Social Group node has an empty uuid\n");
LABEL_7:
    objc_msgSend(v3, "stringByAppendingFormat:", v4, v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  double latitude;
  double longitude;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  CLLocationCoordinate2D v35;

  v34 = a2;
  objc_msgSend(v34, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Address")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Country")))
    {
      objc_msgSend(v34, "name");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v7, "length"))
          {
LABEL_32:

            goto LABEL_33;
          }
          v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          objc_msgSend(v34, "label");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("%@ node has an empty name\n"), v9, v33);
        }
        else
        {
          v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          objc_msgSend(v34, "label");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("%@ node has a non-string name '%@'\n"), v9, v7);
        }
      }
      else
      {
        v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v34, "label");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("%@ node has no name\n"), v9, v33);
      }
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

LABEL_31:
      goto LABEL_32;
    }
    v7 = v34;
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v9, "length"))
          goto LABEL_23;
        v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v7, "label");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("%@ node has an empty name\n"), v14, v33);
      }
      else
      {
        v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v7, "label");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("%@ node has a non-string name '%@'\n"), v14, v9);
      }
    }
    else
    {
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v7, "label");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("%@ node has no name\n"), v14, v33);
    }
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

LABEL_23:
    objc_msgSend(v7, "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v25, "length"))
        {
LABEL_30:

          goto LABEL_31;
        }
        v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v7, "label");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringByAppendingFormat:", CFSTR("%@ node has an empty uuid\n"), v27, v33);
      }
      else
      {
        v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v7, "label");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringByAppendingFormat:", CFSTR("%@ node has a non-string uuid '%@'\n"), v27, v25);
      }
    }
    else
    {
      v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v7, "label");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByAppendingFormat:", CFSTR("%@ node has no uuid\n"), v27, v33);
    }
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

    goto LABEL_30;
  }
  objc_msgSend(v34, "coordinate");
  latitude = v35.latitude;
  longitude = v35.longitude;
  if (!CLLocationCoordinate2DIsValid(v35))
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v34, "label");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("%@ node has invalid coordinates\n"), v7);
    goto LABEL_12;
  }
  if (longitude == 0.0 && latitude == 0.0)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v34, "label");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("%@ node has null latitude and longitude\n"), v7);
LABEL_12:
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
    goto LABEL_31;
  }
LABEL_33:

}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(a2, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v4 = CFSTR("Area node has no name\n");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v9;
    v4 = CFSTR("Area node has a non-string name '%@'\n");
    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "length"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v4 = CFSTR("Area node has an empty name\n");
LABEL_7:
    objc_msgSend(v3, "stringByAppendingFormat:", v4, v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Date")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Season")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfDay")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("DayOfWeek")))
  {
    objc_msgSend(v9, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("%@ node has a non-string name '%@'\n"), v3, v4);
        goto LABEL_17;
      }
      if (!objc_msgSend(v4, "length"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("%@ node has an empty name\n"), v3, v8);
LABEL_17:
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v7 = *(void **)(v6 + 40);
        *(_QWORD *)(v6 + 40) = v5;

      }
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_16;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Weekend")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("Weekday")) & 1) == 0)
  {
    objc_msgSend(v9, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("%@ node has a string name '%@'\n"), v3, v4);
        goto LABEL_17;
      }
      if (objc_msgSend(v4, "integerValue") < 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("%@ node has negative name\n"), v3, v8);
        goto LABEL_17;
      }
      goto LABEL_18;
    }
LABEL_16:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingFormat:", CFSTR("%@ node has no name\n"), v3, v8);
    goto LABEL_17;
  }
LABEL_19:

}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(a2, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v4 = CFSTR("Holiday node has no name\n");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v9;
    v4 = CFSTR("Holiday node has a non-string name '%@'\n");
    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "length"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v4 = CFSTR("Holiday node has an empty name\n");
LABEL_7:
    objc_msgSend(v3, "stringByAppendingFormat:", v4, v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "uniqueMemoryIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", CFSTR("Two memory nodes have the same unique identifier %@: %@, %@\n"), v7, v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(id *)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v7);
  }

}

void __45__PGManager_Debug___checkConsistencyOfGraph___block_invoke_10(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EF981208);
  v4 = v11;
  if (v3)
  {
    v5 = v11;
    objc_msgSend(v5, "featureIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "stringByAppendingFormat:", CFSTR("Two feature nodes have the same unique identifier %@: %@, %@\n"), v6, v7, v5);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);
    }

    v4 = v11;
  }

}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke(uint64_t a1, void *a2, int a3)
{
  double v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(v7, "clsContentScore");
  else
    objc_msgSend(v7, "curationScore");
  if (v5 >= *MEMORY[0x1E0D77DD0])
  {
    v6 = a1 + 32;
  }
  else if (v5 >= *MEMORY[0x1E0D77DD8])
  {
    v6 = a1 + 40;
  }
  else if (v5 >= *MEMORY[0x1E0D77DE8])
  {
    v6 = a1 + 48;
  }
  else if (v5 <= *MEMORY[0x1E0D77DF0])
  {
    v6 = a1 + 56;
  }
  else
  {
    v6 = a1 + 64;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 24);

}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_299(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;

  v5 = a2;
  v6 = a3;
  switch(objc_msgSend(v6, "locationMode"))
  {
    case 0:
      v7 = a1[4];
      goto LABEL_7;
    case 1:
      v7 = a1[5];
      goto LABEL_7;
    case 2:
      v7 = a1[6];
      goto LABEL_7;
    case 3:
      ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
      objc_msgSend(v6, "coordinate");
      objc_msgSend(v5, "photoCoordinate");
      CLLocationCoordinate2DGetDistanceFrom();
      if (v8 != 0.0)
        goto LABEL_8;
      v7 = a1[8];
LABEL_7:
      ++*(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
LABEL_8:

      return;
    default:
      goto LABEL_8;
  }
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isSameNodeAsNode:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "_stringDescriptionForMeNode:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("### Additional %@"), v4);

  }
}

uint64_t __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v4;

  result = objc_msgSend(*(id *)(a1 + 32), "neighborScoreWithMomentNode:", a2);
  if (v4 > 0.43)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v4 > 0.6)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return result;
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isBlocked"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("- %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
}

uint64_t __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "edgesCount");

  objc_msgSend(v2, "appendFormat:", CFSTR("[POI] Number of %@: %lu\n"), v5, v4);
}

uint64_t __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "edgesCount");

  objc_msgSend(v2, "appendFormat:", CFSTR("[ROI] Number of %@: %lu\n"), v5, v4);
}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "edgesForLabel:domain:", CFSTR("SCENE"), 600);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "count");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v7 += objc_msgSend(v13, "numberOfAssets");
        v8 += objc_msgSend(v13, "numberOfHighConfidenceAssets");
        v9 += objc_msgSend(v13, "numberOfSearchConfidenceAssets");
        v10 += objc_msgSend(v13, "numberOfDominantSceneAssets");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v2, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendFormat:", CFSTR("[Scene] Number of %@: %lu, all assets %lu, high conf. assets %lu, search conf. assets %lu, dominant scene assets %lu\n"), v15, v16, v7, v8, v9, v10);

}

void __71__PGManager_Debug___defaultStatisticsWithGraph_verbose_forDiagnostics___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inEdgesCount");

  objc_msgSend(v2, "appendFormat:", CFSTR("[Visual Lookup Scene]: %@, linked moments:%lu \n"), v5, v4);
}

void __46__PGManager_Debug__statisticsWithTypeStrings___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  PGTitleGenerationContext *v4;
  void *v5;
  PGTitleGenerationContext *v6;
  id v7;
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
  id v37;

  objc_msgSend(a2, "graph");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    objc_msgSend(*(id *)(a1 + 32), "setString:", CFSTR("Graph is nil. Please retry to analyze your library."));
    goto LABEL_32;
  }
  v3 = *(_QWORD *)(a1 + 48);
  v4 = [PGTitleGenerationContext alloc];
  objc_msgSend(*(id *)(a1 + 40), "serviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGTitleGenerationContext initWithGraph:serviceManager:](v4, "initWithGraph:serviceManager:", v37, v5);

  v7 = objc_alloc(MEMORY[0x1E0D77E08]);
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithPhotoLibrary:", v8);

  if ((v3 & 3) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_defaultStatisticsWithGraph:verbose:forDiagnostics:", v37, (v3 >> 2) & 1, v3 & 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v10);

  }
  if ((v3 & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_moodStatisticsWithGraph:", v37);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v13);

    if ((v3 & 0x10) == 0)
    {
LABEL_6:
      if ((v3 & 0x1000000) == 0)
        goto LABEL_7;
      goto LABEL_35;
    }
  }
  else if ((v3 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "_titleStatisticsWithGraph:titleGenerationContext:", v37, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v14);

  if ((v3 & 0x1000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(*(id *)(a1 + 40), "_highlightTitleStatisticsWithGraph:titleGenerationContext:", v37, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v15);

  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(*(id *)(a1 + 40), "_mobilityStatisticsWithGraph:", v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v16);

  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(*(id *)(a1 + 40), "_interestingStatisticsWithGraph:", v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v17);

  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(*(id *)(a1 + 40), "_partOfDayStatisticsWithGraph:titleGenerationContext:", v37, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v18);

  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(*(id *)(a1 + 40), "_highlightEstimatesStatisticsWithCurationContext:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v19);

  if ((v3 & 0x800) == 0)
  {
LABEL_12:
    if ((v3 & 0x1000) == 0)
      goto LABEL_13;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(*(id *)(a1 + 40), "_peopleRelationshipsStatisticsWithGraph:includingDebugInfo:", v37, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v20);

  if ((v3 & 0x1000) == 0)
  {
LABEL_13:
    if ((v3 & 0x8000) == 0)
      goto LABEL_14;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(*(id *)(a1 + 40), "_peopleRelationshipsStatisticsWithGraph:includingDebugInfo:", v37, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v21);

  if ((v3 & 0x8000) == 0)
  {
LABEL_14:
    if ((v3 & 0x2000) == 0)
      goto LABEL_15;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(*(id *)(a1 + 40), "_dayOfWeekStatisticsWithGraph:", v37);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v22);

  if ((v3 & 0x2000) == 0)
  {
LABEL_15:
    if ((v3 & 0x4000) == 0)
      goto LABEL_16;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(*(id *)(a1 + 40), "_stringDescriptionForPublicEventsWithGraph:verbose:", v37, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v23);

  if ((v3 & 0x4000) == 0)
  {
LABEL_16:
    if ((v3 & 0x2000000) == 0)
      goto LABEL_17;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(*(id *)(a1 + 40), "_stringDescriptionForBusinessItemsWithGraph:includingInferredThroughPublicEvents:verbose:", v37, 1, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v24);

  if ((v3 & 0x2000000) == 0)
  {
LABEL_17:
    if ((v3 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(*(id *)(a1 + 40), "_poiStatisticsWithGraph:", v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v25);

  if ((v3 & 0x10000) == 0)
  {
LABEL_18:
    if ((v3 & 0x8000000) == 0)
      goto LABEL_19;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(*(id *)(a1 + 40), "_stringDescriptionForLocationsWithGraph:", v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v26);

  if ((v3 & 0x8000000) == 0)
  {
LABEL_19:
    if ((v3 & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(*(id *)(a1 + 40), "_stringDescriptionForLanguagesWithGraph:", v37);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v27);

  if ((v3 & 0x20000) == 0)
  {
LABEL_20:
    if ((v3 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(*(id *)(a1 + 40), "_stringDescriptionForPetsWithGraph:", v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v28);

  if ((v3 & 0x400000) == 0)
  {
LABEL_21:
    if ((v3 & 0x200000) == 0)
      goto LABEL_22;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(*(id *)(a1 + 40), "_behavioralStatisticsWithGraph:", v37);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v29);

  if ((v3 & 0x200000) == 0)
  {
LABEL_22:
    if ((v3 & 0x800000) == 0)
      goto LABEL_23;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(*(id *)(a1 + 40), "_stringDescriptionForMusicWithGraph:summaryOnly:", v37, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v30);

  if ((v3 & 0x800000) == 0)
  {
LABEL_23:
    if ((v3 & 0x4000000) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(*(id *)(a1 + 40), "_domainLabelCountStatisticsWithGraph:", v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v31);

  if ((v3 & 0x4000000) == 0)
  {
LABEL_24:
    if ((v3 & 0x10000000) == 0)
      goto LABEL_25;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(*(id *)(a1 + 40), "_peopleVisionAgeStatisticsWithGraph:", v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_peopleVisionBiologicalSexStatisticsWithGraph:", v37);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_peopleNameBiologicalSexStatisticsWithGraph:", v37);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v32);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v33);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v34);

  if ((v3 & 0x10000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x20000000) == 0)
      goto LABEL_26;
LABEL_54:
    objc_msgSend(*(id *)(a1 + 40), "_socialGroupsDebugStatistics:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v36);

    if ((v3 & 0x40000000) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_53:
  objc_msgSend(*(id *)(a1 + 40), "_socialGroupsStatistics:", v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v35);

  if ((v3 & 0x20000000) != 0)
    goto LABEL_54;
LABEL_26:
  if ((v3 & 0x40000000) != 0)
  {
LABEL_27:
    objc_msgSend(*(id *)(a1 + 40), "_sharedLibraryStatistics:", v37);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v11);

  }
LABEL_28:
  if (v3 >> 31)
  {
    objc_msgSend(*(id *)(a1 + 40), "_entityTagsStatistics:", v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v12);

  }
LABEL_32:

}

void __40__PGManager_Debug__identifierForMoment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "identifier");
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

void __34__PGManager_Debug__UUIDForMoment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v10;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "Cannot find node for moment: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

void __49__PGManager_Debug__keywordsForAsset_relatedType___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", a1[4], 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v13, "graph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGRelatedComputer searchNodesInGraph:forAsset:inMoment:](PGRelatedComputer, "searchNodesInGraph:forAsset:inMoment:", v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "momentNodeForMoment:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "keywordsForRelatedType:focusOnNodes:", a1[6], v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __58__PGManager_Debug__keywordsForMomentNodeName_relatedType___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v10 = CFSTR("name");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNodeForLabel:domain:properties:", CFSTR("Moment"), 100, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "keywordsForRelatedType:focusOnNodes:", a1[6], 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __59__PGManager_Debug__keywordsForAssetCollection_relatedType___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventNodeForAssetCollection:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relatableEvent");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "keywordsForRelatedType:focusOnNodes:", a1[6], 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (id)exportableDictionaryFromKeywords:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__PGManager_Debug__exportableDictionaryFromKeywords___block_invoke;
  v8[3] = &unk_1E842F880;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

+ (id)_calendarEventsBetweenDate:(id)a3 andDate:(id)a4 atLocation:(id)a5 withPersonLocalIdentifiers:(id)a6 inPhotoLibrary:(id)a7 serviceManager:(id)a8 locationCache:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (!v19)
    __assert_rtn("+[PGManager(Debug) _calendarEventsBetweenDate:andDate:atLocation:withPersonLocalIdentifiers:inPhotoLibrary:serviceManager:locationCache:]", "PGManager+Debug.m", 4200, "serviceManager != nil");
  v21 = v20;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B138]), "initWithServiceManager:", v19);
  v23 = (void *)MEMORY[0x1E0D4B198];
  v35 = v15;
  v36 = v14;
  v39[0] = v14;
  v39[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "clueWithDates:serviceManager:", v24, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mergeClues:", v26);

  if (v16)
  {
    objc_msgSend(v21, "fetchPlacemarkForLocation:withQueryAccuracy:", v16, *MEMORY[0x1E0C9E4D0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0D4B188], "clueWithLocation:locationCache:", v27, v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "mergeClues:", v29);

    }
    else
    {
      v28 = 0;
    }

    if (!v17)
      goto LABEL_11;
  }
  else
  {
    v28 = 0;
    if (!v17)
      goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0D4B190], "cluesWithPersonLocalIdentifiers:inPhotoLibrary:serviceManager:", v17, v18, v19);
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    objc_msgSend(v22, "mergeClues:", v30);

    goto LABEL_12;
  }
LABEL_11:
  if (!v28)
  {
    objc_msgSend(v25, "events");
    v32 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_12:
  objc_msgSend(v19, "eventsForClueCollection:", v22);
  v32 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v33 = (void *)v32;

  return v33;
}

void __53__PGManager_Debug__exportableDictionaryFromKeywords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  const __CFString *v6;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v5 <= 31)
  {
    v6 = CFSTR("People");
    switch(v5)
    {
      case 1:
        goto LABEL_17;
      case 2:
        v6 = CFSTR("Time");
        goto LABEL_17;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_18;
      case 4:
        v6 = CFSTR("Location");
        goto LABEL_17;
      case 8:
        v6 = CFSTR("Event");
        goto LABEL_17;
      default:
        if (v5 != 16)
          goto LABEL_18;
        v6 = CFSTR("Place");
        break;
    }
    goto LABEL_17;
  }
  if (v5 > 63)
  {
    if (v5 == 64)
    {
      v6 = CFSTR("Diversity");
      goto LABEL_17;
    }
    if (v5 == 128)
    {
      v6 = CFSTR("Related");
      goto LABEL_17;
    }
  }
  else
  {
    if (v5 == 32)
    {
      v6 = CFSTR("Scene");
      goto LABEL_17;
    }
    if (v5 == 63)
    {
      v6 = CFSTR("Any");
LABEL_17:
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
    }
  }
LABEL_18:

}

- (id)performerIdentifiersForMomentUUIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__60517;
  v18 = __Block_byref_object_dispose__60518;
  v19 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __62__PGManager_PublicEvents__performerIdentifiersForMomentUUIDs___block_invoke;
  v11 = &unk_1E8435578;
  v5 = v4;
  v12 = v5;
  v13 = &v14;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](self, "performSynchronousConcurrentGraphReadUsingBlock:", &v8);
  objc_msgSend((id)v15[5], "allObjects", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __62__PGManager_PublicEvents__performerIdentifiersForMomentUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v3, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "publicEventNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performerNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performerIdentifiers");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

@end
