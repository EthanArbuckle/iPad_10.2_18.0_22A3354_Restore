@implementation ATXUniversalBlendingLayer

+ (void)logLongDescriptionForBlendingLayerString:(id)a3 prefix:(id)a4 shouldUseDefaultLogLevel:(BOOL)a5 limit:(unint64_t)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t i;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v9;
  objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  if (v13 >= a6)
    v14 = a6;
  else
    v14 = v13;
  if (v14)
  {
    for (i = 0; i < v21; ++i)
    {
      __atxlog_handle_blending_internal_cache();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v7)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_msgSend(v12, "count");
          objc_msgSend(v12, "objectAtIndexedSubscript:", i);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v26 = i + 1;
          v27 = 2048;
          v28 = v18;
          v29 = 2112;
          v30 = v10;
          v31 = 2112;
          v32 = v19;
          _os_log_impl(&dword_1AA841000, v17, OS_LOG_TYPE_DEFAULT, "[%lu of %lu] %@ %@", buf, 0x2Au);

        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v22 = objc_msgSend(v12, "count");
        objc_msgSend(v12, "objectAtIndexedSubscript:", i);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v26 = i + 1;
        v27 = 2048;
        v28 = v22;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v23;
        _os_log_debug_impl(&dword_1AA841000, v17, OS_LOG_TYPE_DEBUG, "[%lu of %lu] %@ %@", buf, 0x2Au);

      }
      v20 = objc_msgSend(v12, "count");
      if (v20 >= a6)
        v21 = a6;
      else
        v21 = v20;
    }
  }

}

+ (id)validConsumerSubTypesForLayoutGeneration
{
  return &unk_1E57EC6E8;
}

- (ATXUniversalBlendingLayer)initWithSuggestionPreprocessor:(id)a3 delegate:(id)a4 layoutSelectorsForConsumerSubTypes:(id)a5 blendingSessionLogger:(id)a6 hyperParameters:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  ATXUniversalBlendingLayer *v18;
  ATXUniversalBlendingLayer *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSString *promotedClientModelId;
  uint64_t v24;
  NSDictionary *layoutSelectorsForConsumerSubTypes;
  uint64_t v26;
  ATXUniversalBlendingFeedbackWriter *feedbackWriter;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)ATXUniversalBlendingLayer;
  v18 = -[ATXUniversalBlendingLayer init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_suggestionPreprocessor, a3);
    v20 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v21 = (void *)objc_msgSend(v20, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    objc_msgSend(v21, "stringForKey:", CFSTR("BlendingLayerPromotedClientModel"));
    v22 = objc_claimAutoreleasedReturnValue();
    promotedClientModelId = v19->_promotedClientModelId;
    v19->_promotedClientModelId = (NSString *)v22;

    objc_storeStrong((id *)&v19->_delegate, a4);
    v24 = objc_msgSend(v15, "copy");
    layoutSelectorsForConsumerSubTypes = v19->_layoutSelectorsForConsumerSubTypes;
    v19->_layoutSelectorsForConsumerSubTypes = (NSDictionary *)v24;

    objc_storeStrong((id *)&v19->_blendingSessionLogger, a6);
    objc_storeStrong((id *)&v19->_hyperParameters, a7);
    v26 = objc_opt_new();
    feedbackWriter = v19->_feedbackWriter;
    v19->_feedbackWriter = (ATXUniversalBlendingFeedbackWriter *)v26;

  }
  return v19;
}

- (void)updateSuggestionsForAllConsumerSubTypesWithClientModelSuggestions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AA841000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer asked to update suggestions for all consumer subtypes. [BLENDING REFRESH START]", buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "validConsumerSubTypesForLayoutGeneration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUniversalBlendingLayer updateSuggestionsForConsumerSubTypes:clientModelSuggestions:](self, "updateSuggestionsForConsumerSubTypes:clientModelSuggestions:", v6, v4);

  __atxlog_handle_blending();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AA841000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer finished updating suggestions for all consumer subtypes. [BLENDING REFRESH END]", v8, 2u);
  }

}

- (void)updateSuggestionsForConsumerSubTypes:(id)a3 clientModelSuggestions:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  sel_getName(a2);
  v22 = (void *)os_transaction_create();
  __atxlog_handle_blending();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AA841000, v9, OS_LOG_TYPE_DEFAULT, "Blending: Considering executing Blending Layer session logging before executing Blending Layer refresh.", buf, 2u);
  }

  -[ATXBlendingLayerSessionLoggerProtocol logCurrentSessionIfPossible](self->_blendingSessionLogger, "logCurrentSessionIfPossible");
  __atxlog_handle_blending();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, "Blending: Done executing Blending Layer session logging before executing Blending Layer refresh.", buf, 2u);
  }

  -[ATXUniversalBlendingLayer rerankedValidSuggestionsFromClientModelSuggestions:](self, "rerankedValidSuggestionsFromClientModelSuggestions:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "integerValue");
        objc_msgSend((id)objc_opt_class(), "validConsumerSubTypesForLayoutGeneration");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v17) = objc_msgSend(v19, "containsObject:", v17);

        if ((v17 & 1) != 0)
        {
          -[ATXUniversalBlendingLayer updateSuggestionsForConsumerSubType:rankedSuggestions:clientModelSuggestions:](self, "updateSuggestionsForConsumerSubType:rankedSuggestions:clientModelSuggestions:", v18, v11, v8);
        }
        else
        {
          __atxlog_handle_blending();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v28 = v21;
            _os_log_impl(&dword_1AA841000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring UI Consumer because it's not allowed. UI Consumer: %@", buf, 0xCu);

          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v14);
  }

}

- (BOOL)updateSuggestionsForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4 clientModelSuggestions:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  ATXBlendingLayerDelegateProtocol *delegate;
  int v17;
  void *v18;
  uint64_t v19;

  v6 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  __atxlog_handle_blending();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "safeStringForConsumerSubtype:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v11;
    _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, ">>> Blending: Blending Layer asked to update suggestions for consumer subtype %@", (uint8_t *)&v17, 0xCu);

  }
  if (!objc_msgSend(v8, "count"))
  {
    __atxlog_handle_blending();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXUniversalBlendingLayer updateSuggestionsForConsumerSubType:rankedSuggestions:clientModelSuggestions:].cold.1(v12);

  }
  -[ATXBlendingLayerDelegateProtocol blendingLayerRerankedSuggestions:consumerSubType:](self->_delegate, "blendingLayerRerankedSuggestions:consumerSubType:", v8, v6);
  -[ATXUniversalBlendingLayer selectedLayoutForUIConsumer:rankedSuggestions:](self, "selectedLayoutForUIConsumer:rankedSuggestions:", v6, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXUniversalBlendingLayer updateCachedLayout:uiConsumer:clientModelSuggestions:](self, "updateCachedLayout:uiConsumer:clientModelSuggestions:", v13, v6, v9);

  delegate = self->_delegate;
  if (delegate)
    -[ATXBlendingLayerDelegateProtocol blendingLayerUpdatedUICache:consumerSubType:](delegate, "blendingLayerUpdatedUICache:consumerSubType:", v13, v6);

  return v14;
}

- (id)rerankedValidSuggestionsFromClientModelSuggestions:(id)a3
{
  void *v4;
  void *v5;

  -[ATXUniversalBlendingLayer rerankedSuggestions:](self, "rerankedSuggestions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSuggestionPreprocessorProtocol suggestionsWithInvalidSuggestionsRemoved:](self->_suggestionPreprocessor, "suggestionsWithInvalidSuggestionsRemoved:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)rerankedSuggestions:(id)a3
{
  id v4;
  NSObject *v5;
  ATXSuggestionReranker *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  __CFString *v12;
  NSObject *v13;
  unint64_t v14;
  __CFString *v15;
  NSObject *v16;
  unint64_t v17;
  __CFString *v18;
  int v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1AA841000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is reranking suggestions.", (uint8_t *)&v20, 2u);
  }

  v6 = -[ATXSuggestionReranker initWithClientModelSuggestions:promoteSuggestionsFromClientModel:hyperParameters:]([ATXSuggestionReranker alloc], "initWithClientModelSuggestions:promoteSuggestionsFromClientModel:hyperParameters:", v4, self->_promotedClientModelId, self->_hyperParameters);
  -[ATXSuggestionReranker rerankedSuggestions](v6, "rerankedSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1AF421DC4]();
  __atxlog_handle_blending();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1AA841000, v9, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer finished reranking suggestions.", (uint8_t *)&v20, 2u);
  }

  __atxlog_handle_blending();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v7, "count");
    if (v11)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("None");
    }
    v20 = 138412290;
    v21 = v12;
    _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, "Blending: 1st highest ranked suggestion: %@", (uint8_t *)&v20, 0xCu);
    if (v11)

  }
  __atxlog_handle_blending();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v7, "count");
    if (v14 < 2)
    {
      v15 = CFSTR("None");
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v20 = 138412290;
    v21 = v15;
    _os_log_impl(&dword_1AA841000, v13, OS_LOG_TYPE_DEFAULT, "Blending: 2nd highest ranked suggestion: %@", (uint8_t *)&v20, 0xCu);
    if (v14 >= 2)

  }
  __atxlog_handle_blending();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v7, "count");
    if (v17 < 3)
    {
      v18 = CFSTR("None");
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v20 = 138412290;
    v21 = v18;
    _os_log_impl(&dword_1AA841000, v16, OS_LOG_TYPE_DEFAULT, "Blending: 3rd highest ranked suggestion: %@", (uint8_t *)&v20, 0xCu);
    if (v17 >= 3)

  }
  objc_autoreleasePoolPop(v8);

  return v7;
}

- (id)selectedLayoutForUIConsumer:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  NSDictionary *layoutSelectorsForConsumerSubTypes;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is selecting a layout for the suggestions.", (uint8_t *)&v18, 2u);
    }

    -[ATXSuggestionPreprocessorProtocol suggestionsByPreprocessingRankedSuggestions:forConsumerSubType:](self->_suggestionPreprocessor, "suggestionsByPreprocessingRankedSuggestions:forConsumerSubType:", v6, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    layoutSelectorsForConsumerSubTypes = self->_layoutSelectorsForConsumerSubTypes;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](layoutSelectorsForConsumerSubTypes, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "selectedLayoutForConsumerSubType:rankedSuggestions:", v4, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "compactDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CF9508], "safeStringForConsumerSubtype:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v15;
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1AA841000, v14, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer selected the following layout: %@ for consumerSubType: %@", (uint8_t *)&v18, 0x16u);

      }
    }
    else
    {
      __atxlog_handle_blending();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXUniversalBlendingLayer selectedLayoutForUIConsumer:rankedSuggestions:].cold.1(v4);
      v13 = 0;
    }

  }
  else
  {
    if (v9)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer asked to select a layout when there were no suggestions available.", (uint8_t *)&v18, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (BOOL)updateCachedLayout:(id)a3 uiConsumer:(unsigned __int8)a4 clientModelSuggestions:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  ATXBlendingModelUICacheUpdate *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v6 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  __atxlog_handle_blending();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v11;
    _os_log_impl(&dword_1AA841000, v10, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is persisting the cached suggestion layout for consumer: %@", buf, 0xCu);

  }
  if (_PASIsInternalDevice())
  {
    v12 = (void *)MEMORY[0x1AF421DC4]();
    v13 = (void *)objc_opt_class();
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("Consumer subtype %@ cache: %@"), v15, v8);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p> "), self);
    objc_msgSend(v13, "logLongDescriptionForBlendingLayerString:prefix:shouldUseDefaultLogLevel:limit:", v16, v17, 1, 60);

    objc_autoreleasePoolPop(v12);
  }
  v18 = -[ATXBlendingModelUICacheUpdate initWithUICache:consumerSubType:clientModelCacheUpdates:]([ATXBlendingModelUICacheUpdate alloc], "initWithUICache:consumerSubType:clientModelCacheUpdates:", v8, v6, v9);
  -[ATXUniversalBlendingFeedbackWriter donateBlendingModelUICacheUpdate:uiConsumer:](self->_feedbackWriter, "donateBlendingModelUICacheUpdate:uiConsumer:", v18, v6);
  v19 = (void *)objc_opt_new();
  v20 = objc_msgSend(v19, "updateCachedLayout:consumerSubType:", v8, v6);
  if (v20)
  {
    __atxlog_handle_blending();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_impl(&dword_1AA841000, v21, OS_LOG_TYPE_DEFAULT, "Blending: Successfully updated the cache for %@", buf, 0xCu);

    }
    __atxlog_handle_feedback();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXBlendingModelUICacheUpdate uuid](v18, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v24;
      v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_1AA841000, v23, OS_LOG_TYPE_DEFAULT, "Blending: Sucesssfully updated the cache for consumer %@ with blending cache UUID: %@", buf, 0x16u);

LABEL_15:
    }
  }
  else
  {
    __atxlog_handle_blending();
    v26 = objc_claimAutoreleasedReturnValue();
    v23 = v26;
    if (v8)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[ATXUniversalBlendingLayer updateCachedLayout:uiConsumer:clientModelSuggestions:].cold.1(v6);
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v24;
      _os_log_impl(&dword_1AA841000, v23, OS_LOG_TYPE_DEFAULT, "Blending: Couldn't generate a valid layout. Not writing a cache for %@.", buf, 0xCu);
      goto LABEL_15;
    }
  }

  return v20;
}

- (void)promoteSuggestionsFromClientModelWithIdentifier:(id)a3
{
  NSString *v4;
  NSString *promotedClientModelId;
  id v6;
  id v7;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  promotedClientModelId = self->_promotedClientModelId;
  self->_promotedClientModelId = v4;

  v6 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v7 = (id)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v7, "setObject:forKey:", self->_promotedClientModelId, CFSTR("BlendingLayerPromotedClientModel"));

}

- (ATXUniversalBlendingFeedbackWriter)feedbackWriter
{
  return self->_feedbackWriter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackWriter, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_blendingSessionLogger, 0);
  objc_storeStrong((id *)&self->_layoutSelectorsForConsumerSubTypes, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_suggestionPreprocessor, 0);
  objc_storeStrong((id *)&self->_promotedClientModelId, 0);
}

- (void)updateSuggestionsForConsumerSubType:(os_log_t)log rankedSuggestions:clientModelSuggestions:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "Encountered empty list of rerankedValidSuggestions.", v1, 2u);
}

- (void)selectedLayoutForUIConsumer:(unsigned __int8)a1 rankedSuggestions:.cold.1(unsigned __int8 a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CF9508], "safeStringForConsumerSubtype:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1AA841000, v2, v3, "Unable to generate layout for consumerSubType %@ because no layout selector was provided.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateCachedLayout:(unsigned __int8)a1 uiConsumer:clientModelSuggestions:.cold.1(unsigned __int8 a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1AA841000, v2, v3, "Blending: Failed to update the cache for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
