@implementation PSEnsembleModel

uint64_t __24___PSEnsembleModel_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_270);
}

void __24___PSEnsembleModel_init__block_invoke_2()
{
  NSObject *v0;

  dispatch_get_global_queue(-2, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_271);

}

id __24___PSEnsembleModel_init__block_invoke_3()
{
  return +[_PSBlockedHandlesCache sharedBlockedHandlesCache](_PSBlockedHandlesCache, "sharedBlockedHandlesCache");
}

void __38___PSEnsembleModel_feedbackDictionary__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)feedbackDictionary__pasExprOnceResult;
  feedbackDictionary__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __81___PSEnsembleModel_saveFeedback_forSessionId_feedbackActionType_isFallbackFetch___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((unint64_t)objc_msgSend(v5, "count") >= 0xB)
    objc_msgSend(v5, "removeAllObjects");
  v3 = v5;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setConversationId:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "setFeedbackActionType:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v4, "setIsFallbackFetch:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

    v3 = v5;
  }

}

uint64_t __34___PSEnsembleModel_forgetSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
}

void __37___PSEnsembleModel_registerWithTrial__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateFactorLevels");
    WeakRetained = v2;
  }

}

uint64_t __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "direction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "mechanism"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToNumber:", a1[5]))
    {
      objc_msgSend(v3, "bundleId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)a1[6];
        objc_msgSend(v3, "bundleId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "containsObject:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "direction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    v6 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "mechanism"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v7))
    {
      objc_msgSend(v3, "targetBundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)a1[6];
        objc_msgSend(v3, "targetBundleId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "containsObject:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "messageInteractionCache");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "shareInteractionCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "populateContactIdCachesWithMessageCache:shareCache:", v4, v2);

}

void __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setZkwFTTrialData:", v3);

}

BOOL __57___PSEnsembleModel_populateCachesWithSupportedBundleIDs___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  _BOOL8 v4;
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

  v3 = a2;
  if (((*(uint64_t (**)(void))(a1[7] + 16))() & 1) != 0 || ((*(uint64_t (**)(void))(a1[8] + 16))() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "direction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      v7 = (void *)a1[5];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "mechanism"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "containsObject:", v8))
      {
        objc_msgSend(v3, "bundleId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v3, "bundleId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[_PSConstants contactsAutocompleteBundleId](_PSConstants, "contactsAutocompleteBundleId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 == v11)
          {
            v4 = 0;
          }
          else
          {
            v12 = (void *)a1[6];
            objc_msgSend(v3, "startDate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "compare:", v13) == 1)
            {
              v14 = (void *)a1[6];
              objc_msgSend(v3, "startDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v4 = objc_msgSend(v14, "compare:", v15) == 1;

            }
            else
            {
              v4 = 0;
            }

          }
        }
        else
        {
          v4 = 0;
        }

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

void __72___PSEnsembleModel_fetchSupportedBundleIDsWithPredictionContextFilters___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __63___PSEnsembleModel_psr_getPhotoBasedFeaturesAsync_withTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __63___PSEnsembleModel_psr_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v4 = v3;

  v5 = fmax(*(double *)(a1 + 80) - v4, 0.0);
  v6 = *(NSObject **)(a1 + 40);
  if (v5 <= 0.0)
  {
    v7 = 0;
  }
  else if (v5 <= 9223372040.0)
  {
    v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  }
  else
  {
    v7 = -1;
  }
  if (dispatch_semaphore_wait(v6, v7))
  {
    +[_PSPhotoSuggestions cancelRequestWithToken:](_PSPhotoSuggestions, "cancelRequestWithToken:", *(_QWORD *)(a1 + 48));
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  }
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 88);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "_PSEnsembleModel_getPhotoBasedFeatures_setPeopleAnalysis", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setPeopleInPhotoIdentifiers:", v11);

  objc_msgSend(*(id *)(a1 + 64), "setPeopleAnalysisFromAssetsWithPredictionContext:identifiersOfPeopleInPhotos:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 88);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v13, OS_SIGNPOST_INTERVAL_END, v14, "_PSEnsembleModel_getPhotoBasedFeatures_setPeopleAnalysis", (const char *)&unk_1A0908603, v19, 2u);
  }

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = *(_QWORD *)(a1 + 88);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v16, OS_SIGNPOST_INTERVAL_END, v17, "_PSEnsembleModel_getPhotoBasedFeatures", (const char *)&unk_1A0908603, v18, 2u);
  }

}

void __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_393(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint8_t v11[16];
  uint8_t buf[16];

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = a1[7];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "_PSEnsembleModel_getPhotoBasedFeatures_mdPersonIDsOfPeopleInSharedPhotoAssets", " enableTelemetry=YES ", buf, 2u);
  }

  +[_PSPhotoSuggestions mdPersonIDsOfPeopleInSharedPhotoAttachments:forBundleID:](_PSPhotoSuggestions, "mdPersonIDsOfPeopleInSharedPhotoAttachments:forBundleID:", a1[4], a1[5]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = a1[7];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v9, OS_SIGNPOST_INTERVAL_END, v10, "_PSEnsembleModel_getPhotoBasedFeatures_mdPersonIDsOfPeopleInSharedPhotoAssets", (const char *)&unk_1A0908603, v11, 2u);
  }

}

void __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_394()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "getPhotoBasedFeatures");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)getPhotoBasedFeaturesAsync_withTimeout___pasExprOnceResult;
  getPhotoBasedFeaturesAsync_withTimeout___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __59___PSEnsembleModel_getPhotoBasedFeaturesAsync_withTimeout___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v4 = v3;

  v5 = fmax(*(double *)(a1 + 72) - v4, 0.0);
  v6 = *(void **)(a1 + 56);
  if (v5 <= 0.0)
  {
    v7 = 0;
  }
  else if (v5 <= 9223372040.0)
  {
    v7 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  }
  else
  {
    v7 = -1;
  }
  if (dispatch_block_wait(v6, v7))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  v9 = v8;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 80);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "_PSEnsembleModel_getPhotoBasedFeatures_setPeopleAnalysis", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(v9, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setPeopleInPhotoIdentifiers:", v13);

  objc_msgSend(*(id *)(a1 + 48), "setPeopleAnalysisFromAssetsWithPredictionContext:identifiersOfPeopleInPhotos:", *(_QWORD *)(a1 + 40), v9);
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 80);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v15, OS_SIGNPOST_INTERVAL_END, v16, "_PSEnsembleModel_getPhotoBasedFeatures_setPeopleAnalysis", (const char *)&unk_1A0908603, v29, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = *(_QWORD *)(a1 + 80);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "_PSEnsembleModel_getPhotoBasedFeatures_setPhotoAnalysisFromAssetsWithPredictionContext", " enableTelemetry=YES ", v28, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "setPhotoAnalysisFromAssetsWithPredictionContext:", *(_QWORD *)(a1 + 40));
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = *(_QWORD *)(a1 + 80);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v21, OS_SIGNPOST_INTERVAL_END, v22, "_PSEnsembleModel_getPhotoBasedFeatures_setPhotoAnalysisFromAssetsWithPredictionContext", (const char *)&unk_1A0908603, v27, 2u);
    }

  }
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v25 = *(_QWORD *)(a1 + 80);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v24, OS_SIGNPOST_INTERVAL_END, v25, "_PSEnsembleModel_getPhotoBasedFeatures", (const char *)&unk_1A0908603, v26, 2u);
  }

}

uint64_t __70___PSEnsembleModel_getModelSuggestionsProxyDictWithModelProxiesArray___block_invoke()
{
  return MEMORY[0x1E0C9AA60];
}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "getMeContactIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)predictWithPredictionContext_maxSuggestions_contactKeysToFetch__getMeContactIdentifierPrefetchQueue;
  predictWithPredictionContext_maxSuggestions_contactKeysToFetch__getMeContactIdentifierPrefetchQueue = v0;

  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "trialRankingModel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)predictWithPredictionContext_maxSuggestions_contactKeysToFetch__trialRankingModelPrefetchQueue;
  predictWithPredictionContext_maxSuggestions_contactKeysToFetch__trialRankingModelPrefetchQueue = v2;

}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "createSubSpanWithName:", CFSTR("getMeContactIdentifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  objc_msgSend(*(id *)(a1 + 40), "getMeContactIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(v5, "end");
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_3(uint64_t a1)
{
  dispatch_block_wait(*(dispatch_block_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_444(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "rankingModel");
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_493(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_498(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "freeCachesIfNotCoreDuetDaemon");
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_502(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD v18[2];
  int v19;

  v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x2020000000;
  v19 = 0;
  v2 = *(void **)(a1 + 32);
  +[_PSCandidate selfCandidate](_PSCandidate, "selfCandidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_504;
  v14 = &unk_1E43FF0B8;
  v15 = *(id *)(a1 + 40);
  v16 = &v17;
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:forKeys:", v7, v5, v11, v12, v13, v14);

  if (*(int *)(v18[0] + 24) >= 1)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_502_cold_1((uint64_t)v18, v9);

  }
  _Block_object_dispose(&v17, 8);
  return v8;
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_504(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "candidateForDeduping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v4;
    if (!v4)
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v4 = (void *)MEMORY[0x1E0C9AA70];
    }
  }
  v8 = v4;

  return v8;
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_511(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            v10 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "count");
            objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%tu"), v8, v12, (_QWORD)v16);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v13);

          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "_pas_componentsJoinedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_518(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addExtraInformationWithSuggestions:modelSuggestionProxiesDict:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "saveToVirtualStore");
}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_523(uint64_t a1, void *a2, unsigned __int8 a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "reasonType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1E442A880, v6);
  }
  objc_msgSend(v5, "conversationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqual:", v9),
        v10,
        v11))
  {
    objc_msgSend(v5, "derivedIntentIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  objc_msgSend(v5, "score");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v5, "score");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

  }
  else
  {
    v16 = -1.0;
  }

  v17 = (void *)objc_msgSend(objc_alloc((Class)get_PSPeopleSuggestionsMetricsModelClass()), "initWithModelIdentifier:trialIdentifier:", v6, 0);
  v18 = objc_alloc((Class)getPSPeopleSuggestionsMetricsItemClass());
  objc_msgSend(v5, "bundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithId:modelIdentifier:transportBundleId:rank:score:", v9, v17, v19, objc_msgSend(v20, "unsignedShortValue"), v16);

  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_523_cold_2();

  }
  v23 = (void *)objc_msgSend(objc_alloc((Class)get_PSPeopleSuggestionsMetricsModelClass()), "initWithModelIdentifier:trialIdentifier:", *(_QWORD *)(a1 + 48), 0);
  v24 = objc_alloc((Class)getPSPeopleSuggestionsMetricsItemClass());
  objc_msgSend(v5, "bundleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithId:modelIdentifier:transportBundleId:rank:score:", v9, v23, v25, a3, v16);

  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v26))
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl(&dword_1A07F4000, v27, OS_LOG_TYPE_DEFAULT, "Duplicate ensemble suggestion: {%@}", buf, 0xCu);
    }

  }
  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v26);
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_523_cold_1();

  }
}

id __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_528(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configWithAnchorDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "enrichConfig:withInformationFromPredictionContext:", v4, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "interactionStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getInteractionsStatisticsForConfig:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v4, v6);
  return v7;
}

void __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "conversationIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v4);

    if (!v6)
      goto LABEL_4;
  }
  objc_msgSend(v3, "derivedIntentIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (v7)
  {
LABEL_4:
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v9 = objc_alloc(MEMORY[0x1E0D020D0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", v10, 0, 0, 0, 0);
    objc_msgSend(v3, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFeatureValueForFeatureName:featureValue:candidate:bundleID:", 690, v11, v4, v12);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_cold_1();
  }

}

void __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_530(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_2;
  v7[3] = &unk_1E43FF1F0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "interactionRecipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(_QWORD **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)v6[3];
    v9 = objc_msgSend(v6, "modelProxyToVirtualFeatureStoreFeature:", v7);
    v10 = objc_alloc(MEMORY[0x1E0D020D0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", v11, 0, 0, 0, 0);
    objc_msgSend(v15, "interactionRecipients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFeatureValueForFeatureName:featureValue:candidate:bundleID:", v9, v12, v13, v14);

  }
}

void __105___PSEnsembleModel__suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction == %@ OR direction == %@) AND mechanism == %@ AND domainIdentifier != nil AND bundleId == $bundleID AND domainIdentifier == $interactionRecipients"), &unk_1E442A778, &unk_1E442A790, &unk_1E442A7C0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction == %@ OR direction == %@) AND mechanism == %@ AND domainIdentifier != nil AND targetBundleId == $bundleID AND domainIdentifier == $interactionRecipients"), &unk_1E442A778, &unk_1E442A790, &unk_1E442A730);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__firstPartyMessagesPredicates;
  _suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__firstPartyMessagesPredicates = v2;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction == %@ OR direction == %@) AND mechanism == %@ AND derivedIntentIdentifier != nil AND bundleId == $bundleID AND derivedIntentIdentifier == $interactionRecipients"), &unk_1E442A778, &unk_1E442A790, &unk_1E442A7C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction == %@ OR direction == %@) AND mechanism == %@ AND derivedIntentIdentifier != nil AND targetBundleId == $bundleID AND derivedIntentIdentifier == $interactionRecipients"), &unk_1E442A778, &unk_1E442A790, &unk_1E442A730, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__thirdPartyPredicates;
  _suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients__thirdPartyPredicates = v6;

}

uint64_t __105___PSEnsembleModel__suggestionInteractionPredicatesForFirstPartyMessages_bundleID_interactionRecipients___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "predicateWithSubstitutionVariables:", *(_QWORD *)(a1 + 32));
}

id __126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(a2, "copy");
  v3 = (void *)MEMORY[0x1E0D15890];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedStringFromContactString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentifier:", v5);

  return v2;
}

NSObject *__126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke_569(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "interactionStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  objc_msgSend(v7, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", v6, v8, 1, 0, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  objc_msgSend(v9, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (!v5 || _CDStartDateCompare() == -1)
    {
      v12 = v5;
      v5 = v11;
LABEL_8:

    }
  }
  else if (v10)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke_569_cold_1();
    goto LABEL_8;
  }

  return v5;
}

id __68___PSEnsembleModel_predictWithMapsPredictionContext_maxSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a2;
  v7 = [v5 alloc];
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:", v6);

  return (id)objc_msgSend(v7, "initWithFormat:", CFSTR("%tu -> %tu"), v8, a3);
}

id __68___PSEnsembleModel_predictWithMapsPredictionContext_maxSuggestions___block_invoke_607(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@: %tu -> %tu"), v6, objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:", v6), a3);

  return v7;
}

void __78___PSEnsembleModel_suggestZKWSuggestionsWithPredictionContext_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "zkwFTOrchestrator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateConfigWithTrialData:", v4);

  v6 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setZkwFTTrialData:", v6);

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_DEFAULT, "_PSFTZKWOrchestrator updated to reflect Trial configuration update.", v8, 2u);
  }

}

uint64_t __120___PSEnsembleModel_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "contactMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contactIdIsInContactStore:", v3);

  return v5;
}

void __120___PSEnsembleModel_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions___block_invoke_629(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  _PSRecipient *v9;
  _PSSuggestion *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _PSSuggestion *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contactMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactIdsSeen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if ((v8 & 1) == 0)
  {
    v9 = -[_PSRecipient initWithIdentifier:handle:contact:]([_PSRecipient alloc], "initWithIdentifier:handle:contact:", v5, 0, 0);
    v10 = [_PSSuggestion alloc];
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "knnNameOrContactRankerModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:](v10, "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", 0, v5, 0, v11, CFSTR("kNN model"), v14);

    if (v15)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 48))
    *a3 = 1;

}

uint64_t __103___PSEnsembleModel_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __103___PSEnsembleModel_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __103___PSEnsembleModel_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId___block_invoke_2_cold_1();

  }
}

id __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "appBundleIdsToShareExtensionBundleIdsMapping");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "appBundleIdsToShareExtensionBundleIdsMapping");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v7, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v12);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(";"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke_643(uint64_t a1, void *a2, unsigned __int8 a3)
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v6 = (void *)getPSAppSuggestionsMetricsItemClass_softClass;
  v16 = getPSAppSuggestionsMetricsItemClass_softClass;
  if (!getPSAppSuggestionsMetricsItemClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getPSAppSuggestionsMetricsItemClass_block_invoke;
    v12[3] = &unk_1E43FEA00;
    v12[4] = &v13;
    __getPSAppSuggestionsMetricsItemClass_block_invoke((uint64_t)v12);
    v6 = (void *)v14[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v13, 8);
  v8 = [v7 alloc];
  objc_msgSend(v5, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTransportBundleId:model:rank:", v9, CFSTR("appSuggestions"), a3);

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke_643_cold_1();

  }
}

id __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke_2;
  v7[3] = &unk_1E43FF3C8;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 < v8)
    return 1;
  else
    return v9;
}

void __50___PSEnsembleModel_candidatesForShareSheetRanking__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(v5, "integerValue");

  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  objc_msgSend(v6, "subarrayWithRange:", 0, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v11);
  objc_msgSend(v6, "subarrayWithRange:", v9, objc_msgSend(v6, "count") - v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v10);
}

id __70___PSEnsembleModel_validateCoreMLModelWithRawInput_predictionContext___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __46___PSEnsembleModel_pruneCandidatesForRanking___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForFeature:forConversationId:", CFSTR("timeSinceLastOutgoingInteraction"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

void __81___PSEnsembleModel_logPipeline_withPipelineStage_andSessionID_andCandidateNames___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:forFeature:", v10, CFSTR("conversationId"));
  if (v6)
  {
    objc_msgSend(v5, "setNumber:forFeature:", &unk_1E442A8C8, CFSTR("candidateNameHasBeenResolved"));
    v7 = *(void **)(a1 + 40);
    v8 = v5;
    v9 = v6;
  }
  else
  {
    objc_msgSend(v5, "setNumber:forFeature:", &unk_1E442A880, CFSTR("candidateNameHasBeenResolved"));
    v7 = *(void **)(a1 + 40);
    v8 = v5;
    v9 = v10;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);

}

void __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0C9E8F8]);
  objc_msgSend(*(id *)(a1 + 32), "nonNilFeaturesForConversationId:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:error:", v5, 0);

  objc_msgSend(*(id *)(a1 + 40), "predictionFromFeatures:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "featureValueForName:", CFSTR("coreMLModelScore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setValue:forFeature:andConversationId:", v10, CFSTR("coreMLModelScore"), v3);
  +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_cold_1();

}

uint64_t __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "featureNamesToSortWith");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "valueOrDefaultValueForFeature:forConversationId:", v12, v5, (_QWORD)v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        objc_msgSend(*(id *)(a1 + 40), "valueOrDefaultValueForFeature:forConversationId:", v12, v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        if (v15 != v18)
        {
          v20 = objc_msgSend(v12, "containsString:", CFSTR("timeSince"));
          v21 = -1;
          if (v15 > v18)
            v22 = 1;
          else
            v22 = -1;
          if (v15 < v18)
            v21 = 1;
          if (v20)
            v19 = v22;
          else
            v19 = v21;
          goto LABEL_18;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_18:

  return v19;
}

void __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke_671(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _PSSuggestionProxy *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _PSSuggestionProxy *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "featureNamesToSortWith");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 40), "valueOrDefaultValueForFeature:forConversationId:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10), v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v12 = *(void **)(a1 + 48);
  v13 = [_PSSuggestionProxy alloc];
  objc_msgSend(*(id *)(a1 + 40), "bundleIdForConversationId:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "featureNamesToSortWith");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("Score: %@\n%@"), v5, v16, (_QWORD)v19);
  v18 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:reason:reasonType:](v13, "initWithBundleID:interactionRecipients:contactID:reason:reasonType:", v14, v3, 0, v17, CFSTR("suggestionsProxiesFromStats"));
  objc_msgSend(v12, "addObject:", v18);

}

id __105___PSEnsembleModel_getSuggestionsFromInteractionsStatistics_withConfig_trialClient_andPredictionContext___block_invoke_676(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "interactionRecipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privatizedConversationId:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __94___PSEnsembleModel_finalSuggestionProxiesForInteractionStatistics_config_trialClient_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  _PSSuggestionProxy *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _PSSuggestionProxy *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v4, "addObject:", v9);
        objc_msgSend(v9, "interactionRecipients");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(*(id *)(a1 + 32), "isSharePlayAvailable");
        objc_msgSend(*(id *)(a1 + 40), "valueOrDefaultValueForFeature:forConversationId:", CFSTR("hasEverSharePlayedWithConversation"), v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if (v11 && v13)
        {
          v14 = [_PSSuggestionProxy alloc];
          objc_msgSend(*(id *)(a1 + 40), "valueForProperty:forConversationId:", CFSTR("RecipientListConversationId"), v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:handles:reason:reasonType:](v14, "initWithBundleID:interactionRecipients:handles:reason:reasonType:", CFSTR("com.apple.telephonyutilities.callservicesd"), v15, 0, CFSTR("SharePlay heuristic"), v17);
          objc_msgSend(v4, "addObject:", v18);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  return v4;
}

void __61___PSEnsembleModel_sendDataToPETAsync_withConfig_andContext___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "getPETMessageFrom:withConfig:andContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logMessage:", v1);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: sent data to PET", v4, 2u);
  }

}

id __70___PSEnsembleModel_enrichConfig_withInformationFromPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "contentURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "asyncPSRDataCollectionForContext", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasExprOnceResult;
  psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_3;
  v13[3] = &unk_1E43FF608;
  v14 = *(id *)(a1 + 32);
  v5 = v4;
  v15 = v5;
  v6 = v3;
  v18 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v16 = v6;
  v17 = v7;
  v8 = MEMORY[0x1A1AFCBF8](v13);
  v9 = (void *)v8;
  if (*(int *)(a1 + 64) < 1)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_DWORD *)(a1 + 64);
      *(_DWORD *)buf = 67109120;
      v20 = v11;
      _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: async Wait until the feedback call populates chosenSuggestion: %d seconds", buf, 8u);
    }

    v12 = dispatch_time(0, 1000000000 * *(int *)(a1 + 64));
    dispatch_after(v12, MEMORY[0x1E0C80D38], v9);
  }

}

void __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint64_t *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  const __CFString *v64;
  const __CFString *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__1;
  v62 = __Block_byref_object_dispose__1;
  v63 = 0;
  +[_PSEnsembleModel feedbackDictionary](_PSEnsembleModel, "feedbackDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_4;
  v57[3] = &unk_1E43FF5B8;
  v57[4] = &v58;
  objc_msgSend(v2, "runWithLockAcquired:", v57);

  v3 = (void *)v59[5];
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v5 == 0;

  if ((v3 & 1) == 0)
  {
    v6 = (void *)v59[5];
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFeedBack:", objc_msgSend(v8, "feedbackActionType"));

    v9 = (void *)v59[5];
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conversationId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "features");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v54;
      v16 = &unk_1E442A8F8;
      v17 = &unk_1E442A8E0;
      do
      {
        v18 = 0;
        v47 = v14;
        do
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v13);
          v19 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v18);
          v20 = objc_msgSend(v12, "isEqualToString:", v19);
          v21 = v16;
          if (v20)
          {
            +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel", v16);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v23 = v15;
              v24 = v17;
              v25 = v16;
              v26 = v13;
              v27 = a1;
              v28 = v12;
              v29 = v27;
              objc_msgSend(*(id *)(v27 + 32), "sessionID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v67 = v30;
              v68 = 2112;
              v69 = v19;
              v70 = 2048;
              v71 = 1;
              _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, "Feedback resolved for session %@ resolved to %@ as %ld", buf, 0x20u);

              v12 = v28;
              a1 = v29;
              v13 = v26;
              v16 = v25;
              v17 = v24;
              v15 = v23;
              v14 = v47;
            }

            v21 = v17;
          }
          objc_msgSend(*(id *)(a1 + 40), "setValue:forFeature:andConversationId:", v21, CFSTR("feedback"), v19);
          ++v18;
        }
        while (v14 != v18);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == 0;

    if (!v32)
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSEnsembleModel forgetSession:](_PSEnsembleModel, "forgetSession:", v33);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_alloc(MEMORY[0x1E0D158E8]);
    objc_msgSend(*(id *)(a1 + 48), "rightBoundDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(double *)(a1 + 64);
    v65 = CFSTR("timeSinceLastOutgoingInteraction");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v46) = 0;
    v39 = (void *)objc_msgSend(v35, "initWithAnchorDate:leftBoundDate:rightBoundDate:fetchLimit:maxComputationTime:featureNamesToSortWith:shouldSortAscending:shouldUseSuggestionEngaged:statsDefaultValues:", v34, v36, v34, 100, v38, 1, v37, v46, MEMORY[0x1E0C9AA70]);

    v64 = CFSTR("timeSinceLastOutgoingInteraction");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setStatsToCompute:", v40);

    objc_msgSend(*(id *)(a1 + 56), "interactionStore");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "getInteractionsStatisticsForConfig:", v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "conversationIds");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_693;
    v48[3] = &unk_1E43FF5E0;
    v44 = v42;
    v49 = v44;
    v50 = *(id *)(a1 + 40);
    v52 = &v58;
    v51 = *(id *)(a1 + 32);
    objc_msgSend(v43, "enumerateObjectsUsingBlock:", v48);

    objc_msgSend(*(id *)(a1 + 56), "sendDataToPETAsync:withConfig:andContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v45, OS_LOG_TYPE_DEFAULT, "_PSEnsemble: logged data from PSR", buf, 2u);
    }

  }
  _Block_object_dispose(&v58, 8);

}

void __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __111___PSEnsembleModel_psrDataCollectionForContext_timeToWaitInSeconds_maxComputationTime_withConfigAndStatsBlock___block_invoke_693(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForFeature:forConversationId:", CFSTR("timeSinceLastOutgoingInteraction"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "conversationIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  if (v4)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "valueForFeature:forConversationId:", CFSTR("feedback"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    if (!v9)
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 48), "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "feedbackActionType");

      if (v13 == 4)
        v14 = &unk_1E442A910;
      else
        v14 = &unk_1E442A928;
      +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 48), "sessionID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v16;
        v19 = 2112;
        v20 = v3;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_INFO, "Feedback reesolved for session %@ resolved to %@ as %@", (uint8_t *)&v17, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "setValue:forFeature:andConversationId:", v14, CFSTR("feedback"), v3);
    }
  }

}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_502_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(*(_QWORD *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_FAULT, "Found %d candidates with an empty feature dictionary", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_9();
}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_523_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "Ensemble suggestion metrics item is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __83___PSEnsembleModel_predictWithPredictionContext_maxSuggestions_contactKeysToFetch___block_invoke_2_523_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "Individual model suggestions metrics item is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __82___PSEnsembleModel_addExtraInformationWithSuggestions_modelSuggestionProxiesDict___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "Suggestion without conversationID or derivedIntentID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __126___PSEnsembleModel_suggestionsFromSuggestionProxies_supportedBundleIDs_contactKeysToFetch_meContactIdentifier_maxSuggestions___block_invoke_569_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "Error fetching interaction to create Messages suggestion template (predicate: %{public}@): %@");
  OUTLINED_FUNCTION_1();
}

void __103___PSEnsembleModel_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "Error saving feedback event to knowledge store: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __55___PSEnsembleModel_appExtensionSuggestionsFromContext___block_invoke_643_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "metricsSuggestion item is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __50___PSEnsembleModel_evaluateCandidates_psrMLModel___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1A07F4000, v0, OS_LOG_TYPE_DEBUG, "_PSEnsemble: CoreML model score for candidate %@ = %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
