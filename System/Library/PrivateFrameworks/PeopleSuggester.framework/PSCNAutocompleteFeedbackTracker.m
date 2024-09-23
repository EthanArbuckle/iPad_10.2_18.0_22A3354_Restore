@implementation PSCNAutocompleteFeedbackTracker

void __66___PSCNAutocompleteFeedbackTracker_logImpressionsFromAccumulator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v16 = a2;
  v21 = (id)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "vendedSuggestionEvents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "vendedSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "vendedSuggestionEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "vendedSuggestionEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vendedSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trialID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "defaultSubmodelImpressionWithFeedback:submodel:bundleID:trialID:isImplicit:", v3, v16, v4, v10, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v11, "mutableCopy");

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "metricsForSubmodelImpressions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "annotateImpression:withStatistics:", v22, v15);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();

}

@end
