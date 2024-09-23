@implementation ATXSuggestionReranker

- (ATXSuggestionReranker)initWithProactiveSuggestions:(id)a3 hyperParameters:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  ATXClientModelCacheUpdate *v26;
  void *v27;
  ATXClientModelCacheUpdate *v28;
  ATXSuggestionReranker *v29;
  ATXSuggestionReranker *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v31 = self;
  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32 = a4;
  v6 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1AF421DC4]();
        objc_msgSend(v12, "clientModelSpecification");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "clientModelId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v17 = (void *)objc_opt_new();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v15);

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v15, v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v12);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }

  v19 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v20 = v6;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v24);
        v26 = [ATXClientModelCacheUpdate alloc];
        objc_msgSend(v20, "objectForKeyedSubscript:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[ATXClientModelCacheUpdate initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:](v26, "initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:", v25, v27, 0, 0);

        objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, v25);
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v22);
  }

  v29 = -[ATXSuggestionReranker initWithClientModelSuggestions:promoteSuggestionsFromClientModel:hyperParameters:](v31, "initWithClientModelSuggestions:promoteSuggestionsFromClientModel:hyperParameters:", v19, 0, v32);
  return v29;
}

- (ATXSuggestionReranker)initWithClientModelSuggestions:(id)a3 promoteSuggestionsFromClientModel:(id)a4 hyperParameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXSuggestionReranker *v12;
  ATXSuggestionReranker *v13;
  uint64_t v14;
  NSString *promotedClientModelId;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXSuggestionReranker;
  v12 = -[ATXSuggestionReranker init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientModelSuggestions, a3);
    v14 = objc_msgSend(v10, "copy");
    promotedClientModelId = v13->_promotedClientModelId;
    v13->_promotedClientModelId = (NSString *)v14;

    objc_storeStrong((id *)&v13->_blendingLayerHyperParameters, a5);
  }

  return v13;
}

- (id)clientModelPriorityOrder
{
  return (id)-[ATXUniversalBlendingLayerHyperParametersProtocol clientModelPriorityOrder](self->_blendingLayerHyperParameters, "clientModelPriorityOrder");
}

- (id)rerankedSuggestions
{
  void *v3;
  void *v4;

  -[ATXSuggestionReranker constructConfidenceCategoryDictionaryForClientModelSuggestions](self, "constructConfidenceCategoryDictionaryForClientModelSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestionReranker convertConfidenceCategoryDictionaryToArray:](self, "convertConfidenceCategoryDictionaryToArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)constructConfidenceCategoryDictionaryForClientModelSuggestions
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[ATXSuggestionReranker initializeConfidenceCategoryToSuggestionsDictionary](self, "initializeConfidenceCategoryToSuggestionsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ATXSuggestionReranker clientModelPriorityOrder](self, "clientModelPriorityOrder");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v29;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v22 = v4;
        v5 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v4);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        -[NSDictionary objectForKeyedSubscript:](self->_clientModelSuggestions, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "suggestions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v7;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v25;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v23);
              v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
              if (self->_promotedClientModelId && objc_msgSend(v5, "isEqualToString:"))
              {
                objc_msgSend(v12, "scoreSpecification");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setSuggestedConfidenceCategory:", 4);

              }
              v14 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v12, "scoreSpecification");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "suggestedConfidenceCategory"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v12);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v9);
        }

        v4 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v21);
  }

  return v3;
}

- (id)initializeConfidenceCategoryToSuggestionsDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, &unk_1E57EC458);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, &unk_1E57EC470);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, &unk_1E57EC488);

  v6 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, &unk_1E57EC4A0);

  return v2;
}

- (id)convertConfidenceCategoryDictionaryToArray:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString *promotedClientModelId;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  unint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = 4;
  do
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          promotedClientModelId = self->_promotedClientModelId;
          objc_msgSend(v13, "clientModelSpecification");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "clientModelId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(promotedClientModelId) = -[NSString isEqualToString:](promotedClientModelId, "isEqualToString:", v16);

          if ((_DWORD)promotedClientModelId)
            v17 = v4;
          else
            v17 = v5;
          objc_msgSend(v17, "addObject:", v13);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    v6 = v22 - 1;
  }
  while (v22 > 1);
  if (objc_msgSend(v4, "count", v6))
  {
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v5;
  }
  v19 = v18;

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingLayerHyperParameters, 0);
  objc_storeStrong((id *)&self->_promotedClientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelSuggestions, 0);
}

@end
