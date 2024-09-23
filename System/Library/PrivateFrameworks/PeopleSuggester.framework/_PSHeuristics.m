@implementation _PSHeuristics

- (_PSHeuristics)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4 contactResolver:(id)a5 messageInteractionCache:(id)a6
{
  return -[_PSHeuristics initWithKnowledgeStore:interactionStore:contactResolver:shareSheetSupportedBundleIds:messageInteractionCache:](self, "initWithKnowledgeStore:interactionStore:contactResolver:shareSheetSupportedBundleIds:messageInteractionCache:", a3, a4, a5, 0, a6);
}

- (_PSHeuristics)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4 contactResolver:(id)a5 shareSheetSupportedBundleIds:(id)a6 messageInteractionCache:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _PSHeuristics *v18;
  _PSHeuristics *v19;
  void *v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_PSHeuristics;
  v18 = -[_PSHeuristics init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_knowledgeStore, a3);
    objc_storeStrong((id *)&v19->_interactionStore, a4);
    objc_storeStrong((id *)&v19->_contactResolver, a5);
    objc_storeStrong((id *)&v19->_messageInteractionCache, a7);
    +[_PSConfig defaultConfig](_PSConfig, "defaultConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSHeuristics updateModelProperties:](v19, "updateModelProperties:", v20);
    -[_PSHeuristics prepareRecencyCacheWithSupportedBundleIds:](v19, "prepareRecencyCacheWithSupportedBundleIds:", v16);

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
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSHeuristicsRecencyMargin"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSHeuristics setRecencyMargin:](self, "setRecencyMargin:", (double)objc_msgSend(v8, "integerValue"));

  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[_PSHeuristics updateModelProperties:].cold.1(self);

  v26[0] = &unk_1E442ADD8;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSHeuristicsBackfillLimit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");
  if (v12)
    v13 = v12;
  else
    v13 = -1;
  objc_msgSend(v10, "numberWithUnsignedLong:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  v26[1] = &unk_1E442ADF0;
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSHeuristicsMessagesRecencyLimit"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");
  if (v17)
    v18 = v17;
  else
    v18 = 3;
  objc_msgSend(v15, "numberWithInteger:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v19;
  v26[2] = &unk_1E442AE08;
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PSHeuristicsShareSheetRecencyLimit"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerValue");
  if (v22)
    v23 = v22;
  else
    v23 = 2;
  objc_msgSend(v20, "numberWithInteger:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSHeuristics setRecencyHeuristicLimitNumberOfProxiesByReason:](self, "setRecencyHeuristicLimitNumberOfProxiesByReason:", v25);

}

- (void)prepareRecencyCacheWithSupportedBundleIds:(id)a3
{
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
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(bundleId IN %@) AND (mechanism == %@)"), v4, &unk_1E442AE20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    +[_PSConstants shareSheetTargetBundleIdMail](_PSConstants, "shareSheetTargetBundleIdMail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

    +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v8);

    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v9);

    +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(targetBundleId IN %@) AND (mechanism == %@)"), v6, &unk_1E442AE38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism IN %@) AND (recipients.@count == 1) AND SUBQUERY(recipients, $recipient, $recipient.personId != nil).@count > 0"), &unk_1E442CAC0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3528];
    v21[0] = v5;
    v21[1] = v11;
    v21[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "orPredicateWithSubpredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_PSHeuristics interactionStore](self, "interactionStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59___PSHeuristics_prepareRecencyCacheWithSupportedBundleIds___block_invoke;
    v19[3] = &unk_1E44006B8;
    v20 = v15;
    v17 = v15;
    +[_PSInteractionStoreUtils interactionCacheFromStore:size:queryPredicate:filterBlock:](_PSInteractionStoreUtils, "interactionCacheFromStore:size:queryPredicate:filterBlock:", v16, 1, v17, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSHeuristics setRecencyCache:](self, "setRecencyCache:", v18);

  }
}

- (id)seedSuggestionsForChatGuidsAndTransports:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __objc2_class **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __objc2_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _PSRecipient *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _PSRecipient *v35;
  void *v36;
  id INImageClass;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  _PSSuggestion *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _PSSuggestion *v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v55;
  id v56;
  uint64_t v57;
  NSObject *log;
  id obj;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  NSObject *v78;
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    v53 = MEMORY[0x1E0C9AA60];
    goto LABEL_45;
  }
  v4 = 0x1E0C99000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[_PSHeuristics seedSuggestionsForChatGuidsAndTransports:].cold.1(log);
LABEL_44:
    v53 = MEMORY[0x1E0C9AA60];

    goto LABEL_45;
  }
  log = objc_opt_new();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (!v5)
    goto LABEL_37;
  v6 = v5;
  v7 = off_1E43FD000;
  v8 = *(_QWORD *)v73;
  v55 = *(_QWORD *)v73;
  v56 = v3;
  while (2)
  {
    v9 = 0;
    v57 = v6;
    do
    {
      if (*(_QWORD *)v73 != v8)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v9), "componentsSeparatedByString:", CFSTR("||"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "count"))
      {

        goto LABEL_44;
      }
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v63 = v10;
      v64 = v9;
      if ((unint64_t)objc_msgSend(v10, "count") <= 1)
        +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
      else
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v7[1];
      v62 = v11;
      v79 = v11;
      objc_msgSend(*(id *)(v4 + 3360), "arrayWithObjects:count:", &v79, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSHeuristics interactionStore](self, "interactionStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[__objc2_class interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:](v12, "interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:", v13, 0, &unk_1E442CAD8, 0, 0, v14, 500);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v16;
      v61 = v15;
      if (v16 && (v17 = v16, objc_msgSend(v16, "count")))
      {
        objc_msgSend(v17, "firstObject");
        v18 = objc_claimAutoreleasedReturnValue();
        +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v18;
          _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_DEFAULT, "Interaction being used to generate suggestion %@", buf, 0xCu);
        }

        v20 = (void *)objc_opt_new();
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v65 = v18;
        -[NSObject recipients](v18, "recipients");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v69;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v69 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
              -[_PSHeuristics contactResolver](self, "contactResolver");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "handle");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "resolveContactIfPossibleFromContactIdentifierString:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              v30 = [_PSRecipient alloc];
              if (v29)
                v31 = v29;
              else
                v31 = v26;
              objc_msgSend(v31, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "handle");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "displayName");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[_PSRecipient initWithIdentifier:handle:displayName:contact:](v30, "initWithIdentifier:handle:displayName:contact:", v32, v33, v34, v29);

              objc_msgSend(v20, "addObject:", v35);
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
          }
          while (v23);
        }

        -[NSObject contentURL](v65, "contentURL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          INImageClass = getINImageClass();
          -[NSObject contentURL](v65, "contentURL");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(INImageClass, "imageWithURL:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v39 = 0;
        }
        v44 = [_PSSuggestion alloc];
        v45 = (void *)MEMORY[0x1E0CB3940];
        -[NSObject domainIdentifier](v65, "domainIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "stringWithFormat:", CFSTR("%@_%@"), v66, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject groupName](v65, "groupName");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)objc_msgSend(v20, "copy");
        -[NSObject derivedIntentIdentifier](v65, "derivedIntentIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:](v44, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:", v66, v47, v48, v49, v50, v39, CFSTR("Demo mode"), CFSTR("Demo mode"), 0);

        if (v51)
          -[NSObject addObject:](log, "addObject:", v51);

        v4 = 0x1E0C99000;
        v3 = v56;
        v6 = v57;
        v7 = off_1E43FD000;
        v8 = v55;
      }
      else
      {
        +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
        v40 = objc_claimAutoreleasedReturnValue();
        v65 = v40;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v62;
          v78 = v62;
          _os_log_impl(&dword_1A07F4000, v40, OS_LOG_TYPE_DEFAULT, "Could not find any interaction matching seed suggestion %@", buf, 0xCu);
          v43 = v63;
          v42 = v64;
          goto LABEL_35;
        }
      }
      v43 = v63;
      v42 = v64;
      v41 = v62;
LABEL_35:

      v9 = v42 + 1;
    }
    while (v9 != v6);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    if (v6)
      continue;
    break;
  }
LABEL_37:

  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v78 = log;
    _os_log_impl(&dword_1A07F4000, v52, OS_LOG_TYPE_DEFAULT, "Returned suggestions for demo mode %@", buf, 0xCu);
  }

  v53 = log;
LABEL_45:

  return v53;
}

- (id)recentNonSystemSuggestionsForBundleIDs:(id)a3 numberOfSuggestion:(unint64_t)a4
{
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
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  _PSHeuristics *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v36);
  v6 = (void *)MEMORY[0x1E0C99E60];
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants shareSheetTargetBundleIdMail](_PSConstants, "shareSheetTargetBundleIdMail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v11);

  v39 = self;
  -[_PSHeuristics interactionStore](self, "interactionStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v5;
  v13 = (void *)objc_msgSend(v5, "copy");
  +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:](_PSInteractionStoreUtils, "recentInteractionsFromStore:bundleIDs:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    v38 = *(_QWORD *)v42;
    do
    {
      v20 = 0;
      v40 = v18;
      do
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v20);
        objc_msgSend(v21, "derivedIntentIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "mechanism") == 13)
          objc_msgSend(v21, "targetBundleId");
        else
          objc_msgSend(v21, "bundleId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v22)
          v25 = v23 == 0;
        else
          v25 = 1;
        if (!v25)
        {
          _PSSuggestionKey(v23, v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "containsObject:", v26) & 1) == 0)
          {
            v27 = v15;
            objc_msgSend(v15, "addObject:", v26);
            -[_PSHeuristics knowledgeStore](v39, "knowledgeStore");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSHeuristics contactResolver](v39, "contactResolver");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[_PSSuggestion suggestionForBundleID:derivedIntentIdentifier:knowledgeStore:contactResolver:reason:reasonType:](_PSSuggestion, "suggestionForBundleID:derivedIntentIdentifier:knowledgeStore:contactResolver:reason:reasonType:", v24, v22, v28, v29, CFSTR("Recent Non-System"), v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
              objc_msgSend(v37, "addObject:", v32);

            v15 = v27;
            v19 = v38;
            v18 = v40;
          }

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v18);
  }

  v33 = (void *)objc_msgSend(v37, "copy");
  return v33;
}

- (id)proximityBoostingHeuristicWithProximityBooster:(id)a3 existingSuggestions:(id)a4
{
  return (id)objc_msgSend(a3, "suggestionsByBoostingNearbySuggestions:", a4);
}

- (id)hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:(id)a3
{
  return -[_PSHeuristics hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:forStatName:](self, "hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:forStatName:", a3, CFSTR("timeSinceLastOutgoingInteraction"));
}

- (id)hyperRecentHeuristicIncomingSuggestionProxiesForInteractionStatistics:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[_PSHeuristics hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:forStatName:](self, "hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:forStatName:", a3, CFSTR("timeSinceLastIncomingInteraction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:(id)a3 forStatName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _PSHeuristics *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _PSHeuristics *v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "conversationIds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke;
  v27[3] = &unk_1E44006E0;
  v10 = v6;
  v28 = v10;
  v11 = v7;
  v29 = v11;
  v30 = self;
  objc_msgSend(v8, "_pas_filteredArrayWithTest:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke_2;
  v24[3] = &unk_1E4400708;
  v13 = v10;
  v25 = v13;
  v14 = v11;
  v26 = v14;
  objc_msgSend(v12, "sortedArrayUsingComparator:", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke_3;
  v20[3] = &unk_1E4400730;
  v21 = v13;
  v22 = v14;
  v23 = self;
  v16 = v14;
  v17 = v13;
  objc_msgSend(v15, "_pas_mappedArrayWithTransform:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)peopleAwareSuggestionProxiesForInteractionStatistics:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("numberOfSharesOfDetectedPeopleWithConversation");
  v9[1] = CFSTR("numberOfEngagedSuggestionsOfDetectedPeopleWithConversation");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSHeuristics heuristicsFromInteractionsStatistics:forStatsNames:threshold:maxNumberOfSuggestions:reason:](self, "heuristicsFromInteractionsStatistics:forStatsNames:threshold:maxNumberOfSuggestions:reason:", v5, v6, 8, CFSTR("PASS heuristic - PS Rewrite"), 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pastSharesWithCurrentAppAwareSuggestionProxiesForInteractionStatistics:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("numberOfSharesFromCurrentAppWithConversation");
  v9[1] = CFSTR("numberOfEngagedSuggestionsFromCurrentAppWithConversation");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSHeuristics heuristicsFromInteractionsStatistics:forStatsNames:threshold:maxNumberOfSuggestions:reason:](self, "heuristicsFromInteractionsStatistics:forStatsNames:threshold:maxNumberOfSuggestions:reason:", v5, v6, 4, CFSTR("PastSharesWithCurrentApp heuristic - PS Rewrite"), 3.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pastSharesAwareSuggestionProxiesForInteractionStatistics:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("numberOfSharesWithConversation");
  v9[1] = CFSTR("numberOfEngagedSuggestionsWithConversation");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSHeuristics heuristicsFromInteractionsStatistics:forStatsNames:threshold:maxNumberOfSuggestions:reason:](self, "heuristicsFromInteractionsStatistics:forStatsNames:threshold:maxNumberOfSuggestions:reason:", v5, v6, 5, CFSTR("PastSharesHeuristic - PS Rewrite"), 3.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pastSharesOfTopDomainURLAwareSuggestionProxiesForInteractionStatistics:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("numberOfSharesOfTopDomainURLWithConversation");
  v9[1] = CFSTR("numberOfEngagedSuggestionsOfTopDomainURLWithConversation");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSHeuristics heuristicsFromInteractionsStatistics:forStatsNames:threshold:maxNumberOfSuggestions:reason:](self, "heuristicsFromInteractionsStatistics:forStatsNames:threshold:maxNumberOfSuggestions:reason:", v5, v6, 3, CFSTR("PastSharesOfTopDomainURLHeuristic - PS Rewrite"), 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)heuristicsFromInteractionsStatistics:(id)a3 forStatsNames:(id)a4 threshold:(double)a5 maxNumberOfSuggestions:(int)a6 reason:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  _PSHeuristics *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  double v38;
  _QWORD v39[4];
  id v40;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke;
  v39[3] = &unk_1E4400780;
  v15 = v11;
  v40 = v15;
  v16 = (void *)MEMORY[0x1A1AFCBF8](v39);
  objc_msgSend(v15, "conversationIds");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v14;
  v35[1] = 3221225472;
  v35[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_3;
  v35[3] = &unk_1E44007A8;
  v18 = v16;
  v37 = v18;
  v19 = v12;
  v36 = v19;
  v38 = a5;
  objc_msgSend(v17, "_pas_filteredArrayWithTest:", v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v14;
  v32[1] = 3221225472;
  v32[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_4;
  v32[3] = &unk_1E44007D0;
  v33 = v19;
  v34 = v18;
  v21 = v19;
  v22 = v18;
  objc_msgSend(v20, "sortedArrayUsingComparator:", v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v28[1] = 3221225472;
  v28[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_5;
  v28[3] = &unk_1E4400730;
  v29 = v15;
  v30 = v13;
  v31 = self;
  v24 = v13;
  v25 = v15;
  objc_msgSend(v23, "_pas_mappedArrayWithTransform:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)hyperRecentHeuristicSuggestionProxiesWithReferenceDate:(id)a3 predictionContextBundleId:(id)a4
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  _PSSuggestionProxy *v30;
  void *v31;
  _PSSuggestionProxy *v32;
  objc_class *v33;
  void *v35;
  _PSSuggestionProxy *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_PSHeuristics recencyMargin](self, "recencyMargin");
  objc_msgSend(v5, "dateByAddingTimeInterval:", -v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSHeuristics recencyCache](self, "recencyCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interactions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3880];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __98___PSHeuristics_hyperRecentHeuristicSuggestionProxiesWithReferenceDate_predictionContextBundleId___block_invoke;
  v38[3] = &unk_1E44007F8;
  v11 = v7;
  v39 = v11;
  objc_msgSend(v10, "predicateWithBlock:", v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject mechanism](v14, "mechanism") == 4 || -[NSObject mechanism](v14, "mechanism") == 13)
    {
      if (-[NSObject mechanism](v14, "mechanism") == 13)
      {
        -[NSObject targetBundleId](v14, "targetBundleId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) != 0)
          +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
        else
          -[NSObject targetBundleId](v14, "targetBundleId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject targetBundleId](v14, "targetBundleId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants shareSheetTargetBundleIdMessages](_PSConstants, "shareSheetTargetBundleIdMessages");
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[NSObject bundleId](v14, "bundleId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bundleId](v14, "bundleId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v31 = (void *)v22;
      if ((objc_msgSend(v21, "isEqualToString:", v22) & 1) != 0)
        -[NSObject domainIdentifier](v14, "domainIdentifier");
      else
        -[NSObject derivedIntentIdentifier](v14, "derivedIntentIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = [_PSSuggestionProxy alloc];
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v32, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v20, v23, 0, CFSTR("Hyper-recent message heuristic"), v24);
    }
    else
    {
      v36 = [_PSSuggestionProxy alloc];
      +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject recipients](v14, "recipients");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "personId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject recipients](v14, "recipients");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstObject");
      v37 = v11;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handle:reason:reasonType:](v36, "initWithBundleID:interactionRecipients:contactID:handle:reason:reasonType:", v20, 0, v25, v27, CFSTR("Hyper-recent call heuristic"), v29);

      v11 = v37;
    }

    v40[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[_PSHeuristics hyperRecentHeuristicSuggestionProxiesWithReferenceDate:predictionContextBundleId:].cold.1(v14, v17, v18);
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

- (id)inPhoneCallHeuristicSuggestionProxiesWithBundleIds:(id)a3 predictionContext:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
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
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  void *v50;
  id INImageClass;
  void *v52;
  _PSSuggestionProxy *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  _PSSuggestionProxy *v57;
  NSObject *v58;
  _PSSuggestionProxy *v59;
  void *v60;
  void *v61;
  objc_class *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  _PSSuggestionProxy *v66;
  objc_class *v67;
  void *v68;
  NSObject *v69;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v87;
  void *v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  id v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD v99[3];

  v99[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_INFO, "Looking to get in phone call heuristic", buf, 2u);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForActiveCall");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v18 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_71;
  }
  v75 = v10;
  v76 = v9;
  objc_msgSend(MEMORY[0x1E0D15C58], "calleeContactIDsKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "calleeHandlesKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C58], "bundleIDKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v99[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v79 = 0;
  }
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") == 1)
  {
    objc_msgSend(v15, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = 0;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v15, "count") < 2)
      v20 = 0;
    else
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v15);
    v19 = 0;
  }
  v81 = v8;
  v82 = v13;
  v77 = v5;
  v85 = v6;
  v80 = (void *)v20;
  if (v13 && objc_msgSend(v13, "count") == 1)
  {
    +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_INFO, "Found a donation in the context store on an active call where calleeContactIDsKey is set", buf, 2u);
    }

    objc_msgSend(v13, "firstObject");
    v22 = objc_claimAutoreleasedReturnValue();
    v87 = 0;
  }
  else
  {
    if (v20)
    {
      +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v23, OS_LOG_TYPE_INFO, "Found a donation in the context store on an active call where calleeHandlesKey is set", buf, 2u);
      }

      -[_PSHeuristics interactionStore](self, "interactionStore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSHeuristics messageInteractionCache](self, "messageInteractionCache");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSInteractionStoreUtils conversationIdWithExactMatchWithContactHandles:store:bundleIds:messageInteractionCache:](_PSInteractionStoreUtils, "conversationIdWithExactMatchWithContactHandles:store:bundleIds:messageInteractionCache:", v80, v24, v5, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v26, "count"))
      {
        v83 = v15;
        v27 = v19;
        objc_msgSend(v26, "allValues");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "allKeys");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v29, "length") && objc_msgSend(v31, "length"))
          v87 = v29;
        else
          v87 = 0;
        v19 = v27;

        v15 = v83;
      }
      else
      {
        v87 = 0;
      }

    }
    else
    {
      v87 = 0;
    }
    v22 = 0;
  }
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)v17;
  if (!objc_msgSend(v88, "isEqualToString:", v32))
  {
    v84 = 0;
    v36 = 0;
LABEL_52:

    goto LABEL_53;
  }

  if (v19 | v22)
  {
    if (v22)
    {
      v33 = objc_alloc(MEMORY[0x1E0C99E60]);
      v98 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v33, "initWithArray:", v34);

      if (v19)
      {
LABEL_36:
        v97 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
        v35 = objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
    }
    else
    {
      v32 = 0;
      if (v19)
        goto LABEL_36;
    }
    v35 = 0;
LABEL_41:
    -[_PSHeuristics interactionStore](self, "interactionStore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSHeuristics messageInteractionCache](self, "messageInteractionCache");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)v35;
    +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrContactIds:identifiers:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrContactIds:identifiers:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:", v35, v32, 0, &unk_1E442CAF0, &unk_1E442CB08, v79, v37, 1, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = v39;
    objc_msgSend(v39, "firstObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41
      && (objc_msgSend(v41, "bundleId"), v43 = (void *)objc_claimAutoreleasedReturnValue(), v43, v43))
    {
      v73 = v40;
      v44 = v19;
      v45 = v78;

      objc_msgSend(v42, "groupName");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "bundleId");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqualToString:", v47);

      if ((v48 & 1) == 0)
      {
        objc_msgSend(v42, "derivedIntentIdentifier");
        v49 = objc_claimAutoreleasedReturnValue();

        v87 = (id)v49;
      }
      v88 = v45;
      v19 = v44;
      v40 = v73;
    }
    else
    {
      v84 = 0;
    }
    objc_msgSend(v42, "contentURL");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      INImageClass = getINImageClass();
      objc_msgSend(v42, "contentURL");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(INImageClass, "imageWithURL:", v52);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = 0;
    }

    goto LABEL_52;
  }
  v84 = 0;
  v36 = 0;
LABEL_53:
  v53 = [_PSSuggestionProxy alloc];
  +[_PSConstants inCallHeuristicReason](_PSConstants, "inCallHeuristicReason");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (objc_class *)objc_opt_class();
  NSStringFromClass(v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 || v22 || v87)
  {
    LOBYTE(v71) = 0;
    v57 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:](v53, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:", v88, v87, v22, v15, v54, v56, v71, v84, v36);

    +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v90 = v88;
      v91 = 2112;
      v92 = v87;
      v93 = 2112;
      v94 = v22;
      v95 = 2112;
      v96 = v19;
      _os_log_debug_impl(&dword_1A07F4000, v65, OS_LOG_TYPE_DEBUG, "bundleId: %@, interactionRecipients: %@, contact: %@, handle: %@", buf, 0x2Au);
    }

    v8 = v81;
    objc_msgSend(v81, "addObject:", v57);
    if (objc_msgSend(v85, "isCollaborationAvailable"))
    {
      v66 = [_PSSuggestionProxy alloc];
      +[_PSConstants collaborationSuggestionBundleId](_PSConstants, "collaborationSuggestionBundleId");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants inCallCollaborationHeuristicReason](_PSConstants, "inCallCollaborationHeuristicReason");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v72) = 0;
      v64 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:](v66, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:", v60, v87, v22, v15, v61, v63, v72, v84, v36);
      goto LABEL_64;
    }
LABEL_65:
    v68 = 0;
    goto LABEL_66;
  }
  v57 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:handles:reason:reasonType:](v53, "initWithBundleID:interactionRecipients:handles:reason:reasonType:", v88, 0, v15, v54, v56);

  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    -[_PSHeuristics inPhoneCallHeuristicSuggestionProxiesWithBundleIds:predictionContext:].cold.1((uint64_t)v15, (uint64_t)v57, v58);

  v8 = v81;
  objc_msgSend(v81, "addObject:", v57);
  if (!objc_msgSend(v85, "isCollaborationAvailable"))
    goto LABEL_65;
  v59 = [_PSSuggestionProxy alloc];
  +[_PSConstants collaborationSuggestionBundleId](_PSConstants, "collaborationSuggestionBundleId");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants inCallCollaborationHeuristicReason](_PSConstants, "inCallCollaborationHeuristicReason");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (objc_class *)objc_opt_class();
  NSStringFromClass(v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:handles:reason:reasonType:](v59, "initWithBundleID:interactionRecipients:handles:reason:reasonType:", v60, 0, v15, v61, v63);
LABEL_64:
  v68 = (void *)v64;

  v8 = v81;
LABEL_66:

  if (v68)
    objc_msgSend(v8, "addObject:", v68);
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v69 = objc_claimAutoreleasedReturnValue();
  v5 = v77;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478595;
    v90 = v82;
    v91 = 2113;
    v92 = v15;
    v93 = 2113;
    v94 = (uint64_t)v87;
    v95 = 2113;
    v96 = (uint64_t)v88;
    _os_log_impl(&dword_1A07F4000, v69, OS_LOG_TYPE_INFO, "Active call donation, contactsIds: %{private}@, handles: %{private}@, interactionRecipients: %{private}@, bundleId: %{private}@", buf, 0x2Au);
  }

  v18 = v8;
  v6 = v85;
  v10 = v75;
  v9 = v76;
LABEL_71:

  return v18;
}

+ (id)templateForPhoneCallHeuristicFromSuggestionProxy:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  _PSSuggestionTemplate *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _PSSuggestionTemplate *v29;
  void *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  void *v38;
  void *v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "interactionRecipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v31 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v31 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "contactID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v3, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "contactID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "contactID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v13;
      objc_msgSend(v3, "handle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  else
  {
    v11 = 0;
  }
  v30 = 0;
LABEL_9:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v3, "handles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v20, "containsString:", CFSTR("@")))
          v21 = v5;
        else
          v21 = v4;
        objc_msgSend(v21, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v17);
  }

  v22 = [_PSSuggestionTemplate alloc];
  objc_msgSend(v3, "bundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reason");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[_PSSuggestionTemplate initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:reason:reasonType:](v22, "initWithBundleID:interactionRecipients:image:groupName:recipientContactIDs:recipientEmailAddresses:recipientPhoneNumbers:recipientDisplayNames:contactIdToHandleMapping:reason:reasonType:", v23, v31, v24, v25, v30, v5, v4, 0, v11, v26, v27);

  return v29;
}

+ (id)PSHeuristicsRecencyReasonToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E4400848[a3];
}

- (id)proxiesByRecencyUsingInteractions:(id)a3 startIndex:(unint64_t)a4 reason:(int64_t)a5 allowNonSupportedBundleIDs:(BOOL)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
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
  int v25;
  _PSSuggestionProxy *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  _PSSuggestionProxy *v30;
  void *v31;
  _PSSuggestionProxy *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;

  v10 = a3;
  -[_PSHeuristics recencyHeuristicLimitNumberOfProxiesByReason](self, "recencyHeuristicLimitNumberOfProxiesByReason");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  +[_PSHeuristics PSHeuristicsRecencyReasonToString:](_PSHeuristics, "PSHeuristicsRecencyReasonToString:", a5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _PSShareSheetExtensionBundleIDToAppBundleIDMapping(a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") > a4)
  {
    v38 = v16;
    do
    {
      if (objc_msgSend(v15, "count") >= v14)
        break;
      objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "mechanism") == 13)
      {
        objc_msgSend(v17, "targetBundleId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v17, "targetBundleId");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "targetBundleId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v17, "targetBundleId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v23);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v18 = v20;
          }
        }
      }
      +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v18, "isEqualToString:", v24);

      if (v25)
      {
        v26 = [_PSSuggestionProxy alloc];
        objc_msgSend(v17, "domainIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v26, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v18, v27, 0, v39, v29);

        v16 = v38;
        if (v30)
          goto LABEL_11;
      }
      else
      {
        objc_msgSend(v17, "derivedIntentIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
          goto LABEL_13;
        v32 = [_PSSuggestionProxy alloc];
        objc_msgSend(v17, "derivedIntentIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v32, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v18, v33, 0, v39, v35);

        v16 = v38;
        if (v30)
LABEL_11:
          objc_msgSend(v15, "addObject:", v30);
      }

LABEL_13:
      ++a4;
    }
    while (a4 < objc_msgSend(v10, "count"));
  }
  objc_msgSend(v15, "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)returnDocumentToSender:(id)a3
{
  void *v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_class *v21;
  id v22;
  SEL v23;
  char v24;
  NSObject *v25;
  _BOOL4 v26;
  _PSSuggestionProxy *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  _PSSuggestionProxy *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  uint8_t v50;
  _BYTE v51[15];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t v60[128];
  __int128 buf;
  Class (*v62)(uint64_t);
  void *v63;
  uint64_t *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  objc_msgSend(v41, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_opt_new();
  v56 = 0;
  v57 = &v56;
  v58 = 0x2050000000;
  v4 = (void *)getSYDocumentWorkflowsClientClass_softClass;
  v59 = getSYDocumentWorkflowsClientClass_softClass;
  if (!getSYDocumentWorkflowsClientClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v62 = __getSYDocumentWorkflowsClientClass_block_invoke;
    v63 = &unk_1E43FEA00;
    v64 = &v56;
    __getSYDocumentWorkflowsClientClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v57[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v56, 8);
  v46 = objc_alloc_init(v5);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v3;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v53;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v53 != v48)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v6);
        objc_msgSend(v7, "contentURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_26;
        objc_msgSend(v7, "contentURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isFileURL") & 1) == 0)
        {

LABEL_26:
          +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            -[_PSHeuristics returnDocumentToSender:].cold.1(&v50, v51, v16);
          goto LABEL_28;
        }
        objc_msgSend(v7, "contentURLSandboxExtension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
          goto LABEL_26;
        objc_msgSend(v7, "contentURLSandboxExtension");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v12, "bytes");
        sandbox_extension_consume();

        v56 = 0;
        v57 = &v56;
        v58 = 0x2050000000;
        v13 = (void *)getSYDocumentAttributesClass_softClass;
        v59 = getSYDocumentAttributesClass_softClass;
        if (!getSYDocumentAttributesClass_softClass)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v62 = __getSYDocumentAttributesClass_block_invoke;
          v63 = &unk_1E43FEA00;
          v64 = &v56;
          __getSYDocumentAttributesClass_block_invoke((uint64_t)&buf);
          v13 = (void *)v57[3];
        }
        v14 = objc_retainAutorelease(v13);
        _Block_object_dispose(&v56, 8);
        objc_msgSend(v7, "contentURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "documentAttributesForFileAtURL:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        -[NSObject sender](v16, "sender");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_24;
        +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_INFO, "Non-nil attributes fetched from Synapse", (uint8_t *)&buf, 2u);
        }

        v56 = 0;
        v57 = &v56;
        v58 = 0x2050000000;
        v20 = (void *)getSYReturnToDocumentRequestClass_softClass;
        v59 = getSYReturnToDocumentRequestClass_softClass;
        if (!getSYReturnToDocumentRequestClass_softClass)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v62 = __getSYReturnToDocumentRequestClass_block_invoke;
          v63 = &unk_1E43FEA00;
          v64 = &v56;
          __getSYReturnToDocumentRequestClass_block_invoke((uint64_t)&buf);
          v20 = (void *)v57[3];
        }
        v21 = objc_retainAutorelease(v20);
        _Block_object_dispose(&v56, 8);
        v22 = objc_alloc_init(v21);
        objc_msgSend(v22, "setDocumentAttributes:", v16);
        v23 = NSSelectorFromString(CFSTR("canPerformRequest:withError:"));
        v24 = objc_opt_respondsToSelector();
        +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
        if ((v24 & 1) != 0)
        {
          if (v26)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_INFO, "Can perform request is available from Synapse", (uint8_t *)&buf, 2u);
          }

          if ((((uint64_t (*)(id, SEL, id, _QWORD))objc_msgSend(v46, "methodForSelector:", v23))(v46, v23, v22, 0) & 1) != 0)
          {
            -[NSObject sender](v16, "sender");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = [_PSSuggestionProxy alloc];
            -[NSObject sourceBundleIdentifier](v16, "sourceBundleIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x1E0D158B8];
            objc_msgSend(v45, "handle");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "generateConversationIdFromHandle:", v44);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "handle");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[_PSConstants returnToSenderReason](_PSConstants, "returnToSenderReason");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "preferredFormattedName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handle:reason:reasonType:groupName:image:](v27, "initWithBundleID:interactionRecipients:contactID:handle:reason:reasonType:groupName:image:", v43, v29, 0, v30, v31, v33, v34, 0);

            if (v35)
            {
              objc_msgSend(v42, "addObject:", v35);

            }
LABEL_24:
            sandbox_extension_release();
            goto LABEL_28;
          }
        }
        else
        {
          if (v26)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_INFO, "Synapse SPI not available", (uint8_t *)&buf, 2u);
          }

        }
        +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "contentURL");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138477827;
          *(_QWORD *)((char *)&buf + 4) = v37;
          _os_log_impl(&dword_1A07F4000, v36, OS_LOG_TYPE_INFO, "Synapse could not perform request for %{private}@", (uint8_t *)&buf, 0xCu);

        }
LABEL_28:

        ++v6;
      }
      while (v49 != v6);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      v49 = v38;
    }
    while (v38);
  }

  if ((unint64_t)objc_msgSend(v42, "count") <= 1)
    v39 = v42;
  else
    v39 = (id)MEMORY[0x1E0C9AA60];

  return v39;
}

- (id)hourOfDayProbabilitiesToInteractWithContacts:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
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
  uint64_t n;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *context;
  id obj;
  id v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
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
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1A1AFCA24]();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v52 = (id)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v3;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
  if (v55)
  {
    v53 = *(_QWORD *)v81;
    v4 = 0x1E0C99000uLL;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v81 != v53)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
        objc_msgSend(v6, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v61 = i;
          objc_msgSend(*(id *)(v4 + 3560), "array");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "emailAddresses");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v77;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v77 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * j), "value");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v14, "length"))
                  objc_msgSend(v8, "addObject:", v14);

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
            }
            while (v11);
          }
          objc_msgSend(*(id *)(v4 + 3560), "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "phoneNumbers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v62 = v16;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v73;
            do
            {
              for (k = 0; k != v18; ++k)
              {
                if (*(_QWORD *)v73 != v19)
                  objc_enumerationMutation(v62);
                objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * k), "value");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "unformattedInternationalStringValue");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v22, "length"))
                  objc_msgSend(v15, "addObject:", v22);

              }
              v18 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
            }
            while (v18);
          }
          v57 = v15;
          v58 = v9;
          v59 = v8;
          v60 = v7;
          objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v8);
          v23 = objc_claimAutoreleasedReturnValue();
          -[_PSHeuristics interactionStore](self, "interactionStore");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)v23;
          +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:", v23, 0, &unk_1E442CB20, 0, 0, v24, 2000);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v25, "count");
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v63 = v25;
          v28 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v69;
            do
            {
              for (m = 0; m != v29; ++m)
              {
                if (*(_QWORD *)v69 != v30)
                  objc_enumerationMutation(v63);
                objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * m), "startDate");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "components:fromDate:", 32, v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v33, "hour"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v26, "objectForKeyedSubscript:", v34);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "numberWithInteger:", objc_msgSend(v36, "integerValue") + 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, v34);

              }
              v29 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
            }
            while (v29);
          }

          v38 = (void *)objc_msgSend(v26, "mutableCopy");
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v39 = v26;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v65;
            do
            {
              for (n = 0; n != v41; ++n)
              {
                if (*(_QWORD *)v65 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * n);
                v45 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v38, "objectForKeyedSubscript:", v44);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "numberWithDouble:", (double)objc_msgSend(v46, "integerValue") / (double)v54);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "setObject:forKeyedSubscript:", v47, v44);

              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
            }
            while (v41);
          }

          v7 = v60;
          objc_msgSend(v52, "setObject:forKeyedSubscript:", v38, v60);

          v4 = 0x1E0C99000;
          i = v61;
        }

      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    }
    while (v55);
  }

  objc_autoreleasePoolPop(context);
  return v52;
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

- (_CDInteractionCache)messageInteractionCache
{
  return self->_messageInteractionCache;
}

- (_CDInteractionCache)recencyCache
{
  return self->_recencyCache;
}

- (void)setRecencyCache:(id)a3
{
  objc_storeStrong((id *)&self->_recencyCache, a3);
}

- (double)recencyMargin
{
  return self->_recencyMargin;
}

- (void)setRecencyMargin:(double)a3
{
  self->_recencyMargin = a3;
}

- (NSDictionary)recencyHeuristicLimitNumberOfProxiesByReason
{
  return self->_recencyHeuristicLimitNumberOfProxiesByReason;
}

- (void)setRecencyHeuristicLimitNumberOfProxiesByReason:(id)a3
{
  objc_storeStrong((id *)&self->_recencyHeuristicLimitNumberOfProxiesByReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recencyHeuristicLimitNumberOfProxiesByReason, 0);
  objc_storeStrong((id *)&self->_recencyCache, 0);
  objc_storeStrong((id *)&self->_messageInteractionCache, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)updateModelProperties:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "recencyMargin");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v3, v4, "Recency margin: %@.", v5, v6, v7, v8, 2u);

}

- (void)seedSuggestionsForChatGuidsAndTransports:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A07F4000, log, OS_LOG_TYPE_ERROR, "chatGuidsAndTransports is not of type NSArray as expected", v1, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)hyperRecentHeuristicSuggestionProxiesWithReferenceDate:(uint64_t)a3 predictionContextBundleId:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_0(&dword_1A07F4000, a1, a3, "No recent interactions for hyper-recency heuristic.", v3);
  OUTLINED_FUNCTION_9();
}

- (void)inPhoneCallHeuristicSuggestionProxiesWithBundleIds:(os_log_t)log predictionContext:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1A07F4000, log, OS_LOG_TYPE_DEBUG, "handleList: %@, PSSuggestionProxy:%@", (uint8_t *)&v3, 0x16u);
}

- (void)returnDocumentToSender:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_0(&dword_1A07F4000, a3, (uint64_t)a3, "Attachment is not valid for Synapse processing", a1);
}

@end
