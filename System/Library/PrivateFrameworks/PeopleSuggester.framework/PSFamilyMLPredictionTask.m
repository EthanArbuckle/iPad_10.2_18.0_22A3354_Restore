@implementation PSFamilyMLPredictionTask

BOOL __37___PSFamilyMLPredictionTask_execute___block_invoke(uint64_t a1)
{
  _BOOL4 should_defer;
  NSObject *v3;
  uint8_t v5[16];

  should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  if (should_defer)
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_INFO, "_CDDataCollection XPC Activity: Deferred", v5, 2u);
    }

  }
  return !should_defer;
}

void __37___PSFamilyMLPredictionTask_execute___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = (void *)MEMORY[0x1A1AFCA24]();
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "getFeatureDictForContact:", v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      if (+[_PSFamilyUtilities contactMarkedAsFamilyInFeatureDict:](_PSFamilyUtilities, "contactMarkedAsFamilyInFeatureDict:", v6))
      {
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v18, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

      }
      objc_msgSend(*(id *)(a1 + 32), "predictionForContact:featureDict:", v18, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "featureValueForName:", CFSTR("labelFinal"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "int64Value");

        if (v12 == 1)
        {
          objc_msgSend(v10, "featureValueForName:", CFSTR("classProbability"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dictionaryValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E442AC70);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(void **)(a1 + 48);
          objc_msgSend(v18, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

        }
      }

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *a3 = 1;
  }
  objc_autoreleasePoolPop(v5);

}

uint64_t __37___PSFamilyMLPredictionTask_execute___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __37___PSFamilyMLPredictionTask_execute___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37___PSFamilyMLPredictionTask_execute___block_invoke_2_cold_1((uint64_t)v3, v4);

  }
}

void __37___PSFamilyMLPredictionTask_execute___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Error saving feedback event to knowledge store: %@", (uint8_t *)&v2, 0xCu);
}

@end
