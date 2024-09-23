@implementation PPSocialHighlightMLScorer

+ (id)_scorerFromModelFactorName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  PPSocialHighlightMLScorer *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "mlModelForModelName:namespaceName:error:", v3, CFSTR("PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"), &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (!v5)
  {
    pp_social_highlights_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to fetch assets: %@", buf, 0xCu);
    }

  }
  v8 = -[PPSocialHighlightMLScorer initWithModel:]([PPSocialHighlightMLScorer alloc], "initWithModel:", v5);

  return v8;
}

- (PPSocialHighlightMLScorer)initWithModel:(id)a3
{
  id v5;
  PPSocialHighlightMLScorer *v6;
  PPSocialHighlightMLScorer *v7;
  uint64_t v8;
  OS_dispatch_queue *modelQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSocialHighlightMLScorer;
  v6 = -[PPSocialHighlightMLScorer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "SocialHighlightScorer-queue");
    v8 = objc_claimAutoreleasedReturnValue();
    modelQueue = v7->_modelQueue;
    v7->_modelQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

id __52__PPSocialHighlightMLScorer_sharedFirstPassInstance__block_invoke_2()
{
  return +[PPSocialHighlightMLScorer _scorerFromModelFactorName:](PPSocialHighlightMLScorer, "_scorerFromModelFactorName:", CFSTR("social_highlights_scorer.mlmodelc"));
}

id __47__PPSocialHighlightMLScorer_sharedTopKInstance__block_invoke_2()
{
  return +[PPSocialHighlightMLScorer _scorerFromModelFactorName:](PPSocialHighlightMLScorer, "_scorerFromModelFactorName:", CFSTR("social_highlights_top_k_scorer.mlmodelc"));
}

+ (id)sharedTopKInstance
{
  if (sharedTopKInstance__pasOnceToken8 != -1)
    dispatch_once(&sharedTopKInstance__pasOnceToken8, &__block_literal_global_52);
  return (id)objc_msgSend((id)sharedTopKInstance__pasExprOnceResult, "result");
}

+ (id)sharedFirstPassInstance
{
  if (sharedFirstPassInstance__pasOnceToken7 != -1)
    dispatch_once(&sharedFirstPassInstance__pasOnceToken7, &__block_literal_global_5722);
  return (id)objc_msgSend((id)sharedFirstPassInstance__pasExprOnceResult, "result");
}

- (double)scoreSocialHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *modelQueue;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  double v20;
  double v21;
  uint8_t v23[8];
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSocialHighlightMLScorer clientEncodingForClientId:applicationIdentifiers:](PPSocialHighlightMLScorer, "clientEncodingForClientId:applicationIdentifiers:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "variant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSocialHighlightMLScorer variantEncodingForVariant:](PPSocialHighlightMLScorer, "variantEncodingForVariant:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v4;
  v11 = v10;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C9E910], "lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C9E910], "lazyProviderWithFeaturesProvidedBy:addedToFeaturesProvidedBy:", v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5668;
  v31 = __Block_byref_object_dispose__5669;
  v32 = 0;
  modelQueue = self->_modelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PPSocialHighlightMLScorer_scoreSocialHighlight___block_invoke;
  block[3] = &unk_1E7E1BAB8;
  v26 = &v27;
  block[4] = self;
  v14 = v11;
  v25 = v14;
  dispatch_sync(modelQueue, block);
  v15 = (void *)v28[5];
  if (v15)
  {
    objc_msgSend(v15, "featureValueForName:", CFSTR("score"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "multiArrayValue");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

    }
    else
    {
      pp_default_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      v21 = 0.0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_fault_impl(&dword_1C392E000, v18, OS_LOG_TYPE_FAULT, "PPSocialHighlightMLScorer: invalid output keys, score not found", v23, 2u);
      }
    }

  }
  else
  {
    v21 = 0.0;
  }

  _Block_object_dispose(&v27, 8);
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

void __50__PPSocialHighlightMLScorer_scoreSocialHighlight___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  v9 = 0;
  objc_msgSend(v3, "predictionFromFeatures:error:", v2, &v9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    pp_social_highlights_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to score: %@", buf, 0xCu);
    }

  }
}

+ (id)clientEncodingForClientId:(id)a3 applicationIdentifiers:(id)a4
{
  __CFString *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v21;
  id v22;
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = a4;
  if (clientEncodingForClientId_applicationIdentifiers___pasOnceToken11 != -1)
    dispatch_once(&clientEncodingForClientId_applicationIdentifiers___pasOnceToken11, &__block_literal_global_56_5710);
  v7 = (id)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PPSocialHighlightMLScorer_clientEncodingForClientId_applicationIdentifiers___block_invoke_2;
  block[3] = &unk_1E7E1F4F0;
  v8 = v7;
  v9 = v8;
  v24 = v8;
  if (clientEncodingForClientId_applicationIdentifiers___pasOnceToken12 == -1)
  {
    v10 = v8;
  }
  else
  {
    dispatch_once(&clientEncodingForClientId_applicationIdentifiers___pasOnceToken12, block);
    v10 = v24;
  }
  v11 = (id)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_58;

  if (clientEncodingForClientId_applicationIdentifiers___pasOnceToken13 != -1)
    dispatch_once(&clientEncodingForClientId_applicationIdentifiers___pasOnceToken13, &__block_literal_global_60);
  v12 = (id)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_59;
  if (v5)
  {
    if ((-[__CFString isEqualToString:](v5, "isEqualToString:", *MEMORY[0x1E0D70D60]) & 1) != 0
      || (-[__CFString isEqualToString:](v5, "isEqualToString:", *MEMORY[0x1E0D70D70]) & 1) != 0
      || (objc_msgSend(v9, "containsObject:", v5) & 1) == 0
      && +[PPSocialHighlightStorage entitlementStatusForClient:applicationIdentifiers:](PPSocialHighlightStorage, "entitlementStatusForClient:applicationIdentifiers:", v5, v6) == 2)
    {

      v5 = CFSTR("WebBrowser");
    }
    objc_msgSend(v11, "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), CFSTR("client"), v5);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v15);

    v22 = 0;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8F8]), "initWithDictionary:error:", v14, &v22);
    v17 = v22;
    v18 = v16;
    if (!v16)
    {
      pp_social_highlights_log_handle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v17;
        _os_log_error_impl(&dword_1C392E000, v21, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: failed to allocate client dictionary, returning fallback to ensure content remains hidden. %@", buf, 0xCu);
      }

      v18 = v11;
    }
    v19 = v18;

  }
  else
  {
    v19 = v11;
  }

  return v19;
}

+ (id)_singleItemMultiArrayValueWithConstantValue:(double)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3BD6630](a1, a2);
  v11 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithShape:dataType:error:", &unk_1E7E5B290, 65600, &v11);
  v6 = v11;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:atIndexedSubscript:", v7, 0);

    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pp_social_highlights_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to allocate multiarray: %@", buf, 0xCu);
    }

    v8 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v8;
}

+ (id)_oneHotEncodeString:(id)a3 columns:(id)a4 prefix:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v7 = a4;
  v30 = a5;
  v8 = (void *)MEMORY[0x1C3BD6630]();
  v32 = (void *)objc_opt_new();
  v38 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithShape:dataType:error:", &unk_1E7E5B2A8, 65600, &v38);
  v10 = v38;
  if (v9)
  {
    objc_msgSend(v9, "setObject:atIndexedSubscript:", &unk_1E7E5C058, 0);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E970]), "initWithShape:dataType:error:", &unk_1E7E5B2C0, 65600, 0);
    v12 = v11;
    if (v11)
    {
      v26 = v10;
      v29 = v8;
      -[NSObject setObject:atIndexedSubscript:](v11, "setObject:atIndexedSubscript:", &unk_1E7E5C068, 0);
      v28 = v9;
      objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v9);
      v13 = objc_claimAutoreleasedReturnValue();
      v27 = v12;
      objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v15 = v7;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v35 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v31, "isEqual:", v20))
              v21 = v13;
            else
              v21 = v14;
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), v30, v20);
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, v22);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v17);
      }

      v33 = v10;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8F8]), "initWithDictionary:error:", v32, &v33);
      v10 = v33;

      v8 = v29;
      v12 = v27;
      if (!v23)
      {
        pp_default_log_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v10;
          _os_log_fault_impl(&dword_1C392E000, v24, OS_LOG_TYPE_FAULT, "PPSocialHighlightMLScorer: unable to allocate one hot encoded feature provider. %@", buf, 0xCu);
        }

      }
      v9 = v28;
    }
    else
    {
      pp_social_highlights_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v10;
        _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to allocate multiarray: %@", buf, 0xCu);
      }
      v23 = 0;
    }

  }
  else
  {
    pp_social_highlights_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPSocialHighlightMLScorer: unable to allocate multiarray: %@", buf, 0xCu);
    }
    v23 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v23;
}

+ (id)variantEncodingForVariant:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = variantEncodingForVariant___pasOnceToken21;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&variantEncodingForVariant___pasOnceToken21, &__block_literal_global_76);
  +[PPSocialHighlightMLScorer _oneHotEncodeString:columns:prefix:](PPSocialHighlightMLScorer, "_oneHotEncodeString:columns:prefix:", v4, variantEncodingForVariant___pasExprOnceResult, CFSTR("variant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __55__PPSocialHighlightMLScorer_variantEncodingForVariant___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = (void *)MEMORY[0x1C3BD6630]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E0D70F18], *MEMORY[0x1E0D70F10], 0);
  objc_autoreleasePoolPop(v1);
  v4 = (void *)variantEncodingForVariant___pasExprOnceResult;
  variantEncodingForVariant___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __78__PPSocialHighlightMLScorer_clientEncodingForClientId_applicationIdentifiers___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  +[PPSocialHighlightMLScorer _oneHotEncodeString:columns:prefix:](PPSocialHighlightMLScorer, "_oneHotEncodeString:columns:prefix:", 0, *(_QWORD *)(a1 + 32), CFSTR("client"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_58;
  clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_58 = v3;

  objc_autoreleasePoolPop(v2);
}

void __78__PPSocialHighlightMLScorer_clientEncodingForClientId_applicationIdentifiers___block_invoke_3()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  +[PPSocialHighlightMLScorer _singleItemMultiArrayValueWithConstantValue:](PPSocialHighlightMLScorer, "_singleItemMultiArrayValueWithConstantValue:", 1.0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_59;
  clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult_59 = v1;

  objc_autoreleasePoolPop(v0);
}

void __78__PPSocialHighlightMLScorer_clientEncodingForClientId_applicationIdentifiers___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = (void *)MEMORY[0x1C3BD6630]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E0D70D88], *MEMORY[0x1E0D70D98], *MEMORY[0x1E0D70D80], *MEMORY[0x1E0D70D68], *MEMORY[0x1E0D70D78], *MEMORY[0x1E0D70DB8], CFSTR("WebBrowser"), 0);
  objc_autoreleasePoolPop(v1);
  v4 = (void *)clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult;
  clientEncodingForClientId_applicationIdentifiers___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __47__PPSocialHighlightMLScorer_sharedTopKInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_53_5718, 300.0);
  v2 = (void *)sharedTopKInstance__pasExprOnceResult;
  sharedTopKInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __52__PPSocialHighlightMLScorer_sharedFirstPassInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_51, 300.0);
  v2 = (void *)sharedFirstPassInstance__pasExprOnceResult;
  sharedFirstPassInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
