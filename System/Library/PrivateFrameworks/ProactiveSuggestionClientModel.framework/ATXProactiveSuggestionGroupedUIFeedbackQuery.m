@implementation ATXProactiveSuggestionGroupedUIFeedbackQuery

- (ATXProactiveSuggestionGroupedUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6 hyperParameters:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  ATXProactiveSuggestionGroupedUIFeedbackQuery *v21;
  NSObject *v22;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v17 = v16;
  -[ATXProactiveSuggestionGroupedUIFeedbackQuery uiPublisherForConsumerSubType:startTime:](self, "uiPublisherForConsumerSubType:startTime:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "publisherFromStartTime:consumerSubType:", v10, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    self = -[ATXProactiveSuggestionUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:uiPublisher:blendingModelPublisher:contextPublisher:hyperParameters:](self, "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:uiPublisher:blendingModelPublisher:contextPublisher:hyperParameters:", v12, v10, v13, v14, v18, v20, 0, v15);
    v21 = self;
  }
  else
  {
    __atxlog_handle_blending_ecosystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestionGroupedUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:hyperParameters:].cold.1((uint64_t)self, v10, v22);

    v21 = 0;
  }

  return v21;
}

- (id)uiPublisherForConsumerSubType:(unsigned __int8)a3 startTime:(double)a4
{
  void *v5;
  void *v6;
  NSObject *v8;

  if (a3 == 43)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "genericEventPublisherFromStartTime:consumerSubType:", 43, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_blending_ecosystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestionGroupedUIFeedbackQuery uiPublisherForConsumerSubType:startTime:].cold.1(a3, v8);

    v6 = 0;
  }
  return v6;
}

- (id)uiFeedbackPublisherChainForShortcutsEditor
{
  ATXShortcutsEditorGroupedUIFeedbackPublisher *v3;
  void *v4;
  ATXShortcutsEditorGroupedUIFeedbackPublisher *v5;
  void *v6;

  v3 = [ATXShortcutsEditorGroupedUIFeedbackPublisher alloc];
  -[ATXProactiveSuggestionUIFeedbackQuery uiFeedbackPublisherChain](self, "uiFeedbackPublisherChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXShortcutsEditorGroupedUIFeedbackPublisher initWithUIFeedbackPublisher:](v3, "initWithUIFeedbackPublisher:", v4);
  -[ATXShortcutsEditorGroupedUIFeedbackPublisher shortcutsEditorUIFeedbackPublisher](v5, "shortcutsEditorUIFeedbackPublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)enumerateGroupedUIFeedbackResultsWithBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t *v16;
  NSObject *v17;
  id v18;
  objc_class *v19;
  id v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[ATXProactiveSuggestionUIFeedbackQuery consumerSubTypeToConsider](self, "consumerSubTypeToConsider") != 43)
  {
    __atxlog_handle_blending();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestionGroupedUIFeedbackQuery enumerateGroupedUIFeedbackResultsWithBlock:completionBlock:].cold.2(v10);

    v28 = *MEMORY[0x1E0CB2D50];
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", -[ATXProactiveSuggestionUIFeedbackQuery consumerSubTypeToConsider](self, "consumerSubTypeToConsider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("Unknown consumerSubType specified: %@"), v12);
    v29[0] = v13;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (void **)v29;
    v16 = &v28;
    goto LABEL_10;
  }
  -[ATXProactiveSuggestionGroupedUIFeedbackQuery uiFeedbackPublisherChainForShortcutsEditor](self, "uiFeedbackPublisherChainForShortcutsEditor");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    __atxlog_handle_blending_ecosystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ATXProactiveSuggestionGroupedUIFeedbackQuery enumerateGroupedUIFeedbackResultsWithBlock:completionBlock:].cold.1((uint64_t)self, v17);

    v26 = *MEMORY[0x1E0CB2D50];
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%@ - could not create uiFeedbackPublisherChain, returning early"), v12, v26);
    v27 = v13;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v27;
    v16 = &v26;
LABEL_10:
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@"), v23);
    v25 = (void *)objc_msgSend(v20, "initWithDomain:code:userInfo:", v24, -1, v9);

    v7[2](v7, v25);
    goto LABEL_11;
  }
  v9 = (void *)v8;
  -[ATXProactiveSuggestionGroupedUIFeedbackQuery enumerateGroupedUIFeedbackResultsWithBlock:completionBlock:uiFeedbackPublisherChain:](self, "enumerateGroupedUIFeedbackResultsWithBlock:completionBlock:uiFeedbackPublisherChain:", v6, v7, v8);
LABEL_11:

}

- (void)enumerateGroupedUIFeedbackResultsWithBlock:(id)a3 completionBlock:(id)a4 uiFeedbackPublisherChain:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CF94A0];
  -[ATXProactiveSuggestionUIFeedbackQuery bookmarkURLPath](self, "bookmarkURLPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bookmarkFromURLPath:maxFileSize:versionNumber:", v12, 3000000, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "bookmark");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __132__ATXProactiveSuggestionGroupedUIFeedbackQuery_enumerateGroupedUIFeedbackResultsWithBlock_completionBlock_uiFeedbackPublisherChain___block_invoke;
  v21[3] = &unk_1E57CE628;
  v21[4] = self;
  v22 = v9;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __132__ATXProactiveSuggestionGroupedUIFeedbackQuery_enumerateGroupedUIFeedbackResultsWithBlock_completionBlock_uiFeedbackPublisherChain___block_invoke_18;
  v19[3] = &unk_1E57CF158;
  v19[4] = self;
  v20 = v8;
  v16 = v8;
  v17 = v9;
  v18 = (id)objc_msgSend(v10, "sinkWithBookmark:completion:receiveInput:", v15, v21, v19);

}

void __132__ATXProactiveSuggestionGroupedUIFeedbackQuery_enumerateGroupedUIFeedbackResultsWithBlock_completionBlock_uiFeedbackPublisherChain___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "state");

  v9 = v8 == 0;
  if (!v8 && !v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "bookmarkURLPath");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v10 = objc_alloc(MEMORY[0x1E0CF94A0]);
      objc_msgSend(*(id *)(a1 + 32), "bookmarkURLPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithURLPath:versionNumber:bookmark:metadata:", v11, v12, v5, 0);

      v20 = 0;
      v9 = objc_msgSend(v13, "saveBookmarkWithError:", &v20);
      v7 = v20;
      __atxlog_handle_blending_ecosystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v16;
        v23 = 1024;
        v24 = v9;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_1AA841000, v14, OS_LOG_TYPE_DEFAULT, "%@ - saved new bookmark with success: %u, error: %@", buf, 0x1Cu);

      }
    }
    else
    {
      v9 = 1;
    }
  }
  __atxlog_handle_blending_ecosystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v19;
    v23 = 1024;
    v24 = v9;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1AA841000, v17, OS_LOG_TYPE_DEFAULT, "%@ - invoking completion handler with success: %u, error: %@", buf, 0x1Cu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __132__ATXProactiveSuggestionGroupedUIFeedbackQuery_enumerateGroupedUIFeedbackResultsWithBlock_completionBlock_uiFeedbackPublisherChain___block_invoke_18(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  v3 = (void *)MEMORY[0x1AF421DC4]();
  objc_msgSend(v10, "startDateOfFirstSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "startDateForResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  if (v6 >= v9)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v3);

}

- (void)initWithClientModelIds:(NSObject *)a3 consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:hyperParameters:.cold.1(uint64_t a1, unsigned __int8 a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_1AA841000, a3, OS_LOG_TYPE_FAULT, "%@ - could not find iOS ui publisher for consumerSubType: %@", (uint8_t *)&v8, 0x16u);

}

- (void)uiPublisherForConsumerSubType:(unsigned __int8)a1 startTime:(NSObject *)a2 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "Tried to access BiomeUIStream for grouped UI feedback results for an incompatible consumerSubType: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

- (void)enumerateGroupedUIFeedbackResultsWithBlock:(uint64_t)a1 completionBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1AA841000, a2, OS_LOG_TYPE_ERROR, "%@ - could not create uiFeedbackPublisherChain, returning early", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

- (void)enumerateGroupedUIFeedbackResultsWithBlock:(os_log_t)log completionBlock:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AA841000, log, OS_LOG_TYPE_FAULT, "Unknown consumerSubType specified.", v1, 2u);
}

@end
