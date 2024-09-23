@implementation PGTripHighlightSharingSuggester

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 102);
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
  PGTripHighlightSharingSuggester *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGAbstractSuggester session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggingConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "curationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "curationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __67__PGTripHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke;
  v26[3] = &unk_1E842E568;
  v27 = v5;
  v28 = v8;
  v29 = v7;
  v30 = v13;
  v31 = self;
  v32 = v9;
  v33 = v10;
  v34 = v11;
  v35 = v12;
  v14 = v6;
  v36 = v14;
  v25 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  v18 = v13;
  v19 = v7;
  v20 = v8;
  v21 = v5;
  objc_msgSend(v17, "performSynchronousConcurrentGraphReadUsingBlock:", v26);
  v22 = v36;
  v23 = v14;

  return v23;
}

void __67__PGTripHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  PGEnrichableEventSuggestion *v45;
  uint64_t v46;
  PGEnrichableEventSuggestion *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  char v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id obj;
  id v70;
  id v71;
  void *v72;
  void *v73;
  PGTitleGenerationContext *v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint8_t v100[128];
  uint8_t buf[4];
  id v102;
  __int16 v103;
  id v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
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
  v62 = v3;
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v102 = v4;
      v103 = 2112;
      v104 = v6;
      _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Start date or end date invalid: %@ - %@", buf, 0x16u);
    }
    goto LABEL_67;
  }
  objc_msgSend(v3, "graph");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "allTripNodes");
  v9 = a1;
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3880];
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __67__PGTripHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke_129;
  v93[3] = &unk_1E842E540;
  v94 = *(id *)(v9 + 40);
  v12 = v4;
  v95 = v12;
  v13 = v6;
  v96 = v13;
  objc_msgSend(v11, "predicateWithBlock:", v93);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v10;
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "count"))
  {
    v56 = *(NSObject **)(v9 + 40);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v102 = v12;
      v103 = 2112;
      v104 = v13;
      _os_log_impl(&dword_1CA237000, v56, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No trips found between %@ and %@", buf, 0x16u);
    }
    goto LABEL_66;
  }
  v58 = v13;
  v59 = v12;
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v63 = v9;
  objc_msgSend(*(id *)(v9 + 48), "existingSuggestions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
  v66 = v6;
  v67 = v4;
  v72 = v16;
  v65 = v15;
  if (!v17)
    goto LABEL_34;
  v18 = v17;
  v19 = *(_QWORD *)v90;
  v64 = *(_QWORD *)v90;
  do
  {
    v20 = 0;
    v68 = v18;
    do
    {
      if (*(_QWORD *)v90 != v19)
        objc_enumerationMutation(obj);
      v73 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v20);
      if (objc_msgSend(v73, "subtype") == 102)
      {
        v70 = v20;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v75 = v15;
        v21 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
        if (!v21)
          goto LABEL_31;
        v22 = v21;
        v23 = *(_QWORD *)v86;
        while (1)
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v86 != v23)
              objc_enumerationMutation(v75);
            v25 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v24);
            v26 = (void *)MEMORY[0x1CAA4EB2C]();
            if (objc_msgSend(v16, "containsObject:", v25))
            {
              objc_msgSend(v73, "universalStartDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "universalEndDate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v27;
              if (!v29 || !v28)
                goto LABEL_25;
              v30 = v25;
              objc_msgSend(v30, "universalStartDate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "universalEndDate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v31, "compare:", v28) == 1)
              {

LABEL_25:
                goto LABEL_26;
              }
              v33 = objc_msgSend(v32, "compare:", v29);

              v7 = v33 == -1;
              v16 = v72;
              if (!v7)
                objc_msgSend(v72, "removeObject:", v30);
            }
LABEL_26:
            objc_autoreleasePoolPop(v26);
            ++v24;
          }
          while (v22 != v24);
          v34 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
          v22 = v34;
          if (!v34)
          {
LABEL_31:

            v6 = v66;
            v4 = v67;
            v19 = v64;
            v15 = v65;
            v18 = v68;
            v20 = v70;
            break;
          }
        }
      }
      v20 = (char *)v20 + 1;
    }
    while (v20 != (id)v18);
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
  }
  while (v18);
LABEL_34:

  if (objc_msgSend(v16, "count"))
  {
    v74 = -[PGTitleGenerationContext initWithGraph:serviceManager:]([PGTitleGenerationContext alloc], "initWithGraph:serviceManager:", v61, *(_QWORD *)(v63 + 56));
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v71 = v16;
    v35 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
    if (v35)
    {
      v36 = v35;
      v76 = *(id *)v82;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(id *)v82 != v76)
            objc_enumerationMutation(v71);
          v38 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          v39 = (void *)MEMORY[0x1CAA4EB2C]();
          v40 = *(void **)(v63 + 64);
          objc_msgSend(v38, "collection");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "momentNodes");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "temporaryArray");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "sharingSuggestionResultsForMomentNodes:withWorkingContext:", v43, *(_QWORD *)(v63 + 72));
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v45 = v44;
          v46 = -[PGEnrichableEventSuggestion countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
          v47 = v45;
          if (v46)
          {
            v48 = v46;
            v49 = *(_QWORD *)v78;
LABEL_42:
            v50 = 0;
            while (1)
            {
              if (*(_QWORD *)v78 != v49)
                objc_enumerationMutation(v45);
              objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v50), "person");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "isVerified");

              if ((v52 & 1) != 0)
                break;
              if (v48 == ++v50)
              {
                v48 = -[PGEnrichableEventSuggestion countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v77, v97, 16);
                if (v48)
                  goto LABEL_42;
                v47 = v45;
                goto LABEL_56;
              }
            }

            v53 = v63;
            v47 = -[PGEnrichableEventSuggestion initWithType:subtype:enrichableEvent:sharingSuggestionResults:photoLibrary:curationManager:curationContext:loggingConnection:titleGenerationContext:]([PGEnrichableEventSuggestion alloc], "initWithType:subtype:enrichableEvent:sharingSuggestionResults:photoLibrary:curationManager:curationContext:loggingConnection:titleGenerationContext:", 1, 102, v38, v45, *(_QWORD *)(v63 + 80), *(_QWORD *)(v63 + 88), *(_QWORD *)(v63 + 96), *(_QWORD *)(v63 + 40), v74);
            if (v47)
            {
              objc_msgSend(*(id *)(v63 + 104), "addObject:", v47);
              if (objc_msgSend(*(id *)(v63 + 32), "allowNotification"))
              {
                objc_msgSend(*(id *)(v63 + 48), "notificationProfile");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v54, "eligibleForNotification"))
                {
                  -[PGEnrichableEventSuggestion setNotificationQuality:](v47, "setNotificationQuality:", objc_msgSend(v54, "notificationQualityForEnrichableEvent:", v38));
                  if (objc_msgSend(v54, "shouldNotifyForSuggestion:withOptions:", v47, *(_QWORD *)(v63 + 32)))-[PGEnrichableEventSuggestion setNotificationState:](v47, "setNotificationState:", 1);
                }

                v53 = v63;
              }
              v55 = objc_msgSend(*(id *)(v53 + 104), "count");
              if (v55 >= objc_msgSend(*(id *)(v53 + 32), "maximumNumberOfSuggestions"))
              {

                objc_autoreleasePoolPop(v39);
                goto LABEL_64;
              }
            }
          }
LABEL_56:

          objc_autoreleasePoolPop(v39);
        }
        v36 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
      }
      while (v36);
    }
LABEL_64:

    v6 = v66;
    v4 = v67;
    v15 = v65;
    v16 = v72;
  }
  else
  {
    v57 = *(NSObject **)(v63 + 40);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v102 = v59;
      v103 = 2112;
      v104 = v58;
      _os_log_impl(&dword_1CA237000, v57, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Trips found between %@ and %@ are already covered in exising sharing suggestions", buf, 0x16u);
    }
  }

LABEL_66:
LABEL_67:

}

BOOL __67__PGTripHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke_129(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subsetWithEnoughScenesProcessed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subsetWithEnoughFacesProcessed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "count");
  if (v8 == objc_msgSend(v7, "count"))
  {
    v9 = (void *)a1[5];
    v10 = (void *)a1[6];
    v11 = v3;
    v12 = v9;
    v13 = v10;
    v14 = v13;
    v15 = 0;
    if (v12 && v13)
    {
      objc_msgSend(v11, "universalStartDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "universalEndDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v16, "compare:", v14) != 1 && objc_msgSend(v17, "compare:", v12) != -1;

    }
  }
  else
  {
    v18 = a1[4];
    v15 = 0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v3;
      _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Not all moments analyzed for %@", (uint8_t *)&v20, 0xCu);
      v15 = 0;
    }
  }

  return v15;
}

@end
