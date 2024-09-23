@implementation _PSKNNModel

- (id)rankedPhoneCallAutocompleteSuggestionsWithPredictionContext:(id)a3 candidates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  unint64_t v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  _PSKNNModel *v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  unint64_t v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _QWORD v71[4];

  v71[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v8, "count") == 1)
    {
      v9 = v8;
    }
    else
    {
      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "rankedPhoneCallAutocompleteSuggestionsWithPredictionContext", " enableTelemetry=YES ", buf, 2u);
      }

      +[_PSLogging knnChannel](_PSLogging, "knnChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v64 = (unint64_t)v8;
        _os_log_impl(&dword_1A07F4000, v11, OS_LOG_TYPE_DEFAULT, "Autocomplete candidates for PhoneCalls: %{private}@", buf, 0xCu);
      }

      -[_PSKNNModel candidatePropertyFromCandidates:](self, "candidatePropertyFromCandidates:", v8);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = self;
      if (objc_msgSend(v12, "count"))
      {
        +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSKNNModel interactionStore](v53, "interactionStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:", v12, 0, &unk_1E442C7C0, &unk_1E442C7D8, v14, v15, 500);
        v16 = objc_claimAutoreleasedReturnValue();

        self = v53;
        v17 = (void *)v16;
      }
      else
      {
        v17 = 0;
      }
      v48 = v12;
      objc_msgSend(v6, "bundleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v6;
      v47 = v17;
      -[_PSKNNModel rankedSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:](self, "rankedSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:", v6, v18, objc_msgSend(v8, "count"), 0, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      +[_PSLogging knnChannel](_PSLogging, "knnChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v64 = (unint64_t)v19;
        _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_INFO, "Suggestions from rankedSuggestionsWithPredictionContext: %{private}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v8;
      v21 = (void *)objc_msgSend(v8, "mutableCopy");
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      obj = v19;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v60 != v24)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            objc_msgSend(v26, "recipients");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "count") == 1)
            {
              objc_msgSend(v26, "recipients");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "firstObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "handle");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = -[_PSKNNModel suggestionExists:withValue:inArray:](v53, "suggestionExists:withValue:inArray:", CFSTR("handle"), v30, v21);

              if (v31 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v26, "recipients");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectAtIndexedSubscript:", v31);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setRecipients:", v32);

                objc_msgSend(v21, "objectAtIndexedSubscript:", v31);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setResultSourceType:", 16);

                objc_msgSend(v21, "objectAtIndexedSubscript:", v31);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "addObject:", v35);

                objc_msgSend(v21, "removeObjectAtIndex:", v31);
              }
            }
            else
            {

            }
          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
        }
        while (v23);
      }

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v36 = v21;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      v9 = v52;
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v56 != v39)
              objc_enumerationMutation(v36);
            objc_msgSend(v52, "addObject:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
        }
        while (v38);
      }

      v41 = objc_msgSend(v52, "count");
      +[_PSLogging knnChannel](_PSLogging, "knnChannel");
      v42 = objc_claimAutoreleasedReturnValue();
      v8 = v50;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        if (v41 >= 0xA)
          v41 = 10;
        objc_msgSend(v52, "subarrayWithRange:", 0, v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v50, "count");
        *(_DWORD *)buf = 134218498;
        v64 = v41;
        v65 = 2112;
        v66 = v43;
        v67 = 2048;
        v68 = v44;
        _os_log_impl(&dword_1A07F4000, v42, OS_LOG_TYPE_INFO, "Autocomplete Top %lu results: %@ for candidates %lu", buf, 0x20u);

      }
      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v45 = objc_claimAutoreleasedReturnValue();
      v6 = v51;
      if (os_signpost_enabled(v45))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "rankedPhoneCallAutocompleteSuggestionsWithPredictionContext", (const char *)&unk_1A0908603, buf, 2u);
      }

    }
  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)rankedLabelsFromInteractionsForPhoneCallsWithInteractions:(id)a3 andDistances:(id)a4
{
  id v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  double v26;
  double v27;
  unint64_t v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  void *v45;
  id obj;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _QWORD v57[2];
  _QWORD v58[2];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v44 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays");
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v8 = 0x1E43FC000uLL;
    v9 = (double)(unint64_t)(86400 * v6);
    v43 = v5;
    do
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      if (!v10)
        goto LABEL_14;
      v11 = v10;
      v47 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v53 != v47)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v13, "bundleId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v8 + 3752), "mobilePhoneBundleId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", v15))
          {
            objc_msgSend(v13, "derivedIntentIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
              continue;
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "derivedIntentIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("conversationId"));

            objc_msgSend(v13, "bundleId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("bundleId"));

            objc_msgSend(v13, "bundleId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("sourceBundleId"));

            objc_msgSend(v13, "startDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("startDate"));

            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bundleId"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "derivedIntentIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            _PSSuggestionKey(v21, v22);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v45, "objectForKeyedSubscript:", v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("score"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v24, "doubleValue");
            v27 = v26;
            objc_msgSend(v44, "objectAtIndexedSubscript:", v7);
            v28 = v7;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "doubleValue");
            objc_msgSend(v25, "numberWithDouble:", v27 + v9 / v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v57[0] = CFSTR("score");
            v57[1] = CFSTR("key");
            v58[0] = v31;
            v58[1] = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = 0x1E43FC000;
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v32, v15);

            v7 = v28;
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v11);
LABEL_14:

      ++v7;
      v5 = v43;
    }
    while (objc_msgSend(v43, "count") > v7);
  }
  objc_msgSend(v45, "keysSortedByValueUsingComparator:", &__block_literal_global_6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v35 = v33;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(v45, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("key"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v41);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v37);
  }

  return v34;
}

- (int64_t)suggestionExists:(id)a3 withValue:(id)a4 inArray:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  int64_t v11;
  _QWORD v13[4];
  id v14;

  if (!a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = a5;
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K ==[c] %@"), a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80___PSKNNModel_PhoneAutocompleteSuggestions__suggestionExists_withValue_inArray___block_invoke;
  v13[3] = &unk_1E43FF920;
  v14 = v9;
  v10 = v9;
  v11 = objc_msgSend(v8, "indexOfObjectPassingTest:", v13);

  return v11;
}

- (id)candidatePropertyFromCandidates:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "chatGuid", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "chatHandles");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v12, "chatHandles");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v3;
          }
          else
          {
            v15 = v10;
          }
          objc_msgSend(v12, "chatGuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v17);

          if (v14)
        }
        else
        {
          objc_msgSend(v12, "handle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
            continue;
          objc_msgSend(v12, "handle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v14);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (_PSKNNModel)initWithK:(unint64_t)a3 interactionStore:(id)a4 filterByBundleIds:(id)a5 knowledgeStore:(id)a6 contactResolver:(id)a7 messageInteractionCache:(id)a8 shareInteractionCache:(id)a9
{
  id v16;
  id v17;
  _PSKNNModel *v18;
  _PSKNNModel *v19;
  void *v20;
  objc_class *v21;
  CNContactStore *v22;
  CNContactStore *contactStore;
  void *v24;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v16 = a8;
  v17 = a9;
  v18 = -[_PSKNNModel init](self, "init");
  v19 = v18;
  if (v18)
  {
    v18->_k = a3;
    objc_storeStrong((id *)&v18->_interactionStore, a4);
    objc_storeStrong((id *)&v19->_filterBundleIds, a5);
    objc_storeStrong((id *)&v19->_knowledgeStore, a6);
    objc_storeStrong((id *)&v19->_contactResolver, a7);
    objc_storeStrong((id *)&v19->_messageInteractionCache, a8);
    objc_storeStrong((id *)&v19->_shareInteractionCache, a9);
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v20 = (void *)getCNContactStoreClass_softClass_4;
    v34 = getCNContactStoreClass_softClass_4;
    if (!getCNContactStoreClass_softClass_4)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __getCNContactStoreClass_block_invoke_4;
      v30[3] = &unk_1E43FEA00;
      v30[4] = &v31;
      __getCNContactStoreClass_block_invoke_4((uint64_t)v30);
      v20 = (void *)v32[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v31, 8);
    v22 = (CNContactStore *)objc_alloc_init(v21);
    contactStore = v19->_contactStore;
    v19->_contactStore = v22;

    +[_PSConfig defaultConfig](_PSConfig, "defaultConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel updateModelProperties:](v19, "updateModelProperties:", v24);

  }
  return v19;
}

- (void)updateModelProperties:(id)a3
{
  id v4;
  objc_class *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
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
  double v34;
  void *v35;
  void *v36;
  double v37;
  _QWORD v38[3];
  _QWORD v39[4];

  v39[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnTopKShares"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel set_PSKnnTopKShares:](self, "set_PSKnnTopKShares:", objc_msgSend(v8, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnMessagesZkwTopNFilter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel set_PSKnnMessagesZkwTopNFilter:](self, "set_PSKnnMessagesZkwTopNFilter:", objc_msgSend(v9, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelRecencyMarginToPromoteShares"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel set_PSKnnModelRecencyMarginToPromoteShares:](self, "set_PSKnnModelRecencyMarginToPromoteShares:", objc_msgSend(v10, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel set_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId:](self, "set_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId:", objc_msgSend(v11, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelRecencyMarginToRetainShares"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel set_PSKnnModelRecencyMarginToRetainShares:](self, "set_PSKnnModelRecencyMarginToRetainShares:", objc_msgSend(v12, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnTopKGroupActivities"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = &unk_1E442B078;
  -[_PSKNNModel set_PSKnnTopKGroupActivities:](self, "set_PSKnnTopKGroupActivities:", objc_msgSend(v13, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelRecencyMarginToRetainGroupActivities"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v15 = &unk_1E442B090;
  -[_PSKNNModel set_PSKnnModelRecencyMarginToRetainGroupActivities:](self, "set_PSKnnModelRecencyMarginToRetainGroupActivities:", objc_msgSend(v15, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = &unk_1E442B0A8;
  -[_PSKNNModel set_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer:](self, "set_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer:", objc_msgSend(v17, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelShareSheetMinimumOccurenceRegularizer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    v19 = &unk_1E442B0C0;
  -[_PSKNNModel set_PSKnnModelShareSheetMinimumOccurenceRegularizer:](self, "set_PSKnnModelShareSheetMinimumOccurenceRegularizer:", objc_msgSend(v19, "integerValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelShareSheetSuggestionPressedMinimumOccurenceRegularizer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_PSKNNModel _PSKnnModelShareSheetMinimumOccurenceRegularizer](self, "_PSKnnModelShareSheetMinimumOccurenceRegularizer"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  -[_PSKNNModel set_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer:](self, "set_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer:", objc_msgSend(v24, "integerValue"));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelSharePlayMinimumOccurenceRegularizer"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = &unk_1E442B0A8;
  -[_PSKNNModel set_PSKnnModelSharePlayMinimumOccurenceRegularizer:](self, "set_PSKnnModelSharePlayMinimumOccurenceRegularizer:", objc_msgSend(v25, "integerValue"));

  v38[0] = &unk_1E442B0D8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_PSKNNModel _PSKnnModelShareSheetMinimumOccurenceRegularizer](self, "_PSKnnModelShareSheetMinimumOccurenceRegularizer"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v27;
  v38[1] = &unk_1E442B0F0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_PSKNNModel _PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer](self, "_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v28;
  v38[2] = &unk_1E442B108;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_PSKNNModel _PSKnnModelSharePlayMinimumOccurenceRegularizer](self, "_PSKnnModelSharePlayMinimumOccurenceRegularizer"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel set_PSKnnModelMinimumOccurenceOfInteractionByMechanism:](self, "set_PSKnnModelMinimumOccurenceOfInteractionByMechanism:", v30);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSInteractionModelInUse"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel set_PSInteractionModelInUse:](self, "set_PSInteractionModelInUse:", objc_msgSend(v31, "BOOLValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelSameBundleIdPenalty"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (!v32)
    v32 = &unk_1E442D018;
  objc_msgSend(v32, "doubleValue");
  -[_PSKNNModel set_PSKnnModelSameBundleIdPenalty:](self, "set_PSKnnModelSameBundleIdPenalty:", (unint64_t)v34);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSKnnModelDifferentPeoplePenalty"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (!v35)
    v35 = &unk_1E442D018;
  objc_msgSend(v35, "doubleValue");
  -[_PSKNNModel set_PSKnnModelDifferentPeoplePenalty:](self, "set_PSKnnModelDifferentPeoplePenalty:", (unint64_t)v37);

}

- (id)rankedSiriMLCRHandles:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id obj;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "bundleIds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "bundleIds");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(v7, "suggestionDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v48 = v7;
    if (objc_msgSend(v7, "domain") == 2)
    {
      v13 = &unk_1E442CBC8;
    }
    else if (objc_msgSend(v7, "domain") == 1)
    {
      v13 = &unk_1E442CBE0;
    }
    else
    {
      v13 = 0;
    }
    +[_PSContactResolver normalizedHandlesDictionaryFromHandles:](_PSContactResolver, "normalizedHandlesDictionaryFromHandles:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99E60];
    v53 = v14;
    objc_msgSend(v14, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    v50 = v18;
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel interactionStore](self, "interactionStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v9;
    +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:", v19, 0, 0, v13, v9, v20, 5000, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v21;
    -[_PSKNNModel featuresFromInteractionsSplitRecipients:](self, "featuresFromInteractionsSplitRecipients:", v21);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v12;
    -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](self, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v22;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v59 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("key"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("score"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("conversationId"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {

          }
          else if (objc_msgSend(v50, "containsObject:", v31))
          {
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, v31);
          }

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v25);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v49 = v6;
    v51 = v6;
    v33 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    v34 = v53;
    if (v33)
    {
      v35 = v33;
      v36 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v55 != v36)
            objc_enumerationMutation(v51);
          v38 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
          objc_msgSend(v34, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            objc_msgSend(v34, "objectForKeyedSubscript:", v38);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v42, v38);

            v34 = v53;
          }
          else
          {
            objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E442B1F8, v38);
          }

        }
        v35 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v35);
    }

    v7 = v48;
    v6 = v49;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

- (id)rankedHandlesFromCandidateHandles:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  _PSKNNModel *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id obj;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:");
    v5 = objc_claimAutoreleasedReturnValue();
    v43 = v4;
    +[_PSContactResolver normalizedHandlesDictionaryFromHandles:](_PSContactResolver, "normalizedHandlesDictionaryFromHandles:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v47 = v6;
    objc_msgSend(v6, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v44 = v10;
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel interactionStore](self, "interactionStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:", v11, 0, 0, 0, 0, v12, 5000, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v13;
    -[_PSKNNModel featuresFromInteractionsSplitRecipients:](self, "featuresFromInteractionsSplitRecipients:", v13);
    v40 = self;
    v41 = (void *)v5;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](self, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v14;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("key"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("score"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("conversationId"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {

          }
          else if (objc_msgSend(v44, "containsObject:", v23))
          {
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v23);
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v17);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v45 = v43;
    v26 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    v27 = v47;
    if (v26)
    {
      v28 = v26;
      v29 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v49 != v29)
            objc_enumerationMutation(v45);
          v31 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(v27, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            objc_msgSend(v27, "objectForKeyedSubscript:", v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, v31);

            v27 = v47;
          }
          else
          {
            objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E442B1F8, v31);
          }

        }
        v28 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v28);
    }

    -[_PSKNNModel normalizedScoresForInputDictionary:](v40, "normalizedScoresForInputDictionary:", v25);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v43;
  }
  else
  {
    v36 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v36;
}

- (id)rankedAutocompleteSuggestionsWithPredictionContext:(id)a3 candidates:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[8];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "Autocomplete request received", buf, 2u);
  }

  objc_msgSend(v5, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileMessagesComposeBundleId](_PSConstants, "mobileMessagesComposeBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v13;
  +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v14;
  +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v8, "isEqualToString:", v17);

  if ((_DWORD)v13)
  {
    +[_PSLogging knnChannel](_PSLogging, "knnChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "Autocomplete Suggestions for InCallService", buf, 2u);
    }

    -[_PSKNNModel rankedPhoneCallAutocompleteSuggestionsWithPredictionContext:candidates:](self, "rankedPhoneCallAutocompleteSuggestionsWithPredictionContext:candidates:", v5, v6);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v23 = (void *)v19;
    goto LABEL_17;
  }
  v20 = objc_msgSend(v16, "containsObject:", v8);
  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_INFO, "Autocomplete Suggestions for Messages", buf, 2u);
    }

    -[_PSKNNModel rankedMessagesAutocompleteSuggestionsWithPredictionContext:bundleId:candidates:](self, "rankedMessagesAutocompleteSuggestionsWithPredictionContext:bundleId:candidates:", v5, v8, v6);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v22)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_INFO, "Autocomplete Suggestions for Non-Messages", buf, 2u);
  }

  -[_PSKNNModel rankedNonMessagesAutocompleteSuggestionsWithPredictionContext:bundleId:candidates:performSecondarySearch:](self, "rankedNonMessagesAutocompleteSuggestionsWithPredictionContext:bundleId:candidates:performSecondarySearch:", v5, v8, v6, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ranked"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("unranked"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v23;
}

- (id)rankedNonMessagesAutocompleteSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 candidates:(id)a5 performSecondarySearch:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  uint64_t v66;
  id obj;
  unint64_t v68;
  _PSKNNModel *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[2];
  _QWORD v75[2];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  uint64_t v79;
  _BYTE v80[128];
  _QWORD v81[3];

  v6 = a6;
  v81[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "suggestionDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v69 = self;
  -[_PSKNNModel candidatePropertyFromCandidates:](self, "candidatePropertyFromCandidates:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = v17;
  v18 = objc_msgSend(v17, "count");
  v19 = 0;
  if (v11 && v18)
  {
    objc_msgSend(v10, "accountIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel interactionStore](v69, "interactionStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:", v63, v20, &unk_1E442CBF8, 0, v21, v22, 500);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v19 = v23;
      if (!objc_msgSend(v23, "count"))
      {
        objc_msgSend(v10, "accountIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSKNNModel interactionStore](v69, "interactionStore");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:", v63, v24, &unk_1E442CC10, 0, 0, v25, 500);
        v26 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v26;
      }
    }
    else
    {
      v19 = v23;
    }
  }
  v61 = v11;
  v62 = v10;
  v58 = v19;
  -[_PSKNNModel featuresFromInteractionsSplitRecipients:](v69, "featuresFromInteractionsSplitRecipients:", v19);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)v15;
  -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](v69, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v12;
  v28 = (void *)objc_msgSend(v12, "mutableCopy");
  v64 = objc_msgSend(v27, "count");
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v27;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v29)
  {
    v30 = v29;
    v68 = 0;
    v31 = CFSTR("key");
    v32 = *(_QWORD *)v71;
    v33 = CFSTR("conversationId");
    v34 = CFSTR("handle");
    do
    {
      v35 = 0;
      v66 = v30;
      do
      {
        if (*(_QWORD *)v71 != v32)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v35), "objectForKeyedSubscript:", v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = -[_PSKNNModel suggestionExists:withValue:inArray:](v69, "suggestionExists:withValue:inArray:", v34, v37, v28);
        if (v38 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = v38;
          v40 = v34;
          v41 = v33;
          v42 = v31;
          v43 = v28;
          objc_msgSend(v28, "objectAtIndexedSubscript:", v38);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setResultSourceType:", 16);

          if (v64 >= 3
            && v68 <= 2
            && (objc_msgSend(v28, "objectAtIndexedSubscript:", v39),
                v45 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v45, "contactIdentifier"),
                v46 = (void *)objc_claimAutoreleasedReturnValue(),
                v46,
                v45,
                v46))
          {
            objc_msgSend(v43, "objectAtIndexedSubscript:", v39);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "insertObject:atIndex:", v47, v68);

            ++v68;
            v28 = v43;
          }
          else
          {
            v28 = v43;
            objc_msgSend(v43, "objectAtIndexedSubscript:", v39);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "addObject:", v48);

          }
          objc_msgSend(v28, "removeObjectAtIndex:", v39);
          v31 = v42;
          v33 = v41;
          v34 = v40;
          v30 = v66;
        }

        ++v35;
      }
      while (v30 != v35);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    }
    while (v30);
  }

  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v50 = objc_msgSend(v65, "count");
    if (v50 >= 5)
      v51 = 5;
    else
      v51 = v50;
    objc_msgSend(v65, "subarrayWithRange:", 0, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v60, "count");
    *(_DWORD *)buf = 138412546;
    v77 = v52;
    v78 = 2048;
    v79 = v53;
    _os_log_impl(&dword_1A07F4000, v49, OS_LOG_TYPE_INFO, "Autocomplete Top 5 results: %@ for candidates %lu", buf, 0x16u);

  }
  v74[0] = CFSTR("ranked");
  v74[1] = CFSTR("unranked");
  v75[0] = v65;
  v54 = (void *)objc_msgSend(v28, "copy");
  v75[1] = v54;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (id)rankedMessagesAutocompleteSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 candidates:(id)a5
{
  id v8;
  id v9;
  __objc2_class **v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
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
  unint64_t v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  _PSRecipient *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _PSRecipient *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  NSObject *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  char v106;
  NSObject *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t k;
  void *v117;
  NSObject *v118;
  void *v119;
  unint64_t v120;
  NSObject *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  void *v125;
  void *v126;
  unint64_t v127;
  NSObject *v128;
  void *v129;
  uint64_t v130;
  NSObject *v131;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  _PSKNNModel *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD v158[4];
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  uint8_t buf[4];
  unint64_t v173;
  __int16 v174;
  unint64_t v175;
  __int16 v176;
  uint64_t v177;
  _BYTE v178[128];
  _BYTE v179[128];
  _PSRecipient *v180;
  _BYTE v181[128];
  _BYTE v182[128];
  _QWORD v183[5];

  v183[2] = *MEMORY[0x1E0C80C00];
  v141 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v140 = v9;
    if (objc_msgSend(v9, "count"))
    {
      v10 = off_1E43FD000;
      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "rankedMessagesAutocompleteSuggestionsWithPredictionContext", " enableTelemetry=YES ", buf, 2u);
      }

      +[_PSLogging knnChannel](_PSLogging, "knnChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v173 = (unint64_t)v140;
        _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_DEFAULT, "Autocomplete candidates: %{private}@", buf, 0xCu);
      }

      -[_PSKNNModel candidatePropertyFromCandidates:](self, "candidatePropertyFromCandidates:", v140);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v141;
      objc_msgSend(v141, "seedRecipients");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = v13;
      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(v141, "accountIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
        v16 = v8;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v183[0] = v17;
        +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v183[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v183, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSKNNModel interactionStore](self, "interactionStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:", v13, v15, &unk_1E442CC28, 0, v19, v20, 500);
        v21 = objc_claimAutoreleasedReturnValue();

        v10 = off_1E43FD000;
        v8 = v16;

        v22 = (void *)v21;
        v14 = v141;
      }
      else
      {
        v22 = 0;
      }
      v137 = v8;
      v133 = v22;
      -[_PSKNNModel rankedSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:](self, "rankedSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:", v14, v8, 2000, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[__objc2_class knnChannel](v10[8], "knnChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        v173 = (unint64_t)v24;
        _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_INFO, "Suggestions from rankedSuggestionsWithPredictionContext: %{private}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v140, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = 0u;
      v169 = 0u;
      v170 = 0u;
      v171 = 0u;
      v28 = v24;
      v144 = v28;
      v145 = self;
      v153 = v26;
      v148 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v168, v182, 16);
      if (v148)
      {
        v29 = *(_QWORD *)v169;
        v146 = *(_QWORD *)v169;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v169 != v29)
              objc_enumerationMutation(v28);
            v31 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v30);
            objc_msgSend(v31, "conversationIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = -[_PSKNNModel suggestionExists:withValue:inArray:](self, "suggestionExists:withValue:inArray:", CFSTR("chatGuid"), v32, v27);

            objc_msgSend(v31, "recipients");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            v149 = v30;
            if (v33 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v27, "objectAtIndexedSubscript:", v33);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setRecipients:", v35);

              objc_msgSend(v27, "objectAtIndexedSubscript:", v33);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "setResultSourceType:", 16);

              objc_msgSend(v27, "objectAtIndexedSubscript:", v33);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v53);

              objc_msgSend(v27, "removeObjectAtIndex:", v33);
              goto LABEL_44;
            }
            if (objc_msgSend(v34, "count") == 1)
            {
              objc_msgSend(v31, "recipients");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "firstObject");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "handle");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[_PSKNNModel suggestionExists:withValue:inArray:](self, "suggestionExists:withValue:inArray:", CFSTR("handle"), v38, v27);

              v29 = v146;
              v26 = v153;

              if (v39 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v31, "recipients");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectAtIndexedSubscript:", v39);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "setRecipients:", v40);

                objc_msgSend(v27, "objectAtIndexedSubscript:", v39);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setResultSourceType:", 16);

                objc_msgSend(v27, "objectAtIndexedSubscript:", v39);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v153, "addObject:", v43);

                objc_msgSend(v27, "removeObjectAtIndex:", v39);
                objc_msgSend(v31, "recipients");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "firstObject");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "handle");
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v153, "count") - 1);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "recipients");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "firstObject");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "handle");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v151, "setObject:forKeyedSubscript:", v47, v50);

                }
                goto LABEL_44;
              }
            }
            else
            {

            }
            objc_msgSend(v31, "recipients");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "count");

            if (v55 >= 2)
            {
              objc_msgSend(v31, "recipients");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v56, "count"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v164 = 0u;
              v165 = 0u;
              v166 = 0u;
              v167 = 0u;
              v58 = v56;
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v164, v181, 16);
              if (v59)
              {
                v60 = v59;
                v61 = *(_QWORD *)v165;
                do
                {
                  for (i = 0; i != v60; ++i)
                  {
                    if (*(_QWORD *)v165 != v61)
                      objc_enumerationMutation(v58);
                    v63 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
                    objc_msgSend(v63, "handle");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v64)
                    {
                      objc_msgSend(v63, "handle");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "addObject:", v65);

                    }
                  }
                  v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v164, v181, 16);
                }
                while (v60);
              }

              -[_PSKNNModel indexesOfObjectsWithKey:withValues:inArray:](self, "indexesOfObjectsWithKey:withValues:inArray:", CFSTR("handle"), v57, v27);
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v152, "firstIndex");
              if (v66 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v67 = v66;
                do
                {
                  v68 = [_PSRecipient alloc];
                  objc_msgSend(v27, "objectAtIndexedSubscript:", v67);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "contactIdentifier");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "objectAtIndexedSubscript:", v67);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "handle");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = -[_PSRecipient initWithIdentifier:handle:contact:](v68, "initWithIdentifier:handle:contact:", v70, v72, 0);

                  if (v73)
                  {
                    v180 = v73;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v180, 1);
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "objectAtIndexedSubscript:", v67);
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "setRecipients:", v74);

                  }
                  objc_msgSend(v27, "objectAtIndexedSubscript:", v67);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "setResultSourceType:", 16);

                  objc_msgSend(v27, "objectAtIndexedSubscript:", v67);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "addObject:", v77);

                  objc_msgSend(v27, "objectAtIndexedSubscript:", v67);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v78, "handle");
                  v79 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v79)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v153, "count") - 1);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "objectAtIndexedSubscript:", v67);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "handle");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v151, "setObject:forKeyedSubscript:", v80, v82);

                  }
                  v67 = objc_msgSend(v152, "indexGreaterThanIndex:", v67);

                }
                while (v67 != 0x7FFFFFFFFFFFFFFFLL);
              }
              objc_msgSend(v27, "removeObjectsAtIndexes:", v152);

              v28 = v144;
              self = v145;
              v26 = v153;
              v29 = v146;
            }
LABEL_44:
            v30 = v149 + 1;
          }
          while (v149 + 1 != v148);
          v148 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v168, v182, 16);
        }
        while (v148);
      }

      v162 = 0u;
      v163 = 0u;
      v160 = 0u;
      v161 = 0u;
      v83 = v27;
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v160, v179, 16);
      if (v84)
      {
        v85 = v84;
        v86 = *(_QWORD *)v161;
        do
        {
          for (j = 0; j != v85; ++j)
          {
            if (*(_QWORD *)v161 != v86)
              objc_enumerationMutation(v83);
            v88 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * j);
            objc_msgSend(v26, "addObject:", v88);
            objc_msgSend(v88, "handle");
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            if (v89)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "count") - 1);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "handle");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v151, "setObject:forKeyedSubscript:", v90, v91);

            }
          }
          v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v160, v179, 16);
        }
        while (v85);
      }

      v92 = (void *)objc_opt_new();
      if (objc_msgSend(v26, "count"))
      {
        v93 = 0;
        v138 = v92;
        v139 = v83;
        do
        {
          v150 = v93;
          +[_PSLogging knnChannel](_PSLogging, "knnChannel");
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v173 = (unint64_t)v26;
            _os_log_debug_impl(&dword_1A07F4000, v94, OS_LOG_TYPE_DEBUG, "filteredSuggestions - start: %@", buf, 0xCu);
          }

          objc_msgSend(v26, "objectAtIndexedSubscript:", v150);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "recipients");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "valueForKey:", CFSTR("handle"));
          v97 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "objectAtIndexedSubscript:", v150);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "chatHandles");
          v99 = objc_claimAutoreleasedReturnValue();

          v100 = (void *)objc_opt_new();
          v147 = (void *)v97;
          v101 = v97;
          v102 = (void *)v99;
          objc_msgSend(v100, "addObjectsFromArray:", v101);
          objc_msgSend(v100, "addObjectsFromArray:", v99);
          v143 = v100;
          objc_msgSend(v100, "allObjects");
          v103 = (id)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v103, "count") >= 2)
          {
            objc_msgSend(v26, "objectAtIndexedSubscript:", v150);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "chatGuid");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = objc_msgSend(v92, "containsObject:", v105);

            if ((v106 & 1) == 0)
            {
              v142 = v102;
              +[_PSLogging knnChannel](_PSLogging, "knnChannel");
              v107 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v26, "objectAtIndexedSubscript:", v150);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v125, "chatGuid");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v173 = (unint64_t)v126;
                _os_log_debug_impl(&dword_1A07F4000, v107, OS_LOG_TYPE_DEBUG, "considering group: %@", buf, 0xCu);

              }
              objc_msgSend(v26, "objectAtIndexedSubscript:", v150);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "chatGuid");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "addObject:", v109);

              v158[0] = MEMORY[0x1E0C809B0];
              v158[1] = 3221225472;
              v158[2] = __94___PSKNNModel_rankedMessagesAutocompleteSuggestionsWithPredictionContext_bundleId_candidates___block_invoke;
              v158[3] = &unk_1E4400FE0;
              v110 = v151;
              v159 = v110;
              objc_msgSend(v103, "sortedArrayUsingComparator:", v158);
              v111 = (void *)objc_claimAutoreleasedReturnValue();

              v156 = 0u;
              v157 = 0u;
              v154 = 0u;
              v155 = 0u;
              v103 = v111;
              v112 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
              if (v112)
              {
                v113 = v112;
                v114 = *(_QWORD *)v155;
                v115 = v150;
                do
                {
                  for (k = 0; k != v113; ++k)
                  {
                    if (*(_QWORD *)v155 != v114)
                      objc_enumerationMutation(v103);
                    v117 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * k);
                    +[_PSLogging knnChannel](_PSLogging, "knnChannel");
                    v118 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v173 = (unint64_t)v117;
                      _os_log_debug_impl(&dword_1A07F4000, v118, OS_LOG_TYPE_DEBUG, "considering recipient: %@", buf, 0xCu);
                    }

                    objc_msgSend(v110, "objectForKeyedSubscript:", v117);
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    v120 = objc_msgSend(v119, "integerValue");

                    if (v120 > v115 && v115 <= objc_msgSend(v153, "count"))
                    {
                      +[_PSLogging knnChannel](_PSLogging, "knnChannel");
                      v121 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 134218240;
                        v173 = v120;
                        v174 = 2048;
                        v175 = v115;
                        _os_log_debug_impl(&dword_1A07F4000, v121, OS_LOG_TYPE_DEBUG, "swapping filteredSuggestions[idxOfRecipient] to item at idxOfGroup, idxOfRecipient: %tu, idxOfGroup: %tu", buf, 0x16u);
                      }

                      objc_msgSend(v153, "objectAtIndexedSubscript:", v120);
                      v122 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v153, "insertObject:atIndex:", v122, v115);

                      objc_msgSend(v153, "removeObjectAtIndex:", v120 + 1);
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v115);
                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v110, "setObject:forKeyedSubscript:", v123, v117);

                      ++v115;
                    }
                  }
                  v113 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
                }
                while (v113);
              }

              self = v145;
              v26 = v153;
              v92 = v138;
              v83 = v139;
              v102 = v142;
            }
          }
          +[_PSLogging knnChannel](_PSLogging, "knnChannel");
          v124 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v173 = (unint64_t)v26;
            _os_log_debug_impl(&dword_1A07F4000, v124, OS_LOG_TYPE_DEBUG, "filteredSuggestions - end: %@", buf, 0xCu);
          }

          v93 = v150 + 1;
        }
        while (v150 + 1 < objc_msgSend(v26, "count"));
      }
      v127 = objc_msgSend(v26, "count");
      +[_PSLogging knnChannel](_PSLogging, "knnChannel");
      v128 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        if (v127 >= 5)
          v127 = 5;
        objc_msgSend(v26, "subarrayWithRange:", 0, v127);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = objc_msgSend(v140, "count");
        *(_DWORD *)buf = 134218498;
        v173 = v127;
        v174 = 2112;
        v175 = (unint64_t)v129;
        v176 = 2048;
        v177 = v130;
        _os_log_impl(&dword_1A07F4000, v128, OS_LOG_TYPE_INFO, "Autocomplete Top %lu results: %@ for candidates %lu", buf, 0x20u);

      }
      -[_PSKNNModel filterSuggestionsFrom:byFilteringOutSeedRecipients:](self, "filterSuggestionsFrom:byFilteringOutSeedRecipients:", v26, v134);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v131 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v131))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v131, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "rankedMessagesAutocompleteSuggestionsWithPredictionContext", (const char *)&unk_1A0908603, buf, 2u);
      }

      v8 = v137;
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0C9AA60];
    }
    v9 = v140;
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

- (id)messagesGroupResultsForPredictionContext:(id)a3
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  _PSRecipient *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  _PSRecipient *v47;
  void *v48;
  void *v49;
  void *v50;
  _PSRecipient *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _PSRecipient *v56;
  _PSSuggestion *v57;
  void *v58;
  _PSSuggestion *v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  void *v64;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint8_t v92[128];
  uint8_t buf[4];
  uint64_t v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v94 = (uint64_t)v67;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "messagesGroupResultsForPredictionContext: %{private}@", buf, 0xCu);
  }

  v69 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays");
  v6 = (void *)MEMORY[0x1E0C99DE8];
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithObjects:", v7, v8, 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15940], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allLearningDisabledBundleIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v64 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsObject:", v11))
    {

    }
    else
    {
      +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v64, "containsObject:", v12);

      if (!v13)
        goto LABEL_10;
    }
    +[_PSLogging knnChannel](_PSLogging, "knnChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v94 = (uint64_t)v15;
      v95 = 2112;
      v96 = v16;
      _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_DEFAULT, "Falling back to contacts autocomplete bundle id as %@ or %@ is disabled in Siri & Search", buf, 0x16u);

    }
    +[_PSConstants contactsAutocompleteBundleId](_PSConstants, "contactsAutocompleteBundleId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObject:", v17);

  }
LABEL_10:
  v18 = 0;
  v19 = 0;
  v20 = (double)v5 * -86400.0;
  v70 = v4;
  do
  {
    objc_msgSend(v67, "searchPrefix");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel interactionStore](self, "interactionStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils groupInteractionsContainingSearchStringInDisplayName:excludingInteractionUUIDs:account:directions:bundleIds:excludedDomainIdentifiers:startDate:store:fetchLimit:offset:](_PSInteractionStoreUtils, "groupInteractionsContainingSearchStringInDisplayName:excludingInteractionUUIDs:account:directions:bundleIds:excludedDomainIdentifiers:startDate:store:fetchLimit:offset:", v21, 0, 0, &unk_1E442CC40, v66, v4, v22, v23, 500, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[_PSLogging knnChannel](_PSLogging, "knnChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 134283521;
      v94 = v26;
      _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_INFO, "Fetched %{private}tu group interactions", buf, 0xCu);
    }

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v18 = v24;
    v27 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v88;
      v72 = v19;
      v73 = v18;
      v71 = *(_QWORD *)v88;
      do
      {
        v30 = 0;
        v74 = v28;
        do
        {
          if (*(_QWORD *)v88 != v29)
            objc_enumerationMutation(v18);
          v31 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v30);
          v32 = (void *)MEMORY[0x1A1AFCA24]();
          v80 = v31;
          objc_msgSend(v31, "domainIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33 && (objc_msgSend(v4, "containsObject:", v33) & 1) == 0)
          {
            v79 = v33;
            v75 = v32;
            v76 = v30;
            objc_msgSend(v80, "groupName");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "account");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)MEMORY[0x1E0C99DE8];
            objc_msgSend(v80, "recipients");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();

            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            objc_msgSend(v80, "recipients");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v84;
              do
              {
                for (i = 0; i != v38; ++i)
                {
                  if (*(_QWORD *)v84 != v39)
                    objc_enumerationMutation(v36);
                  v41 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                  v42 = [_PSRecipient alloc];
                  v43 = objc_msgSend(v41, "personIdType");
                  if (v43 == 3)
                  {
                    objc_msgSend(v41, "personId");
                    v44 = objc_claimAutoreleasedReturnValue();
                    v82 = (void *)v44;
                  }
                  else
                  {
                    v44 = 0;
                  }
                  objc_msgSend(v41, "identifier");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "displayName");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v42, "initWithIdentifier:handle:displayName:contact:", v44, v45, v46, 0);

                  if (v43 == 3)
                  if (v47)
                    objc_msgSend(v81, "addObject:", v47);

                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
              }
              while (v38);
            }

            v48 = v80;
            if (objc_msgSend(v80, "direction"))
            {
              v4 = v70;
              v29 = v71;
              v19 = v72;
              v18 = v73;
              v28 = v74;
            }
            else
            {
              objc_msgSend(v80, "sender");
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              v29 = v71;
              v28 = v74;
              if (v49)
              {
                objc_msgSend(v80, "sender");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = [_PSRecipient alloc];
                v52 = objc_msgSend(v50, "personIdType");
                if (v52 == 3)
                {
                  objc_msgSend(v50, "personId");
                  v53 = objc_claimAutoreleasedReturnValue();
                  v68 = (void *)v53;
                }
                else
                {
                  v53 = 0;
                }
                objc_msgSend(v50, "identifier");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "displayName");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v51, "initWithIdentifier:handle:displayName:contact:", v53, v54, v55, 0);

                if (v52 == 3)
                v4 = v70;
                v19 = v72;
                v18 = v73;
                if (v56)
                  objc_msgSend(v81, "addObject:", v56);

                v48 = v80;
              }
              else
              {
                v4 = v70;
                v19 = v72;
                v18 = v73;
              }
            }
            v57 = [_PSSuggestion alloc];
            objc_msgSend(v48, "bundleId");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:](v57, "initWithBundleID:conversationIdentifier:groupName:recipients:", v58, v79, v78, v81);

            -[_PSSuggestion setMessagesGroupIdentifier:](v59, "setMessagesGroupIdentifier:", v77);
            if (v59)
              objc_msgSend(v69, "addObject:", v59);
            v33 = v79;
            objc_msgSend(v4, "addObject:", v79);

            v32 = v75;
            v30 = v76;
          }

          objc_autoreleasePoolPop(v32);
          ++v30;
        }
        while (v30 != v28);
        v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
      }
      while (v28);
    }
    v19 += 500;

  }
  while ((unint64_t)objc_msgSend(v18, "count") > 0x1F3);
  -[_PSKNNModel suggestionsByUpdatingGroupNamesFromSuggestions:](self, "suggestionsByUpdatingGroupNamesFromSuggestions:", v69);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = objc_msgSend(v60, "count");
    *(_DWORD *)buf = 134218243;
    v94 = v62;
    v95 = 2113;
    v96 = v60;
    _os_log_impl(&dword_1A07F4000, v61, OS_LOG_TYPE_DEFAULT, "Number of messages group results returned for prefix search: %tu, results: %{private}@", buf, 0x16u);
  }

  return v60;
}

- (id)suggestionsByUpdatingGroupNamesFromSuggestions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _PSKNNModel *v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions___block_invoke;
    v9[3] = &unk_1E4401008;
    v10 = v5;
    v11 = self;
    v6 = v5;
    objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (BOOL)suggestedRecipientHandles:(id)a3 differFromFetchedRecipientHandles:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_opt_new();
    v9 = (void *)objc_opt_new();
    if (objc_msgSend(v5, "count"))
    {
      v10 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v8, "addObject:", v12);
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v9, "addObject:", v14);

        ++v10;
      }
      while (v10 < objc_msgSend(v5, "count"));
    }
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToArray:", v16) ^ 1;

  }
  else
  {
    LOBYTE(v17) = 1;
  }

  return v17;
}

- (id)recipientsForChat:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  _PSRecipient *v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(v24, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v5 = 0;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "address");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v31 = (uint64_t)&v30;
        v32 = 0x2020000000;
        v10 = getIMStringIsPhoneNumberSymbolLoc_ptr;
        v33 = getIMStringIsPhoneNumberSymbolLoc_ptr;
        if (!getIMStringIsPhoneNumberSymbolLoc_ptr)
        {
          v11 = (void *)IMFoundationLibrary();
          v10 = dlsym(v11, "IMStringIsPhoneNumber");
          *(_QWORD *)(v31 + 24) = v10;
          getIMStringIsPhoneNumberSymbolLoc_ptr = v10;
        }
        _Block_object_dispose(&v30, 8);
        if (!v10)
        {
LABEL_22:
          -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
          __break(1u);
        }
        v12 = ((uint64_t (*)(id))v10)(v9);

        if (v12)
        {
          v35 = 0;
          v36 = &v35;
          v37 = 0x2050000000;
          v13 = (void *)getCNPhoneNumberClass_softClass_2;
          v38 = getCNPhoneNumberClass_softClass_2;
          if (!getCNPhoneNumberClass_softClass_2)
          {
            v30 = MEMORY[0x1E0C809B0];
            v31 = 3221225472;
            v32 = (uint64_t)__getCNPhoneNumberClass_block_invoke_2;
            v33 = &unk_1E43FEA00;
            v34 = &v35;
            __getCNPhoneNumberClass_block_invoke_2((uint64_t)&v30);
            v13 = (void *)v36[3];
          }
          v14 = objc_retainAutorelease(v13);
          _Block_object_dispose(&v35, 8);
          objc_msgSend(v14, "phoneNumberWithStringValue:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "unformattedInternationalStringValue");
          v16 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v16;
          goto LABEL_18;
        }
        v17 = v9;
        v30 = 0;
        v31 = (uint64_t)&v30;
        v32 = 0x2020000000;
        v18 = getIMStringIsEmailSymbolLoc_ptr;
        v33 = getIMStringIsEmailSymbolLoc_ptr;
        if (!getIMStringIsEmailSymbolLoc_ptr)
        {
          v19 = (void *)IMFoundationLibrary();
          v18 = dlsym(v19, "IMStringIsEmail");
          *(_QWORD *)(v31 + 24) = v18;
          getIMStringIsEmailSymbolLoc_ptr = v18;
        }
        _Block_object_dispose(&v30, 8);
        if (!v18)
          goto LABEL_22;
        v20 = ((uint64_t (*)(id))v18)(v17);

        if (v20)
        {
          v21 = v17;
          v15 = v5;
          v5 = v21;
LABEL_18:

        }
        v22 = -[_PSRecipient initWithIdentifier:handle:contact:]([_PSRecipient alloc], "initWithIdentifier:handle:contact:", 0, v5, 0);
        objc_msgSend(v4, "addObject:", v22);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)contactKeysToFetch
{
  if (contactKeysToFetch_onceToken != -1)
    dispatch_once(&contactKeysToFetch_onceToken, &__block_literal_global_28);
  return (id)contactKeysToFetch_contactKeysToFetch;
}

- (id)filterSuggestionsFrom:(id)a3 byFilteringOutSeedRecipients:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  -[_PSKNNModel indexesOfObjectsWithKey:withValues:inArray:](self, "indexesOfObjectsWithKey:withValues:inArray:", CFSTR("chatGuid"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsAtIndexes:", v8);
  -[_PSKNNModel indexesOfObjectsWithKey:withValues:inArray:](self, "indexesOfObjectsWithKey:withValues:inArray:", CFSTR("contactIdentifier"), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectsAtIndexes:", v9);
  -[_PSKNNModel indexesOfObjectsWithKey:withValues:inArray:](self, "indexesOfObjectsWithKey:withValues:inArray:", CFSTR("handle"), v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectsAtIndexes:", v10);
  return v7;
}

- (id)indexesOfObjectsWithKey:(id)a3 withValues:(id)a4 inArray:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN[c] %@"), v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58___PSKNNModel_indexesOfObjectsWithKey_withValues_inArray___block_invoke;
    v14[3] = &unk_1E4401030;
    v15 = v10;
    v11 = v10;
    objc_msgSend(v9, "indexesOfObjectsPassingTest:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)rankedZkwSuggestionsWithPredictionContext:(id)a3 modelConfiguration:(id)a4 maxSuggestions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  _PSInteractionPredictor *v23;
  void *v24;
  void *v25;
  _PSInteractionPredictor *v26;
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
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v51;
  void *v52;
  unint64_t v53;
  id v54;
  id v55;
  void *v56;
  uint8_t buf[16];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v14);

    }
    +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v15) & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "isEqualToString:", v17);

    }
    if (_os_feature_enabled_impl()
      && (objc_msgSend(v8, "seedRecipients"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "count"),
          v18,
          v19))
    {
      -[_PSKNNModel rankedCoRecipientSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:](self, "rankedCoRecipientSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:", v8, v9, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = v10;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 | v16) == 1)
      {
        if (-[_PSKNNModel _PSInteractionModelInUse](self, "_PSInteractionModelInUse"))
        {
          v21 = a5;
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, "Using interaction model instead of kNN", buf, 2u);
          }

          v23 = [_PSInteractionPredictor alloc];
          -[_PSKNNModel interactionStore](self, "interactionStore");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "suggestionDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[_PSInteractionPredictor initWithInteractionStore:atDate:withModelName:modelConfiguration:](v23, "initWithInteractionStore:atDate:withModelName:modelConfiguration:", v24, v25, CFSTR("interactionPrediction"), v9);

          objc_msgSend(v8, "suggestionDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSInteractionPredictor getModelURLfromName:](_PSInteractionPredictor, "getModelURLfromName:", CFSTR("interactionPrediction"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:](v26, "predictAtDate:usingModelAtURL:showNumSuggestions:", v27, v28, v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          a5 = v21;
          -[_PSInteractionPredictor rankedZkwSuggestionsFromPredictionArray:forBundleID:](v26, "rankedZkwSuggestionsFromPredictionArray:forBundleID:", v29, v56);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObjectsFromArray:", v30);

          v10 = v56;
        }
        else
        {
          v54 = v9;
          v51 = -[_PSKNNModel _PSKnnMessagesZkwTopNFilter](self, "_PSKnnMessagesZkwTopNFilter");
          -[_PSKNNModel messageInteractionCache](self, "messageInteractionCache");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v8;
          v53 = a5;
          -[_PSKNNModel _rankedZkwSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:interactionCache:](self, "_rankedZkwSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:interactionCache:", v8, v10, a5, 0, 0, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x1E0C99E60];
          -[_PSKNNModel interactionStore](self, "interactionStore");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v31;
          objc_msgSend(v31, "interactions");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSInteractionStoreUtils interactionsMostRecentForBundleId:store:resultLimit:interactions:](_PSInteractionStoreUtils, "interactionsMostRecentForBundleId:store:resultLimit:interactions:", v10, v34, v51, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setWithArray:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v39 = v32;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v59;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v59 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                objc_msgSend(v44, "conversationIdentifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v37, "containsObject:", v45);

                if (v46)
                  v47 = v38;
                else
                  v47 = v20;
                objc_msgSend(v47, "addObject:", v44);
              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
            }
            while (v41);
          }

          objc_msgSend(v20, "addObjectsFromArray:", v38);
          v9 = v54;
          v8 = v55;
          v10 = v56;
          a5 = v53;
        }
      }
    }
    v48 = objc_msgSend(v20, "count");
    if (v48 >= a5)
      v49 = a5;
    else
      v49 = v48;
    objc_msgSend(v20, "subarrayWithRange:", 0, v49);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (id)rankedCoRecipientSuggestionsWithPredictionContext:(id)a3 modelConfiguration:(id)a4 maxSuggestions:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  NSObject *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t n;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  _PSRecipient *v72;
  _PSSuggestion *v73;
  void *v74;
  void *v75;
  _PSSuggestion *v76;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  id v84;
  id obj;
  uint64_t v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
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
  _QWORD v113[4];
  id v114;
  id v115;
  uint64_t *v116;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  _PSRecipient *v131;
  _BYTE v132[128];
  _BYTE v133[128];
  void *v134;
  uint8_t buf[4];
  uint64_t v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  uint64_t v140;
  __int16 v141;
  uint64_t v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v88 = a3;
  v80 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v84 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "suggestionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v6, 0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v127 = 0;
  v128 = &v127;
  v129 = 0x2020000000;
  v130 = 0;
  v123 = 0;
  v124 = &v123;
  v125 = 0x2020000000;
  v126 = 0;
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 0;
  objc_msgSend(v88, "seedRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = MEMORY[0x1E0C809B0];
  v113[1] = 3221225472;
  v113[2] = __99___PSKNNModel_rankedCoRecipientSuggestionsWithPredictionContext_modelConfiguration_maxSuggestions___block_invoke;
  v113[3] = &unk_1E4401058;
  v116 = &v127;
  v117 = &v119;
  v118 = &v123;
  v10 = v7;
  v114 = v10;
  v82 = v8;
  v115 = v82;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v113);

  v11 = (void *)objc_opt_new();
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v151, 16);
  if (v12)
  {
    v86 = *(_QWORD *)v110;
    do
    {
      v89 = (id)v12;
      for (i = 0; i != v89; i = (char *)i + 1)
      {
        if (*(_QWORD *)v110 != v86)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        objc_msgSend(v14, "emailAddresses");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v105, v150, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v106;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v106 != v17)
                objc_enumerationMutation(v15);
              v19 = (void *)MEMORY[0x1E0D15890];
              objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * j), "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "normalizedStringFromContactString:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v21);

            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v105, v150, 16);
          }
          while (v16);
        }

        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        objc_msgSend(v14, "phoneNumbers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v101, v149, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v102;
          do
          {
            for (k = 0; k != v23; ++k)
            {
              if (*(_QWORD *)v102 != v24)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * k), "value");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)MEMORY[0x1E0D15890];
              objc_msgSend(v26, "stringValue");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "normalizedStringFromContactString:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v29);

            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v101, v149, 16);
          }
          while (v23);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v151, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObjectsFromArray:", v11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v82);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v88, "seedRecipients");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");
    v34 = v128[3];
    v35 = v124[3];
    v36 = v120[3];
    v37 = objc_msgSend(obj, "count");
    v38 = objc_msgSend(v11, "count");
    v39 = objc_msgSend(v82, "count");
    *(_DWORD *)buf = 134219520;
    v136 = v33;
    v137 = 2048;
    v138 = v34;
    v139 = 2048;
    v140 = v35;
    v141 = 2048;
    v142 = v36;
    v143 = 2048;
    v144 = v37;
    v145 = 2048;
    v146 = v38;
    v147 = 2048;
    v148 = v39;
    _os_log_impl(&dword_1A07F4000, v31, OS_LOG_TYPE_DEFAULT, "Knn - co-recipient algorithm has %tu recipients (%tu email, %tu phone, %tu unknown) --> %tu contacts (%tu handles), %tu unmatched", buf, 0x48u);

  }
  objc_msgSend(v88, "accountIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "bundleID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel interactionStore](self, "interactionStore");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:", v79, v40, &unk_1E442CC58, 0, v42, v43, 2000);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = (void *)objc_opt_new();
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v46 = v87;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v97, v133, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v98;
      do
      {
        for (m = 0; m != v47; ++m)
        {
          if (*(_QWORD *)v98 != v48)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * m), "bundleId");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v50);

        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v97, v133, 16);
      }
      while (v47);
    }

    objc_msgSend(v45, "allObjects");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_alloc(MEMORY[0x1E0C99D80]);
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = __99___PSKNNModel_rankedCoRecipientSuggestionsWithPredictionContext_modelConfiguration_maxSuggestions___block_invoke_229;
    v95[3] = &unk_1E4401080;
    v53 = v45;
    v96 = v53;
    objc_msgSend(v51, "_pas_mappedArrayWithTransform:", v95);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v52, "initWithObjects:forKeys:", v54, v51);

    *(_DWORD *)buf = 138477827;
    v136 = (uint64_t)v55;
    _os_log_impl(&dword_1A07F4000, v44, OS_LOG_TYPE_DEFAULT, "Knn - co-recipient alogrithm considering interactions from bundle IDs: %{private}@", buf, 0xCu);

  }
  -[_PSKNNModel featuresFromInteractionsSplitRecipients:](self, "featuresFromInteractionsSplitRecipients:", v87);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "suggestionDate");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "firstObject");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "startDate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "timeIntervalSinceDate:", v58);
  v60 = v59;

  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = CFSTR("NO");
    if (v60 > 21600.0)
      v62 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v136 = (uint64_t)v62;
    _os_log_impl(&dword_1A07F4000, v61, OS_LOG_TYPE_DEFAULT, "Knn - co-recipient frequency-only? %{public}@", buf, 0xCu);
  }

  -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](self, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:", v78, v81, 2, v60 > 21600.0, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v90 = v63;
  v65 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v91, v132, 16);
  if (v65)
  {
    v66 = *(_QWORD *)v92;
    do
    {
      for (n = 0; n != v65; ++n)
      {
        if (*(_QWORD *)v92 != v66)
          objc_enumerationMutation(v90);
        objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * n), "objectForKeyedSubscript:", CFSTR("key"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("conversationId"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (v69)
        {
          if ((objc_msgSend(v64, "containsObject:", v69) & 1) == 0)
          {
            objc_msgSend(v88, "seedRecipients");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "containsObject:", v69);

            if ((v71 & 1) == 0)
            {
              v72 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:]([_PSRecipient alloc], "initWithIdentifier:handle:displayName:contact:", v69, v69, 0, 0);
              v73 = [_PSSuggestion alloc];
              objc_msgSend(v88, "bundleID");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v131 = v72;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:](v73, "initWithBundleID:conversationIdentifier:groupName:recipients:", v74, v69, 0, v75);

              if (v76)
                objc_msgSend(v84, "addObject:", v76);
              objc_msgSend(v64, "addObject:", v69);

            }
          }
        }

      }
      v65 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v91, v132, 16);
    }
    while (v65);
  }

  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
  _Block_object_dispose(&v127, 8);

  return v84;
}

- (id)rankedSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 maxSuggestions:(unint64_t)a5 frequencyOnly:(BOOL)a6 interactions:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v7 = a6;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  -[_PSKNNModel messageInteractionCache](self, "messageInteractionCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel _rankedZkwSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:interactionCache:](self, "_rankedZkwSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:interactionCache:", v14, v13, a5, v7, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_rankedZkwSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 maxSuggestions:(unint64_t)a5 frequencyOnly:(BOOL)a6 interactions:(id)a7 interactionCache:(id)a8
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t j;
  void *v52;
  void *v53;
  _PSRecipient *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _PSRecipient *v59;
  _PSSuggestion *v60;
  void *v61;
  _PSSuggestion *v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  id obj;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v10 = a6;
  v104 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  objc_msgSend(v13, "suggestionDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v17, 0);
  v18 = objc_claimAutoreleasedReturnValue();

  v19 = v15;
  if (!v15)
  {
    objc_msgSend(v16, "interactions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleId == %@"), v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filteredArrayUsingPredicate:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v72 = v16;
  v73 = v14;
  -[_PSKNNModel featuresFromInteractions:](self, "featuresFromInteractions:", v19);
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqualToString:", v24);

  if (v25)
    v26 = 5;
  else
    v26 = 0;
  v69 = (void *)v22;
  v70 = (void *)v18;
  -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](self, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:", v22, v18, v26, v10, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v27;
  v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
  if (v82)
  {
    v29 = *(_QWORD *)v98;
    v80 = *(_QWORD *)v98;
    v74 = v15;
    v75 = v13;
    v76 = v19;
    v77 = v28;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v98 != v29)
        {
          v31 = v30;
          objc_enumerationMutation(obj);
          v30 = v31;
        }
        v83 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v30);
        v84 = v30;
        objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("conversationId"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "containsObject:", v32) & 1) == 0)
        {
          v86 = v32;
          if (v15)
          {
            v95 = 0u;
            v96 = 0u;
            v93 = 0u;
            v94 = 0u;
            v85 = v19;
            v33 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v94;
              while (2)
              {
                for (i = 0; i != v34; ++i)
                {
                  if (*(_QWORD *)v94 != v35)
                    objc_enumerationMutation(v85);
                  v37 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
                  objc_msgSend(v37, "domainIdentifier");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "bundleID");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v39, "isEqualToString:", v40);

                  if (v41)
                  {
                    objc_msgSend(v37, "derivedIntentIdentifier");
                    v42 = objc_claimAutoreleasedReturnValue();

                    v38 = (void *)v42;
                  }
                  if (objc_msgSend(v38, "isEqualToString:", v86))
                  {
                    v79 = v38;
                    objc_msgSend(v37, "groupName");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = (void *)MEMORY[0x1E0C99DE8];
                    objc_msgSend(v37, "recipients");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "arrayWithCapacity:", objc_msgSend(v46, "count"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue();

                    v91 = 0u;
                    v92 = 0u;
                    v89 = 0u;
                    v90 = 0u;
                    objc_msgSend(v37, "recipients");
                    v87 = (id)objc_claimAutoreleasedReturnValue();
                    v47 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
                    if (v47)
                    {
                      v48 = v47;
                      v49 = *(_QWORD *)v90;
                      v50 = v44;
                      do
                      {
                        for (j = 0; j != v48; ++j)
                        {
                          v52 = v43;
                          if (*(_QWORD *)v90 != v49)
                            objc_enumerationMutation(v87);
                          v53 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
                          v54 = [_PSRecipient alloc];
                          v55 = objc_msgSend(v53, "personIdType");
                          if (v55 == 3)
                          {
                            objc_msgSend(v53, "personId");
                            v56 = objc_claimAutoreleasedReturnValue();
                            v88 = (void *)v56;
                          }
                          else
                          {
                            v56 = 0;
                          }
                          objc_msgSend(v53, "identifier");
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v53, "displayName");
                          v58 = (void *)objc_claimAutoreleasedReturnValue();
                          v59 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v54, "initWithIdentifier:handle:displayName:contact:", v56, v57, v58, 0);

                          if (v55 == 3)
                          v43 = v52;
                          v44 = v50;
                          if (v59)
                            objc_msgSend(v50, "addObject:", v59);

                        }
                        v48 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
                      }
                      while (v48);
                    }

                    v15 = v74;
                    v13 = v75;
                    goto LABEL_39;
                  }

                }
                v34 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
                if (v34)
                  continue;
                break;
              }
              v43 = 0;
              v44 = 0;
LABEL_39:
              v19 = v76;
            }
            else
            {
              v43 = 0;
              v44 = 0;
            }

            v28 = v77;
          }
          else
          {
            v43 = 0;
            v44 = 0;
          }
          v60 = [_PSSuggestion alloc];
          objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("bundleId"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:](v60, "initWithBundleID:conversationIdentifier:groupName:recipients:", v61, v86, v43, v44);

          if (v62)
            objc_msgSend(v78, "addObject:", v62);
          v29 = v80;
          v32 = v86;
          if (v86)
            objc_msgSend(v28, "addObject:", v86);

        }
        v30 = v84 + 1;
      }
      while (v84 + 1 != v82);
      v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
    }
    while (v82);
  }

  v63 = objc_msgSend(v78, "count");
  if (v63 >= a5)
    v64 = a5;
  else
    v64 = v63;
  objc_msgSend(v78, "subarrayWithRange:", 0, v64);
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = v28;
  v67 = (void *)v65;

  return v67;
}

- (id)rankedNameSuggestionsWithPredictionContext:(id)a3 forName:(id)a4
{
  return -[_PSKNNModel rankedNameSuggestionsWithPredictionContext:forName:contactsOnly:](self, "rankedNameSuggestionsWithPredictionContext:forName:contactsOnly:", a3, a4, 1);
}

- (id)rankedNameSuggestionsWithPredictionContext:(id)a3 forName:(id)a4 contactsOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  char v52;
  void *v53;
  uint64_t n;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ii;
  void *v65;
  char v66;
  void *v67;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id obj;
  void *v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v91;
  _BOOL4 v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
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
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v5 = a5;
  v124 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "length"))
  {
    v92 = v5;
    v78 = v9;
    v71 = v7;
    -[_PSKNNModel messageInteractionCache](self, "messageInteractionCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    obj = v11;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v115;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v115 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
          objc_msgSend(v17, "recipients");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("displayName CONTAINS[cd] %@"), v78);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "filteredArrayUsingPredicate:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v20, "count"))
            objc_msgSend(v12, "addObject:", v17);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
      }
      while (v14);
    }

    v21 = v12;
    v22 = (uint64_t)v21;
    if (!objc_msgSend(v21, "count"))
    {
      -[_PSKNNModel interactionStore](self, "interactionStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSInteractionStoreUtils interactionsContainingSearchStringInDisplayName:account:directions:bundleIds:store:fetchLimit:](_PSInteractionStoreUtils, "interactionsContainingSearchStringInDisplayName:account:directions:bundleIds:store:fetchLimit:", v78, 0, &unk_1E442CC70, 0, v23, 1000);
      v22 = objc_claimAutoreleasedReturnValue();

    }
    v69 = (void *)v22;
    v70 = v21;
    -[_PSKNNModel rankedGlobalSuggestionsWithPredictionContext:maxSuggestions:contactsOnly:interactions:contactIdIsInStoreBlock:](self, "rankedGlobalSuggestionsWithPredictionContext:maxSuggestions:contactsOnly:interactions:contactIdIsInStoreBlock:", v71, 2000, v92, v22, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)objc_msgSend(v24, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v93 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel normalizedStringFromString:](self, "normalizedStringFromString:", v78);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "componentsSeparatedByString:", CFSTR(" "));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v73 = v24;
    v27 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
    if (v27)
    {
      v28 = v27;
      v87 = *(_QWORD *)v111;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v111 != v87)
            objc_enumerationMutation(v73);
          v30 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
          v31 = (void *)MEMORY[0x1A1AFCA24]();
          objc_msgSend(v30, "recipients");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "displayName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            -[_PSKNNModel normalizedStringFromString:](self, "normalizedStringFromString:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v35, "isEqualToString:", v26))
            {
              objc_msgSend(v30, "conversationIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v25, "containsObject:", v36);

              if ((v37 & 1) == 0)
              {
                objc_msgSend(v93, "addObject:", v30);
                objc_msgSend(v30, "conversationIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "addObject:", v38);

                objc_msgSend(v91, "removeObject:", v30);
              }
            }

          }
          objc_autoreleasePoolPop(v31);
        }
        v28 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
      }
      while (v28);
    }

    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v72 = (id)objc_msgSend(v91, "mutableCopy");
    v79 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
    if (v79)
    {
      v76 = *(id *)v107;
      do
      {
        for (k = 0; k != v79; ++k)
        {
          if (*(id *)v107 != v76)
            objc_enumerationMutation(v72);
          v40 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * k);
          v41 = (void *)MEMORY[0x1A1AFCA24]();
          objc_msgSend(v40, "recipients");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "firstObject");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "displayName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            v85 = v41;
            v88 = k;
            v83 = v44;
            -[_PSKNNModel normalizedStringFromString:](self, "normalizedStringFromString:", v44);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "componentsSeparatedByString:", CFSTR(" "));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = 0u;
            v103 = 0u;
            v104 = 0u;
            v105 = 0u;
            v46 = v75;
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
            if (v47)
            {
              v48 = v47;
              v49 = *(_QWORD *)v103;
              do
              {
                for (m = 0; m != v48; ++m)
                {
                  if (*(_QWORD *)v103 != v49)
                    objc_enumerationMutation(v46);
                  if (objc_msgSend(v45, "containsObject:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * m)))
                  {
                    objc_msgSend(v40, "conversationIdentifier");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = objc_msgSend(v25, "containsObject:", v51);

                    if ((v52 & 1) == 0)
                    {
                      objc_msgSend(v93, "addObject:", v40);
                      objc_msgSend(v40, "conversationIdentifier");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "addObject:", v53);

                      objc_msgSend(v91, "removeObject:", v40);
                    }
                  }
                }
                v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
              }
              while (v48);
            }

            v41 = v85;
            k = v88;
            v44 = v83;
          }

          objc_autoreleasePoolPop(v41);
        }
        v79 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
      }
      while (v79);
    }

    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v77 = (id)objc_msgSend(v91, "mutableCopy");
    v82 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
    if (v82)
    {
      v80 = *(_QWORD *)v99;
      do
      {
        for (n = 0; n != v82; ++n)
        {
          if (*(_QWORD *)v99 != v80)
            objc_enumerationMutation(v77);
          v55 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * n);
          v56 = (void *)MEMORY[0x1A1AFCA24]();
          objc_msgSend(v55, "recipients");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "firstObject");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "displayName");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v59)
          {
            v86 = v59;
            v89 = v56;
            -[_PSKNNModel normalizedStringFromString:](self, "normalizedStringFromString:", v59);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "componentsSeparatedByString:", CFSTR(" "));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = 0u;
            v95 = 0u;
            v96 = 0u;
            v97 = 0u;
            v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
            if (v61)
            {
              v62 = v61;
              v63 = *(_QWORD *)v95;
              do
              {
                for (ii = 0; ii != v62; ++ii)
                {
                  if (*(_QWORD *)v95 != v63)
                    objc_enumerationMutation(v60);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * ii), "hasPrefix:", v26))
                  {
                    objc_msgSend(v55, "conversationIdentifier");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    v66 = objc_msgSend(v25, "containsObject:", v65);

                    if ((v66 & 1) == 0)
                    {
                      objc_msgSend(v93, "addObject:", v55);
                      objc_msgSend(v55, "conversationIdentifier");
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "addObject:", v67);

                      objc_msgSend(v91, "removeObject:", v55);
                    }
                  }
                }
                v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
              }
              while (v62);
            }

            v59 = v86;
            v56 = v89;
          }

          objc_autoreleasePoolPop(v56);
        }
        v82 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
      }
      while (v82);
    }

    v7 = v71;
    v9 = v78;
  }
  else
  {
    v93 = (id)MEMORY[0x1E0C9AA60];
  }

  return v93;
}

- (id)normalizedStringFromString:(id)a3
{
  return (id)_PASNormalizeUnicodeString();
}

- (id)rankedGlobalSuggestionsWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4 contactsOnly:(BOOL)a5 interactions:(id)a6 contactIdIsInStoreBlock:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  _BOOL8 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  _PSSuggestion *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  _PSSuggestion *v49;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  unsigned int (**v61)(id, void *);
  _PSKNNModel *v62;
  void *v63;
  _BOOL4 v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _QWORD v71[3];

  v9 = a5;
  v71[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v61 = (unsigned int (**)(id, void *))a7;
  objc_msgSend(v11, "suggestionDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = self;
  -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v13, 0);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "bundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v18);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_4;
    goto LABEL_3;
  }
  v59 = 0;
  if (!v12)
  {
LABEL_3:
    -[_PSKNNModel interactionStore](v62, "interactionStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dateByAddingTimeInterval:", 28800.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountIdentifier");
    v23 = v9;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1A1AFCA24]();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E442B210, &unk_1E442B1E0, 0);
    objc_autoreleasePoolPop(v25);
    LOBYTE(v54) = 0;
    +[_PSInteractionStoreUtils interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:](_PSInteractionStoreUtils, "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:", v19, v20, v22, 0, v24, v59, 0, v26, v54, 1000);
    v27 = objc_claimAutoreleasedReturnValue();

    v9 = v23;
    v12 = (id)v27;

  }
LABEL_4:
  -[_PSKNNModel featuresFromInteractionsSplitRecipients:](v62, "featuresFromInteractionsSplitRecipients:", v12);
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suggestionDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v12;
  objc_msgSend(v12, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "startDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "timeIntervalSinceDate:", v31);
  v33 = v32 > 21600.0;

  v55 = (void *)v28;
  v57 = (void *)v14;
  -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](v62, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:", v28, v14, 1, v33, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v34;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v67;
    v38 = CFSTR("conversationId");
    if (v61)
      v39 = v9;
    else
      v39 = 0;
    v64 = v39;
    do
    {
      v40 = 0;
      v41 = v63;
      do
      {
        if (*(_QWORD *)v67 != v37)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v40), "objectForKeyedSubscript:", CFSTR("key"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", v38);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v41, "containsObject:", v43) & 1) == 0 && (!v64 || v61[2](v61, v43)))
        {
          v44 = v38;
          v45 = [_PSSuggestion alloc];
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("recipients"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](v45, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", 0, v43, 0, v46, CFSTR("kNN model"), v48);

          if (v49)
            objc_msgSend(v60, "addObject:", v49);
          v41 = v63;
          objc_msgSend(v63, "addObject:", v43);

          v38 = v44;
        }

        ++v40;
      }
      while (v36 != v40);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    }
    while (v36);
  }

  v50 = objc_msgSend(v60, "count");
  if (v50 >= a4)
    v51 = a4;
  else
    v51 = v50;
  objc_msgSend(v60, "subarrayWithRange:", 0, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)rankedGlobalSuggestionsForSiriNLWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  _PSSuggestion *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  _PSSuggestion *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  _PSKNNModel *v48;
  uint64_t v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "suggestionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self;
  -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[_PSKNNModel interactionStore](v48, "interactionStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442CC88);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v5;
  objc_msgSend(v5, "accountIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442CCA0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v12;
  +[_PSInteractionStoreUtils interactionsFromStore:referenceDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:fetchLimit:](_PSInteractionStoreUtils, "interactionsFromStore:referenceDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:fetchLimit:", v13, 0, v14, v15, v12, 0, v16, 5000);
  v17 = objc_claimAutoreleasedReturnValue();

  v41 = (void *)v17;
  -[_PSKNNModel featuresFromInteractionsSplitRecipients:](v48, "featuresFromInteractionsSplitRecipients:", v17);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v7;
  -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](v48, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v18;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v20)
  {
    v21 = v20;
    v22 = CFSTR("key");
    v23 = *(_QWORD *)v52;
    v47 = *(_QWORD *)v52;
    do
    {
      v24 = 0;
      v49 = v21;
      do
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v24);
        objc_msgSend(v25, "objectForKeyedSubscript:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("conversationId"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "containsObject:", v27) & 1) == 0)
        {
          v28 = v19;
          v29 = v22;
          v30 = [_PSSuggestion alloc];
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("recipients"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("score"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:score:](v30, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:score:", 0, v27, 0, v31, CFSTR("kNN model"), v33, v34);

          if (v35)
            objc_msgSend(v46, "addObject:", v35);
          v19 = v28;
          objc_msgSend(v28, "addObject:", v27);

          v22 = v29;
          v23 = v47;
          v21 = v49;
        }

        ++v24;
      }
      while (v21 != v24);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v21);
  }

  v36 = objc_msgSend(v46, "count");
  if (v36 >= a4)
    v37 = a4;
  else
    v37 = v36;
  objc_msgSend(v46, "subarrayWithRange:", 0, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)suggestionProxiesWithPredictionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const __CFString *v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  __CFString *v62;
  objc_class *v63;
  __CFString *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  int v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  int v80;
  void *v81;
  _PSSuggestionProxy *v82;
  objc_class *v83;
  void *v84;
  _PSSuggestionProxy *v85;
  void *v86;
  uint64_t v87;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  _PSKNNModel *v105;
  id obj;
  uint64_t v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint8_t v113[128];
  uint8_t buf[4];
  void *v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PSKNNModel featureVectorFromPredictionContext:](self, "featureVectorFromPredictionContext:", v4);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel shareInteractionCache](self, "shareInteractionCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel _PSKnnModelMinimumOccurenceOfInteractionByMechanism](self, "_PSKnnModelMinimumOccurenceOfInteractionByMechanism");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = self;
  -[_PSKNNModel filterShareInteractions:minimumOccurencesByMechanism:contextBundleId:filterOutNonMatchingSourceBundleIDs:](self, "filterShareInteractions:minimumOccurencesByMechanism:contextBundleId:filterOutNonMatchingSourceBundleIDs:", v6, v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v115 = v10;
    _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Knn - Number of sharesheet interactions = %@", buf, 0xCu);

  }
  -[_PSKNNModel featuresFromInteractions:](self, "featuresFromInteractions:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel neighborsFromTrainingData:k:queryPoint:](self, "neighborsFromTrainingData:k:queryPoint:", v12, -[_PSKNNModel k](self, "k"), v102);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSKNNModel extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:](self, "extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:", v11, v13, 0, 0, 0, CFSTR("Previous Share"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[_PSKNNModel suggestionProxiesWithPredictionContext:].cold.1();

  -[_PSKNNModel messageInteractionCache](self, "messageInteractionCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "interactions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v115 = v18;
    _os_log_impl(&dword_1A07F4000, v17, OS_LOG_TYPE_INFO, "Knn - Number of all interactions (sans Mail) = %@", buf, 0xCu);

  }
  -[_PSKNNModel featuresFromInteractions:](v105, "featuresFromInteractions:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "objectAtIndex:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel neighborsFromTrainingData:k:queryPoint:](v105, "neighborsFromTrainingData:k:queryPoint:", v20, -[_PSKNNModel k](v105, "k"), v102);
  v21 = objc_claimAutoreleasedReturnValue();

  v98 = (void *)v21;
  v99 = v19;
  -[_PSKNNModel extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:](v105, "extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:", v19, v21, 0, 0, 0, CFSTR("Message Interaction"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel splitShareLabels:suggestionDate:contextBundleId:](v105, "splitShareLabels:suggestionDate:contextBundleId:", v101, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("prioritizedShareLabels"));
  v26 = objc_claimAutoreleasedReturnValue();
  v96 = v25;
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("otherShareLabels"));
  v27 = objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel sliceStart:end:ofArray:](v105, "sliceStart:end:ofArray:", 0, -[_PSKNNModel _PSKnnTopKShares](v105, "_PSKnnTopKShares"), v22);
  v28 = objc_claimAutoreleasedReturnValue();
  v100 = v16;
  v97 = v22;
  if (v28)
  {
    v29 = (id)v28;
    -[_PSKNNModel sliceStart:end:ofArray:](v105, "sliceStart:end:ofArray:", -[_PSKNNModel _PSKnnTopKShares](v105, "_PSKnnTopKShares"), objc_msgSend(v22, "count"), v22);
    v30 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = v22;
    v30 = 0;
  }
  v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v95 = (void *)v26;
  v93 = v29;
  -[_PSKNNModel mergedSuggestionsFromShares:andInteractions:](v105, "mergedSuggestionsFromShares:andInteractions:", v26, v29);
  v31 = objc_claimAutoreleasedReturnValue();
  v94 = (void *)v27;
  v92 = (void *)v30;
  -[_PSKNNModel mergedSuggestionsFromShares:andInteractions:](v105, "mergedSuggestionsFromShares:andInteractions:", v27, v30);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)v31;
  -[_PSKNNModel mergedSuggestionsFromShares:andInteractions:](v105, "mergedSuggestionsFromShares:andInteractions:", v31);
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
  if (v108)
  {
    v107 = *(_QWORD *)v110;
    v103 = v4;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v110 != v107)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v32);
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("bundleId"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "suggestionDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("startDate"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "timeIntervalSinceDate:", v36);
        v38 = (int)(v37 / 86400.0);

        objc_msgSend(v4, "bundleID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("sourceBundleId"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "isEqualToString:", v40);

        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("sourceBundleId"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("bundleId"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "isEqualToString:", v43);

        v45 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("reason"));
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v46;
        if (v44)
        {
          v48 = objc_msgSend(v45, "initWithFormat:", CFSTR("%@\n%@\nSent %d days ago"), CFSTR("kNN Model"), v46, v38, v89);
        }
        else
        {
          v49 = CFSTR("From a different bundle ID");
          if (v41)
            v49 = CFSTR("From the same bundle ID");
          v48 = objc_msgSend(v45, "initWithFormat:", CFSTR("%@\n%@\nSent %d days ago\n%@"), CFSTR("kNN Model"), v46, v38, v49);
        }
        v50 = (void *)v48;

        objc_msgSend(v4, "peopleInPhotoIdentifiers");
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = 0x1E43FC000;
        if (v51)
        {
          v53 = (void *)v51;
          objc_msgSend(v4, "peopleInPhotoIdentifiers");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "count");

          if (v55)
          {
            v56 = (void *)MEMORY[0x1E0C99E20];
            objc_msgSend(v4, "peopleInPhotoIdentifiers");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setWithArray:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("peopleInPhoto"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "intersectSet:", v59);
            objc_msgSend(v58, "allObjects");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "count");
            v62 = CFSTR("these people");
            if (v61 == 1)
              v62 = CFSTR("this person");
            v63 = (objc_class *)MEMORY[0x1E0CB3940];
            v64 = v62;
            v65 = [v63 alloc];
            objc_msgSend(v60, "sortedArrayUsingComparator:", &__block_literal_global_279_0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = (void *)objc_msgSend(v65, "initWithFormat:", CFSTR("%@\nPhotos containing %@ were sent to this conversation in previous shares\n\nDetected People:\n%@"), v50, v64, v66);

            if (objc_msgSend(v58, "count"))
            {
              v68 = v67;

              v50 = v68;
            }
            v52 = 0x1E43FC000uLL;

            v4 = v103;
          }
        }
        objc_msgSend(*(id *)(v52 + 3752), "mobileMessagesBundleId");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v34, "isEqualToString:", v69);

        if (v70)
        {
          v71 = v33;
          v72 = CFSTR("conversationId");
LABEL_29:
          objc_msgSend(v71, "objectForKeyedSubscript:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v34)
            goto LABEL_38;
          goto LABEL_36;
        }
        objc_msgSend(*(id *)(v52 + 3752), "mobileMailBundleId");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v34, "isEqualToString:", v74);

        if (v75)
        {
          v76 = (void *)MEMORY[0x1E0D158B8];
          v77 = v33;
          v78 = CFSTR("mailRecipients");
        }
        else
        {
          objc_msgSend(*(id *)(v52 + 3752), "sharePlayBundleId");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v34, "isEqualToString:", v79);

          if (!v80)
          {
            objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("derivedIntentIdentifier"));
            v86 = (void *)objc_claimAutoreleasedReturnValue();

            v73 = 0;
            if (!v86 || !v34)
              goto LABEL_38;
            v71 = v33;
            v72 = CFSTR("derivedIntentIdentifier");
            goto LABEL_29;
          }
          v76 = (void *)MEMORY[0x1E0D158B8];
          v77 = v33;
          v78 = CFSTR("expanseRecipients");
        }
        objc_msgSend(v77, "objectForKeyedSubscript:", v78);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "generateConversationIdFromInteractionRecipients:", v81);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
          goto LABEL_38;
LABEL_36:
        if (v73)
        {
          v82 = [_PSSuggestionProxy alloc];
          v83 = (objc_class *)objc_opt_class();
          NSStringFromClass(v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v82, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v34, v73, 0, v50, v84);

          objc_msgSend(v104, "addObject:", v85);
        }
LABEL_38:

        ++v32;
      }
      while (v108 != v32);
      v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
      v108 = v87;
    }
    while (v87);
  }

  return v104;
}

- (id)suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:(id)a3 withOnlyTopShares:(BOOL)a4 withFilterOutNonMatchingSourceBundleIDs:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  BOOL v47;
  _PSSuggestionProxy *v48;
  objc_class *v49;
  void *v50;
  _PSSuggestionProxy *v51;
  void *v52;
  uint64_t v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v5 = a5;
  v6 = a4;
  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "suggestionDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  -[_PSKNNModel shareInteractionCache](self, "shareInteractionCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "interactions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel _PSKnnModelMinimumOccurenceOfInteractionByMechanism](self, "_PSKnnModelMinimumOccurenceOfInteractionByMechanism");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel filterShareInteractions:minimumOccurencesByMechanism:contextBundleId:filterOutNonMatchingSourceBundleIDs:](self, "filterShareInteractions:minimumOccurencesByMechanism:contextBundleId:filterOutNonMatchingSourceBundleIDs:", v13, v14, v15, v5);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)v16;
  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v71 = v19;
    _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "Knn - Number of sharesheet interactions = %@", buf, 0xCu);

  }
  v61 = v17;
  -[_PSKNNModel featuresFromInteractions:](self, "featuresFromInteractions:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndex:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)v11;
  -[_PSKNNModel neighborsFromTrainingData:k:queryPoint:](self, "neighborsFromTrainingData:k:queryPoint:", v21, -[_PSKNNModel k](self, "k"), v11);
  v22 = objc_claimAutoreleasedReturnValue();

  v59 = (void *)v22;
  v60 = v20;
  -[_PSKNNModel extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:](self, "extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:", v20, v22, 0, 0, 0, CFSTR("Previous Share"));
  v23 = objc_claimAutoreleasedReturnValue();
  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[_PSKNNModel suggestionProxiesWithPredictionContext:].cold.1();

  objc_msgSend(v8, "suggestionDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v8;
  objc_msgSend(v8, "bundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)v23;
  -[_PSKNNModel splitShareLabels:suggestionDate:contextBundleId:](self, "splitShareLabels:suggestionDate:contextBundleId:", v23, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("prioritizedShareLabels"));
  v28 = objc_claimAutoreleasedReturnValue();
  v57 = v27;
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("otherShareLabels"));
  v29 = objc_claimAutoreleasedReturnValue();
  v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = (void *)v29;
  v56 = (void *)v28;
  if (v6)
    v30 = 0;
  else
    v30 = v29;
  -[_PSKNNModel mergedSuggestionsFromShares:andInteractions:](self, "mergedSuggestionsFromShares:andInteractions:", v28, v30);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v66;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v66 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v35);
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("bundleId"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isEqualToString:", v38);

        if (v39)
        {
          v40 = v36;
          v41 = CFSTR("conversationId");
        }
        else
        {
          +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v37, "isEqualToString:", v43);

          if (v44)
          {
            v45 = (void *)MEMORY[0x1E0D158B8];
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("mailRecipients"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "generateConversationIdFromInteractionRecipients:", v46);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_18;
          }
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("derivedIntentIdentifier"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = 0;
          if (!v52 || !v37)
            goto LABEL_23;
          v40 = v36;
          v41 = CFSTR("derivedIntentIdentifier");
        }
        objc_msgSend(v40, "objectForKeyedSubscript:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        if (v37)
          v47 = v42 == 0;
        else
          v47 = 1;
        if (!v47)
        {
          v48 = [_PSSuggestionProxy alloc];
          v49 = (objc_class *)objc_opt_class();
          NSStringFromClass(v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v48, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v37, v42, 0, CFSTR("kNN model"), v50);

          objc_msgSend(v64, "addObject:", v51);
        }
LABEL_23:

        ++v35;
      }
      while (v33 != v35);
      v53 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      v33 = v53;
    }
    while (v53);
  }

  return v64;
}

- (id)suggestionProxiesBasedOnNonSharingInteractionsWithPredictionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  BOOL v35;
  _PSSuggestionProxy *v36;
  objc_class *v37;
  void *v38;
  _PSSuggestionProxy *v39;
  void *v40;
  uint64_t v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "suggestionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v4;
  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSKNNModel messageInteractionCache](self, "messageInteractionCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interactions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v57 = v11;
    _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_INFO, "Knn - Number of all interactions (sans Mail) = %@", buf, 0xCu);

  }
  -[_PSKNNModel featuresFromInteractions:](self, "featuresFromInteractions:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel neighborsFromTrainingData:k:queryPoint:](self, "neighborsFromTrainingData:k:queryPoint:", v13, -[_PSKNNModel k](self, "k"), v7);
  v14 = objc_claimAutoreleasedReturnValue();

  v46 = (void *)v14;
  v47 = v12;
  -[_PSKNNModel extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:](self, "extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:", v12, v14, 0, 0, 0, CFSTR("Message Interaction"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel sliceStart:end:ofArray:](self, "sliceStart:end:ofArray:", 0, -[_PSKNNModel _PSKnnTopKShares](self, "_PSKnnTopKShares"), v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v48 = v9;
  v45 = v15;
  if (v16)
  {
    v17 = (id)v16;
    -[_PSKNNModel sliceStart:end:ofArray:](self, "sliceStart:end:ofArray:", -[_PSKNNModel _PSKnnTopKShares](self, "_PSKnnTopKShares"), objc_msgSend(v15, "count"), v15);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v15;
    v18 = 0;
  }
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = (void *)v18;
  v44 = v17;
  -[_PSKNNModel mergedSuggestionsFromShares:andInteractions:](self, "mergedSuggestionsFromShares:andInteractions:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v52;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v23);
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("bundleId"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqualToString:", v26);

        if (v27)
        {
          v28 = v24;
          v29 = CFSTR("conversationId");
        }
        else
        {
          +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v25, "isEqualToString:", v31);

          if (v32)
          {
            v33 = (void *)MEMORY[0x1E0D158B8];
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("mailRecipients"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "generateConversationIdFromInteractionRecipients:", v34);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("derivedIntentIdentifier"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = 0;
          if (!v40 || !v25)
            goto LABEL_21;
          v28 = v24;
          v29 = CFSTR("derivedIntentIdentifier");
        }
        objc_msgSend(v28, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        if (v25)
          v35 = v30 == 0;
        else
          v35 = 1;
        if (!v35)
        {
          v36 = [_PSSuggestionProxy alloc];
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v36, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v25, v30, 0, CFSTR("kNN model"), v38);

          objc_msgSend(v50, "addObject:", v39);
        }
LABEL_21:

        ++v23;
      }
      while (v21 != v23);
      v41 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      v21 = v41;
    }
    while (v41);
  }

  return v50;
}

- (id)messagesGroupsMatchingSearchPrefix:(id)a3 inInteractions:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = 0x1E43FC000uLL;
  +[_PSAutocompleteSearchUtilities emojiCharacterSet](_PSAutocompleteSearchUtilities, "emojiCharacterSet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "groupName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_15;
        if (!v5)
          goto LABEL_16;
        v14 = *(void **)(v7 + 3520);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "rangeForSearchTerm:inTarget:tokenizedByCharacterSet:", v5, v13, v15);

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_15;
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");

        objc_msgSend(v18, "formUnionWithCharacterSet:", v29);
        v19 = objc_msgSend(*(id *)(v7 + 3520), "rangeForSearchTerm:inTarget:tokenizedByCharacterSet:", v5, v13, v18);

        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_15;
        v20 = *(void **)(v7 + 3520);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v21);
        v22 = v7;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = objc_msgSend(v20, "searchString:containsOnlyCharactersInSet:", v23, v29);

        v7 = v22;
        if (!(_DWORD)v20 || objc_msgSend(v13, "rangeOfString:options:", v5, 385) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v12, "recipients");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("displayName BEGINSWITH[cd] %@"), v5);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "filteredArrayUsingPredicate:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v26, "count"))
            objc_msgSend(v31, "addObject:", v12);

          v7 = v22;
        }
        else
        {
LABEL_15:
          objc_msgSend(v31, "addObject:", v12);
        }
LABEL_16:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  v27 = (void *)objc_msgSend(v31, "copy");
  return v27;
}

- (id)softmaxAppliedOnScoresForInputDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t i;
  float v15;
  float v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  float v24;
  float v25;
  double v26;
  void *v27;
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
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@max.floatValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "floatValue");
        v16 = exp((float)(v15 - v7));
        v13 = v13 + v16;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v3, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "floatValue");
        v25 = exp((float)(v24 - v7));

        *(float *)&v26 = v25 / v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v19);
  }

  return v8;
}

- (id)normalizedScoresForInputDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@max.floatValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    if (v7 <= 0.0)
      v13 = 1.0;
    else
      v13 = v7;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        *(float *)&v19 = v18 / v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)interactionLabelsForQueryResult:(id)a3 queryPoint:(id)a4 rankerType:(int64_t)a5 frequencyOnly:(BOOL)a6 contactsOnly:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a7;
  v8 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel neighborsFromTrainingData:k:queryPoint:](self, "neighborsFromTrainingData:k:queryPoint:", v14, -[_PSKNNModel k](self, "k"), v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSKNNModel extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:](self, "extractNearestNeighborLabelsForQueryResult:andNeighbors:frequencyOnly:rankerType:contactsOnly:reason:", v13, v15, v8, a5, v7, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)splitShareLabels:(id)a3 suggestionDate:(id)a4 contextBundleId:(id)a5
{
  id v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  unint64_t v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v73;
  id obj;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v80 = a4;
  v78 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v8;
  v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  if (v79)
  {
    v77 = *(_QWORD *)v82;
    v9 = 0x1E43FC000uLL;
    do
    {
      for (i = 0; i != v79; ++i)
      {
        if (*(_QWORD *)v82 != v77)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1A1AFCA24]();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bundleId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sourceBundleId"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v78))
          v15 = -[_PSKNNModel _PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId](self, "_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId");
        else
          v15 = -[_PSKNNModel _PSKnnModelRecencyMarginToPromoteShares](self, "_PSKnnModelRecencyMarginToPromoteShares");
        v16 = v15;
        objc_msgSend(*(id *)(v9 + 3752), "mobileMessagesBundleId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v13, "isEqualToString:", v17);

        if (v18)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("conversationId"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startDate"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "timeIntervalSinceDate:", v20);
          v22 = v21;
          v23 = (double)v16;

          if (v22 < (double)v16)
          {
            v24 = objc_msgSend(v76, "count");
            if (v24 >= -[_PSKNNModel _PSKnnTopKShares](self, "_PSKnnTopKShares"))
              v25 = v75;
            else
              v25 = v76;
            objc_msgSend(v25, "addObject:", v11);
            goto LABEL_36;
          }
          -[_PSKNNModel messageInteractionCache](self, "messageInteractionCache");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "mostRecentInteractionForCandidateIdentifier:", v19);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "startDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "timeIntervalSinceDate:", v36);
          v38 = v37;

          if (v38 >= v23)
          {
            objc_msgSend(v35, "startDate");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "timeIntervalSinceDate:", v61);
            v63 = v62;
            v64 = (double)-[_PSKNNModel _PSKnnModelRecencyMarginToRetainShares](self, "_PSKnnModelRecencyMarginToRetainShares");

            v40 = v75;
            if (v63 < v64)
              goto LABEL_34;
          }
          else
          {
            v39 = objc_msgSend(v76, "count");
            if (v39 >= -[_PSKNNModel _PSKnnTopKShares](self, "_PSKnnTopKShares"))
              v40 = v75;
            else
              v40 = v76;
LABEL_34:
            objc_msgSend(v40, "addObject:", v11);
          }

LABEL_36:
          goto LABEL_44;
        }
        objc_msgSend(*(id *)(v9 + 3752), "mobileMailBundleId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v13, "isEqualToString:", v26);

        if (v27)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startDate"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "timeIntervalSinceDate:", v28);
          v30 = v29;

          if (v30 >= (double)v16)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startDate"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "timeIntervalSinceDate:", v57);
            v59 = v58;
            v60 = -[_PSKNNModel _PSKnnModelRecencyMarginToRetainShares](self, "_PSKnnModelRecencyMarginToRetainShares");
            goto LABEL_41;
          }
          v31 = v76;
          v32 = objc_msgSend(v76, "count");
          v33 = -[_PSKNNModel _PSKnnTopKShares](self, "_PSKnnTopKShares");
        }
        else
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("derivedIntentIdentifier"));
          v41 = objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v42 = (void *)v41;
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bundleId"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("derivedIntentIdentifier"));
              v44 = objc_claimAutoreleasedReturnValue();
              -[_PSKNNModel messageInteractionCache](self, "messageInteractionCache");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = (void *)v44;
              objc_msgSend(v45, "mostRecentInteractionForCandidateIdentifier:", v44);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v46, "startDate");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "timeIntervalSinceDate:", v47);
              v49 = v48;

              if (v49 >= (double)v16)
              {
                objc_msgSend(v46, "startDate");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "timeIntervalSinceDate:", v65);
                v67 = v66;
                v68 = (double)-[_PSKNNModel _PSKnnModelRecencyMarginToRetainShares](self, "_PSKnnModelRecencyMarginToRetainShares");

                v50 = v75;
                if (v67 < v68)
                  goto LABEL_38;
              }
              else
              {
                v50 = v76;
                v51 = objc_msgSend(v76, "count");
                if (v51 >= -[_PSKNNModel _PSKnnTopKShares](self, "_PSKnnTopKShares"))
                  goto LABEL_39;
LABEL_38:
                objc_msgSend(v50, "addObject:", v11);
              }
LABEL_39:

              goto LABEL_44;
            }
          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("expanseRecipients"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v52)
            goto LABEL_44;
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startDate"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "timeIntervalSinceDate:", v53);
          v55 = v54;

          if (v55 >= (double)v16)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("startDate"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "timeIntervalSinceDate:", v57);
            v59 = v69;
            v60 = -[_PSKNNModel _PSKnnModelRecencyMarginToRetainGroupActivities](self, "_PSKnnModelRecencyMarginToRetainGroupActivities");
LABEL_41:
            v70 = (double)v60;

            if (v59 >= v70)
              goto LABEL_44;
LABEL_42:
            v56 = v75;
            goto LABEL_43;
          }
          v31 = v76;
          v32 = objc_msgSend(v76, "count");
          v33 = -[_PSKNNModel _PSKnnTopKGroupActivities](self, "_PSKnnTopKGroupActivities");
        }
        if (v32 >= v33)
          goto LABEL_42;
        v56 = v31;
LABEL_43:
        objc_msgSend(v56, "addObject:", v11);
LABEL_44:

        objc_autoreleasePoolPop(v12);
        v9 = 0x1E43FC000;
      }
      v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    }
    while (v79);
  }

  v85[0] = CFSTR("prioritizedShareLabels");
  v85[1] = CFSTR("otherShareLabels");
  v86[0] = v76;
  v86[1] = v75;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

- (id)filterShareInteractions:(id)a3 minimumOccurencesByMechanism:(id)a4 contextBundleId:(id)a5 filterOutNonMatchingSourceBundleIDs:(BOOL)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v52;
  void *v53;
  id v54;
  _BOOL4 v55;
  id obj;
  id obja;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _QWORD v70[2];
  _QWORD v71[2];
  _BYTE v72[128];
  uint64_t v73;

  v55 = a6;
  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v60 = a4;
  v54 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v52 = v8;
  objc_msgSend(v8, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  v53 = v9;
  if (!v10)
  {
    v12 = 0;
    goto LABEL_24;
  }
  v11 = v10;
  v12 = 0;
  v58 = *(id *)v66;
  v13 = 0x1E43FC000uLL;
  do
  {
    v14 = 0;
    do
    {
      if (*(id *)v66 != v58)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v14);
      objc_msgSend(v15, "targetBundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v13 + 3752), "shareSheetTargetBundleIdMessages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (v18)
      {
        objc_msgSend(v15, "domainIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      objc_msgSend(v15, "targetBundleId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v13 + 3752), "shareSheetTargetBundleIdMail");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqualToString:", v21))
      {

LABEL_11:
        v25 = (void *)MEMORY[0x1E0D158B8];
        objc_msgSend(v15, "recipients");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "generateConversationIdFromInteractionRecipients:", v26);
        v19 = objc_claimAutoreleasedReturnValue();

LABEL_12:
        v12 = v26;
        v13 = 0x1E43FC000;
LABEL_13:

        v12 = (void *)v19;
        if (!v19)
          goto LABEL_15;
LABEL_14:
        v27 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "objectForKeyedSubscript:", v12);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("count"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v29, "integerValue") + 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v70[0] = CFSTR("interaction");
        v70[1] = CFSTR("count");
        v71[0] = v15;
        v71[1] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, v12);

        goto LABEL_15;
      }
      objc_msgSend(v15, "targetBundleId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v13 + 3752), "sharePlayBundleId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      v9 = v53;
      if (v24)
        goto LABEL_11;
      objc_msgSend(v15, "derivedIntentIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(v15, "targetBundleId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "derivedIntentIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        _PSSuggestionKey(v26, v33);
        v19 = objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      v13 = 0x1E43FC000;
      if (v12)
        goto LABEL_14;
LABEL_15:
      ++v14;
    }
    while (v11 != v14);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    v11 = v34;
  }
  while (v34);
LABEL_24:

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v59 = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v62 != v37)
          objc_enumerationMutation(v59);
        v39 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("interaction"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v40, "mechanism"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("count"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "integerValue");

        objc_msgSend(v60, "objectForKeyedSubscript:", v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "integerValue");

        if (v43 >= v45)
        {
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("interaction"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (v55)
          {
            objc_msgSend(v46, "bundleId");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "isEqualToString:", v54);

            if (v49)
            {
              objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("interaction"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obja, "addObject:", v50);

            }
          }
          else
          {
            objc_msgSend(obja, "addObject:", v46);
          }

        }
      }
      v36 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v36);
  }

  return obja;
}

- (id)targetBundleIdsForFilterBundlesIds:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  if (v6)
  {
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v7);

    +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "containsObject:", v9);

  if (v10)
  {
    +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v11);

    +[_PSConstants shareSheetTargetBundleIdMail](_PSConstants, "shareSheetTargetBundleIdMail");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_featureVectorFromSuggestionDate:(id)a3 bundleID:(id)a4 peopleInPhotoIdentifiers:(id)a5 scenesInPhotoIdentifiers:(id)a6
{
  id v9;
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  v12 = a6;
  v27 = v9;
  if (v9)
  {
    v13 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture", 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if (v10)
    v15 = v10;
  else
    v15 = &stru_1E4402490;
  v16 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v17 = v11;
  else
    v17 = (void *)MEMORY[0x1E0C9AA60];
  if (v12)
    v16 = v12;
  v18 = (void *)MEMORY[0x1E0CB37E8];
  v19 = v16;
  v20 = v17;
  v21 = v15;
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  objc_msgSend(v18, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v28[1] = v21;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v20);
  v28[2] = v23;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v19);

  v28[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)featureVectorFromPredictionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "suggestionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peopleInPhotoIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scenesInPhotoIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSKNNModel _featureVectorFromSuggestionDate:bundleID:peopleInPhotoIdentifiers:scenesInPhotoIdentifiers:](self, "_featureVectorFromSuggestionDate:bundleID:peopleInPhotoIdentifiers:scenesInPhotoIdentifiers:", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)featureVectorFromInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_301);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSKNNModel _featureVectorFromSuggestionDate:bundleID:peopleInPhotoIdentifiers:scenesInPhotoIdentifiers:](self, "_featureVectorFromSuggestionDate:bundleID:peopleInPhotoIdentifiers:scenesInPhotoIdentifiers:", v7, v8, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)featureVectorFromPredictionDate:(id)a3 bundleId:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a4)
  {
    v16 = v8;
    v17 = v7;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v16;
    v12 = 2;
  }
  else
  {
    v15 = v8;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v15;
    v12 = 1;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)featureVectorFromAbsolutePredictionTime:(double)a3 bundleId:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a4)
  {
    v16 = v8;
    v17 = v7;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v16;
    v12 = 2;
  }
  else
  {
    v15 = v8;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v15;
    v12 = 1;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)mergedSuggestionsFromShares:(id)a3 andInteractions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 && v6)
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v9, "containsObject:", v15, (_QWORD)v19) & 1) == 0)
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
  else
  {
    if (v5)
    {
      v16 = v5;
      goto LABEL_18;
    }
    if (v6)
    {
      v16 = v6;
      goto LABEL_18;
    }
    v9 = (void *)v7;
  }
  v16 = v9;
  v8 = v16;
LABEL_18:
  v17 = v16;

  return v17;
}

- (id)extractNearestNeighborLabelsForQueryResult:(id)a3 andNeighbors:(id)a4 frequencyOnly:(BOOL)a5 rankerType:(int64_t)a6 contactsOnly:(BOOL)a7 reason:(id)a8
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _PSKNNModel *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  _BOOL8 v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  _BOOL4 v39;
  _BOOL4 v40;
  id v42;
  void *v43;
  id obj;
  void *v46;
  void *v47;
  void *v48;
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
  uint64_t v59;

  v39 = a7;
  v40 = a5;
  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v42 = a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v10;
  objc_msgSend(v10, "objectAtIndex:", 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v54;
    v15 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1A1AFCA24]();
        objc_msgSend(v17, "nodeData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (!v19)
          v19 = v15;
        objc_msgSend(v19, "_pas_componentsJoinedByString:", &stru_1E4402490);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v47, "addObject:", v22);
          v23 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v17, "distance");
          objc_msgSend(v23, "numberWithDouble:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v24);

        }
        objc_autoreleasePoolPop(v18);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v13);
  }

  switch(a6)
  {
    case 1:
      v25 = self;
      v27 = v46;
      v26 = v47;
      v29 = v39;
      v28 = v40;
      goto LABEL_16;
    case 2:
      v25 = self;
      v27 = v46;
      v26 = v47;
      v28 = v40;
      v29 = 0;
LABEL_16:
      v31 = 0;
      goto LABEL_19;
    case 3:
      -[_PSKNNModel rankedLabelsFromInteractionsSiriNLWithInteractions:andDistances:freqOnly:](self, "rankedLabelsFromInteractionsSiriNLWithInteractions:andDistances:freqOnly:", v47, v46, v40);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v25 = self;
      v27 = v46;
      v26 = v47;
      v29 = v39;
      v28 = v40;
      v31 = 1;
LABEL_19:
      -[_PSKNNModel rankedLabelsFromInteractionsSingleRecipientArray:andDistances:freqOnly:contactsOnly:scoreLikeShareSheet:](v25, "rankedLabelsFromInteractionsSingleRecipientArray:andDistances:freqOnly:contactsOnly:scoreLikeShareSheet:", v26, v27, v28, v29, v31);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[_PSKNNModel rankedLabelsFromInteractionsForPhoneCallsWithInteractions:andDistances:](self, "rankedLabelsFromInteractionsForPhoneCallsWithInteractions:andDistances:", v47, v46);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[_PSKNNModel rankedLabelsFromInteractionsMaintainRecipientsArray:andDistances:freqOnly:](self, "rankedLabelsFromInteractionsMaintainRecipientsArray:andDistances:freqOnly:", v47, v46, v40);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v32 = v30;
  if (v42)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v33 = v30;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "setObject:forKeyedSubscript:", v42, CFSTR("reason"));
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v35);
    }

  }
  return v32;
}

- (id)rankedLabelsFromInteractionsMaintainRecipientsArray:(id)a3 andDistances:(id)a4 freqOnly:(BOOL)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
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
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t m;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t n;
  void *v121;
  void *v122;
  void *v124;
  void *v125;
  id v126;
  uint64_t v127;
  void *v128;
  id obj;
  _BOOL4 v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _BYTE v155[128];
  _QWORD v156[2];
  _QWORD v157[2];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v130 = a5;
  v162 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v126 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v6;
  v128 = v7;
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    v9 = 0x1E43FC000uLL;
    do
    {
      v153 = 0u;
      v154 = 0u;
      v151 = 0u;
      v152 = 0u;
      v127 = v8;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8, v124);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v132 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, v161, 16);
      if (!v132)
        goto LABEL_88;
      v131 = *(_QWORD *)v152;
      do
      {
        for (i = 0; i != v132; ++i)
        {
          if (*(_QWORD *)v152 != v131)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "mechanism") == 13 || objc_msgSend(v11, "mechanism") == 20;
          objc_msgSend(v11, "bundleId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v9 + 3752), "mobileMessagesBundleId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);
          if ((v16 & 1) != 0
            || (objc_msgSend(v11, "bundleId"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(*(id *)(v9 + 3752), "macMessagesBundleId"),
                v133 = (void *)objc_claimAutoreleasedReturnValue(),
                v134 = v17,
                objc_msgSend(v17, "isEqualToString:")))
          {
            objc_msgSend(v11, "domainIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18 != 0;

            if ((v16 & 1) != 0)
            {

              if (v18)
                goto LABEL_15;
              goto LABEL_18;
            }
          }
          else
          {
            v19 = 0;
          }

          if (v19)
          {
LABEL_15:
            objc_msgSend(v11, "domainIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("conversationId"));

            objc_msgSend(v11, "bundleId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("bundleId"));

            objc_msgSend(v11, "bundleId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("sourceBundleId"));

            objc_msgSend(v11, "startDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("startDate"));

            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("conversationId"));
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundleId"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_78;
          }
LABEL_18:
          v9 = 0x1E43FC000uLL;
          if (v13)
          {
            objc_msgSend(v11, "targetBundleId");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v27, "isEqualToString:", v28) & 1) != 0)
            {
              objc_msgSend(v11, "domainIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
              {
                objc_msgSend(v11, "domainIdentifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, CFSTR("conversationId"));

                +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, CFSTR("bundleId"));

                objc_msgSend(v11, "bundleId");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v32, CFSTR("sourceBundleId"));

                objc_msgSend(v11, "startDate");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, CFSTR("startDate"));

                objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("conversationId"));
                v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v34 = v12;
LABEL_57:
                objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("bundleId"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v25);
                v80 = objc_claimAutoreleasedReturnValue();
                goto LABEL_62;
              }
            }
            else
            {

            }
          }
          objc_msgSend(v11, "bundleId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v35, "isEqualToString:", v36) & 1) != 0)
          {
            objc_msgSend(v11, "recipients");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "count");

            if (v38)
            {
              objc_msgSend(v11, "recipients");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v39, CFSTR("mailRecipients"));

              objc_msgSend(v11, "bundleId");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v40, CFSTR("bundleId"));

              objc_msgSend(v11, "bundleId");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v41, CFSTR("sourceBundleId"));

              objc_msgSend(v11, "startDate");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v42, CFSTR("startDate"));

              v149 = 0u;
              v150 = 0u;
              v147 = 0u;
              v148 = 0u;
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mailRecipients"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v147, v160, 16);
              if (v44)
              {
                v45 = v44;
                v46 = *(_QWORD *)v148;
                v24 = &stru_1E4402490;
                do
                {
                  for (j = 0; j != v45; ++j)
                  {
                    if (*(_QWORD *)v148 != v46)
                      objc_enumerationMutation(v43);
                    v48 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * j);
                    objc_msgSend(v48, "identifier");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v49)
                    {
                      objc_msgSend(v48, "identifier");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v50);
                      v51 = objc_claimAutoreleasedReturnValue();

                      v24 = (__CFString *)v51;
                    }
                  }
                  v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v147, v160, 16);
                }
                while (v45);
                goto LABEL_77;
              }
              goto LABEL_76;
            }
          }
          else
          {

          }
          if (v13)
          {
            objc_msgSend(v11, "targetBundleId");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            +[_PSConstants shareSheetTargetBundleIdMail](_PSConstants, "shareSheetTargetBundleIdMail");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v52, "isEqualToString:", v53) & 1) != 0)
            {
              objc_msgSend(v11, "recipients");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "count");

              if (v55)
              {
                objc_msgSend(v11, "recipients");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v56, CFSTR("mailRecipients"));

                +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v57, CFSTR("bundleId"));

                objc_msgSend(v11, "bundleId");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v58, CFSTR("sourceBundleId"));

                objc_msgSend(v11, "startDate");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v59, CFSTR("startDate"));

                v145 = 0u;
                v146 = 0u;
                v143 = 0u;
                v144 = 0u;
                objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mailRecipients"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v143, v159, 16);
                if (v60)
                {
                  v61 = v60;
                  v62 = *(_QWORD *)v144;
                  v24 = &stru_1E4402490;
                  do
                  {
                    for (k = 0; k != v61; ++k)
                    {
                      if (*(_QWORD *)v144 != v62)
                        objc_enumerationMutation(v43);
                      v64 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * k);
                      objc_msgSend(v64, "identifier");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v65)
                      {
                        objc_msgSend(v64, "identifier");
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v66);
                        v67 = objc_claimAutoreleasedReturnValue();

                        v24 = (__CFString *)v67;
                      }
                    }
                    v61 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v143, v159, 16);
                  }
                  while (v61);
                  goto LABEL_77;
                }
                goto LABEL_76;
              }
            }
            else
            {

            }
          }
          objc_msgSend(v11, "derivedIntentIdentifier");
          v68 = objc_claimAutoreleasedReturnValue();
          if (v68)
          {
            v69 = (void *)v68;
            objc_msgSend(v11, "bundleId");
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            if (v70)
            {
              objc_msgSend(v11, "derivedIntentIdentifier");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v71, CFSTR("derivedIntentIdentifier"));

              if (v13)
                objc_msgSend(v11, "targetBundleId");
              else
                objc_msgSend(v11, "bundleId");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v82, CFSTR("bundleId"));

              objc_msgSend(v11, "bundleId");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v83, CFSTR("sourceBundleId"));

              objc_msgSend(v11, "startDate");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v84, CFSTR("startDate"));

              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundleId"));
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "derivedIntentIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              _PSSuggestionKey(v24, v25);
              v80 = objc_claimAutoreleasedReturnValue();
LABEL_62:
              v26 = (void *)v80;
LABEL_79:

              v102 = objc_alloc(MEMORY[0x1E0C99E60]);
              objc_msgSend(v11, "attachments");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "_pas_mappedArrayWithTransform:", &__block_literal_global_304);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = (void *)objc_msgSend(v102, "initWithArray:", v104);
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v105, CFSTR("peopleInPhoto"));

              objc_msgSend(v7, "objectForKeyedSubscript:", v26);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("score"));
              v107 = (void *)objc_claimAutoreleasedReturnValue();

              if (v130)
              {
                v108 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v107, "doubleValue");
                v110 = v109 + 1.0;
                goto LABEL_83;
              }
              if (!v107)
              {
                v108 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v126, "objectAtIndexedSubscript:", v127);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "doubleValue");
                v110 = -v111;
LABEL_83:
                objc_msgSend(v108, "numberWithDouble:", v110);
                v112 = objc_claimAutoreleasedReturnValue();

                v107 = (void *)v112;
              }
              v156[0] = CFSTR("score");
              v156[1] = CFSTR("key");
              v157[0] = v107;
              v157[1] = v12;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, v156, 2);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v113, v26);

              goto LABEL_85;
            }
          }
          objc_msgSend(v11, "domainIdentifier");
          v72 = objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            v73 = (void *)v72;
            objc_msgSend(v11, "bundleId");
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            if (v74)
            {
              objc_msgSend(v11, "recipients");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v75, CFSTR("expanseRecipients"));

              objc_msgSend(v11, "domainIdentifier");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v76, CFSTR("domainIdentifier"));

              objc_msgSend(v11, "bundleId");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v77, CFSTR("bundleId"));

              objc_msgSend(v11, "bundleId");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v78, CFSTR("sourceBundleId"));

              objc_msgSend(v11, "startDate");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v79, CFSTR("startDate"));

              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("domainIdentifier"));
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v34 = v12;
              goto LABEL_57;
            }
          }
          objc_msgSend(v11, "domainIdentifier");
          v81 = objc_claimAutoreleasedReturnValue();
          if (!v81)
          {
            objc_msgSend(v11, "bundleId");
            v85 = objc_claimAutoreleasedReturnValue();
            if (!v85)
              goto LABEL_86;
            v26 = (void *)v85;
            objc_msgSend(v11, "targetBundleId");
            v86 = objc_claimAutoreleasedReturnValue();
            if (!v86)
              goto LABEL_85;
            v87 = (void *)v86;
            objc_msgSend(v11, "recipients");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = objc_msgSend(v88, "count");

            if (!v89)
              goto LABEL_86;
            objc_msgSend(v11, "recipients");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v90, CFSTR("expanseRecipients"));

            objc_msgSend(v11, "targetBundleId");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v91, CFSTR("bundleId"));

            objc_msgSend(v11, "bundleId");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v92, CFSTR("sourceBundleId"));

            objc_msgSend(v11, "startDate");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v93, CFSTR("startDate"));

            v141 = 0u;
            v142 = 0u;
            v139 = 0u;
            v140 = 0u;
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("expanseRecipients"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v139, v158, 16);
            if (v94)
            {
              v95 = v94;
              v96 = *(_QWORD *)v140;
              v24 = &stru_1E4402490;
              do
              {
                for (m = 0; m != v95; ++m)
                {
                  if (*(_QWORD *)v140 != v96)
                    objc_enumerationMutation(v43);
                  v98 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * m);
                  objc_msgSend(v98, "identifier");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v99)
                  {
                    objc_msgSend(v98, "identifier");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v100);
                    v101 = objc_claimAutoreleasedReturnValue();

                    v24 = (__CFString *)v101;
                  }
                }
                v95 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v139, v158, 16);
              }
              while (v95);
LABEL_77:

              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundleId"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = v128;
LABEL_78:
              v9 = 0x1E43FC000;
              goto LABEL_79;
            }
LABEL_76:
            v24 = &stru_1E4402490;
            goto LABEL_77;
          }
          v26 = (void *)v81;
LABEL_85:

LABEL_86:
        }
        v132 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, v161, 16);
      }
      while (v132);
LABEL_88:

      v8 = v127 + 1;
      v6 = v124;
    }
    while (objc_msgSend(v124, "count") > (unint64_t)(v127 + 1));
  }
  objc_msgSend(v7, "keysSortedByValueUsingComparator:", &__block_literal_global_305, v124);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v116 = v114;
  v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v135, v155, 16);
  if (v117)
  {
    v118 = v117;
    v119 = *(_QWORD *)v136;
    do
    {
      for (n = 0; n != v118; ++n)
      {
        if (*(_QWORD *)v136 != v119)
          objc_enumerationMutation(v116);
        objc_msgSend(v128, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * n));
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("key"));
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "addObject:", v122);

      }
      v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v135, v155, 16);
    }
    while (v118);
  }

  return v115;
}

- (id)rankedLabelsFromInteractionsSingleRecipientArray:(id)a3 andDistances:(id)a4 freqOnly:(BOOL)a5 contactsOnly:(BOOL)a6 scoreLikeShareSheet:(BOOL)a7
{
  _BOOL4 v7;
  id v9;
  int64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
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
  void **v26;
  const __CFString **v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _PSRecipient *v33;
  _PSRecipient **v34;
  void *v35;
  _PSRecipient *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  _BOOL4 v72;
  _BOOL4 v73;
  void *v74;
  id obj;
  _BOOL4 v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _QWORD v90[2];
  _QWORD v91[2];
  _PSRecipient *v92;
  _PSRecipient *v93;
  const __CFString *v94;
  void *v95;
  _QWORD v96[2];
  _QWORD v97[2];
  _BYTE v98[128];
  uint64_t v99;

  v72 = a7;
  v73 = a5;
  v7 = a6;
  v99 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v70 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays");
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    v12 = (double)(86400 * v10);
    v76 = v7;
    v68 = v9;
    do
    {
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v71 = v11;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11, v68);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
      if (!v79)
        goto LABEL_51;
      v78 = *(_QWORD *)v86;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v86 != v78)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v13);
          objc_msgSend(v14, "recipients");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 || (objc_msgSend(v14, "sender"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (!v7
              || (objc_msgSend(v16, "identifier"),
                  v17 = (void *)objc_claimAutoreleasedReturnValue(),
                  v17,
                  !v17))
            {
              v24 = 0;
              v22 = 0;
              v21 = 0;
              goto LABEL_21;
            }
            objc_msgSend(v16, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19 || objc_msgSend(v16, "personIdType") != 3)
            {

            }
            else
            {
              objc_msgSend(v16, "personId");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                objc_msgSend(v16, "personId");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "displayName");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "sender");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21 && v22)
                {
                  v96[0] = CFSTR("conversationId");
                  v96[1] = CFSTR("displayName");
                  v97[0] = v21;
                  v97[1] = v22;
                  v25 = (void *)MEMORY[0x1E0C99D80];
                  v26 = (void **)v97;
                  v27 = (const __CFString **)v96;
                  v28 = 2;
                  goto LABEL_46;
                }
                if (v21)
                {
                  v94 = CFSTR("conversationId");
                  v95 = v21;
                  v25 = (void *)MEMORY[0x1E0C99D80];
                  v26 = &v95;
                  v27 = &v94;
                  v28 = 1;
LABEL_46:
                  objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, v28);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "identifier");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "setObject:forKeyedSubscript:", v55, v56);

                  if (v24)
                  {
                    objc_msgSend(v69, "objectForKeyedSubscript:", v21);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v57)
                      objc_msgSend(v69, "setObject:forKeyedSubscript:", v24, v21);
                  }
                }
LABEL_21:
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v31;
                if (!v7)
                {
                  v80 = v22;
                  objc_msgSend(v16, "identifier");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("conversationId"));

                  v36 = [_PSRecipient alloc];
                  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("conversationId"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "identifier");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "displayName");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v36, "initWithIdentifier:handle:displayName:contact:", v37, v38, v39, 0);

                  v92 = v33;
                  v34 = &v92;
                  goto LABEL_27;
                }
                if (v21)
                {
                  objc_msgSend(v31, "setObject:forKeyedSubscript:", v21, CFSTR("conversationId"));
                  if (!v24)
                  {
                    objc_msgSend(v69, "objectForKeyedSubscript:", v21);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v80 = v22;
                  v33 = -[_PSRecipient initWithIdentifier:senderHandle:handle:displayName:contact:]([_PSRecipient alloc], "initWithIdentifier:senderHandle:handle:displayName:contact:", v21, v24, 0, v22, 0);
                  v93 = v33;
                  v34 = &v93;
LABEL_27:
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "setObject:forKeyedSubscript:", v40, CFSTR("recipients"));

                  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("conversationId"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v41)
                  {
                    objc_msgSend(v77, "objectForKeyedSubscript:", v41);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("score"));
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v73)
                    {
                      v44 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v43, "doubleValue");
                      v46 = v45 + 1.0;
                      goto LABEL_34;
                    }
                    if (!v72 || v43)
                    {
                      if (!v72)
                      {
                        v50 = (void *)MEMORY[0x1E0CB37E8];
                        objc_msgSend(v43, "doubleValue");
                        v52 = v51;
                        objc_msgSend(v70, "objectAtIndexedSubscript:", v71);
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v53, "doubleValue");
                        objc_msgSend(v50, "numberWithDouble:", v52 + v12 / v54);
                        v48 = objc_claimAutoreleasedReturnValue();

                        v43 = v53;
                        goto LABEL_35;
                      }
                      v7 = v76;
                    }
                    else
                    {
                      v44 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v70, "objectAtIndexedSubscript:", v71);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "doubleValue");
                      v46 = -v47;
LABEL_34:
                      objc_msgSend(v44, "numberWithDouble:", v46);
                      v48 = objc_claimAutoreleasedReturnValue();
LABEL_35:

                      v43 = (void *)v48;
                      v7 = v76;
                    }
                    v90[0] = CFSTR("score");
                    v90[1] = CFSTR("key");
                    v91[0] = v43;
                    v91[1] = v32;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "setObject:forKeyedSubscript:", v49, v41);

                  }
                  else
                  {
                    v7 = v76;
                  }
                  v22 = v80;
                }

                goto LABEL_39;
              }
            }
            objc_msgSend(v16, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("conversationId"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("displayName"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = 0;
            goto LABEL_21;
          }
LABEL_39:
          ++v13;
        }
        while (v79 != v13);
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
        v79 = v58;
      }
      while (v58);
LABEL_51:

      v11 = v71 + 1;
      v9 = v68;
    }
    while (objc_msgSend(v68, "count") > (unint64_t)(v71 + 1));
  }
  objc_msgSend(v77, "keysSortedByValueUsingComparator:", &__block_literal_global_308);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v61 = v59;
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v63; ++i)
      {
        if (*(_QWORD *)v82 != v64)
          objc_enumerationMutation(v61);
        objc_msgSend(v77, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addObject:", v66);

      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
    }
    while (v63);
  }

  return v60;
}

- (id)rankedLabelsFromInteractionsSiriNLWithInteractions:(id)a3 andDistances:(id)a4 freqOnly:(BOOL)a5
{
  id v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _PSRecipient *v27;
  void *v28;
  _PSRecipient *v29;
  _PSRecipient **v30;
  void *v31;
  void *v32;
  void *v33;
  _PSRecipient *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v55;
  id v56;
  uint64_t v57;
  _BOOL4 v58;
  _PSKNNModel *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _QWORD v72[2];
  _QWORD v73[2];
  _PSRecipient *v74;
  _PSRecipient *v75;
  _BYTE v76[128];
  uint64_t v77;

  v58 = a5;
  v77 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v56 = a4;
  v8 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays](_PSPrivacyDataRetentionPeriod, "lookbackDurationInDays");
  if (objc_msgSend(v7, "count"))
  {
    v10 = 0;
    v11 = (double)(86400 * v9);
    v59 = self;
    v55 = v7;
    do
    {
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v57 = v10;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v55);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      if (!v13)
        goto LABEL_28;
      v14 = v13;
      v15 = *(_QWORD *)v68;
      v60 = v12;
      v61 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v68 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v17, "recipients");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "firstObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            objc_msgSend(v17, "sender");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
              continue;
          }
          objc_msgSend(*(id *)(v8 + 3592), "dictionary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "personIdType") == 3
            && (objc_msgSend(v19, "personId"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v21, v21))
          {
            -[_PSKNNModel contactResolver](self, "contactResolver");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "personId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "contactWithIdentifier:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "identifier");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = (void *)v25;
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("conversationId"));
              v27 = [_PSRecipient alloc];
              objc_msgSend(v19, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = -[_PSRecipient initWithIdentifier:senderHandle:handle:displayName:contact:](v27, "initWithIdentifier:senderHandle:handle:displayName:contact:", v26, 0, v28, 0, v24);

              v75 = v29;
              v30 = &v75;
              goto LABEL_17;
            }
            -[_PSKNNModel contactResolver](self, "contactResolver");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", v32, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("conversationId"));
              v34 = [_PSRecipient alloc];
              objc_msgSend(v19, "identifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = -[_PSRecipient initWithIdentifier:senderHandle:handle:displayName:contact:](v34, "initWithIdentifier:senderHandle:handle:displayName:contact:", v26, 0, v35, 0, v33);

              v74 = v29;
              v30 = &v74;
              v24 = v33;
LABEL_17:
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v36, CFSTR("recipients"));

              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("conversationId"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(v62, "objectForKeyedSubscript:", v33);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("score"));
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                v39 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v38, "doubleValue");
                v41 = v40;
                v12 = v60;
                if (v58)
                {
                  objc_msgSend(v39, "numberWithDouble:", v40 + 1.0);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v56, "objectAtIndexedSubscript:", v57);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "doubleValue");
                  objc_msgSend(v39, "numberWithDouble:", v41 + v11 / v44);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  v38 = v43;
                }

                v72[0] = CFSTR("score");
                v72[1] = CFSTR("key");
                v73[0] = v42;
                v73[1] = v20;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setObject:forKeyedSubscript:", v45, v33);

                self = v59;
                goto LABEL_23;
              }
              self = v59;
              v12 = v60;
            }
            else
            {
LABEL_23:

            }
            v8 = 0x1E0C99000;
            v15 = v61;
          }
          else
          {
            v26 = 0;
          }

          continue;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v14);
LABEL_28:

      v10 = v57 + 1;
      v7 = v55;
    }
    while (objc_msgSend(v55, "count") > (unint64_t)(v57 + 1));
  }
  objc_msgSend(v62, "keysSortedByValueUsingComparator:", &__block_literal_global_309);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v48 = v46;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v64;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v64 != v51)
          objc_enumerationMutation(v48);
        objc_msgSend(v62, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v53);

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v50);
  }

  return v47;
}

- (id)featuresFromInteractions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "startDate");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "bundleId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[_PSKNNModel featureVectorFromInteraction:](self, "featureVectorFromInteraction:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (!v15)
              v15 = (void *)MEMORY[0x1E0C9AA60];
            objc_msgSend(v15, "_pas_componentsJoinedByString:", &stru_1E4402490);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v17);

            }
            objc_msgSend(v5, "objectForKeyedSubscript:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v11);

            objc_msgSend(v4, "addObject:", v16);
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(v22, "addObject:", v4);
  objc_msgSend(v22, "addObject:", v5);

  return v22;
}

- (id)featuresFromInteractionsSplitRecipients:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  uint64_t v35;
  uint64_t v37;
  id obj;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v48;
    v35 = *(_QWORD *)v48;
    do
    {
      v8 = 0;
      v37 = v6;
      do
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1A1AFCA24]();
        objc_msgSend(v9, "startDate");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v9, "bundleId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v39 = v10;
            v40 = v8;
            objc_msgSend(v9, "startDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "bundleId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v14, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "valueForKey:", CFSTR("description"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "_pas_componentsJoinedByString:", &stru_1E4402490);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = 0u;
            v46 = 0u;
            v43 = 0u;
            v44 = 0u;
            objc_msgSend(v9, "recipients");
            v41 = (id)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v44;
              do
              {
                v22 = 0;
                do
                {
                  if (*(_QWORD *)v44 != v21)
                    objc_enumerationMutation(v41);
                  v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v22);
                  objc_msgSend(v4, "objectForKeyedSubscript:", v18);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v24)
                  {
                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, v18);

                  }
                  v26 = (void *)objc_opt_new();
                  objc_msgSend(v9, "startDate");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setStartDate:", v27);

                  objc_msgSend(v9, "endDate");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setEndDate:", v28);

                  objc_msgSend(v9, "bundleId");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setBundleId:", v29);

                  objc_msgSend(v26, "setMechanism:", objc_msgSend(v9, "mechanism"));
                  objc_msgSend(v26, "setDirection:", objc_msgSend(v9, "direction"));
                  objc_msgSend(v9, "sender");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setSender:", v30);

                  v51 = v23;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setRecipients:", v31);

                  objc_msgSend(v4, "objectForKeyedSubscript:", v18);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "addObject:", v26);

                  objc_msgSend(v42, "addObject:", v16);
                  ++v22;
                }
                while (v20 != v22);
                v20 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
              }
              while (v20);
            }

            v7 = v35;
            v6 = v37;
            v10 = v39;
            v8 = v40;
          }
        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v6);
  }

  objc_msgSend(v34, "addObject:", v42);
  objc_msgSend(v34, "addObject:", v4);

  return v34;
}

- (id)sliceStart:(unint64_t)a3 end:(unint64_t)a4 ofArray:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  if (objc_msgSend(v7, "count") >= a3 && objc_msgSend(v7, "count") >= a4)
  {
    objc_msgSend(v7, "subarrayWithRange:", a3, a4 - a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)jaccardDistanceFromSetBasedReference:(id)a3 neighbor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 1.0;
  if (v5)
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = (void *)objc_msgSend(v5, "mutableCopy");
          objc_msgSend(v9, "intersectSet:", v7);
          v10 = objc_msgSend(v5, "count");
          v11 = objc_msgSend(v7, "count") + v10;
          v12 = v11 - objc_msgSend(v9, "count");
          if (v12)
            v8 = 1.0 - (double)(unint64_t)objc_msgSend(v9, "count") / (double)v12;

        }
      }
    }
  }

  return v8;
}

- (double)distanceOfNeighbor:(id)a3 fromReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  char v16;
  unint64_t v17;
  double v18;
  void *v19;
  void *v20;
  double v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = (v10 - v12) * (v10 - v12);

  if (objc_msgSend(v7, "count") != 1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      v17 = -[_PSKNNModel _PSKnnModelSameBundleIdPenalty](self, "_PSKnnModelSameBundleIdPenalty");
      v13 = v13 + (double)v17 * (double)v17;
    }
    if (objc_msgSend(v7, "count") != 2)
    {
      v18 = (double)-[_PSKNNModel _PSKnnModelDifferentPeoplePenalty](self, "_PSKnnModelDifferentPeoplePenalty");
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSKNNModel jaccardDistanceFromSetBasedReference:neighbor:](self, "jaccardDistanceFromSetBasedReference:neighbor:", v19, v20);
      v13 = v13 + v21 * v18 * (v21 * v18);

    }
  }

  return sqrt(v13);
}

- (id)neighborsFromTrainingData:(id)a3 k:(unint64_t)a4 queryPoint:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  _PSKNNeighbor *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[_PSKNNModel distanceOfNeighbor:fromReference:](self, "distanceOfNeighbor:fromReference:", v16, v9, (_QWORD)v24);
        v18 = v17;
        if (objc_msgSend(v10, "count") >= a4)
        {
          objc_msgSend(v10, "lastObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "distance");
          v21 = v20;

          if (v18 >= v21)
            continue;
          objc_msgSend(v10, "removeLastObject");
        }
        v22 = -[_PSKNNeighbor initWithNodeData:distance:]([_PSKNNeighbor alloc], "initWithNodeData:distance:", v16, v18);
        objc_msgSend(v10, "insertObject:atIndex:", v22, -[_PSKNNModel indexToInsertNeighbor:array:](self, "indexToInsertNeighbor:array:", v22, v10));

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  return v10;
}

- (unint64_t)indexToInsertNeighbor:(id)a3 array:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v5, "count"), 1024, &__block_literal_global_314);

  return v7;
}

- (id)rankedMapsShareEtaSuggestions:(id)a3 maxSuggestions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _PSRecipient *v35;
  void *v36;
  _PSRecipient *v37;
  _PSSuggestion *v38;
  void *v39;
  _PSSuggestion *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  _PSRecipient *v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MapsShare");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ETAFeedback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v10;
  objc_msgSend(v10, "publisherWithUseCase:", CFSTR("MapsShareETAFeedback"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_319;
  v55[3] = &unk_1E4401148;
  v12 = v7;
  v56 = v12;
  v47 = v11;
  v13 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_318, v55);
  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = v15;
    _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_INFO, "Knn - Number of maps feedback events = %@", buf, 0xCu);

  }
  v46 = v12;
  objc_msgSend(v12, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel featuresFromMapsFeedbackEvents:](self, "featuresFromMapsFeedbackEvents:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "suggestionDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v6;
  objc_msgSend(v6, "bundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectAtIndex:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v20;
  -[_PSKNNModel neighborsFromTrainingData:k:queryPoint:](self, "neighborsFromTrainingData:k:queryPoint:", v21, -[_PSKNNModel k](self, "k"), v20);
  v22 = objc_claimAutoreleasedReturnValue();

  v45 = v17;
  v43 = (void *)v22;
  -[_PSKNNModel extractNearestNeighborsForMapsQueryResult:andNeighbors:frequencyOnly:](self, "extractNearestNeighborsForMapsQueryResult:andNeighbors:frequencyOnly:", v17, v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  if (v24 >= a4)
    v25 = a4;
  else
    v25 = v24;
  v42 = v23;
  objc_msgSend(v23, "subarrayWithRange:", 0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v27 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v52;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v52 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v31);
        -[_PSKNNModel contactResolver](self, "contactResolver");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", v32, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v35 = [_PSRecipient alloc];
          objc_msgSend(v34, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[_PSRecipient initWithIdentifier:handle:contact:](v35, "initWithIdentifier:handle:contact:", v36, v32, v34);

          if (v37)
          {
            v38 = [_PSSuggestion alloc];
            v57 = v37;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:](v38, "initWithBundleID:conversationIdentifier:groupName:recipients:", 0, 0, 0, v39);

            objc_msgSend(v50, "addObject:", v40);
          }

        }
        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v29);
  }

  return v50;
}

- (id)mapsShareEtaDefaultKnnSuggestions:(id)a3 maxSuggestions:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
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
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t j;
  void *v43;
  void *v44;
  const __CFString *v45;
  _PSRecipient *v46;
  _PSSuggestion *v47;
  unint64_t v48;
  void *v49;
  _PSSuggestion *v50;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  id obj;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  _PSRecipient *v72;
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  _QWORD v77[3];

  v77[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "suggestionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v6, v7);
  v57 = objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E442CCB8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("(direction IN %@)"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), &unk_1E442B1B0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(recipientCount == 1)"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v13);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSKNNModel interactionStore](self, "interactionStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  objc_msgSend(v16, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v14, v17, 2000, &v71);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v71;

  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[_PSKNNModel mapsShareEtaDefaultKnnSuggestions:maxSuggestions:].cold.1();
    v58 = (id)MEMORY[0x1E0C9AA60];
    v22 = (void *)v57;
  }
  else
  {
    v53 = v15;
    v54 = v14;
    v55 = v8;
    v56 = v5;
    v23 = 0x1E0C99000uLL;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v21;
      v25 = (void *)objc_opt_new();
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v26 = v18;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v68 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "bundleId");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v31);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        }
        while (v28);
      }

      objc_msgSend(v25, "allObjects");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_alloc(MEMORY[0x1E0C99D80]);
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __64___PSKNNModel_mapsShareEtaDefaultKnnSuggestions_maxSuggestions___block_invoke;
      v65[3] = &unk_1E4401080;
      v66 = v25;
      v34 = v25;
      objc_msgSend(v32, "_pas_mappedArrayWithTransform:", v65);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v33, "initWithObjects:forKeys:", v35, v32);

      *(_DWORD *)buf = 138477827;
      v76 = v36;
      v21 = v24;
      _os_log_impl(&dword_1A07F4000, v24, OS_LOG_TYPE_DEFAULT, "Knn - Maps ShareETA considering interactions from bundle IDs: %{private}@", buf, 0xCu);

    }
    -[_PSKNNModel featuresFromInteractionsSplitRecipients:](self, "featuresFromInteractionsSplitRecipients:", v18);
    v52 = objc_claimAutoreleasedReturnValue();
    -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](self, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = v37;
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v62;
      v41 = CFSTR("key");
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v62 != v40)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "objectForKeyedSubscript:", v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("conversationId"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44 && (objc_msgSend(v60, "containsObject:", v44) & 1) == 0)
          {
            v45 = v41;
            v46 = -[_PSRecipient initWithIdentifier:handle:contact:]([_PSRecipient alloc], "initWithIdentifier:handle:contact:", v44, v44, 0);
            v47 = [_PSSuggestion alloc];
            v72 = v46;
            v48 = v23;
            objc_msgSend(*(id *)(v23 + 3360), "arrayWithObjects:count:", &v72, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:](v47, "initWithBundleID:conversationIdentifier:groupName:recipients:", 0, 0, 0, v49);

            if (v50)
              objc_msgSend(v58, "addObject:", v50);
            objc_msgSend(v60, "addObject:", v44);

            v23 = v48;
            v41 = v45;
          }

        }
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      }
      while (v39);
    }

    v5 = v56;
    v22 = (void *)v57;
    v14 = v54;
    v8 = v55;
    v15 = v53;
    v21 = v52;
    v19 = 0;
  }

  return v58;
}

- (id)featuresFromMapsFeedbackEvents:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
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
  void *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "startDate");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "source");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bundleID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v10, "startDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "source");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bundleID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:", v15, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "valueForKey:", CFSTR("description"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "componentsJoinedByString:", &stru_1E4402490);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, v20);

            }
            objc_msgSend(v4, "objectForKeyedSubscript:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v10);

            objc_msgSend(v27, "addObject:", v18);
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v7);
  }

  objc_msgSend(v25, "addObject:", v27);
  objc_msgSend(v25, "addObject:", v4);

  return v25;
}

- (id)extractNearestNeighborsForMapsQueryResult:(id)a3 andNeighbors:(id)a4 frequencyOnly:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v38;
  void *v39;
  id obj;
  void *v41;
  void *v42;
  _BOOL4 v43;
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

  v43 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v6;
  objc_msgSend(v6, "objectAtIndex:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v13, "nodeData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "valueForKey:", CFSTR("description"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", &stru_1E4402490);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v13, "distance");
        objc_msgSend(v18, "numberWithDouble:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v19);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v21 = 0;
    v39 = v8;
    do
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v45 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "value");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringValue");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              objc_msgSend(v20, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v29, "doubleValue");
              v32 = v31;
              if (v43)
              {
                objc_msgSend(v30, "numberWithDouble:", v31 + 1.0);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v42, "objectAtIndexedSubscript:", v21);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "doubleValue");
                objc_msgSend(v30, "numberWithDouble:", v32 + 1.0 / v35);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                v29 = v34;
              }

              objc_msgSend(v20, "setObject:forKeyedSubscript:", v33, v28);
            }

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v24);
      }

      ++v21;
      v8 = v39;
    }
    while (objc_msgSend(v39, "count") > v21);
  }
  objc_msgSend(v20, "keysSortedByValueUsingComparator:", &__block_literal_global_339);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (unint64_t)k
{
  return self->_k;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (_PSContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (NSArray)filterBundleIds
{
  return self->_filterBundleIds;
}

- (_CDInteractionCache)messageInteractionCache
{
  return self->_messageInteractionCache;
}

- (void)setMessageInteractionCache:(id)a3
{
  objc_storeStrong((id *)&self->_messageInteractionCache, a3);
}

- (_CDInteractionCache)shareInteractionCache
{
  return self->_shareInteractionCache;
}

- (void)setShareInteractionCache:(id)a3
{
  objc_storeStrong((id *)&self->_shareInteractionCache, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (unint64_t)_PSKnnTopKShares
{
  return self->__PSKnnTopKShares;
}

- (void)set_PSKnnTopKShares:(unint64_t)a3
{
  self->__PSKnnTopKShares = a3;
}

- (unint64_t)_PSKnnMessagesZkwTopNFilter
{
  return self->__PSKnnMessagesZkwTopNFilter;
}

- (void)set_PSKnnMessagesZkwTopNFilter:(unint64_t)a3
{
  self->__PSKnnMessagesZkwTopNFilter = a3;
}

- (unint64_t)_PSKnnModelRecencyMarginToPromoteShares
{
  return self->__PSKnnModelRecencyMarginToPromoteShares;
}

- (void)set_PSKnnModelRecencyMarginToPromoteShares:(unint64_t)a3
{
  self->__PSKnnModelRecencyMarginToPromoteShares = a3;
}

- (unint64_t)_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId
{
  return self->__PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId;
}

- (void)set_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId:(unint64_t)a3
{
  self->__PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId = a3;
}

- (unint64_t)_PSKnnModelRecencyMarginToRetainShares
{
  return self->__PSKnnModelRecencyMarginToRetainShares;
}

- (void)set_PSKnnModelRecencyMarginToRetainShares:(unint64_t)a3
{
  self->__PSKnnModelRecencyMarginToRetainShares = a3;
}

- (unint64_t)_PSKnnModelShareSheetMinimumOccurenceRegularizer
{
  return self->__PSKnnModelShareSheetMinimumOccurenceRegularizer;
}

- (void)set_PSKnnModelShareSheetMinimumOccurenceRegularizer:(unint64_t)a3
{
  self->__PSKnnModelShareSheetMinimumOccurenceRegularizer = a3;
}

- (unint64_t)_PSKnnModelSharePlayMinimumOccurenceRegularizer
{
  return self->__PSKnnModelSharePlayMinimumOccurenceRegularizer;
}

- (void)set_PSKnnModelSharePlayMinimumOccurenceRegularizer:(unint64_t)a3
{
  self->__PSKnnModelSharePlayMinimumOccurenceRegularizer = a3;
}

- (unint64_t)_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer
{
  return self->__PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer;
}

- (void)set_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer:(unint64_t)a3
{
  self->__PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer = a3;
}

- (unint64_t)_PSKnnTopKGroupActivities
{
  return self->__PSKnnTopKGroupActivities;
}

- (void)set_PSKnnTopKGroupActivities:(unint64_t)a3
{
  self->__PSKnnTopKGroupActivities = a3;
}

- (unint64_t)_PSKnnModelRecencyMarginToRetainGroupActivities
{
  return self->__PSKnnModelRecencyMarginToRetainGroupActivities;
}

- (void)set_PSKnnModelRecencyMarginToRetainGroupActivities:(unint64_t)a3
{
  self->__PSKnnModelRecencyMarginToRetainGroupActivities = a3;
}

- (unint64_t)_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer
{
  return self->__PSKnnModelGroupActivitiesMinimumOccuranceRegularizer;
}

- (void)set_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer:(unint64_t)a3
{
  self->__PSKnnModelGroupActivitiesMinimumOccuranceRegularizer = a3;
}

- (unint64_t)_PSKnnModelSameBundleIdPenalty
{
  return self->__PSKnnModelSameBundleIdPenalty;
}

- (void)set_PSKnnModelSameBundleIdPenalty:(unint64_t)a3
{
  self->__PSKnnModelSameBundleIdPenalty = a3;
}

- (unint64_t)_PSKnnModelDifferentPeoplePenalty
{
  return self->__PSKnnModelDifferentPeoplePenalty;
}

- (void)set_PSKnnModelDifferentPeoplePenalty:(unint64_t)a3
{
  self->__PSKnnModelDifferentPeoplePenalty = a3;
}

- (BOOL)_PSInteractionModelInUse
{
  return self->__PSInteractionModelInUse;
}

- (void)set_PSInteractionModelInUse:(BOOL)a3
{
  self->__PSInteractionModelInUse = a3;
}

- (NSDictionary)_PSKnnModelMinimumOccurenceOfInteractionByMechanism
{
  return self->__PSKnnModelMinimumOccurenceOfInteractionByMechanism;
}

- (void)set_PSKnnModelMinimumOccurenceOfInteractionByMechanism:(id)a3
{
  objc_storeStrong((id *)&self->__PSKnnModelMinimumOccurenceOfInteractionByMechanism, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__PSKnnModelMinimumOccurenceOfInteractionByMechanism, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_shareInteractionCache, 0);
  objc_storeStrong((id *)&self->_messageInteractionCache, 0);
  objc_storeStrong((id *)&self->_filterBundleIds, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)suggestionProxiesWithPredictionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "Knn - Sharesheet shareLabels: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mapsShareEtaDefaultKnnSuggestions:maxSuggestions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "Knn - Maps ShareETA error querying interactions database for maps suggestions: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
