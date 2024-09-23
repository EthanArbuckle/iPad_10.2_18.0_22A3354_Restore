@implementation PRSCoreParsecQueryTask

- (BOOL)needsBag
{
  return 0;
}

- (void)setParsecState:(BOOL)a3
{
  self->_parsecEnabled = a3;
}

- (PRSCoreParsecQueryTask)initWithSession:(id)a3 parsecSession:(id)a4 handler:(id)a5 queue:(id)a6 queryContext:(id)a7 queryIdent:(unint64_t)a8
{
  id v15;
  PRSCoreParsecQueryTask *v16;
  PRSCoreParsecQueryTask *v17;
  objc_super v19;

  v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PRSCoreParsecQueryTask;
  v16 = -[PRSQueryTask initWithSession:handler:queue:feedback:queryContext:](&v19, sel_initWithSession_handler_queue_feedback_queryContext_, a3, a5, a6, 0, a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parSession, a4);
    -[PRSQueryTask setQueryIdent:](v17, "setQueryIdent:", a8);
  }

  return v17;
}

- (void)handleResults:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  double v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v29;
  _QWORD block[5];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE buf[12];
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  PRSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v27, "sections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "suggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v27;
    v39 = 2112;
    v40 = v4;
    v41 = 2112;
    v42 = v5;
    _os_log_impl(&dword_1B86C5000, v3, OS_LOG_TYPE_INFO, "Response: %@ (%@ %@)", buf, 0x20u);

  }
  objc_msgSend(v27, "rawSqf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSQueryTask setCategory_stats:](self, "setCategory_stats:", v6);

  objc_msgSend(v27, "serverFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSQueryTask setServer_features:](self, "setServer_features:", v7);

  objc_msgSend(v27, "engagementSignal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSQueryTask setEngagementSignal:](self, "setEngagementSignal:", v8);

  v29 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v27, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    v12 = 1055286886;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v14, "sectionBundleIdentifier", v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.parsec.web_index")))
        {
          objc_msgSend(v14, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (v17)
            continue;
          objc_msgSend(v14, "serverFeatures");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("relevance_score"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v15, v19);

          }
          objc_msgSend(v14, "serverFeatures");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", CFSTR("local_intent_threshold"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v21, "floatValue");
            v12 = v22;
          }

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (!v10)
        goto LABEL_20;
    }
  }
  v12 = 1055286886;
LABEL_20:

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSQueryTask setServerRelevanceScores:](self, "setServerRelevanceScores:", v23);

  LODWORD(v24) = v12;
  -[PRSQueryTask setServerRelevanceScoreThreshold:](self, "setServerRelevanceScoreThreshold:", v24);
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  -[PRSQueryTask queue](self, "queue");
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PRSCoreParsecQueryTask_handleResults___block_invoke;
  block[3] = &unk_1E6E53FD8;
  objc_copyWeak(&v32, (id *)buf);
  block[4] = self;
  v31 = v27;
  v26 = v27;
  dispatch_async(v25, block);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);

}

void __40__PRSCoreParsecQueryTask_handleResults___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "queryDidFinishLoading:", a1[4]);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a1[5], "geoUserSessionEntity");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sessionEntityString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "geoUserSessionEntityString:", v6);

      }
    }
    v7 = (void *)objc_opt_new();
    objc_msgSend(a1[5], "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(a1[5], "sections", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
            if (v14)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13), "bundleIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_msgSend(v14, "bundleIdentifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v16);

              }
            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v7, "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setParsecCategoryOrder:", v17);

    if (v4)
    {
      v18 = a1[4];
      objc_msgSend(a1[5], "sections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "suggestions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "corrections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "alternativeResults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "query:didFinishWithResults:withSuggestions:withCorrections:withAlternativeResults:suggestionsAreBlended:", v18, v19, v20, v21, v22, objc_msgSend(a1[5], "suggestionsAreBlended"));

    }
    objc_msgSend(a1[4], "session");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "queryCompleted:", a1[4]);

  }
}

- (void)resume
{
  OUTLINED_FUNCTION_0_7(&dword_1B86C5000, a2, a3, "resume %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __32__PRSCoreParsecQueryTask_resume__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  NSObject *v13;
  id WeakRetained;
  void *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = ((uint64_t (*)(void))*MEMORY[0x1E0D4DE28])();
  v16 = *(_OWORD *)v10;
  v17 = *(_OWORD *)(v10 + 16);
  v18 = *(_QWORD *)(v10 + 32);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v10 + 16) = v12;
  *(_QWORD *)(v10 + 32) = v11;
  PRSLogCategoryDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "rawResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v15;
    _os_log_debug_impl(&dword_1B86C5000, v13, OS_LOG_TYPE_DEBUG, "callback on %@ with response %@ raw:%@", buf, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleResults:", v8);

  *(_OWORD *)v10 = v16;
  *(_OWORD *)(v10 + 16) = v17;
  *(_QWORD *)(v10 + 32) = v18;

}

- (SPSearchSuggestionResult)suggestionResult
{
  return self->_suggestionResult;
}

- (void)setSuggestionResult:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionResult, a3);
}

- (PARTask)task
{
  return (PARTask *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_suggestionResult, 0);
  objc_storeStrong((id *)&self->_parSession, 0);
}

@end
