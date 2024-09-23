@implementation _PSKNNZKWATXDelegateWrapper

- (_PSKNNZKWATXDelegateWrapper)initWithKNNModel:(id)a3 modelType:(int64_t)a4 modelConfiguration:(id)a5 maxSuggestions:(unint64_t)a6 transformers:(id)a7 isEnabled:(BOOL)a8 defaultConfidenceCategory:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  _PSKNNZKWATXDelegateWrapper *v19;
  _PSKNNZKWATXDelegateWrapper *v20;
  objc_super v22;

  v16 = a3;
  v17 = a5;
  v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_PSKNNZKWATXDelegateWrapper;
  v19 = -[_PSKNNZKWATXDelegateWrapper init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_knnModel, a3);
    v20->_modelType = a4;
    objc_storeStrong((id *)&v20->_modelConfiguration, a5);
    v20->_maxSuggestions = a6;
    objc_storeStrong((id *)&v20->_transformers, a7);
    v20->_isEnabled = a8;
    v20->_defaultConfidenceCategory = a9;
  }

  return v20;
}

- (_PSKNNZKWATXDelegateWrapper)initWithKNNModel:(id)a3 primaryInteractionsConfig:(id)a4
{
  id v6;
  id v7;
  _PSKNNModelConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _PSKNNModelConfiguration *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _PSKNNZKWATXDelegateWrapper *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [_PSKNNModelConfiguration alloc];
  objc_msgSend(v6, "mechanisms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionCountMaxDepths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionHistoryRelativeStartDates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "modelType");
  -[_PSKNNZKWATXDelegateWrapper _getInteractionFilterForPrimaryInteractionsModel](self, "_getInteractionFilterForPrimaryInteractionsModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_PSKNNModelConfiguration initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:shouldExcludeInteractionBlock:](v8, "initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:shouldExcludeInteractionBlock:", v9, v10, v11, v12, v13, 5, CFSTR("PastFaceTimeCallsorMessages"), v14);

  v16 = (void *)objc_opt_new();
  v17 = objc_msgSend(v6, "maxSuggestions");
  objc_msgSend(v16, "mapRecipientsToContactsWithUnmapped:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v6, "isEnabled");
  v21 = objc_msgSend(v6, "defaultConfidenceCategory");

  v22 = -[_PSKNNZKWATXDelegateWrapper initWithKNNModel:modelType:modelConfiguration:maxSuggestions:transformers:isEnabled:defaultConfidenceCategory:](self, "initWithKNNModel:modelType:modelConfiguration:maxSuggestions:transformers:isEnabled:defaultConfidenceCategory:", v7, 32, v15, v17, v19, v20, v21);
  return v22;
}

- (_PSKNNZKWATXDelegateWrapper)initWithKNNModel:(id)a3 fallbackInteractionConfig:(id)a4
{
  id v6;
  id v7;
  _PSKNNModelConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _PSKNNModelConfiguration *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _PSKNNZKWATXDelegateWrapper *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [_PSKNNModelConfiguration alloc];
  objc_msgSend(v6, "mechanisms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionCountMaxDepths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionHistoryRelativeStartDates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_PSKNNModelConfiguration initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:](v8, "initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:", v9, v10, v11, v12, objc_msgSend(v6, "modelType"), 5, CFSTR("PastPhoneCalls"));

  v14 = (void *)objc_opt_new();
  v15 = objc_msgSend(v6, "maxSuggestions");
  objc_msgSend(v14, "mapRecipientsToContactsWithUnmapped:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v6, "isEnabled");
  v19 = objc_msgSend(v6, "defaultConfidenceCategory");

  v20 = -[_PSKNNZKWATXDelegateWrapper initWithKNNModel:modelType:modelConfiguration:maxSuggestions:transformers:isEnabled:defaultConfidenceCategory:](self, "initWithKNNModel:modelType:modelConfiguration:maxSuggestions:transformers:isEnabled:defaultConfidenceCategory:", v7, 33, v13, v15, v17, v18, v19);
  return v20;
}

- (id)_getInteractionFilterForPrimaryInteractionsModel
{
  return &__block_literal_global_45;
}

- (void)updateWithPrimaryInteractionsConfig:(id)a3
{
  id v4;
  _PSKNNModelConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _PSKNNModelConfiguration *v12;
  _PSKNNModelConfiguration *modelConfiguration;
  int64_t v14;

  v4 = a3;
  v5 = [_PSKNNModelConfiguration alloc];
  objc_msgSend(v4, "mechanisms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionCountMaxDepths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionHistoryRelativeStartDates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "modelType");
  -[_PSKNNZKWATXDelegateWrapper _getInteractionFilterForPrimaryInteractionsModel](self, "_getInteractionFilterForPrimaryInteractionsModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_PSKNNModelConfiguration initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:shouldExcludeInteractionBlock:](v5, "initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:shouldExcludeInteractionBlock:", v6, v7, v8, v9, v10, 5, CFSTR("PastFaceTimeCallsorMessages"), v11);
  modelConfiguration = self->_modelConfiguration;
  self->_modelConfiguration = v12;

  self->_isEnabled = objc_msgSend(v4, "isEnabled");
  v14 = objc_msgSend(v4, "defaultConfidenceCategory");

  self->_defaultConfidenceCategory = v14;
}

- (void)updateWithFallbackInteractionsConfig:(id)a3
{
  id v4;
  _PSKNNModelConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _PSKNNModelConfiguration *v10;
  _PSKNNModelConfiguration *modelConfiguration;
  int64_t v12;

  v4 = a3;
  v5 = [_PSKNNModelConfiguration alloc];
  objc_msgSend(v4, "mechanisms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionCountMaxDepths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionHistoryRelativeStartDates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_PSKNNModelConfiguration initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:](v5, "initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:", v6, v7, v8, v9, objc_msgSend(v4, "modelType"), 5, CFSTR("PastPhoneCalls"));
  modelConfiguration = self->_modelConfiguration;
  self->_modelConfiguration = v10;

  self->_isEnabled = objc_msgSend(v4, "isEnabled");
  v12 = objc_msgSend(v4, "defaultConfidenceCategory");

  self->_defaultConfidenceCategory = v12;
}

- (id)getSuggestionsWithPredictionContext:(id)a3
{
  id v4;
  int64_t modelType;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  modelType = self->_modelType;
  if (!self->_isEnabled)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (modelType == 32)
    {
      if (v11)
      {
        LOWORD(v18) = 0;
        v12 = "ZKW primary interaction model disabled. Not generating suggestions.";
LABEL_25:
        _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, 2u);
      }
    }
    else if (v11)
    {
      LOWORD(v18) = 0;
      v12 = "ZKW fallback interaction model disabled. Not generating suggestions.";
      goto LABEL_25;
    }
LABEL_26:
    v15 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_27;
  }
  if (modelType == 33)
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v13))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFallbackInteractionModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
    }

    -[_PSKNNModel rankedZkwSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:](self->_knnModel, "rankedZkwSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:", v4, self->_modelConfiguration, self->_maxSuggestions);
    v7 = objc_claimAutoreleasedReturnValue();
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      LOWORD(v18) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFallbackInteractionModelTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v18, 2u);
    }

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    v18 = 138739971;
    v19 = v7;
    v10 = "ZKW fallback interaction suggestions: %{sensitive}@";
    goto LABEL_19;
  }
  if (modelType != 32)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_PSKNNZKWATXDelegateWrapper getSuggestionsWithPredictionContext:].cold.1(&self->_modelType, v7, v16);
    goto LABEL_26;
  }
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFaceTimeInteractionModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  -[_PSKNNModel rankedZkwSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:](self->_knnModel, "rankedZkwSuggestionsWithPredictionContext:modelConfiguration:maxSuggestions:", v4, self->_modelConfiguration, self->_maxSuggestions);
  v7 = objc_claimAutoreleasedReturnValue();
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFaceTimeInteractionModelTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v18, 2u);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    goto LABEL_20;
  v18 = 138739971;
  v19 = v7;
  v10 = "ZKW primary interaction suggestions: %{sensitive}@";
LABEL_19:
  _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v18, 0xCu);
LABEL_20:

  +[_PSFTZKWSuggestionsTransformerFactory getResultsFromTransformers:suggestions:](_PSFTZKWSuggestionsTransformerFactory, "getResultsFromTransformers:suggestions:", self->_transformers, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v15;
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
  _BOOL4 v33;
  void *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  void (**v43)(id, void *);
  void *v44;
  id v45;
  void *v46;
  id v47;
  id obj;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
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
  v47 = a3;
  v45 = a4;
  v43 = (void (**)(id, void *))a5;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_PSKNNZKWATXDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:].cold.2((uint64_t)v47, v7);

  objc_msgSend(v47, "psPredictionContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSKNNZKWATXDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:].cold.1((uint64_t)v46, v8);

  }
  objc_msgSend(getATXProactiveSuggestionClientModelClass_1(), "clientModelIdFromClientModelType:", self->_modelType);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v45, "isEqualToString:", v44) & 1) != 0)
  {
    -[_PSKNNZKWATXDelegateWrapper getSuggestionsWithPredictionContext:](self, "getSuggestionsWithPredictionContext:", v46);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_opt_new();
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v9;
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v51)
    {
      v49 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v57 != v49)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v12 = (void *)getATXProactiveSuggestionClientModelSpecificationClass_softClass_1;
          v68 = getATXProactiveSuggestionClientModelSpecificationClass_softClass_1;
          if (!getATXProactiveSuggestionClientModelSpecificationClass_softClass_1)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke_1;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke_1((uint64_t)&v60);
            v12 = (void *)v66[3];
          }
          v13 = objc_retainAutorelease(v12);
          _Block_object_dispose(&v65, 8);
          v14 = [v13 alloc];
          objc_msgSend(getATXProactiveSuggestionClientModelClass_1(), "clientModelIdFromClientModelType:", self->_modelType);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v15, CFSTR("1.0"), 0);

          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v17 = (void *)getATXProactiveSuggestionExecutableSpecificationClass_softClass_1;
          v68 = getATXProactiveSuggestionExecutableSpecificationClass_softClass_1;
          if (!getATXProactiveSuggestionExecutableSpecificationClass_softClass_1)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke_1;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke_1((uint64_t)&v60);
            v17 = (void *)v66[3];
          }
          v18 = objc_retainAutorelease(v17);
          _Block_object_dispose(&v65, 8);
          v19 = [v18 alloc];
          objc_msgSend(v11, "description");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_opt_new();
          objc_msgSend(v21, "UUIDString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v19, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v11, v20, v22, 6);

          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v24 = (void *)getATXProactiveSuggestionUISpecificationClass_softClass_1;
          v68 = getATXProactiveSuggestionUISpecificationClass_softClass_1;
          if (!getATXProactiveSuggestionUISpecificationClass_softClass_1)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionUISpecificationClass_block_invoke_1;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionUISpecificationClass_block_invoke_1((uint64_t)&v60);
            v24 = (void *)v66[3];
          }
          v25 = objc_retainAutorelease(v24);
          _Block_object_dispose(&v65, 8);
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
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v29 = (void *)getATXProactiveSuggestionLayoutConfigClass_softClass_1;
          v68 = getATXProactiveSuggestionLayoutConfigClass_softClass_1;
          if (!getATXProactiveSuggestionLayoutConfigClass_softClass_1)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionLayoutConfigClass_block_invoke_1;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionLayoutConfigClass_block_invoke_1((uint64_t)&v60);
            v29 = (void *)v66[3];
          }
          v30 = objc_retainAutorelease(v29);
          _Block_object_dispose(&v65, 8);
          objc_msgSend(v30, "layoutConfigurationsForLayoutOptions:", 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v26, "initWithTitle:subtitle:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:", v28, 0, v31, 1, 1, 1);

          if (!v27)
          {

          }
          v33 = self->_modelType == 32;
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v34 = (void *)getATXProactiveSuggestionScoreSpecificationClass_softClass_1;
          v68 = getATXProactiveSuggestionScoreSpecificationClass_softClass_1;
          if (!getATXProactiveSuggestionScoreSpecificationClass_softClass_1)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionScoreSpecificationClass_block_invoke_1;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionScoreSpecificationClass_block_invoke_1((uint64_t)&v60);
            v34 = (void *)v66[3];
          }
          v35 = objc_retainAutorelease(v34);
          _Block_object_dispose(&v65, 8);
          v36 = (void *)objc_msgSend([v35 alloc], "initWithRawScore:suggestedConfidenceCategory:", self->_defaultConfidenceCategory, dbl_1A08F9A00[v33]);
          v65 = 0;
          v66 = &v65;
          v67 = 0x2050000000;
          v37 = (void *)getATXProactiveSuggestionClass_softClass_1;
          v68 = getATXProactiveSuggestionClass_softClass_1;
          if (!getATXProactiveSuggestionClass_softClass_1)
          {
            v60 = MEMORY[0x1E0C809B0];
            v61 = 3221225472;
            v62 = __getATXProactiveSuggestionClass_block_invoke_1;
            v63 = &unk_1E43FEA00;
            v64 = &v65;
            __getATXProactiveSuggestionClass_block_invoke_1((uint64_t)&v60);
            v37 = (void *)v66[3];
          }
          v38 = objc_retainAutorelease(v37);
          _Block_object_dispose(&v65, 8);
          v39 = (void *)objc_msgSend([v38 alloc], "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v16, v23, v32, v36);
          objc_msgSend(v50, "addObject:", v39);

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v51);
    }

    v65 = 0;
    v66 = &v65;
    v67 = 0x2050000000;
    v40 = (void *)getATXSuggestionRequestResponseClass_softClass_2;
    v68 = getATXSuggestionRequestResponseClass_softClass_2;
    if (!getATXSuggestionRequestResponseClass_softClass_2)
    {
      v60 = MEMORY[0x1E0C809B0];
      v61 = 3221225472;
      v62 = __getATXSuggestionRequestResponseClass_block_invoke_2;
      v63 = &unk_1E43FEA00;
      v64 = &v65;
      __getATXSuggestionRequestResponseClass_block_invoke_2((uint64_t)&v60);
      v40 = (void *)v66[3];
    }
    v41 = objc_retainAutorelease(v40);
    _Block_object_dispose(&v65, 8);
    v42 = (void *)objc_msgSend([v41 alloc], "initWithSuggestions:feedbackMetadata:originalRequest:responseCode:error:", v50, 0, v47, 2, 0);
    v43[2](v43, v42);

  }
  else
  {
    +[_PSZkwUtils clientModelMismatchErrorResponseForRequest:requestedClientModelId:actualClientModelId:](_PSZkwUtils, "clientModelMismatchErrorResponseForRequest:requestedClientModelId:actualClientModelId:", v47, v45, v44);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v43[2](v43, obj);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformers, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_knnModel, 0);
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
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, a3, "Unknown ZKW fallback interaction model type: %ld", (uint8_t *)&v4);
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

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(NSObject *)a2 reply:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_DEBUG, "Interaction model delegate call %@", (uint8_t *)&v2, 0xCu);
}

@end
