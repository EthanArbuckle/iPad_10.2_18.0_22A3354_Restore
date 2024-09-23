@implementation PLInitialSuggestionRanker

+ (id)rankSearchSuggestionCandidates:(id)a3 suggestionLimit:(unint64_t)a4 maxNumberOfSuggestionsPerContentType:(unint64_t)a5 locale:(id)a6
{
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  unint64_t j;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  double v35;
  double v36;
  unint64_t v37;
  double v38;
  double v39;
  unint64_t v40;
  unint64_t v41;
  double v42;
  void *v43;
  void *v44;
  char v45;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v61;
  os_signpost_id_t spid;
  unint64_t v63;
  NSObject *v64;
  id v65;
  void *v66;
  unint64_t v67;
  char v68;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  unint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  id v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v65 = a6;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLInitialSuggestionRanker.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

  }
  v66 = v10;
  if (objc_msgSend(v10, "count"))
  {
    PLPhotosSearchGetLog();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    v13 = v11;
    v14 = v13;
    v63 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLSearchBackendInitialSuggestionIndexRankingSignpost", ", buf, 2u);
    }
    spid = v12;
    v64 = v14;

    v73 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v74 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(a1, "_candidateBucketsForCandidates:suggestionLimit:maxNumberOfSuggestionsPerContentType:locale:", v10, a4, a5, v65);
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v82 != v18)
            objc_enumerationMutation(v15);
          v20 = objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "count");
          if (v16 <= v20)
            v16 = v20;
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
      }
      while (v17);
    }

    v21 = 2 * objc_msgSend(v15, "count");
    if (v21 < a4)
    {
      PLSearchBackendInitialSuggestionsGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v86 = v21;
        v87 = 2112;
        v88 = (uint64_t)v15;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Adjusting suggestion limit to %tu due to limited initial suggestion candidates: %@.", buf, 0x16u);
      }

      a4 = v21;
    }
    v23 = objc_msgSend(v66, "count");
    v24 = 0;
    v68 = 0;
    v71 = 0;
    v72 = 0;
    v25 = 0;
    if (a4 >= v23)
      v26 = v23;
    else
      v26 = a4;
    v70 = v26;
    v67 = v16 - 1;
    v27 = 0.0;
    v75 = -1;
    v76 = 0;
LABEL_24:
    if (!((objc_msgSend(v73, "count") >= v70) | v68 & 1))
    {
      v68 = 0;
      for (j = 0; ; ++j)
      {
        if (j >= objc_msgSend(v15, "count"))
          goto LABEL_24;
        objc_msgSend(v15, "objectAtIndexedSubscript:", j);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v76 >= objc_msgSend(v29, "count"))
        {
          ++v25;
          goto LABEL_51;
        }
        objc_msgSend(v29, "objectAtIndexedSubscript:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v74, "containsObject:", v30) & 1) != 0)
        {
          PLSearchBackendInitialSuggestionsGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v86 = (unint64_t)v30;
            v87 = 2112;
            v88 = (uint64_t)v73;
            _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Unexpectedly found duplicate candidate suggestions, discarding candidate: %@, for ranked candidates: %@", buf, 0x16u);
          }

          ++v25;
          goto LABEL_50;
        }
        if (objc_msgSend(v73, "count"))
          break;
        objc_msgSend(v73, "addObject:", v30);
        objc_msgSend(v74, "addObject:", v30);
        ++v71;
LABEL_50:

LABEL_51:
        if (j == objc_msgSend(v15, "count") - 1)
        {
          if (v75 == -1)
          {
            v45 = 0;
          }
          else
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectAtIndexedSubscript:", v76);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v74, "containsObject:", v44) & 1) != 0 || objc_msgSend(v73, "count") >= v70)
            {
              v45 = 0;
            }
            else
            {
              objc_msgSend(v73, "addObject:", v44);
              objc_msgSend(v74, "addObject:", v44);
              ++v71;
              v45 = 1;
            }

          }
          v46 = objc_msgSend(v15, "count");
          v27 = 0.0;
          if ((v45 & 1) == 0 && (v46 == v25 || v71 == v46 - v25))
          {
            v24 = 0;
            if (v76 >= v67)
            {
              v72 = 0;
              v25 = 0;
              v68 = 1;
            }
            else
            {
              v71 = 0;
              v72 = 0;
              v25 = 0;
              ++v76;
            }
          }
          else
          {
            v24 = 0;
            v72 = 0;
            v25 = 0;
          }
          v75 = -1;
        }

      }
      objc_msgSend(v73, "lastObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(a1, "candidateSimilarityToOtherCandidate:otherCandidate:", v30, v32);
      objc_msgSend(v30, "suggestionTemplate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "timeSinceLastUsed");
      if (v75 == -1)
      {
        v24 = objc_msgSend(v34, "templateContentType");
        objc_msgSend(v30, "timeSinceLastUsed");
        v27 = v39;
      }
      else
      {
        v36 = v35;
        if (v72 != v33 && v33 > 1)
        {
          if (v72 >= v33)
            v37 = v33;
          else
            v37 = v72;
          if (v33 <= v72)
          {
            v24 = objc_msgSend(v34, "templateContentType");
            objc_msgSend(v30, "timeSinceLastUsed");
            v27 = v38;
            v75 = j;
          }
          v72 = v37;
          goto LABEL_49;
        }
        v40 = objc_msgSend(v34, "templateContentType");
        v41 = v40;
        if (v36 >= v27 && v40 <= v24)
        {
LABEL_49:

          goto LABEL_50;
        }
        objc_msgSend(v30, "timeSinceLastUsed");
        v27 = v42;
        v24 = v41;
      }
      v75 = j;
      v72 = v33;
      goto LABEL_49;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "timeIntervalSince1970");
    v49 = v48;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v50 = v73;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v78 != v52)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * k), "setTimeSinceLastUsed:", v49);
        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
      }
      while (v51);
    }

    v54 = v64;
    v55 = v54;
    if (v63 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v55, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendInitialSuggestionIndexRankingSignpost", ", buf, 2u);
    }

    PLSearchBackendInitialSuggestionsGetLog();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      v57 = objc_msgSend(v50, "count");
      v58 = objc_msgSend(v66, "count");
      *(_DWORD *)buf = 134218498;
      v86 = v57;
      v87 = 2048;
      v88 = v58;
      v89 = 2112;
      v90 = v73;
      _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_DEFAULT, "Returning %tu initial suggestions after ranking from %tu candidates: %@", buf, 0x20u);
    }

    v59 = (void *)objc_msgSend(v50, "copy");
  }
  else
  {
    v59 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v59;
}

+ (unint64_t)candidateSimilarityToOtherCandidate:(id)a3 otherCandidate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  int v26;
  BOOL v27;
  char v28;
  BOOL v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  BOOL v38;
  int v39;
  BOOL v40;
  char v41;
  BOOL v42;
  void *v44;
  void *v45;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "suggestionTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestionTemplate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suggestionTemplateKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestionTemplateKey");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v9;
  if (objc_msgSend(v9, "isEqualToString:"))
    v10 = 16;
  else
    v10 = 0;
  v11 = objc_msgSend(v7, "templateType");
  v12 = v10 | (v11 == objc_msgSend(v8, "templateType"));
  v13 = objc_msgSend(v7, "templateDateType");
  v14 = objc_msgSend(v8, "templateDateType");
  if (v13 != v14 || (v13 | v14) == 0)
    v16 = v12;
  else
    v16 = v12 | 4;
  objc_msgSend(v5, "firstGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "groupId");

  objc_msgSend(v5, "secondGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "groupId");

  objc_msgSend(v6, "firstGroup");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "groupId");

  objc_msgSend(v6, "secondGroup");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "groupId");

  if (v18 | v22 && v18 == v22
    || (v20 | v22 ? (v25 = v20 == v22) : (v25 = 0),
        !v25 ? (v26 = 0) : (v26 = 1),
        v18 | v24 ? (v27 = v18 == v24) : (v27 = 0),
        !v27 ? (v28 = 0) : (v28 = 1),
        v20 == v24 ? (v29 = (v20 | v24) == 0) : (v29 = 1),
        !v29 || (v28 & 1) != 0 || v26))
  {
    v16 |= 8uLL;
  }
  objc_msgSend(v5, "firstGroup");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "searchIndexingCategory");

  objc_msgSend(v5, "secondGroup");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "searchIndexingCategory");

  objc_msgSend(v6, "firstGroup");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "searchIndexingCategory");

  objc_msgSend(v6, "secondGroup");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "searchIndexingCategory");

  if (v31 | v35 && v31 == v35
    || (v33 | v35 ? (v38 = v33 == v35) : (v38 = 0),
        !v38 ? (v39 = 0) : (v39 = 1),
        v31 | v37 ? (v40 = v31 == v37) : (v40 = 0),
        !v40 ? (v41 = 0) : (v41 = 1),
        v33 == v37 ? (v42 = (v33 | v37) == 0) : (v42 = 1),
        !v42 || (v41 & 1) != 0 || v39))
  {
    v16 |= 2uLL;
  }

  return v16;
}

+ (id)trimmedListCandidatesOfCandidatesFromCandidates:(id)a3 maxNumberOfSuggestionsPerContentType:(unint64_t)a4 locale:(id)a5
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_candidateBucketsForCandidates:suggestionLimit:maxNumberOfSuggestionsPerContentType:locale:", a3, -1, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++), (_QWORD)v14);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v12 = (void *)objc_msgSend(v6, "copy");
  return v12;
}

+ (BOOL)_candidateHasLastUsedDateOfToday:(id)a3 calendar:(id)a4 todayDateComponents:(id)a5 calendarUnits:(unint64_t)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;

  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a4;
  objc_msgSend(a3, "timeSinceLastUsed");
  objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:", a6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "month");
  v17 = 0;
  if (v14 == objc_msgSend(v9, "month"))
  {
    v15 = objc_msgSend(v13, "day");
    if (v15 == objc_msgSend(v9, "day"))
    {
      v16 = objc_msgSend(v13, "year");
      if (v16 == objc_msgSend(v9, "year"))
        v17 = 1;
    }
  }

  return v17;
}

+ (id)_candidateBucketsForCandidates:(id)a3 suggestionLimit:(unint64_t)a4 maxNumberOfSuggestionsPerContentType:(unint64_t)a5 locale:(id)a6
{
  id v10;
  id v11;
  unint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v30 = a6;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = v10;
  v12 = objc_msgSend(v10, "count");
  for (i = 1; i != 10; ++i)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v14, v15);

  }
  objc_msgSend(a1, "_populateBuckets:candidates:shouldTryToExcludeCandidatesUsedToday:suggestionLimit:locale:", v31, v29, v12 > a4, a4, v30);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  if (v12 > a4)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __120__PLInitialSuggestionRanker__candidateBucketsForCandidates_suggestionLimit_maxNumberOfSuggestionsPerContentType_locale___block_invoke;
    v37[3] = &unk_1E36779E8;
    v37[4] = &v38;
    objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v37);
    if (v39[3] < a4)
    {
      objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_100244);
      objc_msgSend(a1, "_populateBuckets:candidates:shouldTryToExcludeCandidatesUsedToday:suggestionLimit:locale:", v31, v29, 0, a4, v30);
    }
  }
  v16 = 9;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count"))
      objc_msgSend(v11, "addObject:", v18);

    --v16;
  }
  while (v16);
  v35 = 0u;
  v36 = 0u;
  if (a5)
    v19 = a5;
  else
    v19 = 25;
  v33 = 0uLL;
  v34 = 0uLL;
  obj = v11;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timeSinceLastUsed"), 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v24;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("rankingScore"), 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v42[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sortUsingDescriptors:", v26);

        if (objc_msgSend(v23, "count") > v19)
        {
          objc_msgSend(v23, "subarrayWithRange:", 0, v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeAllObjects");
          objc_msgSend(v23, "addObjectsFromArray:", v27);

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v20);
  }

  _Block_object_dispose(&v38, 8);
  return obj;
}

+ (void)_populateBuckets:(id)a3 candidates:(id)a4 shouldTryToExcludeCandidatesUsedToday:(BOOL)a5 suggestionLimit:(unint64_t)a6 locale:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
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
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v9 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  if (v9)
    v14 = objc_msgSend(v12, "count") - a6;
  else
    v14 = 0;
  v15 = (void *)MEMORY[0x1E0C99D48];
  v33 = v13;
  objc_msgSend(v13, "calendarIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "calendarWithIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v36 = v17;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "components:fromDate:", 28);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v23, "suggestionTemplate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "templateContentType");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v23, "timeSinceLastUsed");
          v29 = v28 == 0.0 || v14 == 0;
          if (v29
            || (objc_msgSend(a1, "_candidateHasLastUsedDateOfToday:calendar:todayDateComponents:calendarUnits:", v23, v36, v35, 28) & 1) == 0)
          {
            objc_msgSend(v27, "addObject:", v23);
          }
          else
          {
            PLSearchBackendInitialSuggestionsGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = (uint64_t)v23;
              _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "Excluding candidate %@ from initial suggestions because it was already used today.", buf, 0xCu);
            }
            --v14;

          }
        }
        else
        {
          PLSearchBackendInitialSuggestionsGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v42 = v25;
            _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Missing bucket for content type %tu during initial suggestion ranking, no suggestions for this content type will be generated.", buf, 0xCu);
          }

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v20);
  }

}

uint64_t __120__PLInitialSuggestionRanker__candidateBucketsForCandidates_suggestionLimit_maxNumberOfSuggestionsPerContentType_locale___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __120__PLInitialSuggestionRanker__candidateBucketsForCandidates_suggestionLimit_maxNumberOfSuggestionsPerContentType_locale___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeAllObjects");
}

@end
