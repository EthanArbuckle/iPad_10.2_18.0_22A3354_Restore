@implementation ATXLayoutGenerator

- (ATXLayoutGenerator)initWithRankedSuggestions:(id)a3 layoutsToConsider:(id)a4 hyperParameters:(id)a5 suggestionDeduplicator:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXLayoutGenerator *v15;
  ATXLayoutGenerator *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXLayoutGenerator;
  v15 = -[ATXLayoutGenerator init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rankedSuggestions, a3);
    objc_storeStrong((id *)&v16->_layoutsToConsider, a4);
    objc_storeStrong((id *)&v16->_hyperParameters, a5);
    objc_storeStrong((id *)&v16->_deduplicator, a6);
  }

  return v16;
}

- (id)generateValidLayouts
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  v3 = (void *)objc_opt_new();
  -[ATXLayoutGenerator generateLayoutToSuggestionDictionary](self, "generateLayoutToSuggestionDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_layoutsToConsider;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[ATXLayoutGenerator generateGreedySuggestionLayoutForUILayoutType:layoutTypesForRankedSuggestions:isSuggestionsWidgetLayout:](self, "generateGreedySuggestionLayoutForUILayoutType:layoutTypesForRankedSuggestions:isSuggestionsWidgetLayout:", objc_msgSend(v10, "integerValue", (_QWORD)v15), v4, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v3, "addObject:", v11);
        -[ATXLayoutGenerator generateGreedySuggestionLayoutForUILayoutType:layoutTypesForRankedSuggestions:isSuggestionsWidgetLayout:](self, "generateGreedySuggestionLayoutForUILayoutType:layoutTypesForRankedSuggestions:isSuggestionsWidgetLayout:", objc_msgSend(v10, "integerValue"), v4, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v3, "addObject:", v12);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend((id)objc_opt_class(), "sortLayouts:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)generateLayoutToSuggestionDictionary
{
  void *v3;
  uint64_t v4;
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
  NSArray *obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_rankedSuggestions;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = v4;
        v5 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v4);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v5, "uiSpecification");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "preferredLayoutConfigs");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "applicableLayoutType"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v14)
              {
                v15 = (void *)objc_opt_new();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "applicableLayoutType"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v16);

              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "applicableLayoutType"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v5);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v9);
        }

        v4 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  v19 = (void *)objc_msgSend(v3, "copy");
  return v19;
}

- (id)generateGreedySuggestionLayoutForUILayoutType:(int64_t)a3 layoutTypesForRankedSuggestions:(id)a4 isSuggestionsWidgetLayout:(BOOL)a5
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t i;
  void *v51;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  unint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  NSArray *obj;
  _BOOL4 v81;
  void *v82;
  uint64_t v83;
  int v84;
  char v85;
  char v86;
  void *v88;
  int64_t v89;
  void *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  uint64_t v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v81 = a5;
  v106 = *MEMORY[0x1E0C80C00];
  v76 = a4;
  v6 = 0x1E57CD000uLL;
  +[ATXSuggestionLayout minSuggestionLayoutTypesForUILayoutType:](ATXSuggestionLayout, "minSuggestionLayoutTypesForUILayoutType:", a3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = a3;
  +[ATXSuggestionLayout maxSuggestionLayoutTypesForUILayoutType:](ATXSuggestionLayout, "maxSuggestionLayoutTypesForUILayoutType:", a3);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_opt_new();
  v7 = 1;
  v8 = 0x1E0CB3000uLL;
  v91 = (void *)objc_opt_new();
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    if (v11 < v14)
    {
      __atxlog_handle_blending();
      v46 = objc_claimAutoreleasedReturnValue();
      v17 = v91;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        +[ATXSuggestionLayout stringFromUILayoutType:](ATXSuggestionLayout, "stringFromUILayoutType:", v89);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v101 = v47;
        _os_log_impl(&dword_1AA841000, v46, OS_LOG_TYPE_DEFAULT, "Blending: Don't have enough suggestions to create UI layout %@", buf, 0xCu);

      }
      v48 = 0;
      v49 = v88;
      goto LABEL_53;
    }
    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v91;
    objc_msgSend(v91, "setObject:forKeyedSubscript:", v15, v16);

    ++v7;
  }
  while (v7 != 8);
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = self->_rankedSuggestions;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
  if (v18)
  {
    v19 = v18;
    v86 = 0;
    v20 = *(_QWORD *)v97;
    v21 = !v81;
    v85 = 1;
    v78 = *(_QWORD *)v97;
    while (1)
    {
      v22 = 0;
      v79 = v19;
      do
      {
        if (*(_QWORD *)v97 != v20)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v22);
        v24 = (void *)MEMORY[0x1AF421DC4]();
        v84 = objc_msgSend(v23, "isValidForSuggestionsWidget");
        if (!v84 || v81)
        {
          if ((v84 | v21) != 1)
            goto LABEL_39;
LABEL_15:
          v82 = v24;
          v83 = v22;
          v94 = 0u;
          v95 = 0u;
          v92 = 0u;
          v93 = 0u;
          objc_msgSend(v23, "uiSpecification");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "preferredLayoutConfigs");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
          if (!v28)
            goto LABEL_38;
          v29 = v28;
          v30 = *(_QWORD *)v93;
          while (2)
          {
            v31 = 0;
LABEL_18:
            if (*(_QWORD *)v93 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(v8 + 2024), "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v31), "applicableLayoutType"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "count");
            objc_msgSend(v90, "objectForKeyedSubscript:", v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "unsignedIntegerValue");

            if (v34 >= v36)
              goto LABEL_35;
            objc_msgSend(v23, "executableSpecification");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v37, "executableType"))
              goto LABEL_24;
            objc_msgSend(v23, "executableSpecification");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v38, "executableType") == 3)
            {

LABEL_24:
              v39 = v89;
LABEL_25:
              if ((v39 > 0x10 || ((1 << v39) & 0x10428) == 0)
                && !+[ATXSuggestionLayout isCompositeLayout:](ATXSuggestionLayout, "isCompositeLayout:"))
              {
LABEL_35:
                v17 = v91;
                goto LABEL_36;
              }
            }
            else
            {
              objc_msgSend(v23, "executableSpecification");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "executableType");

              v39 = v89;
              if (v45 == 4)
                goto LABEL_25;
            }
            v17 = v91;
            if (-[ATXUniversalSuggestionDeduplicatorProtocol suggestionIsDuplicate:existingSuggestions:](self->_deduplicator, "suggestionIsDuplicate:existingSuggestions:", v23, v88))
            {
              __atxlog_handle_blending();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v101 = v23;
                _os_log_debug_impl(&dword_1AA841000, v40, OS_LOG_TYPE_DEBUG, "Ignore duplicate prediction while building layout. Suggestion: %@", buf, 0xCu);
              }

            }
            else
            {
              objc_msgSend(v91, "objectForKeyedSubscript:", v32);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "addObject:", v23);

              objc_msgSend(v88, "addObject:", v23);
              v85 &= v84;
              objc_msgSend(v23, "scoreSpecification");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "suggestedConfidenceCategory") > 2;

              v86 |= v43;
            }
LABEL_36:
            v8 = 0x1E0CB3000;

            if (v29 == ++v31)
            {
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v92, v104, 16);
              if (!v29)
              {
LABEL_38:

                v6 = 0x1E57CD000;
                v20 = v78;
                v19 = v79;
                v21 = !v81;
                v24 = v82;
                v22 = v83;
                goto LABEL_39;
              }
              continue;
            }
            goto LABEL_18;
          }
        }
        v25 = objc_msgSend(*(id *)(v6 + 2320), "isCompositeLayout:", v89);
        if ((v84 | v21) == 1 && (v25 & 1) != 0)
          goto LABEL_15;
LABEL_39:
        objc_autoreleasePoolPop(v24);
        ++v22;
      }
      while (v22 != v19);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v96, v105, 16);
      if (!v19)
        goto LABEL_46;
    }
  }
  v85 = 1;
  v86 = 0;
LABEL_46:

  for (i = 1; i != 8; ++i)
  {
    objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInteger:", i);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v8;
    v54 = objc_msgSend(v52, "count");
    objc_msgSend(*(id *)(v53 + 2024), "numberWithUnsignedInteger:", i);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "objectForKeyedSubscript:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "unsignedIntegerValue");

    if (v54 > v57)
      goto LABEL_54;
    objc_msgSend(*(id *)(v53 + 2024), "numberWithUnsignedInteger:", i);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "count");
    objc_msgSend(*(id *)(v53 + 2024), "numberWithUnsignedInteger:", i);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "objectForKeyedSubscript:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "unsignedIntegerValue");

    if (v60 < v63)
    {
LABEL_54:
      v48 = 0;
      v49 = v88;
      goto LABEL_55;
    }
    v8 = 0x1E0CB3000;
  }
  v64 = objc_alloc(*(Class *)(v6 + 2320));
  objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E57EC320);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E57EC338);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E57EC350);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E57EC368);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E57EC380);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E57EC398);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E57EC3B0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v64, "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", v89, v65, v66, v67, v68, v69, v70, v71);

  objc_msgSend(v48, "setIsValidForSuggestionsWidget:", v85 & 1);
  objc_msgSend(v48, "setConfidenceWarrantsSnappingOrNPlusOne:", v86 & 1);
  v49 = v88;
  -[ATXLayoutGenerator uuidOfHighestConfidenceSuggestionFromRankedSuggestions:uiLayoutType:](self, "uuidOfHighestConfidenceSuggestionFromRankedSuggestions:uiLayoutType:", v88, v89);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setUuidOfHighestConfidenceSuggestion:", v72);

  -[ATXLayoutGenerator scoreLayout:](self, "scoreLayout:", v48);
  __atxlog_handle_blending();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    +[ATXSuggestionLayout stringFromUILayoutType:](ATXSuggestionLayout, "stringFromUILayoutType:", v89);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "layoutScore");
    *(_DWORD *)buf = 138412546;
    v101 = v73;
    v102 = 2048;
    v103 = v74;
    _os_log_impl(&dword_1AA841000, v46, OS_LOG_TYPE_DEFAULT, "Blending: Created UI layout %@ (score: %.2f)", buf, 0x16u);

  }
  v17 = v91;
LABEL_53:

LABEL_55:
  return v48;
}

- (id)uuidOfHighestConfidenceSuggestionFromRankedSuggestions:(id)a3 uiLayoutType:(int64_t)a4
{
  id v6;
  ATXSuggestionReranker *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (a4)
    {
      objc_msgSend(v6, "firstObject");
      v7 = (ATXSuggestionReranker *)objc_claimAutoreleasedReturnValue();
      -[ATXSuggestionReranker uuid](v7, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = -[ATXSuggestionReranker initWithProactiveSuggestions:hyperParameters:]([ATXSuggestionReranker alloc], "initWithProactiveSuggestions:hyperParameters:", v6, self->_hyperParameters);
      -[ATXSuggestionReranker rerankedSuggestions](v7, "rerankedSuggestions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXLayoutGenerator uuidOfHighestConfidenceSuggestionFromRankedSuggestions:uiLayoutType:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    v8 = (void *)objc_opt_new();
  }

  return v8;
}

- (void)scoreLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  unint64_t v55;

  v4 = a3;
  -[NSArray firstObject](self->_rankedSuggestions, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[ATXSuggestionLayout minSuggestionLayoutTypesForUILayoutType:](ATXSuggestionLayout, "minSuggestionLayoutTypesForUILayoutType:", objc_msgSend(v4, "layoutType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC320);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if (v8)
    {
      v9 = 0;
      v10 = 0.0;
      do
      {
        objc_msgSend(v4, "oneByOneSuggestions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[ATXLayoutGenerator marginalScoreForSuggestion:topRankingSuggestion:](self, "marginalScoreForSuggestion:topRankingSuggestion:", v12, v5);
        v10 = v10 + v13;

        ++v9;
        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC320);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

      }
      while (v9 < v15);
    }
    else
    {
      v10 = 0.0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC338);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntegerValue");

    if (v25)
    {
      v26 = 0;
      do
      {
        objc_msgSend(v4, "oneByTwoSuggestions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        -[ATXLayoutGenerator marginalScoreForSuggestion:topRankingSuggestion:](self, "marginalScoreForSuggestion:topRankingSuggestion:", v28, v5);
        v10 = v10 + v29;

        ++v26;
        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC338);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "unsignedIntegerValue");

      }
      while (v26 < v31);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC350);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "unsignedIntegerValue");

    if (v33)
    {
      v34 = 0;
      do
      {
        objc_msgSend(v4, "twoByTwoSuggestions");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndexedSubscript:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        -[ATXLayoutGenerator marginalScoreForSuggestion:topRankingSuggestion:](self, "marginalScoreForSuggestion:topRankingSuggestion:", v36, v5);
        v10 = v10 + v37;

        ++v34;
        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC350);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "unsignedIntegerValue");

      }
      while (v34 < v39);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC368);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "unsignedIntegerValue");

    if (v41)
    {
      v42 = 0;
      do
      {
        objc_msgSend(v4, "oneByFourSuggestions");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectAtIndexedSubscript:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        -[ATXLayoutGenerator marginalScoreForSuggestion:topRankingSuggestion:](self, "marginalScoreForSuggestion:topRankingSuggestion:", v44, v5);
        v10 = v10 + v45;

        ++v42;
        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC368);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "unsignedIntegerValue");

      }
      while (v42 < v47);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC380);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "unsignedIntegerValue");

    if (v49)
    {
      v50 = 0;
      do
      {
        objc_msgSend(v4, "twoByFourSuggestions");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        -[ATXLayoutGenerator marginalScoreForSuggestion:topRankingSuggestion:](self, "marginalScoreForSuggestion:topRankingSuggestion:", v52, v5);
        v10 = v10 + v53;

        ++v50;
        objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E57EC380);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "unsignedIntegerValue");

      }
      while (v50 < v55);
    }
    objc_msgSend(v4, "setLayoutScore:", v10);

  }
  else
  {
    __atxlog_handle_blending();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[ATXLayoutGenerator scoreLayout:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  }
}

- (double)marginalScoreForSuggestion:(id)a3 topRankingSuggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "scoreSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXLayoutGenerator weightForConfidenceCategory:](self, "weightForConfidenceCategory:", objc_msgSend(v8, "suggestedConfidenceCategory"));
  v10 = v9 + 0.0;

  LODWORD(self) = objc_msgSend(v7, "isEqual:", v6);
  result = v10 + 1000.0;
  if (!(_DWORD)self)
    return v10;
  return result;
}

- (double)weightForConfidenceCategory:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 100.0;
  else
    return dbl_1AA8B1718[a3];
}

+ (id)sortLayouts:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a3;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("self.layoutScore"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deduplicator, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_layoutsToConsider, 0);
  objc_storeStrong((id *)&self->_rankedSuggestions, 0);
}

- (void)uuidOfHighestConfidenceSuggestionFromRankedSuggestions:(uint64_t)a3 uiLayoutType:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "uuidOfHighestConfidenceSuggestionFromRankedSuggestions received empty rankedSuggestions", a5, a6, a7, a8, 0);
}

- (void)scoreLayout:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA841000, a1, a3, "Tried to score the generated layout, but Layout Selector was unable to find the top ranked valid suggestion.", a5, a6, a7, a8, 0);
}

@end
