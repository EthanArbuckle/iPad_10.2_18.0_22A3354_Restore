@implementation PSHeuristics

uint64_t __59___PSHeuristics_prepareRecencyCacheWithSupportedBundleIds___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
}

void *__58___PSHeuristics_seedSuggestionsForChatGuidsAndTransports___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "mechanism"))
  {
    objc_msgSend(v2, "recipients");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "mechanism"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v4, "isEqualToNumber:", &unk_1E442AE20);

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForFeature:forConversationId:", CFSTR("timeSinceLastOutgoingInteraction"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueOrDefaultValueForFeature:forConversationId:", *(_QWORD *)(a1 + 40), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 48), "recencyMargin");
    v9 = v7 < v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

BOOL __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  _BOOL8 v13;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(v5, "valueOrDefaultValueForFeature:forConversationId:", v6, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "valueOrDefaultValueForFeature:forConversationId:", *(_QWORD *)(a1 + 40), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  v13 = v10 > v12;

  return v13;
}

_PSSuggestionProxy *__91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _PSSuggestionProxy *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  _PSSuggestionProxy *v9;

  v3 = a2;
  v4 = [_PSSuggestionProxy alloc];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdForConversationId:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Hyper-recent heuristic (%@) - PS Rewrite"), *(_QWORD *)(a1 + 40));
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v4, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v5, v3, 0, v6, v8);

  return v9;
}

double __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x2020000000;
    v21 = 0;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForFeature:forConversationId:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    v21 = v11;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_2;
    v14[3] = &unk_1E4400758;
    v15 = *(id *)(a1 + 32);
    v16 = v6;
    v17 = &v18;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);
    v12 = v19[3];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

void __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueOrDefaultValueForFeature:forConversationId:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  if (v5 > v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueOrDefaultValueForFeature:forConversationId:", v9, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;

  }
}

BOOL __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_3(uint64_t a1)
{
  return (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))() > *(double *)(a1 + 48);
}

BOOL __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  double (*v7)(uint64_t, uint64_t, uint64_t);
  id v8;
  double v9;
  double v10;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(double (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v8 = a3;
  v9 = v7(v5, v6, a2);
  v10 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v9 < v10;
}

_PSSuggestionProxy *__108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  _PSSuggestionProxy *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  _PSSuggestionProxy *v9;

  v3 = a2;
  v4 = [_PSSuggestionProxy alloc];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdForConversationId:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v4, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v5, v3, 0, v6, v8);

  return v9;
}

BOOL __98___PSHeuristics_hyperRecentHeuristicSuggestionProxiesWithReferenceDate_predictionContextBundleId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", *(_QWORD *)(a1 + 32)) != -1;

  return v4;
}

@end
