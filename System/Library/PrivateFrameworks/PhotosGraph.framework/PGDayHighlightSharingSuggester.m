@implementation PGDayHighlightSharingSuggester

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 101);
}

+ (BOOL)shouldSuggestHighlightNode:(id)a3 neighborScoreComputer:(id)a4 loggingConnection:(id)a5
{
  id v7;
  NSObject *v8;
  double v9;
  double v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  _BOOL4 v17;
  BOOL v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "neighborScoreWithHighlightNode:", v7);
  v10 = v9;
  v11 = objc_msgSend(v7, "isInteresting");
  v12 = objc_msgSend(v7, "isSmartInteresting");
  objc_msgSend(v7, "meaningLabels");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138413314;
    v24 = v7;
    v25 = 1024;
    v26 = v11;
    v27 = 1024;
    v28 = v12;
    v29 = 2048;
    v30 = v10;
    v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node %@: isInteresting %d, isSmartInteresting %d, neighborScore %.2f, meanings %@", (uint8_t *)&v23, 0x2Cu);
  }
  if (v10 > 0.43)
    v14 = 1;
  else
    v14 = v11;
  if (((v14 | v12) & 1) == 0 && !objc_msgSend(v13, "count"))
  {
    v18 = 0;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    LOWORD(v23) = 0;
    v19 = "[Sharing Suggestion] Highlight node not interesting for sharing.";
    v20 = v8;
    v21 = 2;
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "isPartOfTrip"))
  {
    +[PGGraph mostSignificantMeaningLabels](PGGraph, "mostSignificantMeaningLabels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "intersectsSet:", v15);

    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if ((v16 & 1) != 0)
    {
      if (v17)
      {
        v23 = 138412290;
        v24 = v13;
        _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node is contained in a trip and meaningful enough for sharing (%@).", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_12;
    }
    if (!v17)
    {
LABEL_18:
      v18 = 0;
      goto LABEL_19;
    }
    v23 = 138412290;
    v24 = v13;
    v19 = "[Sharing Suggestion] Highlight node is contained in a trip, but not meaningful enough for sharing (%@).";
    v20 = v8;
    v21 = 12;
LABEL_17:
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);
    goto LABEL_18;
  }
LABEL_12:
  v18 = 1;
LABEL_19:

  return v18;
}

+ (BOOL)canSuggestHighlightNodeWithoutPeople:(id)a3 loggingConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  unint64_t v13;
  BOOL v14;
  int v16;
  id v17;
  __int16 v18;
  double v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "isInteresting"))
    goto LABEL_7;
  objc_msgSend(v5, "localEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 < 7200.0)
    goto LABEL_7;
  objc_msgSend(v5, "collection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "momentNodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfAssets");

  if (v13 >= 0x1E)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412802;
      v17 = v5;
      v18 = 2048;
      v19 = v10;
      v20 = 2048;
      v21 = v13;
      _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Considering highlight node %@ interesting enough to suggest without person detected in it (duration %.0f, number of assets %lu).", (uint8_t *)&v16, 0x20u);
    }
    v14 = 1;
  }
  else
  {
LABEL_7:
    v14 = 0;
  }

  return v14;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
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
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  PGDayHighlightSharingSuggester *v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGAbstractSuggester session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggingConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "curationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "curationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__PGDayHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke;
  v26[3] = &unk_1E842E568;
  v27 = v5;
  v28 = v7;
  v29 = v9;
  v30 = v8;
  v31 = v13;
  v32 = self;
  v33 = v10;
  v34 = v11;
  v35 = v12;
  v14 = v6;
  v36 = v14;
  v25 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  v18 = v8;
  v19 = v9;
  v20 = v7;
  v21 = v5;
  objc_msgSend(v16, "performSynchronousConcurrentGraphReadUsingBlock:", v26);
  v22 = v36;
  v23 = v14;

  return v23;
}

void __66__PGDayHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  PGNeighborScoreComputer *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  PGEnrichableEventSuggestion *v57;
  uint64_t v58;
  PGEnrichableEventSuggestion *v59;
  uint64_t v60;
  PGNeighborScoreComputer *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  int v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  unint64_t v69;
  NSObject *v70;
  const char *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id obj;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  PGTitleGenerationContext *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  void *v96;
  __int128 v97;
  __int128 v98;
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
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint8_t v116[128];
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  void *v120;
  __int16 v121;
  void *v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "universalStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "universalEndDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    v77 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v118 = v4;
      v119 = 2112;
      v120 = v6;
      _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Start date or end date invalid: %@ - %@", buf, 0x16u);
    }
    goto LABEL_86;
  }
  v86 = a1;
  v75 = v3;
  objc_msgSend(v3, "graph");
  v9 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v4, v6);
  v77 = (void *)v9;
  +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    v76 = v10;
    v70 = *(NSObject **)(a1 + 48);
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      goto LABEL_85;
    *(_DWORD *)buf = 138412546;
    v118 = v4;
    v119 = 2112;
    v120 = v6;
    v71 = "[Sharing Suggestion] No moments found between %@ and %@";
LABEL_77:
    _os_log_impl(&dword_1CA237000, v70, OS_LOG_TYPE_DEFAULT, v71, buf, 0x16u);
    goto LABEL_85;
  }
  objc_msgSend(v10, "subsetWithEnoughScenesProcessed");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = (void *)v11;

  objc_msgSend(v13, "subsetWithEnoughFacesProcessed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = v14;
  if (!objc_msgSend(v14, "count"))
  {
    v70 = *(NSObject **)(v86 + 48);
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      goto LABEL_85;
    *(_DWORD *)buf = 138412546;
    v118 = v4;
    v119 = 2112;
    v120 = v6;
    v71 = "[Sharing Suggestion] No moments analyzed found between %@ and %@";
    goto LABEL_77;
  }
  objc_msgSend(v14, "highlightNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v16, "count"))
  {
    v72 = *(NSObject **)(v86 + 48);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v118 = v4;
      v119 = 2112;
      v120 = v6;
      v121 = 2112;
      v122 = v76;
      _os_log_impl(&dword_1CA237000, v72, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No highlight nodes found between %@ and %@ for moment nodes %@", buf, 0x20u);
    }
    goto LABEL_84;
  }
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  v96 = (void *)objc_opt_new();
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  objc_msgSend(*(id *)(v86 + 40), "existingSuggestions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
  v80 = v6;
  v81 = v4;
  v87 = v17;
  v79 = v16;
  if (!v18)
    goto LABEL_42;
  v19 = v18;
  v20 = *(_QWORD *)v110;
  v78 = *(_QWORD *)v110;
  do
  {
    v21 = 0;
    v82 = v19;
    do
    {
      if (*(_QWORD *)v110 != v20)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v21);
      v23 = (void *)MEMORY[0x1CAA4EB2C]();
      if (objc_msgSend(v22, "subtype") == 101)
      {
        v84 = v23;
        v85 = v21;
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v22, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fetchedObjectIDsSet");
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v94 = v16;
        v25 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
        if (!v25)
          goto LABEL_39;
        v26 = v25;
        v27 = v22;
        v28 = *(_QWORD *)v106;
        v88 = v22;
        while (1)
        {
          v29 = 0;
          v92 = v26;
          do
          {
            if (*(_QWORD *)v106 != v28)
              objc_enumerationMutation(v94);
            v30 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v29);
            v31 = (void *)MEMORY[0x1CAA4EB2C]();
            if (objc_msgSend(v17, "containsObject:", v30))
            {
              objc_msgSend(v27, "universalStartDate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "universalEndDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v32;
              if (v34 && v33)
              {
                v35 = v30;
                objc_msgSend(v35, "universalStartDate");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "universalEndDate");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v36, "compare:", v33) == 1)
                {

                  v17 = v87;
                  goto LABEL_27;
                }
                v42 = objc_msgSend(v37, "compare:", v34);

                v7 = v42 == -1;
                v17 = v87;
                v27 = v88;
                if (!v7)
                {
                  objc_msgSend(v87, "removeObject:", v35);
LABEL_33:
                  v26 = v92;
                  goto LABEL_34;
                }
              }
              else
              {
LABEL_27:

              }
              objc_msgSend(v30, "localIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "objectForKeyedSubscript:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v39)
              {
                objc_msgSend(v30, "fetchAssetCollectionInPhotoLibrary:", *(_QWORD *)(v86 + 56));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v40, 0);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "fetchedObjectIDsSet");
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v96, "setObject:forKeyedSubscript:", v39, v38);
                v27 = v88;
              }
              if (objc_msgSend(v90, "intersectsSet:", v39))
                objc_msgSend(v17, "removeObject:", v30);

              goto LABEL_33;
            }
LABEL_34:
            objc_autoreleasePoolPop(v31);
            ++v29;
          }
          while (v26 != v29);
          v43 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
          v26 = v43;
          if (!v43)
          {
LABEL_39:

            v6 = v80;
            v4 = v81;
            v20 = v78;
            v16 = v79;
            v19 = v82;
            v23 = v84;
            v21 = v85;
            break;
          }
        }
      }
      objc_autoreleasePoolPop(v23);
      ++v21;
    }
    while (v21 != v19);
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v116, 16);
  }
  while (v19);
LABEL_42:

  if (objc_msgSend(v17, "count"))
  {
    v44 = objc_alloc_init(PGNeighborScoreComputer);
    v45 = v86;
    v91 = -[PGTitleGenerationContext initWithGraph:serviceManager:]([PGTitleGenerationContext alloc], "initWithGraph:serviceManager:", v77, *(_QWORD *)(v86 + 64));
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v95 = v17;
    v46 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v102;
      v89 = *(_QWORD *)v102;
      do
      {
        v49 = 0;
        v93 = v47;
        do
        {
          if (*(_QWORD *)v102 != v48)
            objc_enumerationMutation(v95);
          v50 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v49);
          v51 = (void *)MEMORY[0x1CAA4EB2C]();
          if (objc_msgSend((id)objc_opt_class(), "shouldSuggestHighlightNode:neighborScoreComputer:loggingConnection:", v50, v44, *(_QWORD *)(v45 + 48)))
          {
            v52 = *(void **)(v45 + 72);
            objc_msgSend(v50, "eventEnrichmentMomentNodes");
            v53 = v45;
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "array");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "sharingSuggestionResultsForMomentNodes:withWorkingContext:", v55, *(_QWORD *)(v53 + 80));
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
            v57 = v56;
            v58 = -[PGEnrichableEventSuggestion countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
            v59 = v57;
            if (v58)
            {
              v60 = v58;
              v61 = v44;
              v62 = *(_QWORD *)v98;
LABEL_51:
              v63 = 0;
              while (1)
              {
                if (*(_QWORD *)v98 != v62)
                  objc_enumerationMutation(v57);
                objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * v63), "person");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_msgSend(v64, "isVerified");

                if (v65)
                  break;
                if (v60 == ++v63)
                {
                  v60 = -[PGEnrichableEventSuggestion countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
                  if (v60)
                    goto LABEL_51;
                  v59 = v57;
                  v17 = v87;
                  v44 = v61;
                  goto LABEL_68;
                }
              }
              v66 = *(NSObject **)(v86 + 48);
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1CA237000, v66, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node contains verified people", buf, 2u);
              }

              v67 = v86;
              v59 = -[PGEnrichableEventSuggestion initWithType:subtype:enrichableEvent:sharingSuggestionResults:photoLibrary:curationManager:curationContext:loggingConnection:titleGenerationContext:]([PGEnrichableEventSuggestion alloc], "initWithType:subtype:enrichableEvent:sharingSuggestionResults:photoLibrary:curationManager:curationContext:loggingConnection:titleGenerationContext:", 1, 101, v50, v57, *(_QWORD *)(v86 + 56), *(_QWORD *)(v86 + 88), *(_QWORD *)(v86 + 96), *(_QWORD *)(v86 + 48), v91);
              v17 = v87;
              v44 = v61;
              if (!v59)
              {
LABEL_68:
                v48 = v89;
                goto LABEL_69;
              }
              objc_msgSend(*(id *)(v86 + 104), "addObject:", v59);
              v48 = v89;
              if (objc_msgSend(*(id *)(v86 + 32), "allowNotification"))
              {
                objc_msgSend(*(id *)(v86 + 40), "notificationProfile");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v68, "eligibleForNotification"))
                {
                  -[PGEnrichableEventSuggestion setNotificationQuality:](v59, "setNotificationQuality:", objc_msgSend(v68, "notificationQualityForHighlightNode:", v50));
                  if (objc_msgSend(v68, "shouldNotifyForSuggestion:withOptions:", v59, *(_QWORD *)(v86 + 32)))-[PGEnrichableEventSuggestion setNotificationState:](v59, "setNotificationState:", 1);
                }

                v67 = v86;
              }
              v69 = objc_msgSend(*(id *)(v67 + 104), "count");
              if (v69 >= objc_msgSend(*(id *)(v67 + 32), "maximumNumberOfSuggestions"))
              {

                objc_autoreleasePoolPop(v51);
                goto LABEL_82;
              }
            }
LABEL_69:

            v45 = v86;
            v47 = v93;
          }
          objc_autoreleasePoolPop(v51);
          ++v49;
        }
        while (v49 != v47);
        v47 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
      }
      while (v47);
    }
LABEL_82:

    v6 = v80;
    v4 = v81;
    v16 = v79;
  }
  else
  {
    v73 = *(NSObject **)(v86 + 48);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v118 = v4;
      v119 = 2112;
      v120 = v6;
      _os_log_impl(&dword_1CA237000, v73, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlights found between %@ and %@ are already covered in exising sharing suggestions", buf, 0x16u);
    }
  }

LABEL_84:
LABEL_85:

  v3 = v75;
LABEL_86:

}

@end
