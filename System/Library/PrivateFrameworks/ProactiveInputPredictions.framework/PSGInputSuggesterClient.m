@implementation PSGInputSuggesterClient

- (void)warmUpWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSGInputSuggesterClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "warmUpWithCompletion:", v4);

}

- (id)_remoteObjectProxy
{
  return (id)-[_PASXPCClientHelper remoteObjectProxy](self->_clientHelper, "remoteObjectProxy");
}

- (PSGInputSuggesterClient)init
{
  void *v3;
  PSGInputSuggesterClient *v4;

  +[PSGStructuredInfoSuggestionCache sharedInstance](PSGStructuredInfoSuggestionCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSGInputSuggesterClient initWithStructuredInfoCache:](self, "initWithStructuredInfoCache:", v3);

  return v4;
}

- (PSGInputSuggesterClient)initWithStructuredInfoCache:(id)a3
{
  id v5;
  PSGInputSuggesterClient *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _PASXPCClientHelper *clientHelper;
  uint64_t v12;
  _PASLRUCache *triggeringCache;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSGInputSuggesterClient;
  v6 = -[PSGInputSuggesterClient init](&v15, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0313F68);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D81640]);
    psg_default_log_handle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithServiceName:whitelistedServerInterface:whitelistedClientInterface:serverInitiatedRequestHandler:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.proactive.input.suggester"), v7, 0, 0, &__block_literal_global_666, &__block_literal_global_42, v9);
    clientHelper = v6->_clientHelper;
    v6->_clientHelper = (_PASXPCClientHelper *)v10;

    objc_storeStrong((id *)&v6->_structuredSuggestionCache, a3);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 3);
    triggeringCache = v6->_triggeringCache;
    v6->_triggeringCache = (_PASLRUCache *)v12;

  }
  return v6;
}

- (id)_rkResponsesForContext:(id)a3 conversationTurns:(id)a4 languageID:(id)a5 maximumResponses:(unint64_t)a6 shouldDisableAutoCaps:(BOOL)a7 adaptationContextID:(id)a8
{
  _BOOL4 v9;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = a7;
  v13 = a4;
  v14 = a8;
  if (v9)
    v15 = 704;
  else
    v15 = 576;
  v16 = a5;
  v17 = a3;
  v18 = objc_msgSend(v13, "count");
  objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
    objc_msgSend(v19, "responsesForMessage:maximumResponses:forConversationHistory:withLanguage:options:", v17, a6, v13, v16, v15);
  else
    objc_msgSend(v19, "responsesForMessage:maximumResponses:forContext:withLanguage:options:", v17, a6, v14, v16, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_responseKitPredictionsForContext:(id)a3 bundleIdentifier:(id)a4 conversationTurns:(id)a5 languageID:(id)a6 adaptationContextID:(id)a7 shouldDisableAutoCaps:(BOOL)a8 maximumResponses:(unint64_t)a9 isBlacklisted:(BOOL)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _BOOL8 v21;
  PSGInputSuggesterClient *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  BOOL v35;
  NSObject *v36;
  uint64_t v37;
  PSGProactiveTrigger *v38;
  PSGTextualResponseSuggestion *v39;
  uint64_t v40;
  void *v41;
  id v42;
  PSGProactiveTrigger *v43;
  _BOOL8 v44;
  PSGStructuredInfoSuggestion *v45;
  PSGInputSuggestionsResponseItem *v46;
  NSObject *v47;
  PSGTextualResponseSuggestion *v49;
  void *v50;
  NSObject *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  PSGInputSuggesterClient *v59;
  __CFString *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v10 = a8;
  v69 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v56 = v16;
  v57 = (id)objc_opt_new();
  v54 = v19;
  v55 = v18;
  v21 = a10;
  v22 = self;
  v53 = v20;
  -[PSGInputSuggesterClient _rkResponsesForContext:conversationTurns:languageID:maximumResponses:shouldDisableAutoCaps:adaptationContextID:](self, "_rkResponsesForContext:conversationTurns:languageID:maximumResponses:shouldDisableAutoCaps:adaptationContextID:", v16, v18, v19, a9, v10, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v24)
  {
    v25 = v24;
    v61 = *(_QWORD *)v63;
    v58 = *MEMORY[0x1E0D87C30];
    v59 = v22;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v63 != v61)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v27, "category");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v28;
        v30 = CFSTR("UndefinedResponseKitCategory");
        if (v28)
          v30 = (__CFString *)v28;
        v31 = v30;

        objc_msgSend(v27, "attributes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSGInputSuggesterClient _maybeModifyTrigger:bundleIdentifier:](v22, "_maybeModifyTrigger:bundleIdentifier:", v32, v17);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          psg_default_log_handle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v33;
            _os_log_impl(&dword_1DBD27000, v34, OS_LOG_TYPE_INFO, "RK trigger: %@", buf, 0xCu);
          }

          if (-[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("QueryPhotoSharing")))
            v35 = !v21;
          else
            v35 = 1;
          if (!v35)
          {
            psg_default_log_handle();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1DBD27000, v47, OS_LOG_TYPE_DEBUG, "We got a deny-listed request of the photo sharing category", buf, 2u);
            }

            v46 = 0;
            goto LABEL_35;
          }
          objc_msgSend(v33, "objectForKey:", *MEMORY[0x1E0D43428]);
          v36 = objc_claimAutoreleasedReturnValue();
          if (-[NSObject isEqualToString:](v36, "isEqualToString:", v58))
          {
            -[PSGInputSuggesterClient _rewriteMoneyAttributes:](v22, "_rewriteMoneyAttributes:", v33);
            v37 = objc_claimAutoreleasedReturnValue();

            v33 = (void *)v37;
            if (!v37)
            {
              psg_default_log_handle();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v67 = 0;
                _os_log_error_impl(&dword_1DBD27000, v51, OS_LOG_TYPE_ERROR, "Ill-formatted ApplePay trigger: %@", buf, 0xCu);
              }

LABEL_33:
              v46 = 0;
LABEL_34:
              v33 = 0;
              goto LABEL_35;
            }
          }
          v60 = v31;
          v38 = -[PSGProactiveTrigger initWithSourceType:category:attributes:]([PSGProactiveTrigger alloc], "initWithSourceType:category:attributes:", 1, v31, v33);
          v39 = (PSGTextualResponseSuggestion *)v36;
          v40 = v25;
          v41 = v23;
          v42 = v17;
          v43 = v38;
          v44 = v21;
          v45 = -[PSGStructuredInfoSuggestion initWithProactiveTrigger:portraitItem:operationalItem:]([PSGStructuredInfoSuggestion alloc], "initWithProactiveTrigger:portraitItem:operationalItem:", v38, 0, 0);
          v46 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:]([PSGInputSuggestionsResponseItem alloc], "initWithTextualResponseSuggestion:structuredInfoSuggestion:", 0, v45);

          v21 = v44;
          v17 = v42;
          v23 = v41;
          v25 = v40;
        }
        else
        {
          objc_msgSend(v27, "string");
          v46 = (PSGInputSuggestionsResponseItem *)objc_claimAutoreleasedReturnValue();

          if (!v46)
            goto LABEL_34;
          if (v21)
          {
            psg_default_log_handle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DBD27000, v36, OS_LOG_TYPE_INFO, "Request is deny-listed, skipping generating textual suggestion", buf, 2u);
            }
            goto LABEL_33;
          }
          v49 = [PSGTextualResponseSuggestion alloc];
          objc_msgSend(v27, "string");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v31;
          v39 = -[PSGTextualResponseSuggestion initWithText:category:](v49, "initWithText:category:", v50, v31);

          v46 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:]([PSGInputSuggestionsResponseItem alloc], "initWithTextualResponseSuggestion:structuredInfoSuggestion:", v39, 0);
          v33 = 0;
        }

        if (v46)
          objc_msgSend(v57, "addObject:", v46);
        v22 = v59;
        v31 = v60;
LABEL_35:

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v25);
  }

  return v57;
}

- (id)_rewriteMoneyAttributes:(id)a3
{
  _QWORD *v3;
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
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)MEMORY[0x1E0D433D0];
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D433D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D87C38]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v28 = v4;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", *MEMORY[0x1E0D87C30], *MEMORY[0x1E0D43428]);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("Currency"));
      v25 = v7;
      v26 = v6;
      objc_msgSend(v6, "setValue:forKey:", v7, *v3);
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = v5;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v30;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v30 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = (void *)MEMORY[0x1E0C99E08];
              v16 = v14;
              objc_msgSend(v15, "dictionary");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "currency");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("CurrencyType"));

              v19 = objc_alloc(MEMORY[0x1E0CB3940]);
              objc_msgSend(v16, "value");
              v21 = v20;

              v22 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%.2f"), v21);
              objc_msgSend(v17, "setObject:forKey:", v22, CFSTR("CurrencyValue"));

              objc_msgSend(v8, "addObject:", v17);
            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v11);
      }

      v5 = v27;
      v4 = v28;
      v23 = v26;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_fillSuggestionsForResponseItems:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 recipientNames:(id)a6 bundleIdentifier:(id)a7 timeoutSeconds:(double)a8 structuredInfoFetchLimit:(unint64_t)a9 availableApps:(id)a10 textualResponseLimit:(unint64_t)a11 structuredInfoLimit:(unint64_t)a12 totalSuggestionsLimit:(unint64_t)a13 explanationSet:(id)a14 error:(id *)a15
{
  unint64_t v20;
  unint64_t v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  PSGInputSuggestionsResponseItem *v39;
  unint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  NSObject *v49;
  id obj;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  unint64_t v64;
  uint64_t v65;
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
  uint8_t buf[4];
  unint64_t v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v20 = a12;
  v21 = a13;
  v85 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v59 = a4;
  v58 = a5;
  v57 = a6;
  v56 = a7;
  v55 = a10;
  v54 = a14;
  +[PSGProactiveTriggerHandler sharedInstance](PSGProactiveTriggerHandler, "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_new();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v24 = v22;
  v62 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  if (v62)
  {
    v25 = 0;
    v26 = 0;
    if (a12 >= a13)
      v27 = a13;
    else
      v27 = a12;
    v60 = v27;
    v61 = *(_QWORD *)v75;
    obj = v24;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v75 != v61)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "structuredInfoSuggestion");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v63 = v29;
          objc_msgSend(v29, "proactiveTrigger");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "handleTrigger:localeIdentifier:bundleIdentifier:recipients:recipientNames:availableApps:timeoutSeconds:fetchLimit:maxSuggestions:explanationSet:error:", v30, v59, v56, v58, v57, v55, a8, a9, v20, v54, a15);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v32 = v31;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v71;
            while (2)
            {
              v36 = 0;
              v64 = v25;
              if (v60 >= v25)
                v37 = v60 - v25;
              else
                v37 = 0;
              do
              {
                if (*(_QWORD *)v71 != v35)
                  objc_enumerationMutation(v32);
                if (v37 == v36)
                {
                  v40 = v34 - 1;
                  if (v37 < v34 - 1)
                    v40 = v37;
                  v25 = v64 + v40;
                  goto LABEL_24;
                }
                v38 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v36);
                v26 |= objc_msgSend(v38, "isApplePay");
                v39 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:]([PSGInputSuggestionsResponseItem alloc], "initWithTextualResponseSuggestion:structuredInfoSuggestion:", 0, v38);
                objc_msgSend(v23, "addObject:", v39);

                ++v36;
              }
              while (v34 != v36);
              v25 = v64 + v36;
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
              if (v34)
                continue;
              break;
            }
          }
LABEL_24:

          v20 = a12;
          v29 = v63;
        }

      }
      v24 = obj;
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    }
    while (v62);

    v65 = v25;
    if (!((v25 == 0) | v26 & 1))
    {
      psg_default_log_handle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DBD27000, v41, OS_LOG_TYPE_DEBUG, "Non-ApplePay structured suggestion generated. Skipping textual ones.", buf, 2u);
      }
      goto LABEL_44;
    }
    v21 = a13;
  }
  else
  {

    v65 = 0;
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v41 = v24;
  v42 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
  if (!v42)
  {
LABEL_44:
    v44 = 0;
    goto LABEL_45;
  }
  v43 = v42;
  v44 = 0;
  v45 = *(_QWORD *)v67;
  do
  {
    for (j = 0; j != v43; ++j)
    {
      if (*(_QWORD *)v67 != v45)
        objc_enumerationMutation(v41);
      v47 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
      objc_msgSend(v47, "textualResponseSuggestion");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        if (v44 >= a11 || objc_msgSend(v23, "count") >= v21)
          goto LABEL_45;
        objc_msgSend(v23, "addObject:", v47);
        ++v44;
      }
    }
    v43 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
  }
  while (v43);
LABEL_45:

  psg_default_log_handle();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v79 = v44;
    v80 = 2048;
    v81 = v65;
    _os_log_debug_impl(&dword_1DBD27000, v49, OS_LOG_TYPE_DEBUG, "[Client] Returning %tu textual and %tu structurd predictions", buf, 0x16u);
  }

  return v23;
}

- (id)_getFTLinkShareTrigger
{
  if (_getFTLinkShareTrigger__pasOnceToken11 != -1)
    dispatch_once(&_getFTLinkShareTrigger__pasOnceToken11, &__block_literal_global_67);
  return (id)_getFTLinkShareTrigger__pasExprOnceResult;
}

- (id)_maybeModifyTrigger:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  if (_maybeModifyTrigger_bundleIdentifier___pasOnceToken14 != -1)
    dispatch_once(&_maybeModifyTrigger_bundleIdentifier___pasOnceToken14, &__block_literal_global_69);
  v8 = (id)_maybeModifyTrigger_bundleIdentifier___pasExprOnceResult;
  -[PSGInputSuggesterClient _getFTLinkShareTrigger](self, "_getFTLinkShareTrigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqualToDictionary:", v9);

  if (v10 && objc_msgSend(v7, "length") && objc_msgSend(v8, "containsObject:", v7))
  {
    psg_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DBD27000, v11, OS_LOG_TYPE_INFO, "PSGClient: FT Link share suppressed for Messages app.", v14, 2u);
    }

    v12 = 0;
  }
  else
  {
    v12 = v6;
  }

  return v12;
}

- (id)_wordBoundaryPredictionsForContext:(id)a3 localeIdentifier:(id)a4 textContentType:(id)a5 recipientNames:(id)a6 availableApps:(id)a7 request:(id)a8 explanationSet:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  PSGStructuredInfoSuggestion *v23;
  PSGInputSuggestionsResponseItem *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  dispatch_semaphore_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  PSGStructuredInfoSuggestion *v39;
  PSGInputSuggestionsResponseItem *v40;
  NSObject *v41;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  _BOOL4 v46;
  uint64_t v47;
  PSGProactiveTrigger *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  NSObject *v55;
  _BYTE *v56;
  PSGInputSuggestionsResponseItem *v57;
  uint8_t v58[4];
  uint64_t v59;
  __int16 v60;
  PSGInputSuggestionsResponseItem *v61;
  _BYTE buf[24];
  uint64_t (*v63)(uint64_t, uint64_t);
  __int128 v64;
  uint64_t v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v52 = a7;
  v51 = a8;
  v53 = a9;
  if (!objc_msgSend(v15, "length") || !objc_msgSend(v16, "length"))
  {
    psg_default_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = objc_msgSend(v15, "length");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1DBD27000, v20, OS_LOG_TYPE_DEFAULT, "Tried to get word boundary predications but either locale or context were missing {context length: %tu locale: %@}", buf, 0x16u);
    }
    goto LABEL_31;
  }
  psg_default_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = objc_msgSend(v15, "length");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2048;
    v63 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(v18, "count");
    LOWORD(v64) = 2112;
    *(_QWORD *)((char *)&v64 + 2) = v17;
    _os_log_impl(&dword_1DBD27000, v19, OS_LOG_TYPE_DEFAULT, "Context length: %tu, locale: %@, recipientNames count: %tu, textContentType: %@", buf, 0x2Au);
  }

  if (!objc_msgSend(v18, "count"))
  {
LABEL_13:
    objc_msgSend((id)objc_opt_class(), "_getQueryFieldFromTextContentType:", v17);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v27 = (void *)MEMORY[0x1DF0B9950]();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("​"), &stru_1EA3F1D80);
      v30 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v27);
      if (-[NSObject length](v30, "length"))
      {
        objc_msgSend((id)objc_opt_class(), "_getContactsAutocompleteItemForQueryField:searchTerm:localeIdentifier:", v20, v30, v16);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = (void *)v31;
        if (v31)
        {
          v65 = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
          v26 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_32;
        }
      }
    }
    else
    {
      psg_default_log_handle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_debug_impl(&dword_1DBD27000, v30, OS_LOG_TYPE_DEBUG, "Unsupported textContentType for Keyboard Contacts Autocomplete: %@", buf, 0xCu);
      }
    }

    if (objc_msgSend(v17, "length"))
    {
      psg_default_log_handle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DBD27000, v33, OS_LOG_TYPE_DEBUG, "Word boundary prediction disabled for tagged text field", buf, 2u);
      }
LABEL_30:

LABEL_31:
      v26 = 0;
      goto LABEL_32;
    }
    if ((objc_msgSend((id)objc_opt_class(), "_shouldGenerateWordBoundaryPredictionsForContext:localeIdentifier:", v15, v16) & 1) == 0)
    {
      psg_default_log_handle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DBD27000, v33, OS_LOG_TYPE_DEBUG, "Word boundary prediction disabled by _shouldGenerate check", buf, 2u);
      }
      goto LABEL_30;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v63 = __Block_byref_object_copy__635;
    *(_QWORD *)&v64 = __Block_byref_object_dispose__636;
    *((_QWORD *)&v64 + 1) = 0;
    v34 = dispatch_semaphore_create(0);
    -[PSGInputSuggesterClient _remoteObjectProxy](self, "_remoteObjectProxy");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __147__PSGInputSuggesterClient__wordBoundaryPredictionsForContext_localeIdentifier_textContentType_recipientNames_availableApps_request_explanationSet___block_invoke;
    v54[3] = &unk_1EA3F0EB0;
    v56 = buf;
    v36 = v34;
    v55 = v36;
    objc_msgSend(v35, "inputSuggestionsWithRequest:completion:", v51, v54);

    +[PSGWordBoundaryFSTGrammar sharedInstance](PSGWordBoundaryFSTGrammar, "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "triggerAttributesForContext:localeIdentifier:", v15, v16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bundleIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGInputSuggesterClient _maybeModifyTrigger:bundleIdentifier:](self, "_maybeModifyTrigger:bundleIdentifier:", v37, v38);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v48 = -[PSGProactiveTrigger initWithSourceType:category:attributes:]([PSGProactiveTrigger alloc], "initWithSourceType:category:attributes:", 0, CFSTR("LMWordBoundaryTriggerCategory"), v50);
      v39 = -[PSGStructuredInfoSuggestion initWithProactiveTrigger:portraitItem:operationalItem:]([PSGStructuredInfoSuggestion alloc], "initWithProactiveTrigger:portraitItem:operationalItem:", v48, 0, 0);
      v40 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:]([PSGInputSuggestionsResponseItem alloc], "initWithTextualResponseSuggestion:structuredInfoSuggestion:", 0, v39);
      psg_default_log_handle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v58 = 138412546;
        v59 = (uint64_t)v50;
        v60 = 2112;
        v61 = v40;
        _os_log_impl(&dword_1DBD27000, v41, OS_LOG_TYPE_INFO, "Word-boundary trigger: %@ returning response item with proactive trigger %@", v58, 0x16u);
      }

      v57 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v36, 0.1) == 1)
      {
        psg_default_log_handle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v58 = 134217984;
          v59 = 0x3FB999999999999ALL;
          _os_log_impl(&dword_1DBD27000, v43, OS_LOG_TYPE_DEFAULT, "[WordBoundary] Timed out trying to fetch ml results (threshold: %.3f s)", v58, 0xCu);
        }

        -[PSGInputSuggesterClient logErrorForRequest:trigger:errorType:](self, "logErrorForRequest:trigger:errorType:", v51, 0, 1);
        objc_msgSend(v53, "pushInternalExplanationCode:", 7);
      }
      else
      {
        v44 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
        psg_default_log_handle();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG);
        if (v44)
        {
          if (v46)
          {
            v47 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
            *(_DWORD *)v58 = 134217984;
            v59 = v47;
            _os_log_debug_impl(&dword_1DBD27000, v45, OS_LOG_TYPE_DEBUG, "[WordBoundary] No results from fst grammar but has %tu ML item(s)", v58, 0xCu);
          }

          v26 = *(id *)(*(_QWORD *)&buf[8] + 40);
          goto LABEL_45;
        }
        if (v46)
        {
          *(_WORD *)v58 = 0;
          _os_log_debug_impl(&dword_1DBD27000, v45, OS_LOG_TYPE_DEBUG, "[WordBoundary] No results from either FST or ML", v58, 2u);
        }

      }
      v26 = 0;
    }
LABEL_45:

    _Block_object_dispose(buf, 8);
    goto LABEL_32;
  }
  +[PSGNameMentionsHandler sharedInstance](PSGNameMentionsHandler, "sharedInstance");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1DF0B9950]();
  -[NSObject getNameMentionsTriggerForContext:recipientNames:availableApps:localeIdentifier:explanationSet:](v20, "getNameMentionsTriggerForContext:recipientNames:availableApps:localeIdentifier:explanationSet:", v15, v18, v52, v16, v53);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v21);
  if (!v22)
  {

    goto LABEL_13;
  }
  v23 = -[PSGStructuredInfoSuggestion initWithProactiveTrigger:portraitItem:operationalItem:]([PSGStructuredInfoSuggestion alloc], "initWithProactiveTrigger:portraitItem:operationalItem:", v22, 0, 0);
  v24 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:]([PSGInputSuggestionsResponseItem alloc], "initWithTextualResponseSuggestion:structuredInfoSuggestion:", 0, v23);
  psg_default_log_handle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBD27000, v25, OS_LOG_TYPE_DEFAULT, "Returning NameMentions trigger", buf, 2u);
  }

  v66[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 1);
  v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
  return v26;
}

- (id)_combineMLAndRKItems:(id)a3 mlItems:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  psg_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v42 = objc_msgSend(v5, "count");
    v43 = 2048;
    v44 = objc_msgSend(v6, "count");
    _os_log_debug_impl(&dword_1DBD27000, v7, OS_LOG_TYPE_DEBUG, "[Client] combining %tu rk item(s) & %tu ml item(s)", buf, 0x16u);
  }

  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v5, "count"))
    {
      v34 = v6;
      v35 = v5;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v37 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v13, "textualResponseSuggestion", v34);
            v14 = objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = (void *)v14;
              objc_msgSend(v13, "textualResponseSuggestion");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "responseCategory");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("QueryAlternative"));

              if (v18)
              {
                psg_default_log_handle();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1DBD27000, v24, OS_LOG_TYPE_INFO, "[Client] rk query alternative category found, discarding ml results", buf, 2u);
                }
                goto LABEL_29;
              }
            }
            objc_msgSend(v13, "structuredInfoSuggestion");
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = (void *)v19;
              objc_msgSend(v13, "structuredInfoSuggestion");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "proactiveTrigger");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
              {
                psg_default_log_handle();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v13, "structuredInfoSuggestion");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "proactiveTrigger");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "triggerAttributes");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v42 = (uint64_t)v27;
                  _os_log_impl(&dword_1DBD27000, v24, OS_LOG_TYPE_INFO, "[Client] rk proactive trigger (%@) found, discarding ml results", buf, 0xCu);

                }
LABEL_29:
                v6 = v34;
                v5 = v35;

                psg_default_log_handle();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  v31 = objc_msgSend(v8, "count");
                  *(_DWORD *)buf = 134217984;
                  v42 = v31;
                  _os_log_debug_impl(&dword_1DBD27000, v23, OS_LOG_TYPE_DEBUG, "[Client] proactive trigger or alternative category is matched -- using rk results (%tu)", buf, 0xCu);
                }
                goto LABEL_31;
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v10)
            continue;
          break;
        }
      }

      psg_default_log_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      v6 = v34;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v33 = objc_msgSend(v34, "count");
        *(_DWORD *)buf = 134217984;
        v42 = v33;
        _os_log_debug_impl(&dword_1DBD27000, v23, OS_LOG_TYPE_DEBUG, "[Client] discarding rk responses and using ml results (%tu)", buf, 0xCu);
      }
      v8 = v34;
      v5 = v35;
    }
    else
    {
      psg_default_log_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v32 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 134217984;
        v42 = v32;
        _os_log_debug_impl(&dword_1DBD27000, v23, OS_LOG_TYPE_DEBUG, "[Client] no rk responses and using ml results (%tu)", buf, 0xCu);
      }
      v8 = v6;
    }
  }
  else
  {
    psg_default_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v30 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v42 = v30;
      _os_log_debug_impl(&dword_1DBD27000, v23, OS_LOG_TYPE_DEBUG, "[Client] no ml items, returning rk results (%tu)", buf, 0xCu);
    }
    v8 = v5;
  }
LABEL_31:

  v28 = v8;
  return v28;
}

- (id)_getZKWResultsForRequest:(id)a3 explanationSet:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  BOOL v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  _QWORD v39[4];
  NSObject *v40;
  _BYTE *v41;
  void *v42;
  uint8_t v43[4];
  uint64_t v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v36 = a4;
  objc_msgSend(v5, "responseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContentType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length") && !objc_msgSend(v37, "length"))
  {
    psg_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBD27000, v7, OS_LOG_TYPE_INFO, "[ZKW] Response context and content type are both empty.", buf, 2u);
    }

  }
  psg_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v6, "length");
    objc_msgSend(v5, "localeIdentifier");
    v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 2112;
    v46 = v10;
    _os_log_impl(&dword_1DBD27000, v8, OS_LOG_TYPE_INFO, "Response context length: %tu, text content type: %@, locale: %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy__635;
  v47 = __Block_byref_object_dispose__636;
  v48 = 0;
  if (!objc_msgSend(v6, "length")
    && (objc_msgSend(v5, "conversationTurns"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count") == 0,
        v11,
        v12))
  {
    v23 = 0;
  }
  else
  {
    v13 = dispatch_semaphore_create(0);
    -[PSGInputSuggesterClient _remoteObjectProxy](self, "_remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __67__PSGInputSuggesterClient__getZKWResultsForRequest_explanationSet___block_invoke;
    v39[3] = &unk_1EA3F0EB0;
    v41 = buf;
    v15 = v13;
    v40 = v15;
    objc_msgSend(v14, "inputSuggestionsWithRequest:completion:", v5, v39);

    objc_msgSend(v5, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "responseKitConversationTurns");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adaptationContextID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v5, "shouldDisableAutoCaps");
    v21 = objc_msgSend(v5, "textualResponseLimit");
    v22 = objc_msgSend(v5, "structuredInfoLimit");
    LOBYTE(v35) = objc_msgSend(v5, "isResponseContextBlacklisted");
    -[PSGInputSuggesterClient _responseKitPredictionsForContext:bundleIdentifier:conversationTurns:languageID:adaptationContextID:shouldDisableAutoCaps:maximumResponses:isBlacklisted:](self, "_responseKitPredictionsForContext:bundleIdentifier:conversationTurns:languageID:adaptationContextID:shouldDisableAutoCaps:maximumResponses:isBlacklisted:", v6, v16, v17, v18, v19, v20, v22 + v21, v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v15, 0.1) == 1)
    {
      psg_default_log_handle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v43 = 134217984;
        v44 = 0x3FB999999999999ALL;
        _os_log_impl(&dword_1DBD27000, v24, OS_LOG_TYPE_DEFAULT, "[ZKW] timed out trying to fetch ML results (threshold: %.3f s)", v43, 0xCu);
      }

      -[PSGInputSuggesterClient logErrorForRequest:trigger:errorType:](self, "logErrorForRequest:trigger:errorType:", v5, 0, 2);
      objc_msgSend(v36, "pushInternalExplanationCode:", 7);
    }

  }
  if (objc_msgSend(v37, "length")
    && (objc_msgSend(v5, "textContentType"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PSGInputSuggesterClient _appConnectionTriggerForTextContentType:](self, "_appConnectionTriggerForTextContentType:", v25), v26 = (void *)objc_claimAutoreleasedReturnValue(), v25, v26))
  {
    v42 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGInputSuggesterClient _combineMLAndRKItems:mlItems:](self, "_combineMLAndRKItems:mlItems:", v23, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v29;
    }

  }
  else
  {
    -[PSGInputSuggesterClient _combineMLAndRKItems:mlItems:](self, "_combineMLAndRKItems:mlItems:", v23, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
  }
  if (objc_msgSend(v6, "length")
    || !objc_msgSend((id)objc_opt_class(), "_zkwItemsContainsOnlyTextualResponses:", v27))
  {
    psg_default_log_handle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v34 = objc_msgSend(v27, "count");
      *(_DWORD *)v43 = 134217984;
      v44 = v34;
      _os_log_debug_impl(&dword_1DBD27000, v32, OS_LOG_TYPE_DEBUG, "[ZKW] %tu zkw item(s)", v43, 0xCu);
    }

    v31 = v27;
  }
  else
  {
    psg_default_log_handle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_1DBD27000, v30, OS_LOG_TYPE_INFO, "[ZKW] Not providing responses for outgoing turns because there are no structured items", v43, 2u);
    }

    v31 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v31;
}

- (id)_getWordBoundaryResultForRequest:(id)a3 explanationSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contextBeforeInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "contextBeforeInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textContentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipientNames");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "availableApps");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGInputSuggesterClient _wordBoundaryPredictionsForContext:localeIdentifier:textContentType:recipientNames:availableApps:request:explanationSet:](self, "_wordBoundaryPredictionsForContext:localeIdentifier:textContentType:recipientNames:availableApps:request:explanationSet:", v9, v10, v11, v12, v13, v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    psg_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBD27000, v15, OS_LOG_TYPE_DEFAULT, "Client document isn't empty, but no context before input", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (id)_textualSuggestionsAndTriggersForRequest:(id)a3 explanationSet:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  psg_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v22) = 0;
    _os_log_debug_impl(&dword_1DBD27000, v8, OS_LOG_TYPE_DEBUG, "Client called to _textualSuggestionsAndTriggersForRequest", (uint8_t *)&v22, 2u);
  }

  objc_msgSend(v6, "conversationTurns");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (objc_msgSend(v10, "senderID"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "length"),
        v11,
        !v12))
  {
    psg_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_debug_impl(&dword_1DBD27000, v16, OS_LOG_TYPE_DEBUG, "[Client] Not returning responses because the last conversation turn has an ambiguous sender", (uint8_t *)&v22, 2u);
    }
    v17 = 0;
  }
  else
  {
    -[_PASLRUCache objectForKey:](self->_triggeringCache, "objectForKey:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      psg_default_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v20 = objc_msgSend(v14, "count");
        v22 = 134218242;
        v23 = v20;
        v24 = 2112;
        v25 = v14;
        _os_log_debug_impl(&dword_1DBD27000, v15, OS_LOG_TYPE_DEBUG, "[Client] returning from triggeringCache (%tu): %@", (uint8_t *)&v22, 0x16u);
      }

    }
    else
    {
      if (objc_msgSend(v6, "isDocumentEmpty"))
        -[PSGInputSuggesterClient _getZKWResultsForRequest:explanationSet:](self, "_getZKWResultsForRequest:explanationSet:", v6, v7);
      else
        -[PSGInputSuggesterClient _getWordBoundaryResultForRequest:explanationSet:](self, "_getWordBoundaryResultForRequest:explanationSet:", v6, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      psg_default_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v21 = objc_msgSend(v14, "count");
        v22 = 134218242;
        v23 = v21;
        v24 = 2112;
        v25 = v14;
        _os_log_debug_impl(&dword_1DBD27000, v18, OS_LOG_TYPE_DEBUG, "[Client] got %tu textual suggestions or triggers: %@", (uint8_t *)&v22, 0x16u);
      }

      if (objc_msgSend(v14, "count") || (objc_msgSend(v7, "hasTriggeringXPCTimeout") & 1) == 0)
        -[_PASLRUCache setObject:forKey:](self->_triggeringCache, "setObject:forKey:", v14, v6);
    }
    v16 = v14;
    v17 = v16;
  }

  return v17;
}

- (id)_appConnectionTriggerForTextContentType:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  PSGProactiveTrigger *v6;
  PSGStructuredInfoSuggestion *v7;
  PSGInputSuggestionsResponseItem *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    psg_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_debug_impl(&dword_1DBD27000, v4, OS_LOG_TYPE_DEBUG, "Client creating an app connection trigger for tagged text field: %@", (uint8_t *)&v10, 0xCu);
    }

    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setValue:forKey:", CFSTR("triggerTypeConnections"), *MEMORY[0x1E0D43428]);
    objc_msgSend(v5, "setValue:forKey:", v3, CFSTR("textContentTypeTag"));
    v6 = -[PSGProactiveTrigger initWithSourceType:category:attributes:]([PSGProactiveTrigger alloc], "initWithSourceType:category:attributes:", 2, CFSTR("TaggedTextFieldMeCard"), v5);
    v7 = -[PSGStructuredInfoSuggestion initWithProactiveTrigger:portraitItem:operationalItem:]([PSGStructuredInfoSuggestion alloc], "initWithProactiveTrigger:portraitItem:operationalItem:", v6, 0, 0);
    v8 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:]([PSGInputSuggestionsResponseItem alloc], "initWithTextualResponseSuggestion:structuredInfoSuggestion:", 0, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_cachedStructuredSuggestionsForContext:(id)a3 localeIdentifier:(id)a4 maxSuggestions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PSGInputSuggestionsResponseItem *v18;
  PSGInputSuggestionsResponseItem *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    -[PSGStructuredInfoSuggestionCache searchWithContext:localeIdentifier:maxSuggestions:](self->_structuredSuggestionCache, "searchWithContext:localeIdentifier:maxSuggestions:", v8, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_opt_new();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
            v18 = [PSGInputSuggestionsResponseItem alloc];
            v19 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:](v18, "initWithTextualResponseSuggestion:structuredInfoSuggestion:", 0, v17, (_QWORD)v21);
            objc_msgSend(v11, "addObject:", v19);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)inputSuggestionsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, PSGInputSuggestionsResponse *, id);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  double v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  double v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  double v48;
  unint64_t v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  PSGInputSuggesterClient *v55;
  uint64_t v56;
  PSGInputSuggesterClient *v57;
  void *v58;
  double v59;
  double v60;
  NSObject *v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  double v66;
  PSGInputSuggestionsResponse *v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  os_signpost_id_t spid;
  void *v76;
  void (**v77)(id, PSGInputSuggestionsResponse *, id);
  unint64_t v78;
  uint64_t v79;
  void *v80;
  PSGInputSuggesterClient *v81;
  uint64_t v82;
  _QWORD v83[5];
  id v84;
  id v85;
  id v86;
  uint8_t buf[4];
  double v88;
  __int16 v89;
  double v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, PSGInputSuggestionsResponse *, id))a4;
  psg_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1DBD27000, v8, OS_LOG_TYPE_DEBUG, "[Client] inputSuggestionsWithRequest called", buf, 2u);
  }

  if (inputSuggestionsWithRequest_completion__onceToken != -1)
    dispatch_once(&inputSuggestionsWithRequest_completion__onceToken, &__block_literal_global_93);
  v9 = mach_absolute_time();
  objc_msgSend(v6, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localeIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[PSGUtilities sharedInstance](PSGUtilities, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "prewarmCacheForLocale:usingQueue:", v12, inputSuggestionsWithRequest_completion__prewarmQueue);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  objc_msgSend(v6, "textContentType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  v82 = v9;
  if (v18)
  {
    psg_default_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DBD27000, v19, OS_LOG_TYPE_DEBUG, "Skip prefix-based structured info cache lookup for tagged text field.", buf, 2u);
    }
    v20 = 0;
  }
  else
  {
    objc_msgSend(v6, "contextBeforeInput");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGInputSuggesterClient _cachedStructuredSuggestionsForContext:localeIdentifier:maxSuggestions:](self, "_cachedStructuredSuggestionsForContext:localeIdentifier:maxSuggestions:", v19, v21, objc_msgSend(v6, "structuredInfoLimit"));
    v20 = objc_claimAutoreleasedReturnValue();

  }
  v22 = -[NSObject count](v20, "count");
  psg_default_log_handle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v81 = self;
  if (v22)
  {
    v25 = -1.0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v26 = -[NSObject count](v20, "count");
      *(_DWORD *)buf = 134217984;
      v88 = *(double *)&v26;
      _os_log_impl(&dword_1DBD27000, v24, OS_LOG_TYPE_INFO, "Got %tu item(s) from structured suggestions cache", buf, 0xCu);
    }
    v27 = 0;
    v28 = 0xFFFFFFFFLL;
    v29 = -1.0;
  }
  else
  {
    v80 = v16;
    v30 = os_signpost_id_generate(v23);

    psg_default_log_handle();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBD27000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PSGInputSuggesterClient_inputSuggestionsWithRequest_triggering", (const char *)&unk_1DBD3C55A, buf, 2u);
    }

    v33 = mach_absolute_time();
    -[PSGInputSuggesterClient _textualSuggestionsAndTriggersForRequest:explanationSet:](self, "_textualSuggestionsAndTriggersForRequest:explanationSet:", v6, v80);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = *(double *)&inputSuggestionsWithRequest_completion__timeMillisMultiplier
        * (double)(mach_absolute_time() - v33);
    psg_default_log_handle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v88 = v25;
      _os_log_debug_impl(&dword_1DBD27000, v34, OS_LOG_TYPE_DEBUG, "[Client] Triggering time: %.1f ms", buf, 0xCu);
    }

    psg_default_log_handle();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBD27000, v36, OS_SIGNPOST_INTERVAL_END, v30, "PSGInputSuggesterClient_inputSuggestionsWithRequest_triggering", (const char *)&unk_1DBD3C55A, buf, 2u);
    }

    v79 = -[NSObject count](v24, "count");
    psg_default_log_handle();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = os_signpost_id_generate(v37);

    psg_default_log_handle();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v39;
    v78 = v38 - 1;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBD27000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v38, "PSGInputSuggesterClient_inputSuggestionsWithRequest_serving", (const char *)&unk_1DBD3C55A, buf, 2u);
    }
    spid = v38;

    v41 = -[NSObject count](v24, "count");
    psg_default_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    v16 = v80;
    if (v41)
    {
      v76 = v15;
      v77 = v7;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v44 = -[NSObject count](v24, "count");
        *(_DWORD *)buf = 134217984;
        v88 = *(double *)&v44;
        _os_log_impl(&dword_1DBD27000, v43, OS_LOG_TYPE_DEFAULT, "[Client] Triggered %tu item(s)", buf, 0xCu);
      }

      -[PSGInputSuggesterClient _logTriggerForItems:request:](self, "_logTriggerForItems:request:", v24, v6);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = mach_absolute_time();
      objc_msgSend(v6, "textContentType");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length");

      v47 = objc_msgSend(v6, "structuredInfoLimit");
      if (v46)
        v48 = 0.5;
      else
        v48 = 0.2;
      v49 = 100;
      if (!v46)
        v49 = 10;
      v50 = v24;
      if (v49 <= v47)
        v49 = v47;
      v72 = v49;
      objc_msgSend(v6, "recipients");
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recipientNames");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "availableApps");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = self;
      v56 = objc_msgSend(v6, "textualResponseLimit");
      v86 = 0;
      v16 = v80;
      v70 = objc_msgSend(v6, "structuredInfoLimit");
      v71 = objc_msgSend(v6, "totalSuggestionsLimit");
      v57 = v55;
      v58 = (void *)v51;
      -[PSGInputSuggesterClient _fillSuggestionsForResponseItems:localeIdentifier:recipients:recipientNames:bundleIdentifier:timeoutSeconds:structuredInfoFetchLimit:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:explanationSet:error:](v57, "_fillSuggestionsForResponseItems:localeIdentifier:recipients:recipientNames:bundleIdentifier:timeoutSeconds:structuredInfoFetchLimit:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:explanationSet:error:", v50, v12, v51, v52, v53, v72, v48, v54, v56, v70, v71, v80, &v86);
      v24 = objc_claimAutoreleasedReturnValue();
      v27 = v86;

      v59 = (double)(mach_absolute_time() - v74);
      v60 = *(double *)&inputSuggestionsWithRequest_completion__timeMillisMultiplier;
      if (v73 && objc_msgSend(v80, "count"))
      {
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __66__PSGInputSuggesterClient_inputSuggestionsWithRequest_completion___block_invoke_97;
        v83[3] = &unk_1EA3F0F58;
        v83[4] = v81;
        v84 = v6;
        v85 = v73;
        objc_msgSend(v80, "enumerateExplanationCodeWithBlock:", v83);

      }
      v29 = v60 * v59;
      psg_default_log_handle();
      v61 = objc_claimAutoreleasedReturnValue();
      v15 = v76;
      v7 = v77;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v62 = -[NSObject count](v24, "count");
        *(_DWORD *)buf = 134218240;
        v88 = *(double *)&v62;
        v89 = 2048;
        v90 = v29;
        _os_log_impl(&dword_1DBD27000, v61, OS_LOG_TYPE_DEFAULT, "[Client] Predicted %tu item(s). Serving time: %.1f ms", buf, 0x16u);
      }

    }
    else
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DBD27000, v43, OS_LOG_TYPE_DEBUG, "[Client] No triggering item.", buf, 2u);
      }

      v29 = -1.0;
      if (!objc_msgSend(v80, "count"))
        objc_msgSend(v80, "pushInternalExplanationCode:", 5);
      v27 = 0;
    }
    psg_default_log_handle();
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBD27000, v64, OS_SIGNPOST_INTERVAL_END, spid, "PSGInputSuggesterClient_inputSuggestionsWithRequest_serving", (const char *)&unk_1DBD3C55A, buf, 2u);
    }

    if (!v27)
    {
      v28 = v79;
      goto LABEL_57;
    }
    psg_default_log_handle();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v88 = *(double *)&v27;
      _os_log_error_impl(&dword_1DBD27000, v65, OS_LOG_TYPE_ERROR, "[Client] error: %@", buf, 0xCu);
    }

    v20 = 0;
    v28 = v79;
  }

  v24 = v20;
LABEL_57:
  v66 = *(double *)&inputSuggestionsWithRequest_completion__timeMillisMultiplier * (double)(mach_absolute_time() - v82);
  v67 = -[PSGInputSuggestionsResponse initWithResponseItems:explanationSet:]([PSGInputSuggestionsResponse alloc], "initWithResponseItems:explanationSet:", v24, v16);
  -[PSGInputSuggestionsResponse setTriggeringTimeMillis:](v67, "setTriggeringTimeMillis:", v25);
  -[PSGInputSuggestionsResponse setTriggeredItemsCount:](v67, "setTriggeredItemsCount:", v28);
  -[PSGInputSuggestionsResponse setServingTimeMillis:](v67, "setServingTimeMillis:", v29);
  if (-[NSObject count](v24, "count") || (objc_msgSend(v16, "hasPETLoggingData") & 1) != 0)
  {
    -[PSGInputSuggesterClient logPrediction:request:latencyMillis:](v81, "logPrediction:request:latencyMillis:", v67, v6, v66);
  }
  else
  {
    psg_default_log_handle();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DBD27000, v69, OS_LOG_TYPE_DEBUG, "[Client] Skip logging predictions due to empty item set and unworthy explanation set", buf, 2u);
    }

  }
  psg_default_log_handle();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v88 = v66;
    _os_log_impl(&dword_1DBD27000, v68, OS_LOG_TYPE_DEFAULT, "[Client] Total prediction time: %.1f ms", buf, 0xCu);
  }

  v7[2](v7, v67, v27);
  if (v15)
    dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)logTrigger:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PSGInputSuggesterClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logTrigger:request:", v7, v6);

}

- (void)logPrediction:(id)a3 request:(id)a4 latencyMillis:(double)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[PSGInputSuggesterClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logPrediction:request:latencyMillis:", v9, v8, a5);

}

- (void)logImpression:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PSGInputSuggesterClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logImpression:request:", v7, v6);

}

- (void)logEngagement:(id)a3 request:(id)a4 position:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[PSGInputSuggesterClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEngagement:request:position:", v9, v8, a5);

}

- (void)logErrorForRequest:(id)a3 trigger:(id)a4 errorType:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[PSGInputSuggesterClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logErrorForRequest:trigger:errorType:", v9, v8, v5);

}

- (id)_logTriggerForItems:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "structuredInfoSuggestion", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "structuredInfoSuggestion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "proactiveTrigger");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[PSGInputSuggesterClient logTrigger:request:](self, "logTrigger:request:", v16, v7);
            goto LABEL_12;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (void)logSpeedMetricForLocaleIdentifier:(id)a3 messageDurationMilliseconds:(int)a4 messageLength:(int)a5 messageWords:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v10 = a3;
  -[PSGInputSuggesterClient _remoteObjectProxy](self, "_remoteObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logSpeedMetricForLocaleIdentifier:messageDurationMilliseconds:messageLength:messageWords:", v10, v8, v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggeringCache, 0);
  objc_storeStrong((id *)&self->_structuredSuggestionCache, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

uint64_t __66__PSGInputSuggesterClient_inputSuggestionsWithRequest_completion___block_invoke_97(uint64_t result, int a2)
{
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "logErrorForRequest:trigger:errorType:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), 3);
  return result;
}

void __66__PSGInputSuggesterClient_inputSuggestionsWithRequest_completion___block_invoke()
{
  uint64_t v0;
  void *v1;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  *(double *)&inputSuggestionsWithRequest_completion__timeMillisMultiplier = (double)(info.numer
                                                                                                  / info.denom)
                                                                           * 0.000001;
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PSG-label-prewarm", 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)inputSuggestionsWithRequest_completion__prewarmQueue;
  inputSuggestionsWithRequest_completion__prewarmQueue = v0;

}

void __67__PSGInputSuggesterClient__getZKWResultsForRequest_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    psg_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = (uint64_t)v6;
      _os_log_error_impl(&dword_1DBD27000, v7, OS_LOG_TYPE_ERROR, "[ZKW] Error from triggering XPC: %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v5)
  {
    objc_msgSend(v5, "responseItems");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    psg_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
      v12 = 134217984;
      v13 = v11;
      _os_log_debug_impl(&dword_1DBD27000, v7, OS_LOG_TYPE_DEBUG, "[ZKW] xpc call returned %tu ML item(s)", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __147__PSGInputSuggesterClient__wordBoundaryPredictionsForContext_localeIdentifier_textContentType_recipientNames_availableApps_request_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    psg_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_1DBD27000, v7, OS_LOG_TYPE_ERROR, "[WordBoundary] Error from triggering XPC: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (!v5)
      goto LABEL_5;
    objc_msgSend(v5, "responseItems");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    psg_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1DBD27000, v7, OS_LOG_TYPE_INFO, "Client word boundary ml items %@", (uint8_t *)&v12, 0xCu);
    }
  }

LABEL_5:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __64__PSGInputSuggesterClient__maybeModifyTrigger_bundleIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = (void *)MEMORY[0x1DF0B9950]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.MobileSMS.MessagesNotificationExtension"), 0);
  objc_autoreleasePoolPop(v1);
  v3 = (void *)_maybeModifyTrigger_bundleIdentifier___pasExprOnceResult;
  _maybeModifyTrigger_bundleIdentifier___pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

void __49__PSGInputSuggesterClient__getFTLinkShareTrigger__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = *MEMORY[0x1E0D43430];
  v2 = *MEMORY[0x1E0D43400];
  v6[0] = *MEMORY[0x1E0D43428];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0D43310];
  v7[0] = v1;
  v7[1] = v3;
  v6[2] = *MEMORY[0x1E0D432C8];
  v7[2] = *MEMORY[0x1E0D432A0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_getFTLinkShareTrigger__pasExprOnceResult;
  _getFTLinkShareTrigger__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

void __55__PSGInputSuggesterClient_initWithStructuredInfoCache___block_invoke_41()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  psg_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.proactive.input.suggester");
    _os_log_impl(&dword_1DBD27000, v0, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }

}

void __55__PSGInputSuggesterClient_initWithStructuredInfoCache___block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  psg_default_log_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.proactive.input.suggester");
    _os_log_error_impl(&dword_1DBD27000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }

}

+ (PSGInputSuggesterClient)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PSGInputSuggesterClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken4 != -1)
    dispatch_once(&sharedInstance__pasOnceToken4, block);
  return (PSGInputSuggesterClient *)(id)sharedInstance__pasExprOnceResult_687;
}

+ (BOOL)_shouldGenerateWordBoundaryPredictionsForContext:(id)a3 localeIdentifier:(id)a4
{
  id v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(a4, "hasPrefix:", CFSTR("zh")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v5, "length") - 1);
    objc_msgSend(v5, "substringWithRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v10) != 0x7FFFFFFFFFFFFFFFLL;

  }
  return v6;
}

+ (id)_getQueryFieldFromTextContentType:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (_getQueryFieldFromTextContentType__once != -1)
    dispatch_once(&_getQueryFieldFromTextContentType__once, &__block_literal_global_84);
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend((id)_getQueryFieldFromTextContentType__map, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)_allowSingleCharacterContactsAutocompleteTriggerForLanguage:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("zh")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ko")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ja"));
  }

  return v4;
}

+ (id)_getContactsAutocompleteItemForQueryField:(id)a3 searchTerm:(id)a4 localeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  PSGProactiveTrigger *v14;
  PSGStructuredInfoSuggestion *v15;
  PSGInputSuggestionsResponseItem *v16;
  NSObject *v17;
  _QWORD v19[3];
  _QWORD v20[3];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v11, 0, 0, 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    psg_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DBD27000, v13, OS_LOG_TYPE_DEBUG, "SearchTerm starts with a digit. Suppress ContactsAutocomplete trigger.", buf, 2u);
    }
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "length") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
    v13 = objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(a1, "_allowSingleCharacterContactsAutocompleteTriggerForLanguage:", v13) & 1) != 0)
    {

      goto LABEL_5;
    }
    psg_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_debug_impl(&dword_1DBD27000, v17, OS_LOG_TYPE_DEBUG, "Single character SearchTerm for locale %@. Suppress ContactsAutocomplete trigger.", buf, 0xCu);
    }

LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
LABEL_5:
  v19[0] = *MEMORY[0x1E0D43428];
  v19[1] = CFSTR("SearchField");
  v20[0] = CFSTR("ContactsAutocomplete");
  v20[1] = v8;
  v19[2] = CFSTR("SearchTerm");
  v20[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = -[PSGProactiveTrigger initWithSourceType:category:attributes:]([PSGProactiveTrigger alloc], "initWithSourceType:category:attributes:", 2, CFSTR("TaggedTextFieldContactsAutocomplete"), v13);
  v15 = -[PSGStructuredInfoSuggestion initWithProactiveTrigger:portraitItem:operationalItem:]([PSGStructuredInfoSuggestion alloc], "initWithProactiveTrigger:portraitItem:operationalItem:", v14, 0, 0);
  v16 = -[PSGInputSuggestionsResponseItem initWithTextualResponseSuggestion:structuredInfoSuggestion:]([PSGInputSuggestionsResponseItem alloc], "initWithTextualResponseSuggestion:structuredInfoSuggestion:", 0, v15);

LABEL_12:
  return v16;
}

+ (BOOL)_zkwItemsContainsOnlyTextualResponses:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  psg_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1DBD27000, v4, OS_LOG_TYPE_DEBUG, "Checking for any structured suggestions.", buf, 2u);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "structuredInfoSuggestion", (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          psg_default_log_handle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "structuredInfoSuggestion");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "proactiveTrigger");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "triggerCategory");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v23 = v17;
            _os_log_debug_impl(&dword_1DBD27000, v13, OS_LOG_TYPE_DEBUG, "--- found one of category: %@", buf, 0xCu);

          }
          v12 = 0;
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_15:

  return v12;
}

void __61__PSGInputSuggesterClient__getQueryFieldFromTextContentType___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("tel");
  v2[1] = CFSTR("email");
  v3[0] = &unk_1EA3F47D8;
  v3[1] = &unk_1EA3F47F0;
  v2[2] = CFSTR("street-address");
  v3[2] = &unk_1EA3F4808;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_getQueryFieldFromTextContentType__map;
  _getQueryFieldFromTextContentType__map = v0;

}

void __41__PSGInputSuggesterClient_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_687;
  sharedInstance__pasExprOnceResult_687 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
