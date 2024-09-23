@implementation PSInteractionPredictor

BOOL __62___PSInteractionPredictor_getConversationIDLogFromTrainArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10) == 0;

  return v11;
}

uint64_t __79___PSInteractionPredictor_getClusteringResultsForPoint_usingClusterDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "distanceToCluster");
  v6 = v5;
  objc_msgSend(v4, "distanceToCluster");
  v8 = v7;

  if (v6 - v8 >= -2.22044605e-16)
    v9 = 0;
  else
    v9 = -1;
  if (v6 - v8 > 2.22044605e-16)
    return 1;
  else
    return v9;
}

void __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a2;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_INFO, "pre-update: ", v10, 2u);
  }

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "printModelWeights:", v6);

  objc_msgSend(v3, "task");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_cold_1(v3, v9);

  }
}

void __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_103(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  id obj;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_INFO, "Saving the adapted model at %@", buf, 0xCu);
  }

  v6 = (void *)a1[5];
  objc_msgSend(v3, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "printModelWeights:", v7);

  if (a1[4])
  {
    objc_msgSend(v3, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[4];
    v10 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v10 + 40);
    v11 = objc_msgSend(v8, "writeToURL:error:", v9, &obj);
    objc_storeStrong((id *)(v10 + 40), obj);

    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) || (v11 & 1) == 0)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_103_cold_1((uint64_t)(a1 + 6), v12, v13);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[7] + 8) + 40));
  }

}

void __79___PSInteractionPredictor_rankedZkwSuggestionsFromPredictionArray_forBundleID___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = (void *)MEMORY[0x1A1AFCA24]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, 0);

  objc_autoreleasePoolPop(v1);
  v6 = (void *)rankedZkwSuggestionsFromPredictionArray_forBundleID___pasExprOnceResult;
  rankedZkwSuggestionsFromPredictionArray_forBundleID___pasExprOnceResult = v5;

  objc_autoreleasePoolPop(v0);
}

void __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, v5, "context.task.error: %@", v6);

  OUTLINED_FUNCTION_7();
}

void __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_103_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, a3, "Saving the adapted model failed with error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end
