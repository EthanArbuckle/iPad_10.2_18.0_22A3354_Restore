@implementation WBSHistoryContextController

- (WBSHistoryContextController)initWithHistory:(id)a3 contextClient:(id)a4 qualityOfService:(unsigned int)a5
{
  id v9;
  id v10;
  WBSHistoryContextController *v11;
  WBSHistoryContextController *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *internalQueue;
  WBSHistoryContextController *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)WBSHistoryContextController;
  v11 = -[WBSHistoryContextController init](&v24, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_history, a3);
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("com.apple.SafariShared.%@.%p.internalQueue"), v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v16);
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a5, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create(v18, v19);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v12->_client, a4);
    v22 = v12;

  }
  return v12;
}

- (WBSHistoryContextController)initWithHistory:(id)a3 contextClient:(id)a4
{
  return -[WBSHistoryContextController initWithHistory:contextClient:qualityOfService:](self, "initWithHistory:contextClient:qualityOfService:", a3, a4, 17);
}

- (void)cachedResponseForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WBSHistoryContextController_cachedResponseForURL_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A0F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __70__WBSHistoryContextController_cachedResponseForURL_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(a1[4] + 16), "isEqual:", a1[5]))
    v2 = *(_QWORD *)(a1[4] + 8);
  else
    v2 = 0;
  return (*(uint64_t (**)(_QWORD, uint64_t))(a1[6] + 16))(a1[6], v2);
}

- (void)invalidateCachedResults
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WBSHistoryContextController_invalidateCachedResults__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __54__WBSHistoryContextController_invalidateCachedResults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

- (void)contextForPageURL:(id)a3 content:(id)a4 contentType:(int64_t)a5 metadata:(id)a6 isPrivate:(BOOL)a7 isReaderAvailable:(BOOL)a8 withCompletionHandler:(id)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *internalQueue;
  _QWORD v29[4];
  id v30;
  WBSHistoryContextController *v31;
  id v32;
  id v33;
  id v34;
  int64_t v35;

  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  v19 = v18;
  if (v10)
  {
    if (v18)
      (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
  }
  else
  {
    if (!objc_msgSend(v16, "length"))
    {
      v20 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[WBSHistoryContextController contextForPageURL:content:contentType:metadata:isPrivate:isReaderAvailable:withCompletionHandler:].cold.2(a8, v20);
      v21 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[WBSHistoryContextController contextForPageURL:content:contentType:metadata:isPrivate:isReaderAvailable:withCompletionHandler:].cold.1((uint64_t)v15, v21, v22, v23, v24, v25, v26, v27);
    }
    internalQueue = self->_internalQueue;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke;
    v29[3] = &unk_1E4B3B1C0;
    v30 = v15;
    v31 = self;
    v34 = v19;
    v32 = v17;
    v33 = v16;
    v35 = a5;
    dispatch_async(internalQueue, v29);

  }
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  int8x16_t v35;
  int8x16_t v36;
  _QWORD v37[4];
  int8x16_t v38;
  id v39;
  _QWORD v40[4];
  int8x16_t v41;
  id v42;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "results"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "count"),
        v2,
        v3))
  {
    v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_4(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_1();
    v13 = *(_QWORD *)(a1 + 64);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  }
  else
  {
    v14 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
    v22 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_1();
    v23 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_4;
    v40[3] = &unk_1E4B3B198;
    v35 = *(int8x16_t *)(a1 + 32);
    v24 = (id)v35.i64[0];
    v41 = vextq_s8(v35, v35, 8uLL);
    v42 = *(id *)(a1 + 64);
    v25 = (void *)MEMORY[0x1A8599ED0](v40);
    v26 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "newRequest");
    objc_msgSend(*(id *)(a1 + 48), "safari_stringForKey:", CFSTR("author"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContentAuthor:", v27);

    objc_msgSend(*(id *)(a1 + 48), "safari_stringForKey:", CFSTR("description"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContentDescription:", v28);

    objc_msgSend(*(id *)(a1 + 48), "safari_stringForKey:", CFSTR("keywords"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContentKeywords:", v29);

    objc_msgSend(v26, "setIncludeHigherLevelTopics:", 1);
    objc_msgSend(*(id *)(a1 + 56), "safari_bestLanguageTag");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLanguageTag:", v30);

    objc_msgSend(v26, "setText:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v26, "setTextIsRaw:", *(_QWORD *)(a1 + 72) == 2);
    objc_msgSend(*(id *)(a1 + 48), "safari_stringForKey:", CFSTR("title"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitle:", v31);

    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUrl:", v32);

    v37[0] = v23;
    v37[1] = 3221225472;
    v37[2] = __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_6;
    v37[3] = &unk_1E4B3B198;
    v36 = *(int8x16_t *)(a1 + 32);
    v33 = (id)v36.i64[0];
    v38 = vextq_s8(v36, v36, 8uLL);
    v39 = v25;
    v34 = v25;
    objc_msgSend(v26, "executeWithReply:", v37);

  }
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E4B38908;
  v10 = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v8 = v3;
  dispatch_async(v5, v9);

}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2_cold_2(v3, v2);
    v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2_cold_1();
    v5 = 0;
  }
  else
  {
    v5 = *(id *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 8), v5);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 16), *(id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_6(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v6, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_persistTopicsFromContextResult:forPageURL:", v5, a1[5]);

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_persistTopicsFromContextResult:(id)a3 forPageURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WBSHistory *history;
  _QWORD v12[4];
  id v13;
  WBSHistoryContextController *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "topicId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_stringByRemovingParenthesizedDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    history = self->_history;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke;
    v12[3] = &unk_1E4B3B1E8;
    v13 = v8;
    v14 = self;
    -[WBSHistory addTagWithIdentifier:title:toItemAtURL:level:completionHandler:](history, "addTagWithIdentifier:title:toItemAtURL:level:completionHandler:", v13, v10, v7, 200, v12);

  }
}

void __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];

  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_cold_1();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_7;
    block[3] = &unk_1E4B2A078;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_cold_2(a1, v7, v5);
  }

}

void __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WBSHistoryContextControllerDidAddTagNotification"), *(_QWORD *)(a1 + 32));

}

- (WBSHistory)history
{
  return self->_history;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pageURLForCachedResponse, 0);
  objc_storeStrong((id *)&self->_cachedResponse, 0);
}

- (void)contextForPageURL:(uint64_t)a3 content:(uint64_t)a4 contentType:(uint64_t)a5 metadata:(uint64_t)a6 isPrivate:(uint64_t)a7 isReaderAvailable:(uint64_t)a8 withCompletionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Page URL: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)contextForPageURL:(char)a1 content:(NSObject *)a2 contentType:metadata:isPrivate:isReaderAvailable:withCompletionHandler:.cold.2(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_DEBUG, "ContextKit query with empty text; isReaderAvailable: %d",
    (uint8_t *)v2,
    8u);
  OUTLINED_FUNCTION_5();
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7(&dword_1A3D90000, v0, v1, "Page URL: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, a1, a3, "Performing ContextKit query", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, a1, a3, "Using cached ContextKit response", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7(&dword_1A3D90000, v0, v1, "Page URL: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Received ContextKit response with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

void __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_7(&dword_1A3D90000, v0, v1, "Added tag with topic ID: %{private}@ to history item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138478083;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Could not add tag with topic ID: %{private}@ to history item with error: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
