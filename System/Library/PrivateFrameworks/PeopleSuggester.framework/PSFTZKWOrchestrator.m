@implementation PSFTZKWOrchestrator

void __50___PSFTZKWOrchestrator_updateConfigWithTrialData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  objc_msgSend(*(id *)(v5 + 56), "calendarEventConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithConfig:", v7);

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  objc_msgSend(*(id *)(v8 + 56), "unstructuredCalendarConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithCalendarConfig:", v10);

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 24);
  objc_msgSend(*(id *)(v11 + 56), "unstructuredRemindersConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateWithRemindersConfig:", v13);

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 32);
  objc_msgSend(*(id *)(v14 + 56), "faceTimeInteractionsConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateWithPrimaryInteractionsConfig:", v16);

  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 40);
  objc_msgSend(*(id *)(v17 + 56), "fallbackInteractionsConfig");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateWithFallbackInteractionsConfig:", v19);

}

_PSSuggestion *__64___PSFTZKWOrchestrator__getBlendingLayerSuggestionsWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _PSSuggestion *v6;
  _PSSuggestion *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v2 = a2;
  objc_msgSend(v2, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executableObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v4;
  }
  else
  {
    v7 = [_PSSuggestion alloc];
    objc_msgSend(v4, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "derivedIntentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "clientModelSpecification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clientModelId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("External Model (%@)"), v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "score");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v4, "familySuggestion");
    v6 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:](v7, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:", v20, v8, v19, v9, v10, v11, v13, 0, v14, v16);

  }
  return v6;
}

void __69___PSFTZKWOrchestrator__getDirectSuggestionsWithContext_withTimeout___block_invoke(uint64_t a1)
{
  __int128 v2;
  unint64_t v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    v4 = 0.0;
    *(_QWORD *)&v2 = 138413058;
    v21 = v2;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v3, v21);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "getSuggestionsWithPredictionContext:", *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
      v12 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32));
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v7);
      v16 = v15;

      v4 = v4 + v16;
      v17 = *(double *)(a1 + 72);
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v21;
        v23 = v20;
        v24 = 2048;
        v25 = v16;
        v26 = 2048;
        v27 = v4;
        v28 = 1024;
        v29 = v4 > v17;
        _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_DEFAULT, "ZKW FaceTime default route %@ took %f seconds, cummulative seconds %f, timed out %d", buf, 0x26u);

      }
      if (v4 > v17)
        break;
      ++v3;
    }
    while (v3 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
}

void __69___PSFTZKWOrchestrator__getDirectSuggestionsWithContext_withTimeout___block_invoke_36()
{
  void *v0;
  dispatch_queue_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = dispatch_queue_create("ps_ft_zkw_queue", 0);
  v2 = (void *)_getDirectSuggestionsWithContext_withTimeout___pasExprOnceResult;
  _getDirectSuggestionsWithContext_withTimeout___pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __60___PSFTZKWOrchestrator_getSuggestionsWithPredictionContext___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "useBlendingLayer");
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_enabled(v3);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeBlendingRouteTotalTime", " enableTelemetry=YES ", (uint8_t *)&v17, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_getBlendingLayerSuggestionsWithContext:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeBlendingRouteTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v17, 2u);
    }

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v17 = 138412290;
      v18 = v10;
      v11 = "ZKW FaceTime suggestions going through blending layer route: %@";
LABEL_14:
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeDefaultRouteTotalTime", " enableTelemetry=YES ", (uint8_t *)&v17, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_getDirectSuggestionsWithContext:", *(_QWORD *)(a1 + 40));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeDefaultRouteTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v17, 2u);
    }

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v17 = 138412290;
      v18 = v16;
      v11 = "ZKW FaceTime suggestions going through default route: %@";
      goto LABEL_14;
    }
  }

}

void __38___PSFTZKWOrchestrator_populateCaches__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  void *v4;
  _PSFTZKWSuggestionsTransformerFactory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeCacheTotalTime", " enableTelemetry=YES ", v12, 2u);
    }

    objc_msgSend(WeakRetained, "_getDirectSuggestionsWithContext:withTimeout:", *(_QWORD *)(a1 + 32), 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_PSFTZKWSuggestionsTransformerFactory initWithInteractionStore:]([_PSFTZKWSuggestionsTransformerFactory alloc], "initWithInteractionStore:", WeakRetained[8]);
    v6 = (void *)MEMORY[0x1E0C99DE8];
    -[_PSFTZKWSuggestionsTransformerFactory mapRecipientsToContactsWithUnmapped:](v5, "mapRecipientsToContactsWithUnmapped:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[_PSFTZKWSuggestionsTransformerFactory getResultsFromTransformers:suggestions:](_PSFTZKWSuggestionsTransformerFactory, "getResultsFromTransformers:suggestions:", v9, v4);

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZKWFaceTimeCacheTotalTime", (const char *)&unk_1A0908603, v12, 2u);
    }

  }
}

@end
