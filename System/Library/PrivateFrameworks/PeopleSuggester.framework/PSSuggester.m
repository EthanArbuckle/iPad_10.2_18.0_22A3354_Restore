@implementation PSSuggester

void __56___PSSuggester_initWithConfiguration_feedbackRecording___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _Unwind_Exception *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D15900], "peopleDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Feedback"), 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v4 & 1) != 0
    || ((v24 = 0,
         v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v24),
         v9 = v24,
         v8)
      ? (v10 = v9 == 0)
      : (v10 = 0),
        v10))
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v13 = (void *)getBMStoreConfigClass_softClass;
    v33 = getBMStoreConfigClass_softClass;
    if (!getBMStoreConfigClass_softClass)
    {
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __getBMStoreConfigClass_block_invoke;
      v28 = &unk_1E43FEA00;
      v29 = &v30;
      __getBMStoreConfigClass_block_invoke((uint64_t)&v25);
      v13 = (void *)v31[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v30, 8);
    v15 = [v14 alloc];
    objc_msgSend(v5, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v17 = (_QWORD *)getbm_defaultStoreSegmentSizeSymbolLoc_ptr;
    v33 = getbm_defaultStoreSegmentSizeSymbolLoc_ptr;
    if (!getbm_defaultStoreSegmentSizeSymbolLoc_ptr)
    {
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __getbm_defaultStoreSegmentSizeSymbolLoc_block_invoke;
      v28 = &unk_1E43FEA00;
      v29 = &v30;
      __getbm_defaultStoreSegmentSizeSymbolLoc_block_invoke((uint64_t)&v25);
      v17 = (_QWORD *)v31[3];
    }
    _Block_object_dispose(&v30, 8);
    if (!v17)
    {
      v23 = (_Unwind_Exception *)-[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
      _Block_object_dispose(&v30, 8);
      _Unwind_Resume(v23);
    }
    v11 = (void *)objc_msgSend(v15, "initWithStoreBasePath:segmentSize:", v16, *v17);

    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v18 = (void *)getBMStoreStreamClass_softClass;
    v33 = getBMStoreStreamClass_softClass;
    if (!getBMStoreStreamClass_softClass)
    {
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __getBMStoreStreamClass_block_invoke;
      v28 = &unk_1E43FEA00;
      v29 = &v30;
      __getBMStoreStreamClass_block_invoke((uint64_t)&v25);
      v18 = (void *)v31[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v30, 8);
    v12 = objc_msgSend([v19 alloc], "initWithPrivateStreamIdentifier:storeConfig:", CFSTR("CNA"), v11);
    -[NSObject source](v12, "source");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
  else
  {
    v11 = v9;
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __56___PSSuggester_initWithConfiguration_feedbackRecording___block_invoke_cold_2();
  }

}

uint64_t __53___PSSuggester_candidatesForShareSheetRankingCompute__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "candidateIdentifier");
}

BOOL __46___PSSuggester_candidatesForShareSheetRanking__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "conversationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "derivedIntentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

id __46___PSSuggester_candidatesForShareSheetRanking__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "conversationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "derivedIntentIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

void __46___PSSuggester_candidatesForShareSheetRanking__block_invoke_123(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __46___PSSuggester_candidatesForShareSheetRanking__block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __72___PSSuggester_computeShareSheetEphemeralFeaturesWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __72___PSSuggester_computeShareSheetEphemeralFeaturesWithPredictionContext___block_invoke_129(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __47___PSSuggester_suggestInteractionsFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __47___PSSuggester_suggestInteractionsFromContext___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "sync:", v7);

  +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_DEFAULT, "_PSSuggester: finished suggestInteractionsFromContext", v9, 2u);
  }

}

uint64_t __70___PSSuggester_asyncSuggestInteractionsFromContext_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

void __35___PSSuggester_getCacheSuggestions__block_invoke(uint64_t a1, void *a2, unsigned __int8 a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  objc_msgSend(v5, "conversationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v6),
        v7,
        v8))
  {
    objc_msgSend(v5, "derivedIntentIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v10 = (void *)getPSPeopleSuggestionsMetricsItemClass_softClass_0;
  v19 = getPSPeopleSuggestionsMetricsItemClass_softClass_0;
  if (!getPSPeopleSuggestionsMetricsItemClass_softClass_0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getPSPeopleSuggestionsMetricsItemClass_block_invoke_0;
    v15[3] = &unk_1E43FEA00;
    v15[4] = &v16;
    __getPSPeopleSuggestionsMetricsItemClass_block_invoke_0((uint64_t)v15);
    v10 = (void *)v17[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v16, 8);
  v12 = [v11 alloc];
  objc_msgSend(v5, "bundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithId:model:transportBundleId:rank:score:", v6, CFSTR("cached"), v13, a3, -1.0);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
}

void __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Title"), CFSTR("TTR Share Sheet People Suggestion Feedback"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:");
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Description"), CFSTR("How would you rate your experience using Share Sheet on iPhone? (Very positive, positive, neutral, negative, or very negative)\n\n\n\nWhat, if anything, did you like about this Share Sheet experience?\n\n\n\nWhat, if anything, did you dislike about this Share Sheet experience?\n\n\n\nAny other comments to share?\n\n\n\nFeel free to include screenshots or screen recordings (with or without audio) to this radar — thanks! :)\n\n\n\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:");
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("1650220"));
  v1 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Share Sheet User Study"));
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("Feedback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Reproducible"), CFSTR("Not Applicable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("IncludeDevicePrefixInTitle"), CFSTR("1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("UI/Usability"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v1;
  objc_msgSend(v0, "addObject:", v1);
  v13 = (void *)v2;
  objc_msgSend(v0, "addObject:", v2);
  objc_msgSend(v0, "addObject:", v3);
  objc_msgSend(v0, "addObject:", v4);
  objc_msgSend(v0, "addObject:", v5);
  objc_msgSend(v0, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueryItems:", v0);
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = objc_msgSend(v9, "openURL:withOptions:error:", v8, 0, &v17);
  v11 = v17;

  if ((v10 & 1) == 0)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke_cold_1();

  }
}

void __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke_193(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFDictionary *v5;
  __CFUserNotification *v6;
  CFOptionFlags v7;
  _QWORD v8[7];
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C9B810];
  v8[0] = *MEMORY[0x1E0C9B800];
  v8[1] = v2;
  v9[0] = CFSTR("ShareSheet Study Feedback request");
  v9[1] = CFSTR("Could you please share with us your feedback on your experience with the ShareSheet for this session?");
  v3 = *MEMORY[0x1E0C9B868];
  v8[2] = *MEMORY[0x1E0C9B838];
  v8[3] = v3;
  v9[2] = CFSTR("File a radar");
  v9[3] = CFSTR("Dismiss");
  v4 = *MEMORY[0x1E0DABBC8];
  v8[4] = *MEMORY[0x1E0C9B820];
  v8[5] = v4;
  v9[4] = MEMORY[0x1E0C9AAB0];
  v9[5] = MEMORY[0x1E0C9AAB0];
  v8[6] = *MEMORY[0x1E0DABBA8];
  v9[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 7);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 1uLL, 0, v5);
  v7 = 0;
  CFUserNotificationReceiveResponse(v6, 0.0, &v7);
  if (v6)
    CFRelease(v6);
  if (!v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC Error: %@"), v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("com.apple.PeopleSuggester"), 1, v7);

  +[_PSConstants suggestionPathXPCError](_PSConstants, "suggestionPathXPCError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSuggestionPath:", v9);

  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC Error: %@"), v3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logErrorEventWithName:details:attributes:", CFSTR("XPCError"), v11, MEMORY[0x1E0C9AA70]);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

BOOL __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_229(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _BOOL8 v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(os_unfair_lock_s **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  os_unfair_lock_unlock(v2 + 6);
  return v3;
}

void __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.coreduet.logging"));
  v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("forceSuggesterEmptySuggestionForTesting"));

  if (v9)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_DEFAULT, "Simulating a empty suggestion for testing", (uint8_t *)&v29, 2u);
    }

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = MEMORY[0x1E0C9AA60];

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "setTimedOut:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    objc_msgSend(*(id *)(a1 + 40), "sync:", v7);
    objc_msgSend(*(id *)(a1 + 32), "showNotificationToFileARadarForUserStudyParticipants");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSuggestionCompletionDate:", v13);

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("Suggestions timed out");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("com.apple.PeopleSuggester"), 1, v15);

      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        LOWORD(v29) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSSuggestionAsyncFallbackTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v29, 2u);
      }

      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_DEFAULT, "Timed out people suggestions", (uint8_t *)&v29, 2u);
      }

      objc_msgSend(*(id *)(a1 + 48), "logErrorEventWithName:details:attributes:", CFSTR("NormalPathTimedout"), &stru_1E4402490, MEMORY[0x1E0C9AA70]);
    }
    else
    {
      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v20))
      {
        LOWORD(v29) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSSuggestionAsyncTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v29, 2u);
      }

      v16 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) + 16))();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = 0;

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412290;
      v30 = v24;
      _os_log_impl(&dword_1A07F4000, v23, OS_LOG_TYPE_DEFAULT, "Finished fetching people suggestions, timedOut: %@", (uint8_t *)&v29, 0xCu);

    }
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_DEFAULT, "Received completion without valid reply block", (uint8_t *)&v29, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "logErrorEventWithName:details:attributes:", CFSTR("ReceivedNilReplyBlock"), &stru_1E4402490, MEMORY[0x1E0C9AA70]);
  }
  v25 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "trialDeploymentId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "trialExperimentId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "trialTreatmentId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addTrialDeploymentId:trialExperimentId:trialTreatmentId:", v26, v27, v28);

  objc_msgSend(*(id *)(a1 + 48), "end");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));

}

void __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_241(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  objc_msgSend(*(id *)(a1 + 32), "createSubSpanWithName:", CFSTR("timeoutBlocksSpan"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.coreduet.logging"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("shouldAllowShareSheetHangs"));

  if ((v4 & 1) == 0 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_INFO, "Timeout. Falling back to cached suggestions.", v10, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
    +[_PSConstants suggestionPathCachedSuggestion](_PSConstants, "suggestionPathCachedSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setSuggestionPath:", v6);

    objc_msgSend(*(id *)(a1 + 40), "getCacheSuggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSSuggesterCache defaultService](_PSSuggesterCache, "defaultService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getCachedContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setIsFallbackFetch:", 1);
    objc_msgSend(*(id *)(a1 + 48), "sync:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(v2, "end");

  }
}

void __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_248(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  __int16 v20;
  uint8_t v21[2];
  uint8_t buf[16];

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v2, OS_LOG_TYPE_DEFAULT, "Ensuring cache is populated", buf, 2u);
  }

  +[_PSConstants suggestionPathPopulateCache](_PSConstants, "suggestionPathPopulateCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSuggestionPath:", v3);

  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 2.0);
  objc_msgSend(*(id *)(a1 + 40), "createSubSpanWithName:", CFSTR("performInitialFetchIfNeeded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  +[_PSSuggesterCache defaultService](_PSSuggesterCache, "defaultService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performInitialFetchIfNeeded");

  objc_msgSend(v4, "end");
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.coreduet.logging"));
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("forceSuggesterTimeoutForTesting"));

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v20 = 0;
        v10 = "Simulating a timeout for testing";
        v11 = (uint8_t *)&v20;
LABEL_11:
        _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_DEFAULT, "Fetching people suggestions", v19, 2u);
      }

      +[_PSConstants suggestionPathNormal](_PSConstants, "suggestionPathNormal");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSuggestionPath:", v12);

      objc_msgSend(*(id *)(a1 + 40), "createSubSpanWithName:", CFSTR("daemon_suggestInteractionsFromContext"));
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject start](v8, "start");
      -[NSObject getSpanId](v8, "getSpanId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setCurrentSpanId:", v13);

      v14 = *(_QWORD *)(a1 + 32);
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v17, "maximumNumberOfSuggestions"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "suggestInteractionsFromContext:maxSuggestions:reply:", v14, v18, *(_QWORD *)(a1 + 72));

      -[NSObject end](v8, "end");
    }
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      v10 = "Blocking on cache population consumed the entire timeout interval. Bailing prior to firing main daemon request.";
      v11 = v21;
      goto LABEL_11;
    }
  }

}

void __53___PSSuggester_shareExtensionSuggestionsFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __53___PSSuggester_shareExtensionSuggestionsFromContext___block_invoke_257(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __76___PSSuggester_asyncShareExtensionSuggestionsFromContext_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_260()
{
  void *v0;
  dispatch_semaphore_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = dispatch_semaphore_create(1);
  v2 = (void *)asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasExprOnceResult;
  asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_262(_QWORD *a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 24));
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Suggestions timed out");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("com.apple.PeopleSuggester"), 1, v6);

  }
  else
  {
    v7 = 0;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), v7);
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, "Finished fetching people suggestions, timedOut: %@", (uint8_t *)&v13, 0xCu);

    }
    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 24));

}

void __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_263(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1A07F4000, v2, OS_LOG_TYPE_DEFAULT, "Timed out app suggestions", (uint8_t *)&v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "shareExtensionSuggestionsFromContext:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138477827;
    v6 = v3;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_INFO, "Fetched %{private}@ app suggestions in process", (uint8_t *)&v5, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

intptr_t __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_264(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A07F4000, v2, OS_LOG_TYPE_DEFAULT, "Fetching app extension suggestions", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "shareExtensionSuggestionsFromContext:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __54___PSSuggester_rankedNameSuggestionsFromContext_name___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __54___PSSuggester_rankedNameSuggestionsFromContext_name___block_invoke_266(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64___PSSuggester_rankedGlobalSuggestionsFromContext_contactsOnly___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __64___PSSuggester_rankedGlobalSuggestionsFromContext_contactsOnly___block_invoke_268(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __87___PSSuggester_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __87___PSSuggester_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId___block_invoke_270(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48___PSSuggester_rankedZKWSuggestionsFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __48___PSSuggester_rankedZKWSuggestionsFromContext___block_invoke_272(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48___PSSuggester_rankedZKWSuggestionsFromContext___block_invoke_273()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)rankedZKWSuggestionsFromContext___pasExprOnceResult;
  rankedZKWSuggestionsFromContext___pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

void __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke_280(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __68___PSSuggester_rankedAutocompleteSuggestionsFromContext_candidates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __68___PSSuggester_rankedAutocompleteSuggestionsFromContext_candidates___block_invoke_282(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __39___PSSuggester_rankedFamilySuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __39___PSSuggester_rankedFamilySuggestions__block_invoke_284(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69___PSSuggester_familyRecommendationSuggestionsWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __69___PSSuggester_familyRecommendationSuggestionsWithPredictionContext___block_invoke_286(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __67___PSSuggester_photosRelationshipSuggestionsWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __67___PSSuggester_photosRelationshipSuggestionsWithPredictionContext___block_invoke_288(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __72___PSSuggester_photosContactInferencesSuggestionsWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __72___PSSuggester_photosContactInferencesSuggestionsWithPredictionContext___block_invoke_290(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __75___PSSuggester_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __75___PSSuggester_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo___block_invoke_295(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __37___PSSuggester_generatePSRTelemetry___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "copy");
}

void __46___PSSuggester_provideFeedbackForSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __46___PSSuggester_provideFeedbackForSuggestions___block_invoke_379(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "Persisted feedback, reply: %@", (uint8_t *)&v5, 0xCu);

  }
}

id __46___PSSuggester_provideFeedbackForSuggestions___block_invoke_407(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "copy");
}

void __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke_410(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v6 = (objc_class *)MEMORY[0x1E0D15870];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  v22 = [v6 alloc];
  objc_msgSend(v9, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLocalIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UTI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "imageData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v21, "length"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (id)objc_msgSend(v22, "initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:", v20, v10, v11, v12, v14, v15, v16, v17, v8, v7);
  v18 = v23;
  if (v23)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v23);
    v18 = v23;
  }

}

id __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = a2;
  v3 = objc_msgSend(v2, "handleType");
  objc_msgSend(v2, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "displayName");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "givenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_6;
    objc_msgSend(v2, "givenName");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_6:
  if (v3 == 1)
    v7 = 2;
  else
    v7 = v3 == 2;
  v8 = objc_alloc(MEMORY[0x1E0D15880]);
  objc_msgSend(v2, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithIdentifier:type:displayName:personId:personIdType:", v9, v7, v6, v11, 3);

  return v12;
}

void __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_INFO, "Persisted interaction for feedback, reply: %@", (uint8_t *)&v5, 0xCu);

  }
}

void __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke_438(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke_438_cold_1(a1, (uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "contactId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "conversationId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138478339;
    v11 = v7;
    v12 = 2113;
    v13 = v8;
    v14 = 2113;
    v15 = v9;
    _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_DEFAULT, "SuggestLess: Deleted all interactions for contact id: %{private}@ bundle: %{private}@ conversation id: %{private}@", (uint8_t *)&v10, 0x20u);

  }
}

uint64_t __57___PSSuggester_provideFeedbackForMessagesZkwSuggestions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "feedbackPayload");
}

void __66___PSSuggester_provideFeedbackForContactsAutocompleteSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __64___PSSuggester_writeFeedbackForContactsAutocompleteSuggestions___block_invoke(uint64_t a1)
{
  NSObject *v1;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "sendEvent:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __64___PSSuggester_writeFeedbackForContactsAutocompleteSuggestions___block_invoke_cold_1();

  }
}

void __73___PSSuggester_validateCoreMLScoringModelWithRawInput_predictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();

}

void __73___PSSuggester_validateCoreMLScoringModelWithRawInput_predictionContext___block_invoke_443(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = a2;
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "_PSSuggester: Validate CoreML reply was called", v10, 2u);
  }

  objc_msgSend(v3, "scoredCoreMLCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setScoredCoreMLCandidates:", v5);

  objc_msgSend(v3, "coreMLInputFeatureTensor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCoreMLInputFeatureTensor:", v6);

  objc_msgSend(v3, "coreMLModelFeatureOrder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCoreMLModelFeatureOrder:", v7);

  objc_msgSend(v3, "coreMLTensorIndexToCandidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCoreMLTensorIndexToCandidate:", v8);

  objc_msgSend(v3, "coreMLNumberOfCandidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setCoreMLNumberOfCandidates:", v9);
}

uint64_t __96___PSSuggester_InteractionInformation__interactionCountForHandle_fetchLimit_interactionStoreDB___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "isInteractionMechanismCalls"))
    goto LABEL_7;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4 || !v5)
  {
LABEL_6:

LABEL_7:
    v9 = 1;
    goto LABEL_8;
  }
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v8 = v7;
  if (v7 >= 30.0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    goto LABEL_6;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138478083;
    v14 = v12;
    v15 = 2048;
    v16 = v8;
    _os_log_impl(&dword_1A07F4000, v11, OS_LOG_TYPE_DEFAULT, "_PSSuggester: Dropped interaction for handle: %{private}@ since call interval is %f", (uint8_t *)&v13, 0x16u);
  }

  v9 = 0;
LABEL_8:

  return v9;
}

uint64_t __96___PSSuggester_InteractionInformation__interactionCountForHandle_fetchLimit_interactionStoreDB___block_invoke_174(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInteractionMechanismCalls");
}

uint64_t __54___PSSuggester_InteractionInformation___dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_dateFormatter_dateFormatter;
  _dateFormatter_dateFormatter = v0;

  objc_msgSend((id)_dateFormatter_dateFormatter, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend((id)_dateFormatter_dateFormatter, "setDateStyle:", 2);
  return objc_msgSend((id)_dateFormatter_dateFormatter, "setTimeStyle:", 2);
}

void __56___PSSuggester_initWithConfiguration_feedbackRecording___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error creating Biome storage directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error launching Tap-To-Radar for force-quit notification interaction: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke_438_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "contactId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1A07F4000, a3, OS_LOG_TYPE_ERROR, "SuggestLess: Error deleting interactions for contact ID: %@ %@", v6, 0x16u);

}

void __64___PSSuggester_writeFeedbackForContactsAutocompleteSuggestions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "_PSSuggester: No Biome source. Cannot log Contacts Autocomplete feedback.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
