@implementation _PSMapsSuggester

- (id)suggestionsFromContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  _PSEnsembleModel *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSMapsSuggesterTotalTime", (const char *)&unk_1A0908603, buf, 2u);
  }

  v7 = objc_alloc_init(_PSEnsembleModel);
  -[_PSEnsembleModel predictWithMapsPredictionContext:maxSuggestions:](v7, "predictWithMapsPredictionContext:maxSuggestions:", v5, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSMapsSuggesterTotalTime", (const char *)&unk_1A0908603, v11, 2u);
  }

  return v8;
}

- (void)provideMapsFeedback:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  switch(v5)
  {
    case 0:
    case 4:
      v6 = objc_msgSend(v3, "indexOfEngagedSuggestion");
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[_PSMapsSuggester provideMapsFeedback:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "action");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "transportBundleID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v24;
        v31 = 2112;
        v32 = v26;
        _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_INFO, "Feedback for maps suggestions: Engagement with suggestion at index %@, transport: %@", buf, 0x16u);

      }
      break;
    case 1:
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v16 = "Feedback for maps suggestions: Engagement with non-suggestion";
        goto LABEL_9;
      }
      break;
    case 2:
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v16 = "Feedback for maps suggestions: Abandonment";
LABEL_9:
        _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_INFO, v16, buf, 2u);
      }
      break;
    default:
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_PSMapsSuggester provideMapsFeedback:].cold.1(v8, v17, v18, v19, v20, v21, v22, v23);
      break;
  }

  objc_msgSend(v3, "donateToBiome");
  v28 = v3;
  v27 = v3;
  AnalyticsSendEventLazy();

}

- (void)deleteMapsFeedbackEventsMatchingHandle:(id)a3 contactId:(id)a4 startLocationId:(id)a5 endLocationId:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  BiomeLibrary();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "MapsShare");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ETAFeedback");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "pruner");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99___PSMapsSuggester_deleteMapsFeedbackEventsMatchingHandle_contactId_startLocationId_endLocationId___block_invoke;
  v21[3] = &unk_1E44002B8;
  v22 = v9;
  v23 = v11;
  v24 = v12;
  v25 = v10;
  v16 = v10;
  v17 = v12;
  v18 = v11;
  v19 = v9;
  objc_msgSend(v15, "deleteWithPolicy:eventsPassingTest:", CFSTR("delete-maps-feedback"), v21);

}

- (void)provideMapsFeedback:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, a1, a3, "Feedback with unknown action type", a5, a6, a7, a8, 0);
}

- (void)provideMapsFeedback:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, a1, a3, "Feedback with unknown suggestion", a5, a6, a7, a8, 0);
}

@end
