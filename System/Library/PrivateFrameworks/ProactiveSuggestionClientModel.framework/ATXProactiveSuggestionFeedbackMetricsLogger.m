@implementation ATXProactiveSuggestionFeedbackMetricsLogger

- (ATXProactiveSuggestionFeedbackMetricsLogger)initWithHyperParameters:(id)a3
{
  id v4;
  void *v5;
  ATXProactiveSuggestionFeedbackMetricsLogger *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXProactiveSuggestionFeedbackMetricsLogger initWithPETEventTracker:hyperParameters:](self, "initWithPETEventTracker:hyperParameters:", v5, v4);

  return v6;
}

- (ATXProactiveSuggestionFeedbackMetricsLogger)initWithPETEventTracker:(id)a3 hyperParameters:(id)a4
{
  id v7;
  id v8;
  ATXProactiveSuggestionFeedbackMetricsLogger *v9;
  ATXProactiveSuggestionFeedbackMetricsLogger *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXProactiveSuggestionFeedbackMetricsLogger;
  v9 = -[ATXProactiveSuggestionFeedbackMetricsLogger init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_petEventTracker, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
  }

  return v10;
}

- (ATXPETEventTracker2Protocol)petEventTracker
{
  return self->_petEventTracker;
}

- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters
{
  return self->_hyperParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_petEventTracker, 0);
}

- (void)logMetricsWithUIFeedbackQuery:(id)a3
{
  id v4;
  _QWORD v5[5];
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__8;
  v7[4] = __Block_byref_object_dispose__8;
  v8 = 0;
  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__ATXProactiveSuggestionFeedbackMetricsLogger_UIFeedback__logMetricsWithUIFeedbackQuery___block_invoke;
  v6[3] = &unk_1E57CF9D8;
  v6[4] = self;
  v6[5] = v7;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__ATXProactiveSuggestionFeedbackMetricsLogger_UIFeedback__logMetricsWithUIFeedbackQuery___block_invoke_2;
  v5[3] = &unk_1E57CFA00;
  objc_msgSend(v4, "enumerateUIFeedbackResultsWithBlock:completionBlock:", v6, v5);
  _Block_object_dispose(v7, 8);

}

void __89__ATXProactiveSuggestionFeedbackMetricsLogger_UIFeedback__logMetricsWithUIFeedbackQuery___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = a2;
  objc_msgSend(v3, "handleNewFeedbackResult:previousSessionId:", v5, v4);
  objc_msgSend(v5, "session");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sessionUUID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __89__ATXProactiveSuggestionFeedbackMetricsLogger_UIFeedback__logMetricsWithUIFeedbackQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __atxlog_handle_blending_ecosystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1AA841000, v3, OS_LOG_TYPE_DEFAULT, "%@ - logMetricsWithUIFeedbackQuery finished processing new events with error: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)logMetricsWithTestResults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        -[ATXProactiveSuggestionFeedbackMetricsLogger handleNewFeedbackResult:previousSessionId:](self, "handleNewFeedbackResult:previousSessionId:", v11, v10);
        objc_msgSend(v11, "session");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sessionUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);

  }
}

- (void)handleNewFeedbackResult:(id)a3 previousSessionId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[ATXProactiveSuggestionFeedbackMetricsLogger logClientModelUICacheAgeMetricForFeedbackResult:](self, "logClientModelUICacheAgeMetricForFeedbackResult:", v10);
  -[ATXProactiveSuggestionFeedbackMetricsLogger logClientModelClientCacheAgeMetricForFeedbackResult:](self, "logClientModelClientCacheAgeMetricForFeedbackResult:", v10);
  -[ATXProactiveSuggestionFeedbackMetricsLogger logClientModelEngagementMetricForFeedbackResult:](self, "logClientModelEngagementMetricForFeedbackResult:", v10);
  if (!v6
    || (objc_msgSend(v10, "session"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "sessionUUID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v6, "isEqual:", v8),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    -[ATXProactiveSuggestionFeedbackMetricsLogger logSessionEngagementMetricForFeedbackResult:](self, "logSessionEngagementMetricForFeedbackResult:", v10);
  }

}

- (void)logClientModelClientCacheAgeMetricForFeedbackResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
  double v23;
  double v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  __CFString *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "shownSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "engagedSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v4, "rejectedSuggestions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
        v8 = 2;
      else
        v8 = 3;
    }
    objc_msgSend(v4, "shownSuggestions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_opt_new();
    objc_msgSend(v4, "clientCacheUpdate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientModelId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClientModelId:", v15);

    objc_msgSend(v12, "clientModelSpecification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clientModelVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClientModelABGroup:", v17);

    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(v4, "consumerSubType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConsumerSubType:", v18);

    objc_msgSend(v13, "setOutcomeType:", v8);
    objc_msgSend(v4, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sessionEndDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "clientCacheUpdate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cacheCreationDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "timeIntervalSinceDate:", v22);
    v24 = v23;
    -[ATXProactiveSuggestionFeedbackMetricsLogger petEventTracker](self, "petEventTracker");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trackDistributionForMessage:value:", v13, v24);

    __atxlog_handle_metrics();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "consumerSubType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v13, "outcomeType");
      if ((v29 - 1) >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v29);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = off_1E57CFA60[(int)v29 - 1];
      }
      objc_msgSend(v13, "clientModelId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "clientModelABGroup");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v35 = v28;
      v36 = 2112;
      v37 = v33;
      v38 = 2112;
      v39 = v32;
      v40 = 2112;
      v41 = v30;
      v42 = 2112;
      v43 = v31;
      v44 = 2048;
      v45 = v24;
      _os_log_debug_impl(&dword_1AA841000, v26, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingClientModelEngagementClientCacheAgeTracker with consumerSubType: %@ and outcomeType: %@ clientModelId: %@ clientModelABGroup: %@ cacheAge: %f", buf, 0x3Eu);

    }
  }

}

- (void)logClientModelUICacheAgeMetricForFeedbackResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
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
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  id v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "shownSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "engagedSuggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "rejectedSuggestions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
        v9 = 2;
      else
        v9 = 3;
    }
    v12 = (void *)objc_opt_new();
    -[ATXProactiveSuggestionFeedbackMetricsLogger hyperParameters](self, "hyperParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "abGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAbGroup:", v14);

    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(v4, "consumerSubType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConsumerSubType:", v15);

    objc_msgSend(v12, "setOutcomeType:", v9);
    objc_msgSend(v4, "session");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sessionEndDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "uiCacheUpdate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cacheCreationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "timeIntervalSinceDate:", v19);
    v21 = v20;
    -[ATXProactiveSuggestionFeedbackMetricsLogger petEventTracker](self, "petEventTracker");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trackDistributionForMessage:value:", v12, v21);

    __atxlog_handle_metrics();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "consumerSubType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v12, "outcomeType");
      if ((v27 - 1) >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v27);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = off_1E57CFA60[(int)v27 - 1];
      }
      objc_msgSend(v12, "abGroup");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v31 = v25;
      v32 = 2112;
      v33 = v26;
      v34 = 2112;
      v35 = v28;
      v36 = 2112;
      v37 = v29;
      v38 = 2048;
      v39 = v21;
      _os_log_debug_impl(&dword_1AA841000, v23, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingClientModelEngagementUICacheAgeTracker with consumerSubType: %@ and outcomeType: %@ abGroup: %@ cacheAge: %f", buf, 0x34u);

    }
  }

}

- (void)logClientModelEngagementMetricForFeedbackResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  ATXProactiveSuggestionFeedbackMetricsLogger *v45;

  v4 = a3;
  objc_msgSend(v4, "uiCacheUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientCacheUpdate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "engagedSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v45 = self;
  if (!v10)
  {
    objc_msgSend(v4, "rejectedSuggestions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    v12 = 0;
    if (v22)
      v20 = 3;
    else
      v20 = 2;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
    objc_msgSend(v5, "uiCache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v5, "uiCache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "session");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sessionIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "cachedSuggestionWidgetLayouts");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKey:", v27);
      v29 = objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        objc_msgSend(v25, "cachedAppPredictionPanelLayouts");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", v27);
        v29 = objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          __atxlog_handle_feedback();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback) logClientModelEngagementMetricForFeedbackResult:].cold.3((uint64_t)v45, (uint64_t)v27, v31);

          v29 = 0;
        }
      }

      if (!v29)
        goto LABEL_29;
    }
    else
    {
      objc_opt_class();
      v32 = objc_opt_isKindOfClass();

      if ((v32 & 1) == 0
        || (objc_msgSend(v5, "uiCache"), (v29 = objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_29:
        __atxlog_handle_feedback();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback) logClientModelEngagementMetricForFeedbackResult:].cold.1((uint64_t)v45, v5, v29);
LABEL_31:

        goto LABEL_32;
      }
    }
    v33 = (void *)objc_opt_new();
    +[ATXSuggestionLayout stringFromUILayoutType:](ATXSuggestionLayout, "stringFromUILayoutType:", -[NSObject layoutType](v29, "layoutType"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLayoutType:", v34);

    objc_msgSend(v4, "clientCacheUpdate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "clientModelId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setClientModelId:", v36);

    objc_msgSend(v4, "shownSuggestions");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNumSuggestionsForClientModelInLayout:", objc_msgSend(v37, "count"));

    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(v4, "consumerSubType"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setConsumerSubType:", v38);

    objc_msgSend(v33, "setEngagementType:", v20);
    -[ATXProactiveSuggestionFeedbackMetricsLogger hyperParameters](v45, "hyperParameters");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "abGroup");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAbGroup:", v40);

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v33, "setPositionInClientModelCacheOfEngagedSuggestion:", ATXBucketUInt32BetweenValuesWithRounding());
    if (v8)
    {
      objc_msgSend(v8, "clientModelSpecification");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "clientModelVersion");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setClientModelABGroup:", v42);

    }
    -[ATXProactiveSuggestionFeedbackMetricsLogger petEventTracker](v45, "petEventTracker");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trackScalarForMessage:", v33);

    __atxlog_handle_metrics();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback) logClientModelEngagementMetricForFeedbackResult:].cold.2((uint64_t)v45, v33, v44);

    goto LABEL_31;
  }
  objc_msgSend(v4, "engagedSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "clientCacheUpdate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "suggestions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "indexOfObject:", v12);

  objc_msgSend(v4, "session");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "engagedUUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "containsObject:", v18);

  v20 = 1;
  if ((v19 & 1) != 0 || v15 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  if (v15 <= 0x18)
  {
    if (v15 <= 7)
      v20 = 1;
    else
      v20 = 8;
    goto LABEL_12;
  }
LABEL_32:

}

- (void)logSessionEngagementMetricForFeedbackResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v4 = a3;
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shownUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v4, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rejectedUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = 2;
    }
    else
    {
      objc_msgSend(v4, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "engagedUUIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
        v11 = 1;
      else
        v11 = 3;
    }
    v15 = (void *)objc_opt_new();
    v16 = (void *)MEMORY[0x1E0CF9508];
    objc_msgSend(v4, "session");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringForConsumerSubtype:", objc_msgSend(v17, "consumerSubType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setConsumerSubType:", v18);

    objc_msgSend(v15, "setEngagementType:", v11);
    -[ATXProactiveSuggestionFeedbackMetricsLogger petEventTracker](self, "petEventTracker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trackScalarForMessage:", v15);

    __atxlog_handle_metrics();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback) logSessionEngagementMetricForFeedbackResult:].cold.1((uint64_t)self, v15, v20);

  }
}

@end
