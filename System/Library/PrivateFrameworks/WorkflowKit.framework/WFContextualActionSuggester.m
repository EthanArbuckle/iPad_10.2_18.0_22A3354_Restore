@implementation WFContextualActionSuggester

- (WFContextualActionSuggester)init
{
  WFContextualActionSuggester *v2;
  void *v3;
  objc_class *v4;
  CAXSuggestionProvider *v5;
  CAXSuggestionProvider *provider;
  WFContextualActionSuggester *v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)WFContextualActionSuggester;
  v2 = -[WFContextualActionSuggester init](&v9, sel_init);
  if (v2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)getCAXSuggestionProviderClass_softClass;
    v14 = getCAXSuggestionProviderClass_softClass;
    if (!getCAXSuggestionProviderClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getCAXSuggestionProviderClass_block_invoke;
      v10[3] = &unk_1E7AF9520;
      v10[4] = &v11;
      __getCAXSuggestionProviderClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v5 = (CAXSuggestionProvider *)objc_alloc_init(v4);
    provider = v2->_provider;
    v2->_provider = v5;

    v7 = v2;
  }

  return v2;
}

- (id)suggestActionsForContext:(id)a3 numSuggestions:(unint64_t)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  os_signpost_id_t v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[8];
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionSuggester.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(v7, "historicalActionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionSuggester.m"), 108, CFSTR("Context must have non-nil historical action identifiers"));

  }
  getWFContextualActionsLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  getWFContextualActionsLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ContextualSuggestionsUpdate", ", buf, 2u);
  }

  WFLocalizedString(CFSTR("Shortcuts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualActionSuggester initialSuggestionsForContextIfApplicable:numSuggestions:](self, "initialSuggestionsForContextIfApplicable:numSuggestions:", v7, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  if (!v15)
  {
    v35 = v10;
    objc_msgSend(v7, "historicalActionIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "if_map:", &__block_literal_global_49428);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v19 = (void *)getCAXPredictionContextClass_softClass;
    v46 = getCAXPredictionContextClass_softClass;
    if (!getCAXPredictionContextClass_softClass)
    {
      *(_QWORD *)buf = v16;
      v39 = 3221225472;
      v40 = __getCAXPredictionContextClass_block_invoke;
      v41 = &unk_1E7AF9520;
      v42 = &v43;
      __getCAXPredictionContextClass_block_invoke((uint64_t)buf);
      v19 = (void *)v44[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v43, 8);
    v21 = [v20 alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithSuggestionDate:sourceAppName:contents:previousActions:searchTerm:", v23, v14, 0, v18, 0);

    v16 = v22;
    -[WFContextualActionSuggester provider](self, "provider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "predictWithPredictionContext:candidateActions:maxSuggestions:", v24, 0, a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "suggestedActions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "valueForKey:", CFSTR("actionIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v35;
  }
  v36[0] = v16;
  v36[1] = 3221225472;
  v36[2] = __71__WFContextualActionSuggester_suggestActionsForContext_numSuggestions___block_invoke_2;
  v36[3] = &unk_1E7AF56F0;
  v37 = v7;
  v28 = v7;
  objc_msgSend(v15, "if_compactMap:", v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  getWFContextualActionsLogObject();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v31, OS_SIGNPOST_INTERVAL_END, v10, "ContextualSuggestionsUpdate", ", buf, 2u);
  }

  return v29;
}

- (BOOL)shouldShowInitialSuggestionsForContext:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "historicalActionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (id)initialSuggestionsForContextIfApplicable:(id)a3 numSuggestions:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  _QWORD v12[13];

  v12[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "historicalActionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return 0;
  v12[0] = CFSTR("is.workflow.actions.sendmessage");
  v12[1] = CFSTR("is.workflow.actions.openapp");
  v12[2] = CFSTR("is.workflow.actions.playmusic");
  v12[3] = CFSTR("is.workflow.actions.gettext");
  v12[4] = CFSTR("is.workflow.actions.showresult");
  v12[5] = CFSTR("is.workflow.actions.choosefrommenu");
  v12[6] = CFSTR("com.apple.mobilephone.call");
  v12[7] = CFSTR("is.workflow.actions.getlastphoto");
  v12[8] = CFSTR("is.workflow.actions.file");
  v12[9] = CFSTR("is.workflow.actions.getclipboard");
  v12[10] = CFSTR("is.workflow.actions.takephoto");
  v12[11] = CFSTR("is.workflow.actions.timer.start");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  if (v9 >= a4)
    v10 = a4;
  else
    v10 = v9;
  objc_msgSend(v8, "subarrayWithRange:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSUUID)lastSuggestionSessionUUID
{
  return self->_lastSuggestionSessionUUID;
}

- (CAXSuggestionProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_lastSuggestionSessionUUID, 0);
}

id __71__WFContextualActionSuggester_suggestActionsForContext_numSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  id v12;

  v3 = a2;
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createActionWithIdentifier:serializedParameters:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "surface");
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_msgSend(v7, "resourceManager"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "resourcesRequiredForDisplayAvailable"),
          v8,
          !v9)
      || (WFActionShouldBeIncludedInResults(v7, v6 == 4) & 1) == 0)
    {

      v11 = 0;
    }
    else
    {
      v10 = objc_msgSend(v7, "isDiscontinued");

      if (v10)
        v11 = 0;
      else
        v11 = v7;
    }
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __71__WFContextualActionSuggester_suggestActionsForContext_numSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  objc_class *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getCAXContextualActionClass_softClass;
  v11 = getCAXContextualActionClass_softClass;
  if (!getCAXContextualActionClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getCAXContextualActionClass_block_invoke;
    v7[3] = &unk_1E7AF9520;
    v7[4] = &v8;
    __getCAXContextualActionClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "initWithActionIdentifier:parameters:", v2, 0);

  return v5;
}

@end
