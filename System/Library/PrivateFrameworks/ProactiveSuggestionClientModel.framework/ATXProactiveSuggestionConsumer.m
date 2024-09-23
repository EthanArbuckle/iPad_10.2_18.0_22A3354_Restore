@implementation ATXProactiveSuggestionConsumer

- (ATXProactiveSuggestionConsumer)initWithConsumerSubType:(unsigned __int8)a3
{
  ATXProactiveSuggestionConsumer *v4;
  ATXProactiveSuggestionConsumer *v5;
  uint64_t v6;
  ATXUICacheManager *cacheManager;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXProactiveSuggestionConsumer;
  v4 = -[ATXProactiveSuggestionConsumer init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_consumer = a3;
    v6 = objc_opt_new();
    cacheManager = v5->_cacheManager;
    v5->_cacheManager = (ATXUICacheManager *)v6;

  }
  return v5;
}

- (id)suggestionLayoutFromCache
{
  NSObject *v3;
  void *v4;
  unsigned __int8 *p_consumer;
  unsigned int consumer;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", self->_consumer);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1AA841000, v3, OS_LOG_TYPE_DEFAULT, "Accessing Blending's suggestionLayout cache for consumer subtype: %@", (uint8_t *)&v11, 0xCu);

  }
  consumer = self->_consumer;
  p_consumer = &self->_consumer;
  objc_msgSend(*((id *)p_consumer + 1), "cachedLayoutForConsumerSubType:expectedClass:", consumer, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestionConsumer suggestionLayoutFromCache].cold.1(p_consumer, v9);

    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (id)layoutForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  if (!self->_xpcConnection)
    -[ATXProactiveSuggestionConsumer setupRemoteClientXPCConnection](self, "setupRemoteClientXPCConnection");
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[ATXProactiveSuggestionConsumer remoteSyncBlendingLayerServer](self, "remoteSyncBlendingLayerServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ATXProactiveSuggestionConsumer_layoutForRequest___block_invoke;
  v8[3] = &unk_1E57CEC10;
  v8[4] = &v9;
  objc_msgSend(v5, "generateLayoutForRequest:reply:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __51__ATXProactiveSuggestionConsumer_layoutForRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)suggestionsForRequest:(id)a3 limit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  if (!self->_xpcConnection)
    -[ATXProactiveSuggestionConsumer setupRemoteClientXPCConnection](self, "setupRemoteClientXPCConnection");
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[ATXProactiveSuggestionConsumer remoteSyncBlendingLayerServer](self, "remoteSyncBlendingLayerServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__ATXProactiveSuggestionConsumer_suggestionsForRequest_limit___block_invoke;
  v11[3] = &unk_1E57CEC38;
  v11[4] = &v12;
  objc_msgSend(v8, "generateRankedSuggestionsForRequest:limit:reply:", v6, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __62__ATXProactiveSuggestionConsumer_suggestionsForRequest_limit___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)remoteSyncBlendingLayerServer
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
}

void __63__ATXProactiveSuggestionConsumer_remoteSyncBlendingLayerServer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __63__ATXProactiveSuggestionConsumer_remoteSyncBlendingLayerServer__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)setupRemoteClientXPCConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *xpcConnection;
  void *v6;
  uint8_t v7[16];

  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AA841000, v3, OS_LOG_TYPE_DEFAULT, "Establishing a new XPC connection to BlendingLayerServer from ATXProactiveSuggestionConsumer.", v7, 2u);
  }

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.proactive.ProactiveSuggestionClientModel.xpc"), 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  ATXCreateProactiveSuggestionClientModelXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_10);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
}

void __64__ATXProactiveSuggestionConsumer_setupRemoteClientXPCConnection__block_invoke()
{
  NSObject *v0;

  __atxlog_handle_blending();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __64__ATXProactiveSuggestionConsumer_setupRemoteClientXPCConnection__block_invoke_cold_1(v0);

}

- (id)cachedSuggestionsForClientModelType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:](ATXProactiveSuggestionClientModel, "clientModelIdFromClientModelType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "cachedSuggestionsForClientModel:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_blending();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXProactiveSuggestionConsumer cachedSuggestionsForClientModelType:].cold.1(a3, v7, v8, v9, v10, v11, v12, v13);

    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ATXProactiveSuggestionConsumer;
  -[ATXProactiveSuggestionConsumer dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);
}

- (void)suggestionLayoutFromCache
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1AA841000, a2, OS_LOG_TYPE_FAULT, "A suggestion client tried to access cached suggestions for consumerSubType: %@, but the object type wasn't an ATXSuggestionLayout.", (uint8_t *)&v4, 0xCu);

}

void __63__ATXProactiveSuggestionConsumer_remoteSyncBlendingLayerServer__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, a2, a3, "Blending: Error while communicating with Suggestion Receiver. Error: %@.", a5, a6, a7, a8, 2u);
}

void __64__ATXProactiveSuggestionConsumer_setupRemoteClientXPCConnection__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "Blending: Connection to Proactive Suggestion Client Model server interrupted.", v1, 2u);
}

- (void)cachedSuggestionsForClientModelType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA841000, a2, a3, "Unrecognized clientModelType provided: %ld", a5, a6, a7, a8, 0);
}

@end
