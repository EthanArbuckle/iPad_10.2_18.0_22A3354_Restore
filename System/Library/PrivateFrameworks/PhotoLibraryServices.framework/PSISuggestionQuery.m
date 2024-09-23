@implementation PSISuggestionQuery

- (PSISuggestionQuery)initWithFormattedSearchText:(id)a3 originalSearchText:(id)a4 completionSuggestionTexts:(id)a5 suggestionOptions:(id)a6 suggestionComponents:(id)a7 photosEntityStore:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PSISuggestionQuery *v21;
  uint64_t v22;
  NSAttributedString *formattedSearchText;
  uint64_t v24;
  NSAttributedString *originalSearchtext;
  uint64_t v26;
  PSISuggestionOptions *suggestionOptions;
  uint64_t v28;
  NSArray *completionSuggestionTexts;
  uint64_t v30;
  NSArray *suggestionComponents;
  PSISuggestionQuery *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  objc_super v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSISuggestionQuery.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("formattedSearchText"));

    if (v16)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSISuggestionQuery.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionOptions"));

      if (v20)
        goto LABEL_5;
      goto LABEL_14;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSISuggestionQuery.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalSearchText"));

  if (!v18)
    goto LABEL_13;
LABEL_4:
  if (v20)
  {
LABEL_5:
    v38.receiver = self;
    v38.super_class = (Class)PSISuggestionQuery;
    v21 = -[PSISuggestionQuery init](&v38, sel_init);
    if (v21)
    {
      v22 = objc_msgSend(v15, "copy");
      formattedSearchText = v21->_formattedSearchText;
      v21->_formattedSearchText = (NSAttributedString *)v22;

      v24 = objc_msgSend(v16, "copy");
      originalSearchtext = v21->_originalSearchtext;
      v21->_originalSearchtext = (NSAttributedString *)v24;

      v26 = objc_msgSend(v18, "copy");
      suggestionOptions = v21->_suggestionOptions;
      v21->_suggestionOptions = (PSISuggestionOptions *)v26;

      objc_storeStrong((id *)&v21->_photosEntityStore, a8);
      v28 = objc_msgSend(v17, "copy");
      completionSuggestionTexts = v21->_completionSuggestionTexts;
      v21->_completionSuggestionTexts = (NSArray *)v28;

      if (v19)
      {
        v30 = objc_msgSend(v19, "copy");
        suggestionComponents = v21->_suggestionComponents;
        v21->_suggestionComponents = (NSArray *)v30;
      }
      else
      {
        suggestionComponents = v21->_suggestionComponents;
        v21->_suggestionComponents = (NSArray *)MEMORY[0x1E0C9AA60];
      }

    }
    self = v21;
    v32 = self;
    goto LABEL_17;
  }
LABEL_14:
  PLSearchBackendQueryGetLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v15;
    _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_INFO, "Unexpected nil photos entity store, aborting initialization of query: \"%@\", buf, 0xCu);
  }

  v32 = 0;
LABEL_17:

  return v32;
}

- (id)performQueryWithSearchResultAssetUUIDs:(id)a3 collectionUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_20;
  }
  -[PSISuggestionQuery suggestionOptions](self, "suggestionOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "searchSuggestionLimit"))
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v9, "_wantsUnscopedSuggestions");
LABEL_5:
      -[PSISuggestionQuery suggestionOptions](self, "suggestionOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "searchSuggestionType");

      switch(v11)
      {
        case 0:
        case 3:
        case 4:
          PLSearchBackendQueryGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
          v33 = 138412290;
          v34 = v8;
          v13 = "Suggestions query for \"%@\" aborted because the required suggestion type was unexpected";
          v14 = v12;
          v15 = OS_LOG_TYPE_ERROR;
          goto LABEL_16;
        case 1:
          PLPhotosSearchGetLog();
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_generate(v19);

          v21 = v19;
          v22 = v21;
          if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
          {
            LOWORD(v33) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PLSearchCompletionSuggestionsSignpost", ", (uint8_t *)&v33, 2u);
          }

          -[PSISuggestionQuery _generateCompletionSuggestionsForAssetUUIDs:collectionUUIDs:](self, "_generateCompletionSuggestionsForAssetUUIDs:collectionUUIDs:", v6, v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          v12 = v23;
          if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
          {
            LOWORD(v33) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v20, "PLSearchCompletionSuggestionsSignpost", ", (uint8_t *)&v33, 2u);
          }
          goto LABEL_27;
        case 2:
          -[PSISuggestionQuery suggestionOptions](self, "suggestionOptions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "enableNextTokenSuggestions");

          if (!v25)
            goto LABEL_34;
          -[PSISuggestionQuery suggestionOptions](self, "suggestionOptions");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "minNumberOfResultsForNextTokenGeneration");

          PLPhotosSearchGetLog();
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = os_signpost_id_generate(v28);

          v30 = v28;
          v31 = v30;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            LOWORD(v33) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PLSearchNextTokenSuggestionsSignpost", ", (uint8_t *)&v33, 2u);
          }

          if (objc_msgSend(v6, "count") >= v27)
          {
            -[PSISuggestionQuery _generateNextTokenSuggestionsForAssetUUIDs:collectionUUIDs:](self, "_generateNextTokenSuggestionsForAssetUUIDs:collectionUUIDs:", v6, v7);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = (void *)MEMORY[0x1E0C9AA60];
          }
          v32 = v31;
          v12 = v32;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
          {
            LOWORD(v33) = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v29, "PLSearchNextTokenSuggestionsSignpost", ", (uint8_t *)&v33, 2u);
          }
LABEL_27:

          goto LABEL_18;
        default:
LABEL_34:
          v16 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_19;
      }
    }
    v17 = objc_msgSend(v7, "count");
    if ((objc_msgSend(v9, "_wantsUnscopedSuggestions") & 1) != 0 || v17)
      goto LABEL_5;
    PLSearchBackendQueryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_17;
    v33 = 138412290;
    v34 = v8;
    v13 = "Suggestions query for \"%@\" aborted because no scoping search results were provided";
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_17;
    v33 = 138412290;
    v34 = v8;
    v13 = "Suggestions query for \"%@\" aborted because the suggestion limit provided was zero";
  }
  v14 = v12;
  v15 = OS_LOG_TYPE_INFO;
LABEL_16:
  _os_log_impl(&dword_199541000, v14, v15, v13, (uint8_t *)&v33, 0xCu);
LABEL_17:
  v16 = (void *)MEMORY[0x1E0C9AA60];
LABEL_18:

LABEL_19:
LABEL_20:

  return v16;
}

- (void)cancel
{
  -[PSISuggestionQuery setCancelled:](self, "setCancelled:", 1);
}

- (void)setCancelled:(BOOL)a3
{
  PSISuggestionQuery *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = a3;
  objc_sync_exit(obj);

}

- (BOOL)cancelled
{
  PSISuggestionQuery *v2;
  BOOL cancelled;

  v2 = self;
  objc_sync_enter(v2);
  cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (id)_generateCompletionSuggestionsForAssetUUIDs:(id)a3 collectionUUIDs:(id)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const __CFArray *v16;
  const __CFArray *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  CFIndex v34;
  CFIndex v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  CFArrayRef Copy;
  BOOL v41;
  int v42;
  const __CFArray *v43;
  BOOL v44;
  int v45;
  PLSearchSuggestionComponent *v46;
  CFIndex v47;
  CFIndex v48;
  void *v49;
  PLSearchSuggestionComponent *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  const void *v65;
  const void *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  NSObject *v72;
  unint64_t v73;
  id v74;
  id v75;
  void *v76;
  unint64_t v77;
  unint64_t Count;
  void *v79;
  int v80;
  void *v81;
  id obj;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *oslog;
  void *v87;
  NSObject *v88;
  id v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  int v96;
  int v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD v101[4];
  id v102;
  CFArrayRef theArray;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[6];
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  _BYTE v117[12];
  __int16 v118;
  void *v119;
  __int16 v120;
  id v121;
  _BYTE v122[128];
  uint8_t v123[128];
  __int128 buf;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v74 = a3;
  v75 = a4;
  -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSISuggestionQuery originalSearchtext](self, "originalSearchtext");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSISuggestionQuery completionSuggestionTexts](self, "completionSuggestionTexts");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v76, "count") == 0;
  PLSearchBackendQueryGetLog();
  oslog = objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a4)
  {
    v10 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v79;
      v11 = "Completion suggestions aborted because completion text could not be identified. Query string: \"%@\";
LABEL_13:
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v76;
      _os_log_impl(&dword_199541000, oslog, OS_LOG_TYPE_DEFAULT, "Begin completion generation for suggestion texts: %@", (uint8_t *)&buf, 0xCu);
    }

    -[PSISuggestionQuery suggestionOptions](self, "suggestionOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v6, "searchSuggestionLimit");

    if (v73)
    {
      -[PSISuggestionQuery photosEntityStore](self, "photosEntityStore");
      oslog = objc_claimAutoreleasedReturnValue();
      -[PSISuggestionQuery suggestionOptions](self, "suggestionOptions");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSISuggestionQuery suggestionOptions](self, "suggestionOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v7, "limitSuggestionsToExactTextMatches");

      if (-[PSISuggestionQuery cancelled](self, "cancelled"))
      {
        PLSearchBackendQueryGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v79;
          _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Completion suggestions aborted because query was cancelled. Query string: \"%@\", (uint8_t *)&buf, 0xCu);
        }
        v9 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_142;
      }
      v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSObject addObjectsFromArray:](v72, "addObjectsFromArray:", v74);
      -[NSObject addObjectsFromArray:](v72, "addObjectsFromArray:", v75);
      v97 = objc_msgSend(v81, "_wantsUnscopedSuggestions");
      v98 = objc_msgSend(v81, "optionsWantSuggestionsForAssets");
      v96 = objc_msgSend(v81, "optionsWantSuggestionsForCollections");
      if ((v97 & 1) == 0)
      {
        if (v98)
          v98 = objc_msgSend(v74, "count") != 0;
        else
          v98 = 0;
        if (v96)
          v96 = objc_msgSend(v75, "count") != 0;
        else
          v96 = 0;
      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v125 = 0x2020000000;
      v126 = 0;
      v113 = 0;
      v114 = &v113;
      v115 = 0x2020000000;
      v116 = 0;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v72);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v81, "suggestionResultTypes");
      -[PSISuggestionQuery photosEntityStore](self, "photosEntityStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = MEMORY[0x1E0C809B0];
      v112[1] = 3221225472;
      v112[2] = __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke;
      v112[3] = &unk_1E36663E8;
      v112[4] = &buf;
      v112[5] = &v113;
      +[PLScopedSearchUtilities searchIndexIdsFromUUIDs:searchResultTypes:psiDatabase:completion:](PLScopedSearchUtilities, "searchIndexIdsFromUUIDs:searchResultTypes:psiDatabase:completion:", v12, v13, v14, v112);

      if (-[PSISuggestionQuery cancelled](self, "cancelled"))
      {
        PLSearchBackendQueryGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v117 = 138412290;
          *(_QWORD *)&v117[4] = v79;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Completion suggestions aborted because query was cancelled. Query string: \"%@\", v117, 0xCu);
        }
        v9 = (id)MEMORY[0x1E0C9AA60];
LABEL_141:

        _Block_object_dispose(&v113, 8);
        _Block_object_dispose(&buf, 8);
        v8 = v72;
LABEL_142:

        goto LABEL_143;
      }
      v16 = *(const __CFArray **)(*((_QWORD *)&buf + 1) + 24);
      if (v16)
        Count = CFArrayGetCount(v16);
      else
        Count = 0;
      v17 = (const __CFArray *)v114[3];
      if (v17)
        v77 = CFArrayGetCount(v17);
      else
        v77 = 0;
      v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v89 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = v76;
      v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
      if (!v85)
      {
LABEL_116:

        if (-[PSISuggestionQuery cancelled](self, "cancelled"))
        {
          PLSearchBackendQueryGetLog();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v117 = 138412290;
            *(_QWORD *)&v117[4] = v56;
            _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_INFO, "Completion suggestions aborted because query was cancelled. Query: \"%@\".", v117, 0xCu);

          }
          v9 = (id)MEMORY[0x1E0C9AA60];
        }
        else
        {
          PLSearchBackendQueryGetLog();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            v58 = objc_msgSend(v89, "count");
            *(_DWORD *)v117 = 134218498;
            *(_QWORD *)&v117[4] = v58;
            v118 = 2112;
            v119 = v79;
            v120 = 2112;
            v121 = v89;
            _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_DEFAULT, "Generated %tu completion candidates for query \"%@\": %@", v117, 0x20u);
          }

          objc_msgSend((id)objc_opt_class(), "_suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents:assetIds:collectionIds:", v88, *(_QWORD *)(*((_QWORD *)&buf + 1) + 24), v114[3]);
          v55 = objc_claimAutoreleasedReturnValue();
          if (v80)
          {
            v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v101[0] = MEMORY[0x1E0C809B0];
            v101[1] = 3221225472;
            v101[2] = __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_20;
            v101[3] = &unk_1E366B1C0;
            v60 = v59;
            v102 = v60;
            -[NSObject enumerateKeysAndObjectsUsingBlock:](v55, "enumerateKeysAndObjectsUsingBlock:", v101);
            +[PLScopedSearchSuggestionGeneration sortedSuggestionsFromSuggestions:](PLScopedSearchSuggestionGeneration, "sortedSuggestionsFromSuggestions:", v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v60, "count");
            if (v62 >= v73)
              v63 = v73;
            else
              v63 = v62;
            objc_msgSend(v61, "subarrayWithRange:", 0, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            +[PLScopedSearchSuggestionGeneration rankedSearchSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:suggestionQuery:](PLScopedSearchSuggestionGeneration, "rankedSearchSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:suggestionQuery:", v55, 1, objc_msgSend(v74, "count"), objc_msgSend(v75, "count"), v73, self);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v65 = *(const void **)(*((_QWORD *)&buf + 1) + 24);
          if (v65)
          {
            CFRelease(v65);
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = 0;
          }
          v66 = (const void *)v114[3];
          if (v66)
          {
            CFRelease(v66);
            v114[3] = 0;
          }
          if (-[PSISuggestionQuery cancelled](self, "cancelled"))
          {
            PLSearchBackendQueryGetLog();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
            {
              -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v117 = 138412290;
              *(_QWORD *)&v117[4] = v68;
              _os_log_impl(&dword_199541000, v67, OS_LOG_TYPE_INFO, "Completion suggestions aborted because query was cancelled. Query: \"%@\".", v117, 0xCu);

            }
            v9 = (id)MEMORY[0x1E0C9AA60];
          }
          else
          {
            PLSearchBackendQueryGetLog();
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
            {
              v70 = objc_msgSend(v64, "count");
              *(_DWORD *)v117 = 134218242;
              *(_QWORD *)&v117[4] = v70;
              v118 = 2112;
              v119 = v79;
              _os_log_impl(&dword_199541000, v69, OS_LOG_TYPE_INFO, "Generated %tu completion suggestions for query: \"%@\", v117, 0x16u);
            }

            v9 = v64;
          }

        }
        v15 = v88;
        goto LABEL_141;
      }
      v84 = *(_QWORD *)v109;
LABEL_34:
      v99 = 0;
      while (1)
      {
        if (*(_QWORD *)v109 != v84)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v99);
        objc_msgSend(v95, "string");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v19, "rangeOfString:options:", v18, 4);
        v94 = v20;

        if (v100 == 0x7FFFFFFFFFFFFFFFLL)
        {
          PLSearchBackendQueryGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v117 = 138412546;
            *(_QWORD *)&v117[4] = v18;
            v118 = 2112;
            v119 = v79;
            _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "SuggestionText (%@) not found in searchText (%@). Skipping suggestion text.", v117, 0x16u);
          }
          goto LABEL_114;
        }
        objc_msgSend(v18, "lowercaseString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSITokenizer fts5StringFromString:useWildcard:leadingAnchored:](PSITokenizer, "fts5StringFromString:useWildcard:leadingAnchored:", v22, v80 ^ 1u, 1);
        v92 = objc_claimAutoreleasedReturnValue();

        -[NSObject groupIdsMatchingString:categories:textIsSearchable:](oslog, "groupIdsMatchingString:categories:textIsSearchable:", v92, 0, 1);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        PLSearchBackendQueryGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_msgSend(v93, "count");
          *(_DWORD *)v117 = 134218242;
          *(_QWORD *)&v117[4] = v24;
          v118 = 2112;
          v119 = v18;
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Found %tu groups for suggestion text: %@.", v117, 0x16u);
        }

        v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v93, 0);
        -[NSObject groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:](oslog, "groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:", v91, 0, objc_msgSend(v81, "suggestionResultTypes"), &__block_literal_global_21677);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = (void *)objc_msgSend(v25, "mutableCopy");

        +[PLScopedSearchUtilities removeSynonymsOfOtherGroupsInGroups:](PLScopedSearchUtilities, "removeSynonymsOfOtherGroupsInGroups:", v90);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v80)
        {
          +[PLScopedSearchUtilities removeGroupsWithNonExactMatchTextFromGroups:searchText:](PLScopedSearchUtilities, "removeGroupsWithNonExactMatchTextFromGroups:searchText:", v26, v18);
          v28 = objc_claimAutoreleasedReturnValue();

          v26 = (void *)v28;
        }
        v87 = v26;
        if (objc_msgSend(v26, "count"))
          break;
        PLSearchBackendQueryGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v117 = 138412290;
          *(_QWORD *)&v117[4] = v54;
          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "Found no filtered groups for query: \"%@\".", v117, 0xCu);

        }
LABEL_113:

        v21 = v92;
LABEL_114:

        if (++v99 == v85)
        {
          v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
          if (!v85)
            goto LABEL_116;
          goto LABEL_34;
        }
      }
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v29 = v87;
      v30 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
      if (!v30)
        goto LABEL_113;
      v31 = *(_QWORD *)v105;
LABEL_47:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v105 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v32);
        if (!-[PSISuggestionQuery _groupIsValidForSuggestionGeneration:suggestionType:](self, "_groupIsValidForSuggestionGeneration:suggestionType:", v33, 1))goto LABEL_108;
        if (-[PSISuggestionQuery cancelled](self, "cancelled"))
          goto LABEL_113;
        v34 = objc_msgSend(v33, "assetIds") ? CFArrayGetCount((CFArrayRef)objc_msgSend(v33, "assetIds")) : 0;
        v35 = objc_msgSend(v33, "collectionIds") ? CFArrayGetCount((CFArrayRef)objc_msgSend(v33, "collectionIds")) : 0;
        if (v34 | v35)
          break;
        PLSearchBackendQueryGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v117 = 138412546;
          *(_QWORD *)&v117[4] = v33;
          v118 = 2112;
          v119 = v37;
          _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Erroneous group with zero assetIds and zero collectionIds: %@ for query: \"%@\".", v117, 0x16u);

        }
LABEL_108:
        if (v30 == ++v32)
        {
          v30 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
          if (!v30)
            goto LABEL_113;
          goto LABEL_47;
        }
      }
      if (objc_msgSend(v33, "intersectedAssetIds")
        && CFArrayGetCount((CFArrayRef)objc_msgSend(v33, "intersectedAssetIds")))
      {
        PLSearchBackendQueryGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v117 = 138412546;
          *(_QWORD *)&v117[4] = v33;
          v118 = 2112;
          v119 = v39;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Erroneous group with non-zero intersected assetIds: %@ for query: \"%@\".", v117, 0x16u);

        }
      }
      *(_QWORD *)v117 = 0;
      Copy = (CFArrayRef)objc_msgSend(v33, "assetIds");
      if (Copy)
        Copy = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v33, "assetIds"));
      *(_QWORD *)v117 = Copy;
      if (v98)
      {
        if (v97)
        {
          if (objc_msgSend(v33, "assetIds"))
            v41 = v34 == 0;
          else
            v41 = 1;
          v42 = !v41;
LABEL_82:
          theArray = 0;
          v43 = (const __CFArray *)objc_msgSend(v33, "collectionIds");
          if (v43)
            v43 = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v33, "collectionIds"));
          theArray = v43;
          if (v96)
          {
            if (v97)
            {
              if (objc_msgSend(v33, "collectionIds"))
                v44 = v35 == 0;
              else
                v44 = 1;
              v45 = !v44;
LABEL_97:
              if ((v42 | v45) != 1)
              {
LABEL_104:
                if (*(_QWORD *)v117)
                {
                  CFRelease(*(CFTypeRef *)v117);
                  *(_QWORD *)v117 = 0;
                }
                if (theArray)
                  CFRelease(theArray);
                goto LABEL_108;
              }
LABEL_98:
              v46 = [PLSearchSuggestionComponent alloc];
              if (v42)
              {
                v47 = CFArrayGetCount(*(CFArrayRef *)v117);
                if (!v45)
                {
LABEL_100:
                  v48 = 0;
LABEL_103:
                  objc_msgSend(v95, "string");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = -[PLSearchSuggestionComponent initWithGroup:matchedAssetsCount:matchedCollectionsCount:suggestionType:matchedText:matchRangeOfSearchText:](v46, "initWithGroup:matchedAssetsCount:matchedCollectionsCount:suggestionType:matchedText:matchRangeOfSearchText:", v33, v47, v48, 1, v49, v100, v94);

                  -[NSObject addObject:](v88, "addObject:", v50);
                  v51 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v33, "contentString");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "stringWithFormat:", CFSTR("%@-%hd"), v52, (int)objc_msgSend(v33, "category"));
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v89, "addObject:", v53);
                  goto LABEL_104;
                }
              }
              else
              {
                v47 = 0;
                if (!v45)
                  goto LABEL_100;
              }
              v48 = CFArrayGetCount(theArray);
              goto LABEL_103;
            }
            +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &theArray, v114[3], 0);
            if (theArray && v114[3] && CFArrayGetCount(theArray) - 1 < v77)
            {
              objc_msgSend(v33, "resetIntersectedIds");
              objc_msgSend(v33, "updateWithIntersectedIds:searchResultType:", theArray, 2);
              v45 = 1;
              goto LABEL_98;
            }
          }
          v45 = 0;
          goto LABEL_97;
        }
        +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", v117, *(_QWORD *)(*((_QWORD *)&buf + 1) + 24), 0);
        if (*(_QWORD *)v117
          && *(_QWORD *)(*((_QWORD *)&buf + 1) + 24)
          && CFArrayGetCount(*(CFArrayRef *)v117) - 1 < Count)
        {
          objc_msgSend(v33, "resetIntersectedIds");
          v42 = 1;
          objc_msgSend(v33, "updateWithIntersectedIds:searchResultType:", *(_QWORD *)v117, 1);
          goto LABEL_82;
        }
      }
      v42 = 0;
      goto LABEL_82;
    }
    PLSearchBackendQueryGetLog();
    oslog = objc_claimAutoreleasedReturnValue();
    v10 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v79;
      v11 = "Completion suggestions aborted because the completion suggestion limit provided was zero. Query string: \"%@\";
      goto LABEL_13;
    }
  }
  v9 = (id)MEMORY[0x1E0C9AA60];
LABEL_143:

  return v9;
}

- (id)_generateNextTokenSuggestionsForAssetUUIDs:(id)a3 collectionUUIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFArray *v23;
  CFIndex v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const __CFArray *v28;
  CFIndex v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _BOOL4 v33;
  int v34;
  BOOL v35;
  _BOOL4 v36;
  int v37;
  PLSearchSuggestionComponent *v38;
  uint64_t v39;
  uint64_t v40;
  PLSearchSuggestionComponent *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const void *v51;
  const void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  int v59;
  int v60;
  id v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *obj;
  NSObject *log;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  NSObject *v75;
  uint64_t *v76;
  _QWORD v77[4];
  NSObject *v78;
  __int128 *p_buf;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  _QWORD v86[6];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint8_t v95[4];
  uint64_t v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  id v100;
  uint8_t v101[128];
  __int128 buf;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v68 = v6;
  objc_msgSend(v8, "addObjectsFromArray:", v6);
  v64 = v7;
  v65 = v8;
  objc_msgSend(v8, "addObjectsFromArray:", v7);
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  -[PSISuggestionQuery suggestionOptions](self, "suggestionOptions");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v69, "suggestionResultTypes");
  -[PSISuggestionQuery photosEntityStore](self, "photosEntityStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke;
  v86[3] = &unk_1E36663E8;
  v86[4] = &v91;
  v86[5] = &v87;
  +[PLScopedSearchUtilities searchIndexIdsFromUUIDs:searchResultTypes:psiDatabase:completion:](PLScopedSearchUtilities, "searchIndexIdsFromUUIDs:searchResultTypes:psiDatabase:completion:", v9, v10, v11, v86);

  if (-[PSISuggestionQuery cancelled](self, "cancelled"))
  {
    PLSearchBackendQueryGetLog();
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_199541000, log, OS_LOG_TYPE_INFO, "Next Token suggestions query for \"%@\" aborted because query was cancelled", (uint8_t *)&buf, 0xCu);

    }
    v14 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    log = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__21654;
    v105 = __Block_byref_object_dispose__21655;
    v106 = 0;
    v80 = 0;
    v81 = &v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__21654;
    v84 = __Block_byref_object_dispose__21655;
    v85 = 0;
    -[PSISuggestionQuery photosEntityStore](self, "photosEntityStore");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v92[3];
    if (v15)
    {
      v77[0] = v12;
      v77[1] = 3221225472;
      v77[2] = __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_23;
      v77[3] = &unk_1E3677798;
      v78 = log;
      p_buf = &buf;
      objc_msgSend(v62, "groupsForAssetIds:completion:", v15, v77);

    }
    v16 = v88[3];
    if (v16)
    {
      v74[0] = v12;
      v74[1] = 3221225472;
      v74[2] = __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_2;
      v74[3] = &unk_1E3677798;
      v75 = log;
      v76 = &v80;
      v17 = (id)objc_msgSend(v62, "groupsForCollectionIds:completion:", v16, v74);

    }
    if (-[PSISuggestionQuery cancelled](self, "cancelled"))
    {
      PLSearchBackendQueryGetLog();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v95 = 138412290;
        v96 = (uint64_t)v18;
        _os_log_impl(&dword_199541000, v63, OS_LOG_TYPE_INFO, "Next Token suggestions query for \"%@\" aborted because query was cancelled", v95, 0xCu);

      }
      v14 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v60 = objc_msgSend(v69, "optionsWantSuggestionsForAssets");
      v59 = objc_msgSend(v69, "optionsWantSuggestionsForCollections");
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      obj = log;
      v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v101, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v71;
LABEL_15:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v71 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v21);
          if (-[PSISuggestionQuery cancelled](self, "cancelled"))
            break;
          if (-[PSISuggestionQuery _groupIsValidForSuggestionGeneration:suggestionType:](self, "_groupIsValidForSuggestionGeneration:suggestionType:", v22, 2)&& (PLSearchIndexCategoryIsSynonym((int)objc_msgSend(v22, "category")) & 1) == 0)
          {
            v23 = (const __CFArray *)v92[3];
            v24 = v23 ? CFArrayGetCount(v23) : 0;
            v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "groupId"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "countForObject:", v26);

            v28 = (const __CFArray *)v88[3];
            v29 = v28 ? CFArrayGetCount(v28) : 0;
            v30 = (void *)v81[5];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "groupId"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "countForObject:", v31);
            v33 = v27 != v24;

            v34 = v27 && v33;
            v35 = v32 == v29 || v32 == 0;
            v36 = !v35;
            if ((v60 & v59) != 0)
              v37 = v34 | v36;
            else
              v37 = v60 ? v34 : v59 & v36;
            if ((v37 & -[PSISuggestionQuery _groupWithAssetCountMeetsAssetMatchThreshold:assetSearchResultsCount:](self, "_groupWithAssetCountMeetsAssetMatchThreshold:assetSearchResultsCount:", v27, objc_msgSend(v68, "count"))) == 1)
            {
              v38 = [PLSearchSuggestionComponent alloc];
              if (v34)
                v39 = v27;
              else
                v39 = 0;
              if (v36)
                v40 = v32;
              else
                v40 = 0;
              v41 = -[PLSearchSuggestionComponent initWithGroup:matchedAssetsCount:matchedCollectionsCount:suggestionType:matchedText:matchRangeOfSearchText:](v38, "initWithGroup:matchedAssetsCount:matchedCollectionsCount:suggestionType:matchedText:matchRangeOfSearchText:", v22, v39, v40, 2, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
              -[NSObject addObject:](v63, "addObject:", v41);
              v42 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v22, "contentString");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "stringWithFormat:", CFSTR("%@-%hd"), v43, (int)objc_msgSend(v22, "category"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v61, "addObject:", v44);
            }
          }
          if (v19 == ++v21)
          {
            v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v101, 16);
            if (v19)
              goto LABEL_15;
            break;
          }
        }
      }

      if (-[PSISuggestionQuery cancelled](self, "cancelled"))
      {
        PLSearchBackendQueryGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v95 = 138412290;
          v96 = (uint64_t)v46;
          _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_INFO, "Next Token suggestions query for \"%@\" aborted because query was cancelled", v95, 0xCu);

        }
        v14 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        PLSearchBackendQueryGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = objc_msgSend(v61, "count");
          -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v95 = 134218498;
          v96 = v48;
          v97 = 2112;
          v98 = v49;
          v99 = 2112;
          v100 = v61;
          _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_INFO, "Generated %tu next token candidates for query: \"%@\": %@", v95, 0x20u);

        }
        objc_msgSend((id)objc_opt_class(), "_suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents:assetIds:collectionIds:", v63, v92[3], v88[3]);
        v45 = objc_claimAutoreleasedReturnValue();
        +[PLScopedSearchSuggestionGeneration rankedSearchSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:suggestionQuery:](PLScopedSearchSuggestionGeneration, "rankedSearchSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:suggestionQuery:", v45, 2, objc_msgSend(v68, "count"), objc_msgSend(v64, "count"), objc_msgSend(v69, "searchSuggestionLimit"), self);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (const void *)v92[3];
        if (v51)
        {
          CFRelease(v51);
          v92[3] = 0;
        }
        v52 = (const void *)v88[3];
        if (v52)
        {
          CFRelease(v52);
          v88[3] = 0;
        }
        if (-[PSISuggestionQuery cancelled](self, "cancelled"))
        {
          PLSearchBackendQueryGetLog();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v95 = 138412290;
            v96 = (uint64_t)v54;
            _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_INFO, "Next Token suggestions query for \"%@\" aborted because query was cancelled", v95, 0xCu);

          }
          v14 = (id)MEMORY[0x1E0C9AA60];
        }
        else
        {
          PLSearchBackendQueryGetLog();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v56 = objc_msgSend(v50, "count");
            -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v95 = 134218242;
            v96 = v56;
            v97 = 2112;
            v98 = v57;
            _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_INFO, "Generated %tu next token suggestions for query: \"%@\", v95, 0x16u);

          }
          v14 = v50;
        }

      }
    }

    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&buf, 8);

  }
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);

  return v14;
}

- (BOOL)_groupIsValidForSuggestionGeneration:(id)a3 suggestionType:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "contentString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v7, "length");

  if (PLSearchIndexCategoryIsEligibleForSuggestion((int)objc_msgSend(v6, "category")))
    v8 = !-[PSISuggestionQuery _isEligibleIndexCategory:forSuggestionWithType:](self, "_isEligibleIndexCategory:forSuggestionWithType:", (int)objc_msgSend(v6, "category"), a4);
  else
    LOBYTE(v8) = 1;
  if (objc_msgSend(v6, "category") == 1203
    || objc_msgSend(v6, "category") == 1204
    || objc_msgSend(v6, "category") == 1205)
  {
    objc_msgSend(v6, "contentString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (unint64_t)objc_msgSend(v9, "length") > 2;

  }
  else
  {
    v10 = 1;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PSISuggestionQuery suggestionComponents](self, "suggestionComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "psiGroupId");
        if (v16 == objc_msgSend(v6, "groupId"))
        {

          goto LABEL_19;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (((v23 != 0) & ~(_BYTE)v8 & v10) != 0)
  {
    v17 = 1;
  }
  else
  {
LABEL_19:
    PLSearchBackendQueryGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (a4 - 1 > 3)
        v19 = CFSTR("PLSearchSuggestionTypeNone");
      else
        v19 = off_1E3669388[a4 - 1];
      v20 = v19;
      -[PSISuggestionQuery formattedSearchText](self, "formattedSearchText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v6;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "Group is invalid for suggestion of type for query: %@, %@, \"%@\".", buf, 0x20u);

    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isEligibleIndexCategory:(unint64_t)a3 forSuggestionWithType:(unint64_t)a4
{
  BOOL result;

  result = 1;
  if ((uint64_t)a3 > 1600)
  {
    if ((uint64_t)a3 > 2099)
    {
      if ((uint64_t)a3 > 2500)
      {
        if ((uint64_t)a3 > 2699)
        {
          if (a3 == 2700 || a3 == 2800)
            return 0;
        }
        else if (a3 == 2501 || a3 == 2601)
        {
          return a4 != 2;
        }
      }
      else if (a3 - 2400 < 2 || a3 == 2100 || a3 == 2300)
      {
        return a4 != 2;
      }
    }
    else if ((uint64_t)a3 <= 1899)
    {
      if (a3 == 1601 || a3 == 1611 || a3 == 1803)
        return a4 != 2;
    }
    else if (a3 - 1900 <= 0x13 && ((1 << (a3 - 108)) & 0xF7FFD) != 0)
    {
      return a4 != 2;
    }
  }
  else if ((uint64_t)a3 > 1300)
  {
    if (a3 - 1501 <= 0x28 && ((1 << (a3 + 35)) & 0x18060180601) != 0)
      return a4 != 2;
    if (a3 - 1301 <= 0x1E)
    {
      if (((1 << (a3 - 21)) & 0x40180001) != 0)
        return a4 != 2;
      if (a3 == 1310)
        return 0;
    }
    if (a3 - 1400 < 2)
      return a4 != 2;
  }
  else
  {
    if ((uint64_t)a3 <= 1005)
    {
      if (a3 > 0xE)
        goto LABEL_7;
      if (((1 << a3) & 0x53C4) != 0)
        return a4 != 2;
      if (((1 << a3) & 0x2801) == 0)
      {
LABEL_7:
        if (a3 != 1004)
          return result;
        return a4 != 2;
      }
      return 0;
    }
    if ((uint64_t)a3 <= 1199)
    {
      if (a3 == 1006 || a3 == 1102 || a3 == 1105)
        return a4 != 2;
    }
    else if (a3 - 1200 < 6)
    {
      return a4 != 2;
    }
  }
  return result;
}

- (BOOL)_groupWithAssetCountMeetsAssetMatchThreshold:(unint64_t)a3 assetSearchResultsCount:(unint64_t)a4
{
  BOOL result;
  float v5;

  result = 0;
  if (a3 && a4)
  {
    v5 = (float)((float)a3 / (float)a4) * 100.0;
    return v5 <= 65.0 && v5 >= 15.0;
  }
  return result;
}

- (NSAttributedString)formattedSearchText
{
  return self->_formattedSearchText;
}

- (NSAttributedString)originalSearchtext
{
  return self->_originalSearchtext;
}

- (PSISuggestionOptions)suggestionOptions
{
  return self->_suggestionOptions;
}

- (NSArray)completionSuggestionTexts
{
  return self->_completionSuggestionTexts;
}

- (NSArray)suggestionComponents
{
  return self->_suggestionComponents;
}

- (PSIDatabase)photosEntityStore
{
  return self->_photosEntityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosEntityStore, 0);
  objc_storeStrong((id *)&self->_suggestionComponents, 0);
  objc_storeStrong((id *)&self->_completionSuggestionTexts, 0);
  objc_storeStrong((id *)&self->_suggestionOptions, 0);
  objc_storeStrong((id *)&self->_originalSearchtext, 0);
  objc_storeStrong((id *)&self->_formattedSearchText, 0);
}

uint64_t __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

void __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

uint64_t __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

+ (id)_suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents:(id)a3 assetIds:(__CFArray *)a4 collectionIds:(__CFArray *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  __CFArray *v18;
  __CFArray *v19;
  _QWORD v20[4];
  id v21;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke;
    v20[3] = &unk_1E3666430;
    v21 = v9;
    v11 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke_2;
    v15[3] = &unk_1E3666480;
    v18 = a4;
    v19 = a5;
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = a1;
    v12 = v16;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);
    v13 = (void *)objc_msgSend(v12, "copy");

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v13;
}

+ (id)_suggestionCandidatesByContentStringFromSuggestionComponents:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__PSISuggestionQuery__suggestionCandidatesByContentStringFromSuggestionComponents___block_invoke;
  v9[3] = &unk_1E3666430;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __83__PSISuggestionQuery__suggestionCandidatesByContentStringFromSuggestionComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "contentString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }

  objc_msgSend(v6, "addObject:", v3);
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

}

void __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
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

  v3 = a2;
  v4 = PLSearchSuggestionCategoriesTypeForSearchIndexCategory(objc_msgSend(v3, "indexCategory"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v10, "mutableCopy");

  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }

  objc_msgSend(v14, "addObject:", v3);
  v11 = (void *)objc_msgSend(v14, "copy");
  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

}

void __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int128 v11;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_suggestionCandidatesByContentStringFromSuggestionComponents:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke_3;
  v8[3] = &unk_1E3666458;
  v9 = v5;
  v11 = *(_OWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 32);
  v6 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFAllocator *v14;
  const __CFArray *v15;
  const void *v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t i;
  void *v20;
  void *v21;
  const void *v22;
  const void *v23;
  CFArrayRef Copy;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  CFTypeRef v28;
  CFIndex Count;
  unint64_t v30;
  CFIndex v31;
  unint64_t v32;
  __CFArray *Mutable;
  unint64_t v34;
  unint64_t v35;
  const void *ValueAtIndex;
  const void *v37;
  const void *v38;
  CFTypeRef v40;
  CFTypeRef v41;
  const __CFArray *v42;
  CFIndex v43;
  unint64_t v44;
  CFIndex v45;
  unint64_t v46;
  __CFArray *v47;
  unint64_t v48;
  unint64_t v49;
  const void *v50;
  const void *v51;
  const void *v52;
  CFTypeRef v54;
  void *v55;
  CFTypeRef v56;
  CFIndex v57;
  CFIndex v58;
  void *v59;
  void *v60;
  PLSearchSuggestion *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  _BOOL4 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  _BOOL4 v73;
  uint64_t v74;
  uint64_t v75;
  id obj;
  uint64_t v77;
  void *v78;
  CFTypeRef v79;
  CFTypeRef cf;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;
  CFRange v87;
  CFRange v88;
  CFRange v89;
  CFRange v90;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v69 = objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suggestionType");

  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "matchRangeOfSearchText");
  v67 = v11;
  v68 = v10;

  objc_msgSend(v6, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "matchedText");
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v15 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  v16 = CFArrayCreate(v14, 0, 0, 0);
  if (v8 == 2)
  {
    v66 = objc_msgSend(v6, "count") == 1;
    v73 = (unint64_t)objc_msgSend(v6, "count") > 1;
  }
  else
  {
    v66 = 0;
    v73 = 0;
  }
  v70 = (void *)v13;
  v71 = v5;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v6;
  v74 = v8;
  v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  if (!v77)
    goto LABEL_74;
  v17 = *(_QWORD *)v82;
  v72 = a1;
  v18 = v73;
  v75 = *(_QWORD *)v82;
  do
  {
    for (i = 0; i != v77; ++i)
    {
      if (*(_QWORD *)v82 != v17)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "group");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      cf = 0;
      if (v8 == 1)
      {
        v22 = (const void *)objc_msgSend(v20, "intersectedAssetIds");
        v79 = 0;
        cf = v22;
        v23 = (const void *)objc_msgSend(v21, "intersectedCollectionIds");
      }
      else
      {
        v23 = 0;
      }
      v79 = v23;
      if (v18)
      {
        Copy = (CFArrayRef)objc_msgSend(v21, "assetIds");
        if (Copy)
          Copy = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v21, "assetIds"));
        cf = Copy;
        v25 = (const void *)objc_msgSend(v21, "collectionIds");
        if (v25)
          v25 = CFArrayCreateCopy(0, (CFArrayRef)objc_msgSend(v21, "collectionIds"));
        v79 = v25;
        if (cf)
        {
          v26 = *(_QWORD *)(a1 + 48);
          if (v26)
          {
            +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &cf, v26, 0);
            v25 = v79;
          }
        }
        if (v25)
        {
          v27 = *(_QWORD *)(a1 + 56);
          if (v27)
            +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &v79, v27, 0);
        }
      }
      v78 = v21;
      v28 = cf;
      if (cf)
      {
        if (!v15 || (Count = CFArrayGetCount(v15)) == 0)
        {
          Mutable = (__CFArray *)CFRetain(v28);
          goto LABEL_41;
        }
        v30 = Count;
        v31 = CFArrayGetCount((CFArrayRef)v28);
        if (v31)
        {
          v32 = v31;
          Mutable = CFArrayCreateMutable(0, v31 + v30, 0);
          v34 = 0;
          v35 = 0;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v15, v34);
            v37 = CFArrayGetValueAtIndex((CFArrayRef)v28, v35);
            if (ValueAtIndex < v37)
              v38 = ValueAtIndex;
            else
              v38 = v37;
            if (ValueAtIndex <= v37)
              ++v34;
            if (ValueAtIndex >= v37)
              ++v35;
            CFArrayAppendValue(Mutable, v38);
          }
          while (v30 > v34 && v32 > v35);
          v87.location = v34;
          v87.length = v30 - v34;
          CFArrayAppendArray(Mutable, v15, v87);
          v88.length = v32 - v35;
          v88.location = v35;
          CFArrayAppendArray(Mutable, (CFArrayRef)v28, v88);
          a1 = v72;
          v8 = v74;
          v17 = v75;
          v18 = v73;
LABEL_41:
          v40 = CFAutorelease(Mutable);
          if (!v15)
          {
LABEL_45:
            v15 = (const __CFArray *)CFRetain(v40);
            if (v18)
              CFRelease(cf);
            goto LABEL_47;
          }
        }
        else
        {
          v41 = CFRetain(v15);
          v40 = CFAutorelease(v41);
          v17 = v75;
        }
        CFRelease(v15);
        goto LABEL_45;
      }
LABEL_47:
      v42 = (const __CFArray *)v79;
      if (!v79)
      {
        v55 = v78;
        goto LABEL_72;
      }
      if (v16 && (v43 = CFArrayGetCount((CFArrayRef)v16)) != 0)
      {
        v44 = v43;
        v45 = CFArrayGetCount(v42);
        if (!v45)
        {
          v56 = CFRetain(v16);
          v54 = CFAutorelease(v56);
          v17 = v75;
          v55 = v78;
LABEL_69:
          CFRelease(v16);
          goto LABEL_70;
        }
        v46 = v45;
        v47 = CFArrayCreateMutable(0, v45 + v44, 0);
        v48 = 0;
        v49 = 0;
        do
        {
          v50 = CFArrayGetValueAtIndex((CFArrayRef)v16, v48);
          v51 = CFArrayGetValueAtIndex(v42, v49);
          if (v50 < v51)
            v52 = v50;
          else
            v52 = v51;
          if (v50 <= v51)
            ++v48;
          if (v50 >= v51)
            ++v49;
          CFArrayAppendValue(v47, v52);
        }
        while (v44 > v48 && v46 > v49);
        v89.location = v48;
        v89.length = v44 - v48;
        CFArrayAppendArray(v47, (CFArrayRef)v16, v89);
        v90.length = v46 - v49;
        v90.location = v49;
        CFArrayAppendArray(v47, v42, v90);
        a1 = v72;
        v8 = v74;
        v17 = v75;
        v18 = v73;
      }
      else
      {
        v47 = (__CFArray *)CFRetain(v42);
      }
      v54 = CFAutorelease(v47);
      v55 = v78;
      if (v16)
        goto LABEL_69;
LABEL_70:
      v16 = CFRetain(v54);
      if (v18)
        CFRelease(v79);
LABEL_72:

    }
    v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  }
  while (v77);
LABEL_74:

  if (v15)
    v57 = CFArrayGetCount(v15);
  else
    v57 = 0;
  if (v16)
    v58 = CFArrayGetCount((CFArrayRef)v16);
  else
    v58 = 0;
  if (v66)
  {
    objc_msgSend(obj, "firstObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v59, "matchedAssetsCount");

    objc_msgSend(obj, "firstObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v60, "matchedCollectionsCount");

  }
  v61 = -[PLSearchSuggestion initWithContentString:categoriesType:suggestionType:matchedAssetsCount:matchedCollectionsCount:matchedText:matchRangeOfSearchText:suggestionComponents:]([PLSearchSuggestion alloc], "initWithContentString:categoriesType:suggestionType:matchedAssetsCount:matchedCollectionsCount:matchedText:matchRangeOfSearchText:suggestionComponents:", v71, v69, v74, v57, v58, v70, v68, v67, obj);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (id)objc_msgSend(v63, "mutableCopy");

  }
  else
  {
    v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }

  objc_msgSend(v64, "addObject:", v61);
  v65 = (void *)objc_msgSend(v64, "copy");
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v65, *(_QWORD *)(a1 + 32));

  if (v15)
    CFRelease(v15);
  if (v16)
    CFRelease(v16);

}

@end
