@implementation _PSSuggestionFromTextPredictorDelegateWrapper

- (_PSSuggestionFromTextPredictorDelegateWrapper)initWithDelegateType:(int64_t)a3 textPredictor:(id)a4 startSecondsFromQuery:(double)a5 endSecondsFromQuery:(double)a6 priorScoreThreshold:(float)a7 isEnabled:(BOOL)a8 defaultConfidenceCategory:(int64_t)a9
{
  id v17;
  _PSSuggestionFromTextPredictorDelegateWrapper *v18;
  _PSSuggestionFromTextPredictorDelegateWrapper *v19;
  objc_super v21;

  v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_PSSuggestionFromTextPredictorDelegateWrapper;
  v18 = -[_PSSuggestionFromTextPredictorDelegateWrapper init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_delegateType = a3;
    objc_storeStrong((id *)&v18->_textPredictor, a4);
    v19->_startSecondsFromQuery = a5;
    v19->_endSecondsFromQuery = a6;
    v19->_priorScoreThreshold = a7;
    v19->_isEnabled = a8;
    v19->_defaultConfidenceCategory = a9;
  }

  return v19;
}

- (_PSSuggestionFromTextPredictorDelegateWrapper)initWithTextPredictor:(id)a3 calendarConfig:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  _PSSuggestionFromTextPredictorDelegateWrapper *v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "startSecondsFromQuery");
  v9 = v8;
  objc_msgSend(v6, "endSecondsFromQuery");
  v11 = v10;
  objc_msgSend(v6, "priorScoreThreshold");
  v13 = v12;
  v14 = objc_msgSend(v6, "isEnabled");
  v15 = objc_msgSend(v6, "defaultConfidenceCategory");

  LODWORD(v16) = v13;
  v17 = -[_PSSuggestionFromTextPredictorDelegateWrapper initWithDelegateType:textPredictor:startSecondsFromQuery:endSecondsFromQuery:priorScoreThreshold:isEnabled:defaultConfidenceCategory:](self, "initWithDelegateType:textPredictor:startSecondsFromQuery:endSecondsFromQuery:priorScoreThreshold:isEnabled:defaultConfidenceCategory:", 1, v7, v14, v15, v9, v11, v16);

  return v17;
}

- (_PSSuggestionFromTextPredictorDelegateWrapper)initWithTextPredictor:(id)a3 remindersConfig:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  _PSSuggestionFromTextPredictorDelegateWrapper *v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "startSecondsFromQuery");
  v9 = v8;
  objc_msgSend(v6, "endSecondsFromQuery");
  v11 = v10;
  objc_msgSend(v6, "priorScoreThreshold");
  v13 = v12;
  v14 = objc_msgSend(v6, "isEnabled");
  v15 = objc_msgSend(v6, "defaultConfidenceCategory");

  LODWORD(v16) = v13;
  v17 = -[_PSSuggestionFromTextPredictorDelegateWrapper initWithDelegateType:textPredictor:startSecondsFromQuery:endSecondsFromQuery:priorScoreThreshold:isEnabled:defaultConfidenceCategory:](self, "initWithDelegateType:textPredictor:startSecondsFromQuery:endSecondsFromQuery:priorScoreThreshold:isEnabled:defaultConfidenceCategory:", 2, v7, v14, v15, v9, v11, v16);

  return v17;
}

- (void)updateWithCalendarConfig:(id)a3
{
  id v4;
  double v5;
  double v6;
  float v7;
  int64_t v8;

  v4 = a3;
  objc_msgSend(v4, "startSecondsFromQuery");
  self->_startSecondsFromQuery = v5;
  objc_msgSend(v4, "endSecondsFromQuery");
  self->_endSecondsFromQuery = v6;
  objc_msgSend(v4, "priorScoreThreshold");
  self->_priorScoreThreshold = v7;
  self->_isEnabled = objc_msgSend(v4, "isEnabled");
  v8 = objc_msgSend(v4, "defaultConfidenceCategory");

  self->_defaultConfidenceCategory = v8;
}

- (void)updateWithRemindersConfig:(id)a3
{
  id v4;
  double v5;
  double v6;
  float v7;
  int64_t v8;

  v4 = a3;
  objc_msgSend(v4, "startSecondsFromQuery");
  self->_startSecondsFromQuery = v5;
  objc_msgSend(v4, "endSecondsFromQuery");
  self->_endSecondsFromQuery = v6;
  objc_msgSend(v4, "priorScoreThreshold");
  self->_priorScoreThreshold = v7;
  self->_isEnabled = objc_msgSend(v4, "isEnabled");
  v8 = objc_msgSend(v4, "defaultConfidenceCategory");

  self->_defaultConfidenceCategory = v8;
}

- (id)getSuggestionsWithPredictionContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int64_t v7;
  NSObject *v8;
  double v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  int64_t delegateType;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_isEnabled)
  {
    delegateType = self->_delegateType;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (delegateType == 1)
    {
      if (v15)
      {
        LOWORD(v22) = 0;
        v16 = "ZKW unstructured calendar model disabled. Not generating suggestions.";
LABEL_26:
        _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, 2u);
      }
    }
    else if (v15)
    {
      LOWORD(v22) = 0;
      v16 = "ZKW unstructured reminders model disabled. Not generating suggestions.";
      goto LABEL_26;
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -self->_startSecondsFromQuery);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", self->_endSecondsFromQuery);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self->_delegateType;
  if (v7 == 2)
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v17))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSUnstructuredRemindersModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v22, 2u);
    }

    *(float *)&v18 = self->_priorScoreThreshold;
    -[_PSSuggestionFromTextPredictor suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:](self->_textPredictor, "suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:", v4, v5, v6, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSUnstructuredRemindersModelTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v22, 2u);
    }

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v22 = 138412290;
    v23 = v10;
    v13 = "ZKW unstructured reminders suggestions: %@";
    goto LABEL_19;
  }
  if (v7 != 1)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_PSSuggestionFromTextPredictorDelegateWrapper getSuggestionsWithPredictionContext:].cold.1(&self->_delegateType, v12, v20);
    v10 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_23;
  }
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSUnstructuredCalendarModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v22, 2u);
  }

  *(float *)&v9 = self->_priorScoreThreshold;
  -[_PSSuggestionFromTextPredictor suggestionsFromUnstructuredCalendarEventsWithContext:startDate:endDate:priorScoreThreshold:](self->_textPredictor, "suggestionsFromUnstructuredCalendarEventsWithContext:startDate:endDate:priorScoreThreshold:", v4, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSUnstructuredCalendarModelTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v22, 2u);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v10;
    v13 = "ZKW unstructured calendar suggestions: %@";
LABEL_19:
    _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v22, 0xCu);
  }
LABEL_23:

LABEL_28:
  return v10;
}

- (void)pingWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  NSObject *v7;
  NSObject *v8;
  int64_t delegateType;
  uint64_t v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  void (**v44)(id, void *);
  void *v45;
  id v46;
  id obj;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  Class (*v62)(uint64_t);
  void *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v50 = a4;
  v44 = (void (**)(id, void *))a5;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_PSSuggestionFromTextPredictorDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:].cold.2((uint64_t)v46, (uint64_t)self, v7);

  if (!self->_delegateType)
  {
    v45 = (void *)objc_msgSend(objc_alloc((Class)getATXSuggestionRequestResponseClass_0()), "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", MEMORY[0x1E0C9AA60], 0, v46, 2, 0);
    v44[2](v44, v45);
    goto LABEL_44;
  }
  objc_msgSend(v46, "psPredictionContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSSuggestionFromTextPredictorDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:].cold.1((uint64_t)v45, v8);

  }
  delegateType = self->_delegateType;
  if (delegateType == 1)
  {
    v10 = 30;
    goto LABEL_13;
  }
  if (delegateType == 2)
  {
    v10 = 31;
LABEL_13:
    v65 = 0;
    v66 = &v65;
    v67 = 0x2050000000;
    v11 = (void *)getATXProactiveSuggestionClientModelClass_softClass_0;
    v68 = getATXProactiveSuggestionClientModelClass_softClass_0;
    if (!getATXProactiveSuggestionClientModelClass_softClass_0)
    {
      v60 = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = __getATXProactiveSuggestionClientModelClass_block_invoke_0;
      v63 = &unk_1E43FEA00;
      v64 = &v65;
      __getATXProactiveSuggestionClientModelClass_block_invoke_0((uint64_t)&v60);
      v11 = (void *)v66[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v65, 8);
    objc_msgSend(v12, "clientModelIdFromClientModelType:", v10);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v43, "isEqualToString:", v50);
    goto LABEL_17;
  }
  v43 = 0;
  v13 = objc_msgSend(0, "isEqualToString:", v50);
LABEL_17:
  if ((v13 & 1) != 0)
  {
    -[_PSSuggestionFromTextPredictorDelegateWrapper getSuggestionsWithPredictionContext:](self, "getSuggestionsWithPredictionContext:", v45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v14;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v52)
    {
      v48 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v57 != v48)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v17 = (void *)getATXProactiveSuggestionClientModelSpecificationClass_softClass_0;
          v68 = getATXProactiveSuggestionClientModelSpecificationClass_softClass_0;
          if (!getATXProactiveSuggestionClientModelSpecificationClass_softClass_0)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke_0;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke_0((uint64_t)&v60);
            v17 = (void *)v66[3];
          }
          v18 = objc_retainAutorelease(v17);
          _Block_object_dispose(&v65, 8);
          v19 = (void *)objc_msgSend([v18 alloc], "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v50, CFSTR("1.0"), 0);
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v20 = (void *)getATXProactiveSuggestionExecutableSpecificationClass_softClass_0;
          v68 = getATXProactiveSuggestionExecutableSpecificationClass_softClass_0;
          if (!getATXProactiveSuggestionExecutableSpecificationClass_softClass_0)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke_0;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke_0((uint64_t)&v60);
            v20 = (void *)v66[3];
          }
          v21 = objc_retainAutorelease(v20);
          _Block_object_dispose(&v65, 8);
          v22 = [v21 alloc];
          objc_msgSend(v16, "description");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_opt_new();
          objc_msgSend(v24, "UUIDString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v22, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v16, v23, v25, 6);

          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v27 = (void *)getATXProactiveSuggestionUISpecificationClass_softClass_0;
          v68 = getATXProactiveSuggestionUISpecificationClass_softClass_0;
          if (!getATXProactiveSuggestionUISpecificationClass_softClass_0)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionUISpecificationClass_block_invoke_0;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionUISpecificationClass_block_invoke_0((uint64_t)&v60);
            v27 = (void *)v66[3];
          }
          v28 = objc_retainAutorelease(v27);
          _Block_object_dispose(&v65, 8);
          v29 = [v28 alloc];
          objc_msgSend(v16, "groupName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (!v30)
          {
            objc_msgSend(v16, "recipients");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "firstObject");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "handle");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v53;
          }
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v32 = (void *)getATXProactiveSuggestionLayoutConfigClass_softClass_0;
          v68 = getATXProactiveSuggestionLayoutConfigClass_softClass_0;
          if (!getATXProactiveSuggestionLayoutConfigClass_softClass_0)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionLayoutConfigClass_block_invoke_0;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionLayoutConfigClass_block_invoke_0((uint64_t)&v60);
            v32 = (void *)v66[3];
          }
          v33 = objc_retainAutorelease(v32);
          _Block_object_dispose(&v65, 8);
          objc_msgSend(v33, "layoutConfigurationsForLayoutOptions:", 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v29, "initWithTitle:subtitle:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:", v31, 0, v34, 1, 1, 1);

          if (!v30)
          {

          }
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v36 = (void *)getATXProactiveSuggestionScoreSpecificationClass_softClass_0;
          v68 = getATXProactiveSuggestionScoreSpecificationClass_softClass_0;
          if (!getATXProactiveSuggestionScoreSpecificationClass_softClass_0)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionScoreSpecificationClass_block_invoke_0;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionScoreSpecificationClass_block_invoke_0((uint64_t)&v60);
            v36 = (void *)v66[3];
          }
          v37 = objc_retainAutorelease(v36);
          _Block_object_dispose(&v65, 8);
          v38 = (void *)objc_msgSend([v37 alloc], "initWithRawScore:suggestedConfidenceCategory:", self->_defaultConfidenceCategory, 90.0);
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v39 = (void *)getATXProactiveSuggestionClass_softClass_0;
          v68 = getATXProactiveSuggestionClass_softClass_0;
          if (!getATXProactiveSuggestionClass_softClass_0)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionClass_block_invoke_0;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionClass_block_invoke_0((uint64_t)&v60);
            v39 = (void *)v66[3];
          }
          v40 = objc_retainAutorelease(v39);
          _Block_object_dispose(&v65, 8);
          v41 = (void *)objc_msgSend([v40 alloc], "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v19, v26, v35, v38);
          objc_msgSend(v49, "addObject:", v41);

        }
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v52);
    }

    v42 = (void *)objc_msgSend(objc_alloc((Class)getATXSuggestionRequestResponseClass_0()), "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", v49, 0, v46, 2, 0);
    v44[2](v44, v42);

  }
  else
  {
    +[_PSZkwUtils clientModelMismatchErrorResponseForRequest:requestedClientModelId:actualClientModelId:](_PSZkwUtils, "clientModelMismatchErrorResponseForRequest:requestedClientModelId:actualClientModelId:", v46, v50, v43);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v44[2](v44, obj);
  }

LABEL_44:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPredictor, 0);
}

- (void)getSuggestionsWithPredictionContext:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, a3, "Unknown ZKW unstructured reminders delegate type: %ld", (uint8_t *)&v4);
}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(NSObject *)a2 reply:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, v5, "Encountered context of unknown class: %@", (uint8_t *)&v6);

}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(uint64_t)a2 reply:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 8);
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  _os_log_debug_impl(&dword_1A07F4000, log, OS_LOG_TYPE_DEBUG, "Unstructured text model delegate call %@ for delegate type %ld", (uint8_t *)&v4, 0x16u);
}

@end
