@implementation VIAEntryPointLogger

- (VIAEntryPointLogger)initWithQueue:(id)a3 feedbackSubmitter:(id)a4 eventCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  VIAEntryPointLogger *v12;
  VIAEntryPointLogger *v13;
  uint64_t v14;
  NSMutableDictionary *appToQueryIDMap;
  uint64_t v16;
  NSMutableDictionary *appToViewAppearEventMap;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VIAEntryPointLogger;
  v12 = -[VIAEntryPointLogger init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    v14 = objc_opt_new();
    appToQueryIDMap = v13->_appToQueryIDMap;
    v13->_appToQueryIDMap = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    appToViewAppearEventMap = v13->_appToViewAppearEventMap;
    v13->_appToViewAppearEventMap = (NSMutableDictionary *)v16;

    objc_storeStrong((id *)&v13->_eventCache, a5);
    objc_storeStrong((id *)&v13->_feedbackSubmitter, a4);
  }

  return v13;
}

- (void)logEvent:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "feedback");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v7, "feedback");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_7;
    }
    -[VIAEntryPointLogger _logDependentEvent:](self, "_logDependentEvent:", v7);
    goto LABEL_7;
  }
  -[VIAEntryPointLogger _logEvent:](self, "_logEvent:", v7);
LABEL_7:

}

+ (id)feedbackNamesToLog
{
  void *v2;
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_logEvent:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = -[VIAEntryPointLogger _preconditionCheckEvent:](self, "_preconditionCheckEvent:", v7);
  v5 = v7;
  if (v4)
  {
    v6 = objc_msgSend(v7, "type");
    if (v6 == 2)
    {
      -[VIAEntryPointLogger _logEndEvent:](self, "_logEndEvent:", v7);
      goto LABEL_6;
    }
    v5 = v7;
    if (v6 == 1)
    {
      -[VIAEntryPointLogger _logStartEvent:](self, "_logStartEvent:", v7);
LABEL_6:
      v5 = v7;
    }
  }

}

- (void)_logDependentEvent:(id)a3
{
  id v4;
  NSMutableDictionary *appToQueryIDMap;
  void *v6;
  void *v7;
  NSMutableDictionary *appToViewAppearEventMap;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[VIAEntryPointLogger _preconditionCheckEvent:](self, "_preconditionCheckEvent:", v4))
  {
    appToQueryIDMap = self->_appToQueryIDMap;
    objc_msgSend(v4, "originatingApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](appToQueryIDMap, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    appToViewAppearEventMap = self->_appToViewAppearEventMap;
    objc_msgSend(v4, "originatingApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](appToViewAppearEventMap, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 || (v11 = objc_msgSend(v7, "unsignedLongLongValue"), v11 != objc_msgSend(v4, "queryID")))
    {
      -[VIAEventCache cacheEvent:](self->_eventCache, "cacheEvent:", v4);
      goto LABEL_20;
    }
    if (v10)
    {
      v12 = (int)objc_msgSend(v10, "intValue");
    }
    else
    {
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v4, "originatingApplication");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138543618;
          v20 = v14;
          v21 = 2048;
          v22 = objc_msgSend(v4, "queryID");
          _os_log_impl(&dword_1D467C000, v13, OS_LOG_TYPE_ERROR, "_appToViewAppearEventMap missing invocation method for application=%{public}@, queryID=%llu", (uint8_t *)&v19, 0x16u);

        }
      }
      v12 = 28;
    }
    objc_msgSend(v4, "feedback");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "feedback");
      v16 = objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_16:
        objc_msgSend(v4, "feedback");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v4, "feedback");
        v18 = objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[VIAEntryPointLogger _logClientTimeingFeedback:queryID:](self, "_logClientTimeingFeedback:queryID:", v18, objc_msgSend(v4, "queryID"));
          v17 = (void *)v18;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      -[VIAEntryPointLogger _logVisibleSuggestionsFeedback:forViewAppearEvent:queryID:](self, "_logVisibleSuggestionsFeedback:forViewAppearEvent:queryID:", v16, v12, objc_msgSend(v4, "queryID"));
      v15 = (void *)v16;
    }

    goto LABEL_16;
  }
LABEL_21:

}

- (void)_logStartEvent:(id)a3
{
  id v4;
  NSMutableDictionary *appToQueryIDMap;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *appToViewAppearEventMap;
  void *v15;
  void *v16;
  VIAEventCache *eventCache;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  appToQueryIDMap = self->_appToQueryIDMap;
  objc_msgSend(v4, "originatingApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](appToQueryIDMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "queryID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_appToQueryIDMap;
    objc_msgSend(v4, "originatingApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "viewAppearEvent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    appToViewAppearEventMap = self->_appToViewAppearEventMap;
    objc_msgSend(v4, "originatingApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](appToViewAppearEventMap, "setObject:forKeyedSubscript:", v13, v15);

    objc_msgSend(v4, "feedback");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VIAEntryPointLogger _logFeedback:queryID:](self, "_logFeedback:queryID:", v16, objc_msgSend(v4, "queryID"));

    eventCache = self->_eventCache;
    objc_msgSend(v4, "originatingApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VIAEventCache cachedEventForBundleID:queryID:](eventCache, "cachedEventForBundleID:queryID:", v18, objc_msgSend(v4, "queryID"));
    v8 = objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_22;
    v28 = v4;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v8;
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v19)
      goto LABEL_21;
    v20 = v19;
    v21 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v8);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v23, "feedback");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v23, "feedback");
          v25 = objc_claimAutoreleasedReturnValue();

          if (!v25)
            goto LABEL_15;
          -[VIAEntryPointLogger _logVisibleSuggestionsFeedback:forViewAppearEvent:queryID:](self, "_logVisibleSuggestionsFeedback:forViewAppearEvent:queryID:", v25, objc_msgSend(v28, "viewAppearEvent"), objc_msgSend(v23, "queryID"));
          v24 = (void *)v25;
        }

LABEL_15:
        objc_msgSend(v23, "feedback");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v23, "feedback");
          v27 = objc_claimAutoreleasedReturnValue();

          if (!v27)
            continue;
          -[VIAEntryPointLogger _logClientTimeingFeedback:queryID:](self, "_logClientTimeingFeedback:queryID:", v27, objc_msgSend(v23, "queryID"));
          v26 = (void *)v27;
        }

      }
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (!v20)
      {
LABEL_21:

        v4 = v28;
        goto LABEL_22;
      }
    }
  }
  if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
  {
    +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "originatingApplication");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v9;
      v36 = 2048;
      v37 = objc_msgSend(v4, "queryID");
      _os_log_impl(&dword_1D467C000, v8, OS_LOG_TYPE_ERROR, "Starting an event without previous ending. App: %{public}@, queryID: %llu", buf, 0x16u);

    }
LABEL_22:

  }
}

- (void)_logEndEvent:(id)a3
{
  id v4;
  NSMutableDictionary *appToQueryIDMap;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *appToViewAppearEventMap;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  appToQueryIDMap = self->_appToQueryIDMap;
  objc_msgSend(v4, "originatingApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](appToQueryIDMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_appToQueryIDMap;
    objc_msgSend(v4, "originatingApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    appToViewAppearEventMap = self->_appToViewAppearEventMap;
    objc_msgSend(v4, "originatingApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](appToViewAppearEventMap, "removeObjectForKey:", v11);

    objc_msgSend(v4, "feedback");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VIAEntryPointLogger _logFeedback:queryID:](self, "_logFeedback:queryID:", v12, objc_msgSend(v7, "unsignedLongLongValue"));

  }
  else if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
  {
    +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "originatingApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2048;
      v18 = objc_msgSend(v4, "queryID");
      _os_log_impl(&dword_1D467C000, v13, OS_LOG_TYPE_ERROR, "Ending an event without previous start. App: %{public}@, queryID: %llu", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)_logFeedback:(id)a3 queryID:(unint64_t)a4
{
  -[VIAFeedbackSubmitter reportFeedback:queryId:](self->_feedbackSubmitter, "reportFeedback:queryId:", a3, a4);
}

- (BOOL)_preconditionCheckEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "originatingApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5 && +[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
  {
    +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1D467C000, v6, OS_LOG_TYPE_ERROR, "Empty application bundleID for event %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }

  return v5 != 0;
}

- (void)_logVisibleSuggestionsFeedback:(id)a3 forViewAppearEvent:(unint64_t)a4 queryID:(unint64_t)a5
{
  id v7;

  -[VIAEntryPointLogger _visibleSuggestionsFeedbackFromPendingFeeedback:forViewAppearEvent:](self, "_visibleSuggestionsFeedbackFromPendingFeeedback:forViewAppearEvent:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VIAEntryPointLogger _logFeedback:queryID:](self, "_logFeedback:queryID:", v7, a5);

}

- (void)_logClientTimeingFeedback:(id)a3 queryID:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0D8C250];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "eventName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "nanosecondInterval");
  v11 = objc_msgSend(v7, "queryId");

  v12 = (id)objc_msgSend(v8, "initWithEvent:timeInterval:queryId:", v9, v10, v11);
  -[VIAEntryPointLogger _logFeedback:queryID:](self, "_logFeedback:queryID:", v12, a4);

}

- (id)_visibleSuggestionsFeedbackFromPendingFeeedback:(id)a3 forViewAppearEvent:(unint64_t)a4
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  if (a4 == 28)
  {
    v4 = (objc_class *)MEMORY[0x1E0D8C838];
    v5 = a3;
    v6 = [v4 alloc];
    objc_msgSend(v5, "suggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v6, "initWithSuggestions:", v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3880];
    v10 = a3;
    objc_msgSend(v9, "predicateWithBlock:", &__block_literal_global_3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suggestions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "filteredArrayUsingPredicate:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C838]), "initWithSuggestions:", v12);
  }

  return v8;
}

uint64_t __90__VIAEntryPointLogger__visibleSuggestionsFeedbackFromPendingFeeedback_forViewAppearEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:"), CFSTR("infoPanel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("infoPanel")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "suggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasPrefix:", v3) ^ 1;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCache, 0);
  objc_storeStrong((id *)&self->_appToViewAppearEventMap, 0);
  objc_storeStrong((id *)&self->_appToQueryIDMap, 0);
  objc_storeStrong((id *)&self->_feedbackSubmitter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
