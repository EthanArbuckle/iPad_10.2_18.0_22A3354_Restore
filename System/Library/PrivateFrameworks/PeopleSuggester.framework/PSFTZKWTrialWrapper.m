@implementation PSFTZKWTrialWrapper

void __38___PSFTZKWTrialWrapper_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;

  objc_autoreleasePoolPop(v0);
}

void __28___PSFTZKWTrialWrapper_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "refresh");
    objc_msgSend(v2, "flagAsUpdated");
    WeakRetained = v2;
  }

}

void __37___PSFTZKWTrialWrapper_flagAsUpdated__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 8) = 1;
}

void __34___PSFTZKWTrialWrapper_flagAsSame__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 8) = 0;
}

void __35___PSFTZKWTrialWrapper_loadFactors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "experimentIdentifiersWithNamespaceName:", CFSTR("COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExperimentIdentifiers:", v4);

  objc_msgSend(v3, "experimentIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      objc_msgSend(v3, "experimentIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "experimentId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "experimentIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "deploymentId");
      objc_msgSend(v3, "experimentIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "treatmentId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = v9;
      v28 = 1024;
      v29 = v11;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Device is enrolled in experiment with experiment ID = %@, deployment ID = %d, treatment ID = %@", (uint8_t *)&v26, 0x1Cu);

    }
  }
  else if (v7)
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Device is not enrolled in an experiment.", (uint8_t *)&v26, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "rolloutIdentifiersWithNamespaceName:", CFSTR("COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRolloutIdentifiers:", v14);

  objc_msgSend(v3, "rolloutIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      objc_msgSend(v3, "rolloutIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "rolloutId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "rolloutIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "deploymentId");
      objc_msgSend(v3, "rolloutIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "factorPackId");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = v19;
      v28 = 1024;
      v29 = v21;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_1A07F4000, v16, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Device is part of a rollout with rollout ID = %@, deployment ID = %d, factor pack ID = %@", (uint8_t *)&v26, 0x1Cu);

    }
  }
  else if (v17)
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_1A07F4000, v16, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Device is not included in a rollout.", (uint8_t *)&v26, 2u);
  }

  objc_msgSend(v3, "experimentIdentifiers");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(v3, "rolloutIdentifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      goto LABEL_14;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1A07F4000, v24, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Using device-local default factor values (levels).", (uint8_t *)&v26, 2u);
    }
  }

LABEL_14:
  objc_msgSend(v3, "setStructuredCalendarIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", CFSTR("structuredCalendarIsEnabled"), 1));
  objc_msgSend(v3, "setStructuredCalendarDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", CFSTR("structuredCalendarDefaultConfidenceCategory"), 3));
  objc_msgSend(v3, "setUnstructuredCalendarIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", CFSTR("unstructuredCalendarIsEnabled"), 1));
  objc_msgSend(v3, "setUnstructuredCalendarDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", CFSTR("unstructuredCalendarDefaultConfidenceCategory"), 3));
  objc_msgSend(v3, "setUnstructuredRemindersIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", CFSTR("unstructuredRemindersIsEnabled"), 0));
  objc_msgSend(v3, "setUnstructuredRemindersDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", CFSTR("unstructuredRemindersDefaultConfidenceCategory"), 3));
  objc_msgSend(v3, "setPrimaryInteractionsIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", CFSTR("primaryInteractionsIsEnabled"), 1));
  objc_msgSend(v3, "setPrimaryInteractionsDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", CFSTR("primaryInteractionsDefaultConfidenceCategory"), 3));
  objc_msgSend(v3, "setPrimaryInteractionsModelType:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsInteractionModelTypeFromFactor:withDefault:", CFSTR("primaryInteractionsModelType"), 0));
  objc_msgSend(v3, "setFallbackInteractionsIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", CFSTR("fallbackInteractionsIsEnabled"), 1));
  objc_msgSend(v3, "setFallbackInteractionsDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", CFSTR("fallbackInteractionsDefaultConfidenceCategory"), 3));
  objc_msgSend(v3, "setFallbackInteractionsModelType:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsInteractionModelTypeFromFactor:withDefault:", CFSTR("fallbackInteractionsModelType"), 0));

}

uint64_t __36___PSFTZKWTrialWrapper_runWithData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37___PSFTZKWTrialWrapper_runIfUpdated___block_invoke(uint64_t a1, _BYTE *a2)
{
  void *v3;
  uint64_t v4;
  _BYTE *v5;

  if (a2[8])
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = a2;
    objc_msgSend(v3, "runWithData:", v4);
    a2[8] = 0;

  }
}

@end
