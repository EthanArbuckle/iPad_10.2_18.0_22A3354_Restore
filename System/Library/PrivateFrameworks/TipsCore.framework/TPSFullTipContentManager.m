@implementation TPSFullTipContentManager

- (TPSFullTipContentManager)init
{
  TPSFullTipContentManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *clientQueue;
  TPSServiceConnection *v6;
  TPSServiceConnection *serviceProxy;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TPSFullTipContentManager;
  v2 = -[TPSFullTipContentManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.tips.TPSFullTipContentManager", v3);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(TPSServiceConnection);
    serviceProxy = v2->_serviceProxy;
    v2->_serviceProxy = v6;

    TPSXPCServerInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSServiceConnection setRemoteInterfaceInstance:](v2->_serviceProxy, "setRemoteInterfaceInstance:", v8);

  }
  return v2;
}

- (void)contentWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[TPSFullTipContentManager _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__TPSFullTipContentManager_contentWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E395BE90;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __57__TPSFullTipContentManager_contentWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E395B358;
  v8 = v10;
  v6 = v10;
  -[TPSFullTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v9, v7);

}

- (void)_performWithProxyHandler:(id)a3 errorHandler:(id)a4
{
  TPSServiceConnection *serviceProxy;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a3;
  serviceProxy = self->_serviceProxy;
  v7 = a4;
  -[TPSServiceConnection connection](serviceProxy, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10[2](v10, v9);

}

uint64_t __57__TPSFullTipContentManager_contentWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentWithCompletionHandler:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__TPSFullTipContentManager_tipsAppActive__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tipsAppActive");
}

- (id)_objectCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__TPSFullTipContentManager__objectCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_1E395BFA8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

- (void)tipsAppActive
{
  -[TPSFullTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", &__block_literal_global_5_0, &__block_literal_global_6);
}

uint64_t __59__TPSFullTipContentManager__objectCompletionOnClientQueue___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __59__TPSFullTipContentManager__objectCompletionOnClientQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__TPSFullTipContentManager__objectCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_1E395B538;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)invalidate
{
  -[TPSServiceConnection invalidate](self->_serviceProxy, "invalidate");
}

uint64_t __57__TPSFullTipContentManager_contentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)contentForVariant:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[TPSFullTipContentManager _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__TPSFullTipContentManager_contentForVariant_completionHandler___block_invoke;
  v13[3] = &unk_1E395BEB8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __64__TPSFullTipContentManager_contentForVariant_completionHandler___block_invoke_2;
  v11[3] = &unk_1E395B358;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[TPSFullTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v13, v11);

}

uint64_t __64__TPSFullTipContentManager_contentForVariant_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentForVariant:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __64__TPSFullTipContentManager_contentForVariant_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  -[TPSFullTipContentManager _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__TPSFullTipContentManager_fetchAssetsWithAssetsConfiguration_completionHandler___block_invoke;
  v13[3] = &unk_1E395BEB8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __81__TPSFullTipContentManager_fetchAssetsWithAssetsConfiguration_completionHandler___block_invoke_2;
  v11[3] = &unk_1E395B358;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[TPSFullTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v13, v11);

}

uint64_t __81__TPSFullTipContentManager_fetchAssetsWithAssetsConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchAssetsWithAssetsConfiguration:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __81__TPSFullTipContentManager_fetchAssetsWithAssetsConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)markTipViewed:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__TPSFullTipContentManager_markTipViewed___block_invoke;
    v6[3] = &unk_1E395BEE0;
    v7 = v4;
    -[TPSFullTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v6, &__block_literal_global_9);

  }
}

uint64_t __42__TPSFullTipContentManager_markTipViewed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentViewedForIdentifier:", *(_QWORD *)(a1 + 32));
}

void __42__TPSFullTipContentManager_markTipViewed___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[TPSLogger default](TPSLogger, "default");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A906000, v3, OS_LOG_TYPE_DEFAULT, "markTipViewed xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)removeNotificationForIdentifier:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__TPSFullTipContentManager_removeNotificationForIdentifier___block_invoke;
    v6[3] = &unk_1E395BEE0;
    v7 = v4;
    -[TPSFullTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v6, &__block_literal_global_4_0);

  }
}

uint64_t __60__TPSFullTipContentManager_removeNotificationForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeNotificationForIdentifier:", *(_QWORD *)(a1 + 32));
}

void __60__TPSFullTipContentManager_removeNotificationForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[TPSLogger default](TPSLogger, "default");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A906000, v3, OS_LOG_TYPE_DEFAULT, "markTipViewed xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __41__TPSFullTipContentManager_tipsAppActive__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[TPSLogger default](TPSLogger, "default");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A906000, v3, OS_LOG_TYPE_DEFAULT, "tipsAppActive xpc connection failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)userGuideMapWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  -[TPSFullTipContentManager _objectCompletionOnClientQueue:](self, "_objectCompletionOnClientQueue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__TPSFullTipContentManager_userGuideMapWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E395BE90;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __62__TPSFullTipContentManager_userGuideMapWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E395B358;
  v8 = v10;
  v6 = v10;
  -[TPSFullTipContentManager _performWithProxyHandler:errorHandler:](self, "_performWithProxyHandler:errorHandler:", v9, v7);

}

uint64_t __62__TPSFullTipContentManager_userGuideMapWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userGuideMapWithCompletionHandler:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__TPSFullTipContentManager_userGuideMapWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (TPSServiceConnection)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
