@implementation ATXLayoutSelector

- (ATXLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4
{
  id v7;
  id v8;
  ATXLayoutSelector *v9;
  ATXLayoutSelector *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXLayoutSelector;
  v9 = -[ATXLayoutSelector init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deduplicator, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
  }

  return v10;
}

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  __atxlog_handle_blending();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v8;
    v20 = 2048;
    v21 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1AA841000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Layout Selector asked to provide the highest ranking, selected layout for %{public}@ and %lu rankedSuggestions", (uint8_t *)&v18, 0x16u);

  }
  -[ATXLayoutSelector validLayoutsForConsumerSubType:rankedSuggestions:](self, "validLayoutsForConsumerSubType:rankedSuggestions:", v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  __atxlog_handle_blending();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      objc_msgSend(v9, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXSuggestionLayout stringFromUILayoutType:](ATXSuggestionLayout, "stringFromUILayoutType:", objc_msgSend(v13, "layoutType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v14;
      _os_log_impl(&dword_1AA841000, v11, OS_LOG_TYPE_DEFAULT, "Blending: Layout Selector's selected layout type: %@", (uint8_t *)&v18, 0xCu);

    }
    objc_msgSend(v9, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_1AA841000, v11, OS_LOG_TYPE_DEFAULT, "Blending: There is no selected layout for consumerSubType: %@", (uint8_t *)&v18, 0xCu);

    }
    v15 = 0;
  }

  return v15;
}

- (id)validLayoutsForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  ATXLayoutGenerator *v9;
  void *v10;
  ATXLayoutGenerator *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[5];
  char v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  __atxlog_handle_blending();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AA841000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Layout Selector asked to provide validLayouts.", buf, 2u);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__ATXLayoutSelector_validLayoutsForConsumerSubType_rankedSuggestions___block_invoke;
  v20[3] = &unk_1E57CFA80;
  v20[4] = self;
  v21 = v4;
  objc_msgSend(v6, "_pas_filteredArrayWithTest:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [ATXLayoutGenerator alloc];
  -[ATXUniversalBlendingLayerHyperParametersProtocol layoutsToConsiderForConsumerSubType:](self->_hyperParameters, "layoutsToConsiderForConsumerSubType:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ATXLayoutGenerator initWithRankedSuggestions:layoutsToConsider:hyperParameters:suggestionDeduplicator:](v9, "initWithRankedSuggestions:layoutsToConsider:hyperParameters:suggestionDeduplicator:", v8, v10, self->_hyperParameters, self->_deduplicator);

  __atxlog_handle_blending();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 138543618;
    v23 = v13;
    v24 = 2048;
    v25 = v14;
    _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "Generating layouts for non-homescreen consumerSubType %{public}@ with %lu ranked and filtered suggestions", buf, 0x16u);

  }
  -[ATXLayoutGenerator generateValidLayouts](v11, "generateValidLayouts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v16 = v15;
  }
  else
  {
    __atxlog_handle_blending();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_impl(&dword_1AA841000, v17, OS_LOG_TYPE_DEFAULT, "Blending: Unable to generate any valid layouts for consumerSubType: %@.", buf, 0xCu);

    }
    v16 = 0;
  }

  return v16;
}

uint64_t __70__ATXLayoutSelector_validLayoutsForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "uiSupportsSuggestion:consumerSubType:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_deduplicator, 0);
}

@end
