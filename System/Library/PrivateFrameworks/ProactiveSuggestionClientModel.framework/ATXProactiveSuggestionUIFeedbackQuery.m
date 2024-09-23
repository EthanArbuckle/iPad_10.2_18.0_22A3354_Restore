@implementation ATXProactiveSuggestionUIFeedbackQuery

- (NSDate)startDateForResults
{
  return self->_startDateForResults;
}

- (void)enumerateUIFeedbackResultsWithBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  -[ATXProactiveSuggestionUIFeedbackQuery uiFeedbackPublisherChain](self, "uiFeedbackPublisherChain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", self->_bookmarkURLPath, 3000000, &unk_1E57EBF90);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bookmark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__ATXProactiveSuggestionUIFeedbackQuery_enumerateUIFeedbackResultsWithBlock_completionBlock___block_invoke;
    v19[3] = &unk_1E57CE628;
    v19[4] = self;
    v20 = v7;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __93__ATXProactiveSuggestionUIFeedbackQuery_enumerateUIFeedbackResultsWithBlock_completionBlock___block_invoke_8;
    v17[3] = &unk_1E57CE650;
    v17[4] = self;
    v18 = v6;
    v12 = (id)objc_msgSend(v8, "sinkWithBookmark:completion:receiveInput:", v10, v19, v17);

  }
  else
  {
    __atxlog_handle_blending_ecosystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXProactiveSuggestionUIFeedbackQuery enumerateUIFeedbackResultsWithBlock:completionBlock:].cold.1((uint64_t)self, v13);

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v9, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);

  }
}

- (id)uiFeedbackPublisherChain
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestionUIFeedbackQuery uiFeedbackPublisher](self, "uiFeedbackPublisher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiFeedbackPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)uiFeedbackPublisher
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  ATXProactiveSuggestionUIFeedbackPublisher *v7;

  -[NSDate timeIntervalSinceReferenceDate](self->_startDateForResults, "timeIntervalSinceReferenceDate");
  v4 = v3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "publisherFromStartTime:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXProactiveSuggestionUIFeedbackPublisher initWithClientModelPublisher:blendingModelPublisher:uiPublisher:contextPublisher:validUICacheConsumerSubType:validClientModelIds:hyperParameters:]([ATXProactiveSuggestionUIFeedbackPublisher alloc], "initWithClientModelPublisher:blendingModelPublisher:uiPublisher:contextPublisher:validUICacheConsumerSubType:validClientModelIds:hyperParameters:", v6, self->_blendingModelPublisher, self->_uiPublisher, self->_contextPublisher, self->_consumerSubTypeToConsider, self->_clientModelIds, self->_hyperParameters);
  return v7;
}

void __93__ATXProactiveSuggestionUIFeedbackQuery_enumerateUIFeedbackResultsWithBlock_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1AF421DC4]();
  v9 = objc_msgSend(v5, "state");
  v10 = v9 == 0;
  if (!v9 && !v7)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF94A0]), "initWithURLPath:versionNumber:bookmark:metadata:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &unk_1E57EBF90, v6, 0);
      v19 = 0;
      v10 = objc_msgSend(v11, "saveBookmarkWithError:", &v19);
      v7 = v19;
      __atxlog_handle_blending_ecosystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v14;
        v22 = 1024;
        v23 = v10;
        v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "%@ - saved new bookmark with success: %u, error: %@", buf, 0x1Cu);

      }
    }
    else
    {
      v7 = 0;
      v10 = 1;
    }
  }
  __atxlog_handle_blending_ecosystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v17;
    v22 = 1024;
    v23 = v10;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1AA841000, v15, OS_LOG_TYPE_DEFAULT, "%@ - invoking completion handler with success: %u, error: %@", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v8);
  v18 = (void *)MEMORY[0x1AF421DC4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v18);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_contextPublisher, 0);
  objc_storeStrong((id *)&self->_blendingModelPublisher, 0);
  objc_storeStrong((id *)&self->_uiPublisher, 0);
  objc_storeStrong((id *)&self->_bookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_startDateForResults, 0);
  objc_storeStrong((id *)&self->_clientModelIds, 0);
}

- (ATXProactiveSuggestionUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6 uiPublisher:(id)a7 blendingModelPublisher:(id)a8 contextPublisher:(id)a9 hyperParameters:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  ATXProactiveSuggestionUIFeedbackQuery *v19;
  uint64_t v20;
  NSSet *clientModelIds;
  uint64_t v22;
  NSURL *bookmarkURLPath;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v15 = a3;
  v28 = a5;
  v16 = a6;
  v27 = a7;
  v26 = a8;
  v17 = a9;
  v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)ATXProactiveSuggestionUIFeedbackQuery;
  v19 = -[ATXProactiveSuggestionUIFeedbackQuery init](&v29, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    clientModelIds = v19->_clientModelIds;
    v19->_clientModelIds = (NSSet *)v20;

    v19->_consumerSubTypeToConsider = a4;
    objc_storeStrong((id *)&v19->_startDateForResults, a5);
    v22 = objc_msgSend(v16, "copy");
    bookmarkURLPath = v19->_bookmarkURLPath;
    v19->_bookmarkURLPath = (NSURL *)v22;

    objc_storeStrong((id *)&v19->_uiPublisher, a7);
    objc_storeStrong((id *)&v19->_blendingModelPublisher, a8);
    objc_storeStrong((id *)&v19->_contextPublisher, a9);
    objc_storeStrong((id *)&v19->_hyperParameters, a10);
  }

  return v19;
}

void __93__ATXProactiveSuggestionUIFeedbackQuery_enumerateUIFeedbackResultsWithBlock_completionBlock___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  v3 = (void *)MEMORY[0x1AF421DC4]();
  objc_msgSend(v10, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "timeIntervalSinceReferenceDate");
  v9 = v8;

  if (v7 >= v9)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v3);

}

- (unsigned)consumerSubTypeToConsider
{
  return self->_consumerSubTypeToConsider;
}

- (NSSet)clientModelIds
{
  return self->_clientModelIds;
}

- (NSURL)bookmarkURLPath
{
  return self->_bookmarkURLPath;
}

- (BMBookmarkablePublisher)uiPublisher
{
  return self->_uiPublisher;
}

- (void)setUiPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_uiPublisher, a3);
}

- (BMBookmarkablePublisher)blendingModelPublisher
{
  return self->_blendingModelPublisher;
}

- (void)setBlendingModelPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_blendingModelPublisher, a3);
}

- (BMBookmarkablePublisher)contextPublisher
{
  return self->_contextPublisher;
}

- (void)setContextPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_contextPublisher, a3);
}

- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters
{
  return self->_hyperParameters;
}

- (void)setHyperParameters:(id)a3
{
  objc_storeStrong((id *)&self->_hyperParameters, a3);
}

- (void)enumerateUIFeedbackResultsWithBlock:(uint64_t)a1 completionBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
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

}

@end
