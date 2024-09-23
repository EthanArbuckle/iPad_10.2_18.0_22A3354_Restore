@implementation PPUniversalSearchSpotlightIndexScorer

- (PPUniversalSearchSpotlightIndexScorer)initWithLocalTopicStore:(id)a3
{
  id v5;
  PPUniversalSearchSpotlightIndexScorer *v6;
  id v7;
  uint64_t v8;
  _PASLazyPurgeableResult *cachedPortraitTopicScores;
  _QWORD v11[4];
  id v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PPUniversalSearchSpotlightIndexScorer;
  v6 = -[PPUniversalSearchSpotlightIndexScorer init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D815E0]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PPUniversalSearchSpotlightIndexScorer_initWithLocalTopicStore___block_invoke;
    v11[3] = &unk_1E7E1C820;
    v12 = v5;
    v13 = a2;
    v8 = objc_msgSend(v7, "initWithBlock:", v11);
    cachedPortraitTopicScores = v6->_cachedPortraitTopicScores;
    v6->_cachedPortraitTopicScores = (_PASLazyPurgeableResult *)v8;

  }
  return v6;
}

- (id)topicAlgorithmWeights
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = 12;
  do
  {
    objc_msgSend(v2, "addObject:", &unk_1E7E59DC8);
    --v3;
  }
  while (v3);
  return v2;
}

- (double)computeSpotlightIndexTopicSubscoreFromPortraitExtractions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v3;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v29 = v5;
        v6 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v5);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v6, "topics");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v31 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v12, "item");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "topicIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("Q"));

              if (v15)
              {
                objc_msgSend(v12, "item");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "topicIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "objectForKeyedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v18)
                {
                  v18 = (void *)objc_opt_new();
                  objc_msgSend(v12, "item");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "topicIdentifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v20);

                }
                v21 = objc_msgSend(v6, "topicAlgorithm");
                objc_msgSend(v12, "score");
                objc_msgSend(v18, "addToCountForAlgorithm:value:", v21);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v9);
        }

        v5 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v28);
  }

  -[PPUniversalSearchSpotlightIndexScorer computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector:](self, "computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector:", v4);
  v23 = v22;

  return v23;
}

- (double)computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x2020000000;
  v41 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__17185;
  v36[4] = __Block_byref_object_dispose__17186;
  v37 = 0;
  v37 = (id)objc_opt_new();
  -[_PASLazyPurgeableResult result](self->_cachedPortraitTopicScores, "result");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __105__PPUniversalSearchSpotlightIndexScorer_computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector___block_invoke;
  v32[3] = &unk_1E7E1C848;
  v34 = &v38;
  v10 = v7;
  v33 = v10;
  v35 = v36;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v32);

  v11 = v39[3];
  -[PPUniversalSearchSpotlightIndexScorer topicAlgorithmWeights](self, "topicAlgorithmWeights");
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x2020000000;
  v27 = 0;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __105__PPUniversalSearchSpotlightIndexScorer_computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector___block_invoke_2;
  v19[3] = &unk_1E7E1C870;
  v21 = v36;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  v22 = &v24;
  v23 = &v28;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v19);
  v13 = v25[3];
  v14 = 0.0;
  if (v13 != 0.0)
  {
    v15 = sqrt(v11);
    if (v15 != 0.0)
    {
      v16 = v29[3];
      pp_universal_search_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      v14 = v16 / sqrt(v13) / v15;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v43 = v14;
        _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "PPSpotlightScoring: spotlightQueryScore of %f", buf, 0xCu);
      }

    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPortraitTopicScores, 0);
}

void __105__PPUniversalSearchSpotlightIndexScorer_computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + v7 * v8;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v5, v9);

}

void __105__PPUniversalSearchSpotlightIndexScorer_computeSpotlightIndexTopicScoreComponentFromDocumentTopicVector___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t i;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    for (i = 0; i != 12; ++i)
    {
      objc_msgSend(v13, "countForAlgorithm:", i);
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v8 * v10;

      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24)
                                                                  + v11 * v11;
      objc_msgSend(v5, "doubleValue");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 24)
                                                                  + v11 * v12;
    }
  }

}

id __65__PPUniversalSearchSpotlightIndexScorer_initWithLocalTopicStore___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cachedTopicScores");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    pp_universal_search_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "Failed to read topic cache in %@.  Forcing regeneration", buf, 0xCu);

    }
    v5 = *(void **)(a1 + 32);
    v13 = 0;
    v6 = objc_msgSend(v5, "computeAndCacheTopicScores:", &v13);
    v7 = v13;
    if ((v6 & 1) == 0)
    {
      pp_universal_search_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v11;
        v16 = 2112;
        v17 = v7;
        _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "Forced topic cache recreation failed in %@ with %@", buf, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "cachedTopicScores");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      pp_universal_search_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "Topic cache still empty after successful regeneration in %@", buf, 0xCu);

      }
    }

  }
  return v2;
}

@end
