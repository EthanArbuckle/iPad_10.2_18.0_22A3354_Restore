@implementation _PSCalendarEventPredictorDelegateWrapper

- (_PSCalendarEventPredictorDelegateWrapper)initWithCalendarEventPredictor:(id)a3 startSecondsFromQuery:(double)a4 endSecondsFromQuery:(double)a5 maxParticipants:(unint64_t)a6 isEnabled:(BOOL)a7 defaultConfidenceCategory:(int64_t)a8
{
  id v15;
  _PSCalendarEventPredictorDelegateWrapper *v16;
  _PSCalendarEventPredictorDelegateWrapper *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_PSCalendarEventPredictorDelegateWrapper;
  v16 = -[_PSCalendarEventPredictorDelegateWrapper init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_calendarEventPredictor, a3);
    v17->_startSecondsFromQuery = a4;
    v17->_endSecondsFromQuery = a5;
    v17->_maxParticipants = a6;
    v17->_isEnabled = a7;
    v17->_defaultConfidenceCategory = a8;
  }

  return v17;
}

- (_PSCalendarEventPredictorDelegateWrapper)initWithCalendarEventPredictor:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _PSCalendarEventPredictorDelegateWrapper *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "startSecondsFromQuery");
  v9 = v8;
  objc_msgSend(v6, "endSecondsFromQuery");
  v11 = v10;
  v12 = objc_msgSend(v6, "maxOtherParticipants");
  v13 = objc_msgSend(v6, "isEnabled");
  v14 = objc_msgSend(v6, "defaultConfidenceCategory");

  v15 = -[_PSCalendarEventPredictorDelegateWrapper initWithCalendarEventPredictor:startSecondsFromQuery:endSecondsFromQuery:maxParticipants:isEnabled:defaultConfidenceCategory:](self, "initWithCalendarEventPredictor:startSecondsFromQuery:endSecondsFromQuery:maxParticipants:isEnabled:defaultConfidenceCategory:", v7, v12, v13, v14, v9, v11);
  return v15;
}

- (void)updateWithConfig:(id)a3
{
  id v4;
  double v5;
  double v6;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "startSecondsFromQuery");
  self->_startSecondsFromQuery = v5;
  objc_msgSend(v4, "endSecondsFromQuery");
  self->_endSecondsFromQuery = v6;
  self->_maxParticipants = objc_msgSend(v4, "maxOtherParticipants");
  self->_isEnabled = objc_msgSend(v4, "isEnabled");
  v7 = objc_msgSend(v4, "defaultConfidenceCategory");

  self->_defaultConfidenceCategory = v7;
}

- (id)getSuggestionsWithPredictionContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -self->_startSecondsFromQuery);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", self->_endSecondsFromQuery);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSCalendarModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v12, 2u);
    }

    -[_PSCalendarEventPredictor zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:](self->_calendarEventPredictor, "zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:", v4, v5, v6, self->_maxParticipants);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSCalendarModelTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v12, 2u);
    }

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_DEFAULT, "ZKW structured calendar suggestions: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "ZKW structured calendar model disabled. Not generating suggestions.", (uint8_t *)&v12, 2u);
    }
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)pingWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void (**v42)(id, void *);
  void *v43;
  id v44;
  void *v45;
  id v46;
  id obj;
  uint64_t v48;
  void *v49;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  Class (*v61)(uint64_t);
  void *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v44 = a4;
  v42 = (void (**)(id, void *))a5;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_PSCalendarEventPredictorDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:].cold.2((uint64_t)v46, v7);

  objc_msgSend(v46, "psPredictionContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSCalendarEventPredictorDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:].cold.1((uint64_t)v45, v8);

  }
  objc_msgSend(getATXProactiveSuggestionClientModelClass(), "clientModelIdFromClientModelType:", 29);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v44, "isEqualToString:", v43) & 1) != 0)
  {
    -[_PSCalendarEventPredictorDelegateWrapper getSuggestionsWithPredictionContext:](self, "getSuggestionsWithPredictionContext:", v45);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_opt_new();
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v9;
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v51)
    {
      v48 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v56 != v48)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          v64 = 0;
          v65 = &v64;
          v66 = 0x2050000000;
          v12 = (void *)getATXProactiveSuggestionClientModelSpecificationClass_softClass;
          v67 = getATXProactiveSuggestionClientModelSpecificationClass_softClass;
          if (!getATXProactiveSuggestionClientModelSpecificationClass_softClass)
          {
            v59 = MEMORY[0x1E0C809B0];
            v60 = 3221225472;
            v61 = __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke;
            v62 = &unk_1E43FEA00;
            v63 = &v64;
            __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke((uint64_t)&v59);
            v12 = (void *)v65[3];
          }
          v13 = objc_retainAutorelease(v12);
          _Block_object_dispose(&v64, 8);
          v14 = [v13 alloc];
          objc_msgSend(getATXProactiveSuggestionClientModelClass(), "clientModelIdFromClientModelType:", 29);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v15, CFSTR("1.0"), 0);

          v64 = 0;
          v65 = &v64;
          v66 = 0x2050000000;
          v17 = (void *)getATXProactiveSuggestionExecutableSpecificationClass_softClass;
          v67 = getATXProactiveSuggestionExecutableSpecificationClass_softClass;
          if (!getATXProactiveSuggestionExecutableSpecificationClass_softClass)
          {
            v59 = MEMORY[0x1E0C809B0];
            v60 = 3221225472;
            v61 = __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke;
            v62 = &unk_1E43FEA00;
            v63 = &v64;
            __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke((uint64_t)&v59);
            v17 = (void *)v65[3];
          }
          v18 = objc_retainAutorelease(v17);
          _Block_object_dispose(&v64, 8);
          v19 = [v18 alloc];
          objc_msgSend(v11, "description");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_opt_new();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v19, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v11, v20, v22, 6);

          v64 = 0;
          v65 = &v64;
          v66 = 0x2050000000;
          v24 = (void *)getATXProactiveSuggestionUISpecificationClass_softClass;
          v67 = getATXProactiveSuggestionUISpecificationClass_softClass;
          if (!getATXProactiveSuggestionUISpecificationClass_softClass)
          {
            v59 = MEMORY[0x1E0C809B0];
            v60 = 3221225472;
            v61 = __getATXProactiveSuggestionUISpecificationClass_block_invoke;
            v62 = &unk_1E43FEA00;
            v63 = &v64;
            __getATXProactiveSuggestionUISpecificationClass_block_invoke((uint64_t)&v59);
            v24 = (void *)v65[3];
          }
          v25 = objc_retainAutorelease(v24);
          _Block_object_dispose(&v64, 8);
          v26 = [v25 alloc];
          objc_msgSend(v11, "groupName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (!v27)
          {
            objc_msgSend(v11, "recipients");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "firstObject");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "handle");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v52;
          }
          v64 = 0;
          v65 = &v64;
          v66 = 0x2050000000;
          v29 = (void *)getATXProactiveSuggestionLayoutConfigClass_softClass;
          v67 = getATXProactiveSuggestionLayoutConfigClass_softClass;
          if (!getATXProactiveSuggestionLayoutConfigClass_softClass)
          {
            v59 = MEMORY[0x1E0C809B0];
            v60 = 3221225472;
            v61 = __getATXProactiveSuggestionLayoutConfigClass_block_invoke;
            v62 = &unk_1E43FEA00;
            v63 = &v64;
            __getATXProactiveSuggestionLayoutConfigClass_block_invoke((uint64_t)&v59);
            v29 = (void *)v65[3];
          }
          v30 = objc_retainAutorelease(v29);
          _Block_object_dispose(&v64, 8);
          objc_msgSend(v30, "layoutConfigurationsForLayoutOptions:", 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v26, "initWithTitle:subtitle:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:", v28, 0, v31, 1, 1, 1);

          if (!v27)
          {

          }
          v64 = 0;
          v65 = &v64;
          v66 = 0x2050000000;
          v33 = (void *)getATXProactiveSuggestionScoreSpecificationClass_softClass;
          v67 = getATXProactiveSuggestionScoreSpecificationClass_softClass;
          if (!getATXProactiveSuggestionScoreSpecificationClass_softClass)
          {
            v59 = MEMORY[0x1E0C809B0];
            v60 = 3221225472;
            v61 = __getATXProactiveSuggestionScoreSpecificationClass_block_invoke;
            v62 = &unk_1E43FEA00;
            v63 = &v64;
            __getATXProactiveSuggestionScoreSpecificationClass_block_invoke((uint64_t)&v59);
            v33 = (void *)v65[3];
          }
          v34 = objc_retainAutorelease(v33);
          _Block_object_dispose(&v64, 8);
          v35 = (void *)objc_msgSend([v34 alloc], "initWithRawScore:suggestedConfidenceCategory:", self->_defaultConfidenceCategory, 95.0);
          v64 = 0;
          v65 = &v64;
          v66 = 0x2050000000;
          v36 = (void *)getATXProactiveSuggestionClass_softClass;
          v67 = getATXProactiveSuggestionClass_softClass;
          if (!getATXProactiveSuggestionClass_softClass)
          {
            v59 = MEMORY[0x1E0C809B0];
            v60 = 3221225472;
            v61 = __getATXProactiveSuggestionClass_block_invoke;
            v62 = &unk_1E43FEA00;
            v63 = &v64;
            __getATXProactiveSuggestionClass_block_invoke((uint64_t)&v59);
            v36 = (void *)v65[3];
          }
          v37 = objc_retainAutorelease(v36);
          _Block_object_dispose(&v64, 8);
          v38 = (void *)objc_msgSend([v37 alloc], "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v16, v23, v32, v35);
          objc_msgSend(v49, "addObject:", v38);

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v51);
    }

    v64 = 0;
    v65 = &v64;
    v66 = 0x2050000000;
    v39 = (void *)getATXSuggestionRequestResponseClass_softClass_0;
    v67 = getATXSuggestionRequestResponseClass_softClass_0;
    if (!getATXSuggestionRequestResponseClass_softClass_0)
    {
      v59 = MEMORY[0x1E0C809B0];
      v60 = 3221225472;
      v61 = __getATXSuggestionRequestResponseClass_block_invoke_0;
      v62 = &unk_1E43FEA00;
      v63 = &v64;
      __getATXSuggestionRequestResponseClass_block_invoke_0((uint64_t)&v59);
      v39 = (void *)v65[3];
    }
    v40 = objc_retainAutorelease(v39);
    _Block_object_dispose(&v64, 8);
    v41 = (void *)objc_msgSend([v40 alloc], "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", v49, 0, v46, 2, 0);
    v42[2](v42, v41);

  }
  else
  {
    +[_PSZkwUtils clientModelMismatchErrorResponseForRequest:requestedClientModelId:actualClientModelId:](_PSZkwUtils, "clientModelMismatchErrorResponseForRequest:requestedClientModelId:actualClientModelId:", v46, v44, v43);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v42[2](v42, obj);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarEventPredictor, 0);
}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(NSObject *)a2 reply:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Encountered context of unknown class: %@", (uint8_t *)&v5, 0xCu);

}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(NSObject *)a2 reply:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_DEBUG, "Calendar model delegate call %@", (uint8_t *)&v2, 0xCu);
}

@end
