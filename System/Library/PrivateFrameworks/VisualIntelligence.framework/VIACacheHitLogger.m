@implementation VIACacheHitLogger

- (VIACacheHitLogger)initWithQueue:(id)a3 feedbackSubmitter:(id)a4
{
  id v7;
  id v8;
  VIACacheHitLogger *v9;
  VIACacheHitLogger *v10;
  VIAEventCache *v11;
  VIAEventCache *engagementEventCache;
  VIAEventCache *v13;
  VIAEventCache *rankingEventCache;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VIACacheHitLogger;
  v9 = -[VIACacheHitLogger init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_feedbackSubmitter, a4);
    v11 = -[VIAEventCache initWithQueue:]([VIAEventCache alloc], "initWithQueue:", v7);
    engagementEventCache = v10->_engagementEventCache;
    v10->_engagementEventCache = v11;

    v13 = -[VIAEventCache initWithQueue:]([VIAEventCache alloc], "initWithQueue:", v7);
    rankingEventCache = v10->_rankingEventCache;
    v10->_rankingEventCache = v13;

  }
  return v10;
}

- (void)didObserveEvent:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "feedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[VIAEventCache cacheEvent:](self->_engagementEventCache, "cacheEvent:", v8);
  objc_msgSend(v8, "feedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
    -[VIAEventCache cacheEvent:](self->_rankingEventCache, "cacheEvent:", v8);

}

- (void)logEvent:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v5;
    else
      v4 = 0;
    -[VIACacheHitLogger _logEvent:](self, "_logEvent:", v4);
  }

}

+ (id)feedbackNamesToLog
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_logEvent:(id)a3
{
  id v4;
  VIAEventCache *engagementEventCache;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  VIAFeedbackSubmitter *feedbackSubmitter;
  uint64_t v19;
  VIAFeedbackSubmitter *v20;
  VIAEventCache *rankingEventCache;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  void *v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "engagementSuggestionType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  engagementEventCache = self->_engagementEventCache;
  objc_msgSend(v4, "originatingApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VIAEventCache cachedEventForBundleID:queryID:](engagementEventCache, "cachedEventForBundleID:queryID:", v6, objc_msgSend(v4, "cachedResultQueryID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  v38 = v8;
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v13, "feedback");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v13, "feedback");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          objc_msgSend(v15, "VI_searchSuggestionForSuggestionType:", v39);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C778]), "initWithSuggestion:", v14);
          objc_msgSend(v17, "setQueryId:", objc_msgSend(v4, "queryID"));
          feedbackSubmitter = self->_feedbackSubmitter;
          v19 = objc_msgSend(v4, "queryID");
          v20 = feedbackSubmitter;
          v8 = v38;
          -[VIAFeedbackSubmitter reportFeedback:queryId:](v20, "reportFeedback:queryId:", v17, v19);

LABEL_13:
        }
        -[VIAFeedbackSubmitter didHitCacheForQueryId:](self->_feedbackSubmitter, "didHitCacheForQueryId:", objc_msgSend(v4, "queryID"));

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v10);
  }

  rankingEventCache = self->_rankingEventCache;
  objc_msgSend(v4, "originatingApplication");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VIAEventCache cachedEventForBundleID:queryID:](rankingEventCache, "cachedEventForBundleID:queryID:", v22, objc_msgSend(v4, "cachedResultQueryID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v23;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v42;
    *(_QWORD *)&v25 = 138543618;
    v37 = v25;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v29, "feedback", v37);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v29, "feedback");
          v31 = objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            v32 = objc_alloc(MEMORY[0x1E0D8C600]);
            -[NSObject sections](v31, "sections");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject blendingDuration](v31, "blendingDuration");
            v34 = (void *)objc_msgSend(v32, "initWithSections:blendingDuration:", v33);

            -[VIAFeedbackSubmitter reportFeedback:queryId:](self->_feedbackSubmitter, "reportFeedback:queryId:", v34, objc_msgSend(v4, "cachedResultQueryID"));
            goto LABEL_28;
          }
        }
        else
        {

        }
        if (!+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
          continue;
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "originatingApplication");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v4, "cachedResultQueryID");
          *(_DWORD *)buf = v37;
          v50 = v35;
          v51 = 2048;
          v52 = v36;
          _os_log_impl(&dword_1D467C000, v31, OS_LOG_TYPE_ERROR, "Expected ranking event missing from cache for application=%{public}@, queryID=%llu", buf, 0x16u);

        }
LABEL_28:

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v26);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingEventCache, 0);
  objc_storeStrong((id *)&self->_engagementEventCache, 0);
  objc_storeStrong((id *)&self->_feedbackSubmitter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
