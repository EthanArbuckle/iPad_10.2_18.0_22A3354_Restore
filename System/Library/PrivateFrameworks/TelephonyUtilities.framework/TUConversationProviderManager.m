@implementation TUConversationProviderManager

- (TUConversationProviderManager)init
{
  TUConversationProviderManagerXPCClient *v3;
  TUConversationProviderManager *v4;

  v3 = objc_alloc_init(TUConversationProviderManagerXPCClient);
  v4 = -[TUConversationProviderManager initWithDataSource:](self, "initWithDataSource:", v3);

  return v4;
}

- (TUConversationProviderManager)initWithDataSource:(id)a3
{
  id v5;
  TUConversationProviderManager *v6;
  TUConversationProviderManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUConversationProviderManager;
  v6 = -[TUConversationProviderManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TUConversationProviderManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)TUConversationProviderManager;
  -[TUConversationProviderManager dealloc](&v4, sel_dealloc);
}

- (void)registerForCallbacksForProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "providerIdentifier: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationProviderManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForCallbacksForProvider:completionHandler:", v6, v7);

}

- (void)registerConversationProviderForConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TUConversationProvider *v9;
  void *v10;
  TUConversationProvider *v11;
  id v12;
  _QWORD v13[4];
  TUConversationProvider *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "configuration: %@", buf, 0xCu);
  }

  v9 = -[TUConversationProvider initWithConfiguration:]([TUConversationProvider alloc], "initWithConfiguration:", v6);
  -[TUConversationProviderManager dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__TUConversationProviderManager_registerConversationProviderForConfiguration_completionHandler___block_invoke;
  v13[3] = &unk_1E38A1FE8;
  v14 = v9;
  v15 = v7;
  v11 = v9;
  v12 = v7;
  objc_msgSend(v10, "registerConversationProvider:completionHandler:", v11, v13);

}

uint64_t __96__TUConversationProviderManager_registerConversationProviderForConfiguration_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
}

- (void)conversationProviderForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TUDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "identifier: %@", (uint8_t *)&v10, 0xCu);
  }

  -[TUConversationProviderManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationProviderForIdentifier:completionHandler:", v6, v7);

}

- (void)generatePseudonymHandleForConversationProvider:(id)a3 expiryDuration:(double)a4 URI:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  double v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  TUDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412802;
    v16 = v10;
    v17 = 2048;
    v18 = a4;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "provider: %@ expiryDuration: %f uri: %@", (uint8_t *)&v15, 0x20u);
  }

  -[TUConversationProviderManager dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "generatePseudonymHandleForConversationProvider:expiryDuration:URI:completionHandler:", v10, v11, v12, a4);

}

- (void)renewPseudonymHandle:(id)a3 forConversationProvider:(id)a4 expirationDate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  TUDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412802;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_19A50D000, v14, OS_LOG_TYPE_DEFAULT, "pseudonymHandle: %@ provider: %@ expirationDate: %@", (uint8_t *)&v16, 0x20u);
  }

  -[TUConversationProviderManager dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "renewPseudonymHandle:forConversationProvider:expirationDate:completionHandler:", v10, v11, v12, v13);

}

- (void)revokePseudonymHandle:(id)a3 forConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "pseudonymHandle: %@ provider: %@", (uint8_t *)&v13, 0x16u);
  }

  -[TUConversationProviderManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "revokePseudonymHandle:forConversationProvider:completionHandler:", v8, v9, v10);

}

- (void)doesHandle:(id)a3 correspondToConversationProvider:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "handle: %@ provider: %@", (uint8_t *)&v13, 0x16u);
  }

  -[TUConversationProviderManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doesHandle:correspondToConversationProvider:completionHandler:", v8, v9, v10);

}

- (TUConversationProviderManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
