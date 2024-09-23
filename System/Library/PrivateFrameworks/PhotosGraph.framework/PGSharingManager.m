@implementation PGSharingManager

- (PGSharingManager)initWithWorkingContext:(id)a3
{
  id v5;
  PGSharingManager *v6;
  PGSharingManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSharingManager;
  v6 = -[PGSharingManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_workingContext, a3);

  return v7;
}

- (id)presenceStream
{
  void *v3;
  PGSharingSuggestionSourceMergeCandidates *v4;
  void *v5;
  PGSharingSuggestionSourceMergeCandidates *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11[0] = v3;
  v4 = [PGSharingSuggestionSourceMergeCandidates alloc];
  -[PGManagerWorkingContext serviceManager](self->_workingContext, "serviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGSharingSuggestionSourceMergeCandidates initWithServiceManager:](v4, "initWithServiceManager:", v5);
  v11[1] = v6;
  v7 = (void *)objc_opt_new();
  v11[2] = v7;
  v8 = (void *)objc_opt_new();
  v11[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)contextualStream
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v11[0] = v2;
  v3 = (void *)objc_opt_new();
  v11[1] = v3;
  v4 = (void *)objc_opt_new();
  v11[2] = v4;
  v5 = (void *)objc_opt_new();
  v11[3] = v5;
  v6 = (void *)objc_opt_new();
  v11[4] = v6;
  v7 = (void *)objc_opt_new();
  v11[5] = v7;
  v8 = (void *)objc_opt_new();
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)suggestionSourcesForSharingStream:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  if ((v3 & 1) != 0)
  {
    -[PGSharingManager presenceStream](self, "presenceStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  if ((v3 & 2) != 0)
  {
    -[PGSharingManager contextualStream](self, "contextualStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  return v5;
}

- (id)suggestionResultsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  PGManagerWorkingContext *workingContext;
  uint64_t v19;
  void *v20;
  size_t v21;
  id v22;
  NSObject *v23;
  id v24;
  PGManagerWorkingContext *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t *v37;
  _QWORD block[5];
  id v39;
  NSObject *v40;
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  mach_timebase_info info;
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  double v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "count");
  v13 = (id)MEMORY[0x1E0C9AA60];
  if (v12)
  {
    info = 0;
    mach_timebase_info(&info);
    v14 = mach_absolute_time();
    if (!v10)
    {
      objc_msgSend((id)objc_opt_class(), "_defaultOptions");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v10, "includeUnverified"))
      objc_msgSend(v10, "setIncludeUnverified:", -[PGSharingManager _canIncludeUnverified](self, "_canIncludeUnverified"));
    v15 = v9;
    v16 = v11;
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__3308;
    v71 = __Block_byref_object_dispose__3309;
    v72 = v13;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__3308;
    v65 = __Block_byref_object_dispose__3309;
    v66 = 0;
    v17 = v8;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__3308;
    v59 = __Block_byref_object_dispose__3309;
    v60 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 1;
    workingContext = self->_workingContext;
    v19 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke;
    v44[3] = &unk_1E8427F90;
    v48 = &v51;
    v44[4] = self;
    v10 = v10;
    v45 = v10;
    v49 = &v55;
    v46 = v8;
    v47 = v15;
    v50 = &v61;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v44);
    if (*((_BYTE *)v52 + 24))
    {
      v33 = v14;
      v20 = (void *)objc_opt_new();
      v21 = objc_msgSend((id)v62[5], "count");
      block[0] = v19;
      block[1] = 3221225472;
      block[2] = __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_184;
      block[3] = &unk_1E8427FB8;
      block[4] = self;
      v42 = &v61;
      v22 = v10;
      v39 = v22;
      v23 = v16;
      v40 = v23;
      v43 = &v55;
      v24 = v20;
      v41 = v24;
      dispatch_apply(v21, 0, block);
      if (objc_msgSend(v24, "count"))
      {
        v25 = self->_workingContext;
        v34[0] = v19;
        v34[1] = 3221225472;
        v34[2] = __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_186;
        v34[3] = &unk_1E84340C0;
        v37 = &v67;
        v34[4] = self;
        v35 = v24;
        v36 = v22;
        -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](v25, "performSynchronousConcurrentGraphReadUsingBlock:", v34);

        v8 = v17;
        v11 = v16;
        v26 = v33;
        v9 = v15;

      }
      else
      {
        v8 = v17;
        v11 = v16;
        v26 = v33;
        v9 = v15;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v56[5];
          *(_DWORD *)buf = 138412290;
          v75 = v27;
          _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No suggestions found for %@", buf, 0xCu);
        }
      }
      v28 = v23;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_msgSend((id)v68[5], "count");
        v30 = mach_absolute_time();
        v31 = v68[5];
        *(_DWORD *)buf = 134218498;
        v75 = v29;
        v76 = 2048;
        v77 = (float)((float)((float)((float)(v30 - v26) * (float)info.numer) / (float)info.denom) / 1000000.0);
        v78 = 2112;
        v79 = v31;
        _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Returning %lu suggestions in %.4fms:\n%@", buf, 0x20u);
      }

      v13 = (id)v68[5];
    }
    else
    {
      v11 = v16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v75 = (uint64_t)v10;
        _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Cannot run with options %@, no eligible persons to suggest", buf, 0xCu);
      }
      v13 = (id)MEMORY[0x1E0C9AA60];
      v9 = v15;
    }

    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);

    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v67, 8);

  }
  return v13;
}

- (BOOL)canProvideSuggestionsWithOptions:(id)a3 forGraph:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "includeUnverified") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__PGSharingManager_canProvideSuggestionsWithOptions_forGraph___block_invoke;
    v9[3] = &unk_1E842F0C8;
    v11 = &v17;
    v10 = v5;
    v12 = &v13;
    objc_msgSend(v6, "enumeratePersonNodesIncludingMe:withBlock:", 0, v9);
    if (*((_BYTE *)v18 + 24))
      v7 = 1;
    else
      v7 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }

  return v7;
}

- (BOOL)_canIncludeUnverified
{
  void *v3;
  unint64_t v4;
  double v5;
  _BOOL4 v6;
  NSObject *v7;
  int v9;
  unint64_t v10;
  __int16 v11;
  double v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countOfClusteringEligibleFaces");
  if (v4)
  {
    v5 = (double)(unint64_t)objc_msgSend(v3, "countOfUnclusteredFaces") / (double)v4;
    v6 = v5 < 0.1;
  }
  else
  {
    v6 = 0;
    v5 = 0.0;
  }
  -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218752;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    v13 = 2048;
    v14 = 0x3FB999999999999ALL;
    v15 = 1024;
    v16 = v6;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Can include unverified result: countOfClusteringEligibleFaces %lu, percentageOfFacesNotClustered %.2f < %.2f == %d", (uint8_t *)&v9, 0x26u);
  }

  return v6;
}

- (void)_mergeSuggestionResultByPersonIdentifer:(id)a3 withSourceSuggestionResults:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "person");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v13, "length"))
        {
          objc_msgSend(v11, "person");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "contactIdentifier");
          v15 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v15;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          objc_msgSend(v16, "mergeWithSuggestionResult:", v11);
        else
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

- (id)_filteredSuggestionResults:(id)a3 withOptions:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  BOOL (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  double v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PGManagerWorkingContext serviceManager](self->_workingContext, "serviceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "filterLowWeightResults");
  v14 = v13;
  if (v13)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      v19 = 2.22507386e-308;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "sourceWeight");
          v19 = fmax(v19, v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v17);
    }
    else
    {
      v19 = 2.22507386e-308;
    }

  }
  else
  {
    v19 = 2.22507386e-308;
  }
  objc_msgSend(v11, "mePerson");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "fullName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "children");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB3880];
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __65__PGSharingManager__filteredSuggestionResults_withOptions_graph___block_invoke;
  v36 = &unk_1E8427FE0;
  v37 = v24;
  v38 = v11;
  v42 = v14;
  v41 = v19;
  v39 = v23;
  v40 = v12;
  v26 = v12;
  v27 = v23;
  v28 = v11;
  v29 = v24;
  objc_msgSend(v25, "predicateWithBlock:", &v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v30, v33, v34, v35, v36);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)_sortedSuggestionResults:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v5 = a4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_3301);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "fetchLimit"))
  {
    v7 = objc_msgSend(v5, "fetchLimit");
    v8 = objc_msgSend(v6, "count");
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    objc_msgSend(v6, "subarrayWithRange:", 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingContext, 0);
}

uint64_t __57__PGSharingManager__sortedSuggestionResults_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  if (v7 <= v8)
  {
    objc_msgSend(v4, "score");
    v11 = v10;
    objc_msgSend(v5, "score");
    if (v11 >= v12)
    {
      objc_msgSend(v4, "person");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "person");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "compareToPerson:", v14);

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

BOOL __65__PGSharingManager__filteredSuggestionResults_withOptions_graph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(v4, "birthdayDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceDate:", v7);
        v10 = v9;

        if (v10 < 189345600.0)
          goto LABEL_19;
      }
    }
    if (objc_msgSend(v4, "isInferredChild"))
    {
      if (!objc_msgSend(v5, "length"))
        goto LABEL_19;
      objc_msgSend(*(id *)(a1 + 40), "personForIdentifier:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "emailAddresses");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {

      }
      else
      {
        objc_msgSend(v11, "phoneNumbers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (!v14)
          goto LABEL_19;
      }
    }
    if (*(_BYTE *)(a1 + 72) && *(double *)(a1 + 64) > 0.25)
    {
      objc_msgSend(v3, "sourceWeight");
      v6 = v15 > 0.25;
      goto LABEL_21;
    }
    if (!objc_msgSend(*(id *)(a1 + 48), "length")
      || (v16 = *(void **)(a1 + 48),
          objc_msgSend(v4, "fullName"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v16) = objc_msgSend(v16, "isEqualToString:", v17),
          v17,
          !(_DWORD)v16))
    {
      v6 = 1;
      goto LABEL_21;
    }
    v18 = *(NSObject **)(a1 + 56);
    v6 = 0;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      goto LABEL_22;
    }
    v20 = 138477827;
    v21 = v4;
    _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Suggested person %{private}@ matches me contact name", (uint8_t *)&v20, 0xCu);
LABEL_19:
    v6 = 0;
    goto LABEL_21;
  }
  v6 = 0;
LABEL_22:

  return v6;
}

void __62__PGSharingManager_canProvideSuggestionsWithOptions_forGraph___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = a1 + 40;
LABEL_3:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24) = 1;
    *a3 = 1;
    goto LABEL_4;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "useContactSuggestion"))
  {
    objc_msgSend(v10, "suggestedContactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v7 = a1 + 48;
      goto LABEL_3;
    }
  }
LABEL_4:

}

void __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke(uint64_t a1, void *a2)
{
  PGSharingSuggestionInput *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "graph");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "canProvideSuggestionsWithOptions:forGraph:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v3 = [PGSharingSuggestionInput alloc];
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PGSharingSuggestionInput initWithAssetLocalIdentifiers:momentLocalIdentifiers:graph:photoLibrary:](v3, "initWithAssetLocalIdentifiers:momentLocalIdentifiers:graph:photoLibrary:", v4, v5, v13, v6);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1 + 32), "suggestionSourcesForSharingStream:", objc_msgSend(*(id *)(a1 + 40), "sharingStream"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_184(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_2;
  v7[3] = &unk_1E8435160;
  v12 = *(_QWORD *)(a1 + 64);
  v14 = a2;
  v8 = v3;
  v5 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v4, "performSynchronousConcurrentGraphReadUsingBlock:", v7);

}

void __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_186(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_filteredSuggestionResults:withOptions:graph:", v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 32), "_sortedSuggestionResults:withOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (objc_msgSend(*(id *)(a1 + 48), "useContactSuggestion"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "setUseContactSuggestion:", 1, (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
}

void __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  mach_timebase_info info;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "canRunWithOptions:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v12 = *(NSObject **)(a1 + 40);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = v13;
    v14 = "[Sharing Suggestion] Source %@ cannot run with options %@";
LABEL_10:
    _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "canRunWithInput:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)) & 1) == 0)
  {
    v12 = *(NSObject **)(a1 + 40);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    *(_DWORD *)buf = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = v15;
    v14 = "[Sharing Suggestion] Source %@ cannot run with input %@";
    goto LABEL_10;
  }
  info = 0;
  mach_timebase_info(&info);
  v5 = mach_absolute_time();
  objc_msgSend(v4, "suggestedResultsForInput:withOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "count");
    v10 = mach_absolute_time();
    *(_DWORD *)buf = 138413058;
    v18 = v4;
    v19 = 2048;
    v20 = v9;
    v21 = 2048;
    v22 = (float)((float)((float)((float)(v10 - v5) * (float)info.numer) / (float)info.denom) / 1000000.0);
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Source %@ returned %lu suggestions in %.4fms:\n%@", buf, 0x2Au);

  }
  v11 = *(id *)(a1 + 48);
  objc_sync_enter(v11);
  objc_msgSend(*(id *)(a1 + 48), "_mergeSuggestionResultByPersonIdentifer:withSourceSuggestionResults:", *(_QWORD *)(a1 + 56), v6);
  objc_sync_exit(v11);

LABEL_11:
}

+ (id)_defaultOptions
{
  return (id)objc_opt_new();
}

@end
