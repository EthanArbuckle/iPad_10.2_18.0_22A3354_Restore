@implementation WBSHistoryConnection

void __70__WBSHistoryConnection_connectWithOptions_delegate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = *(_QWORD *)(a1 + 56);
    v11 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSHistoryErrorDomain"), 3, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, void *))(v10 + 16))(v10, 0, -1, -1, v11);
    if (!v7)

  }
  else
  {
    v12 = 0;
    objc_msgSend(v5, "allocateTemporaryIDRange:", &v12);
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "safari_stringForKey:", CFSTR("WBSHistoryConnectionOptionEventListenerName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDelegate:listenerName:forConnection:", v8, v9, *(_QWORD *)(a1 + 48));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)connectWithOptions:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  WBSHistoryServiceDatabaseDelegateProxy *v12;
  NSObject *internalQueue;
  WBSHistoryServiceDatabaseDelegateProxy *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  WBSHistoryServiceDatabaseDelegateProxy *v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12 = -[WBSHistoryServiceDatabaseDelegateProxy initWithProxy:]([WBSHistoryServiceDatabaseDelegateProxy alloc], "initWithProxy:", v9);

  }
  else
  {
    v12 = 0;
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WBSHistoryConnection_connectWithOptions_delegate_completionHandler___block_invoke;
  block[3] = &unk_1E4B3AEE8;
  block[4] = self;
  v19 = v8;
  v21 = v12;
  v22 = v10;
  v20 = v11;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  v17 = v8;
  dispatch_async(internalQueue, block);

}

- (WBSHistoryConnection)initWithHistoryService:(id)a3
{
  id v5;
  WBSHistoryConnection *v6;
  WBSHistoryConnection *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *internalQueue;
  WBSHistoryConnection *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryConnection;
  v6 = -[WBSHistoryConnection init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_historyService, a3);
    v8 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryConnection", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = v7;
  }

  return v7;
}

void __44__WBSHistoryConnection_releaseCloudHistory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  JUMPOUT(0x1A859A380);
}

void __70__WBSHistoryConnection_connectWithOptions_delegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__WBSHistoryConnection_connectWithOptions_delegate_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4B3AEC0;
  v9 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "connectWithOptions:connection:completionHandler:", v2, v4, v5);

}

- (void)releaseCloudHistory:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  MEMORY[0x1A859A374]();
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__WBSHistoryConnection_releaseCloudHistory___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

- (void)ensureConnected:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)getServiceInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = (void (**)(id, void *, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("SafariShared"));

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SafariHistory"));

  v8[2](v8, v3, 0);
}

- (void)beginURLCompletionSession:(id)a3
{
  void (**v4)(id, WBSHistoryURLCompletionSession *, _QWORD);
  void *v5;
  void *v6;
  WBSHistoryURLCompletionSession *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, WBSHistoryURLCompletionSession *, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.Safari.History"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[WBSHistoryURLCompletionSession initWithHistoryService:]([WBSHistoryURLCompletionSession alloc], "initWithHistoryService:", self->_historyService);
    v4[2](v4, v7, 0);

  }
  else
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSHistoryConnection beginURLCompletionSession:].cold.1((uint64_t)v10, objc_msgSend(v5, "processIdentifier"), v8);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, WBSHistoryURLCompletionSession *, void *))v4)[2](v4, 0, v9);

  }
}

- (void)beginHistoryAccessSession:(id)a3
{
  void (**v4)(id, WBSHistoryAccessSession *, _QWORD);
  void *v5;
  void *v6;
  WBSHistoryAccessSession *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, WBSHistoryAccessSession *, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.private.Safari.History"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[WBSHistoryAccessSession initWithHistoryService:]([WBSHistoryAccessSession alloc], "initWithHistoryService:", self->_historyService);
    v4[2](v4, v7, 0);

  }
  else
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSHistoryConnection beginURLCompletionSession:].cold.1((uint64_t)v10, objc_msgSend(v5, "processIdentifier"), v8);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, WBSHistoryAccessSession *, void *))v4)[2](v4, 0, v9);

  }
}

- (void)queryMemoryFootprint:(id)a3
{
  void (**v3)(id, void *, id);
  void *v4;
  id v5;
  id v6;

  v3 = (void (**)(id, void *, id))a3;
  v6 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C10]), "initWithError:", &v6);
  v5 = v6;
  v3[2](v3, v4, v5);

}

- (void)listDatabaseURLsWithCompletionHandler:(id)a3
{
  -[WBSHistoryService listDatabaseURLsWithCompletionHandler:](self->_historyService, "listDatabaseURLsWithCompletionHandler:", a3);
}

- (void)finishClearingHistoryIfNecessaryWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *internalQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(internalQueue, block);

}

void __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E4B3AF10;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "connectWithOptions:connection:completionHandler:", 0, v1, v3);

}

void __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  if (!v5 || a3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSHistoryErrorDomain"), 3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E4B2B320;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "finishClearingHistoryIfNecessaryWithCompletionHandler:", v8);

  }
}

uint64_t __78__WBSHistoryConnection_finishClearingHistoryIfNecessaryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *internalQueue;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  void (**v27)(id, _QWORD, id);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "safari_isSafariFamilyApplicationBundle");

  if (v9)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSHistoryConnection initializeCloudHistoryWithConfiguration:completionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)os_transaction_create();
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke;
    block[3] = &unk_1E4B3AF80;
    block[4] = self;
    v24 = v6;
    v26 = v20;
    v27 = v7;
    v25 = v19;
    v22 = v20;
    v18 = v19;
    dispatch_async(internalQueue, block);

  }
}

void __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  WBSCloudHistoryConfiguration *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    objc_msgSend(v2, "applyRemoteConfiguration:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = -[WBSCloudHistoryConfiguration initWithDictionary:]([WBSCloudHistoryConfiguration alloc], "initWithDictionary:", *(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

  }
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v7 = *(void **)(v6 + 8);
    v8 = *(_QWORD *)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_2;
    v11[3] = &unk_1E4B3AF58;
    v9 = *(id *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 32);
    v13 = v9;
    v11[4] = v10;
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v7, "connectWithOptions:connection:completionHandler:", 0, v8, v11);

  }
}

void __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_3;
    v8[3] = &unk_1E4B2A2A0;
    v8[4] = v4;
    v11 = *(id *)(a1 + 48);
    v9 = v3;
    v10 = *(id *)(a1 + 40);
    dispatch_async(v5, v8);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

void __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  WBSCloudHistory *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v2 = *(_QWORD *)(a1[4] + 40);
  if (v2)
  {
    v3 = a1[7];
LABEL_5:
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v2, 0);
    return;
  }
  v4 = -[WBSCloudHistory initWithDatabase:configuration:databaseStore:completionBlock:]([WBSCloudHistory alloc], "initWithDatabase:configuration:databaseStore:completionBlock:", a1[5], *(_QWORD *)(a1[4] + 48), *(_QWORD *)(a1[4] + 8), &__block_literal_global_57);
  v5 = a1[4];
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(a1[4] + 40);
  if (v7)
  {
    objc_msgSend(v7, "setCloudHistoryEnabled:", 1);
    v3 = a1[7];
    v2 = *(_QWORD *)(a1[4] + 40);
    goto LABEL_5;
  }
  v8 = a1[7];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

}

void __82__WBSHistoryConnection_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke_4()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A3D90000, v0, OS_LOG_TYPE_INFO, "Cloud History initialized", v1, 2u);
  }
}

- (void)setCompletionListVendorEndpoint:(id)a3 completionHandler:(id)a4
{
  -[WBSHistoryService setCompletionListVendorEndpoint:completionHandler:](self->_historyService, "setCompletionListVendorEndpoint:completionHandler:", a3, a4);
}

- (void)getCompletionListItemsForQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[WBSHistoryService completionListProvider](self->_historyService, "completionListProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WBSHistoryService completionListProvider](self->_historyService, "completionListProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getCompletionListItemsForQuery:completionHandler:", v6, v7);

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSHistoryConnection getCompletionListItemsForQuery:completionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v7[2](v7, MEMORY[0x1E0C9AA60]);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudHistoryConfiguration, 0);
  objc_storeStrong((id *)&self->_cloudHistory, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_completionListProvider, 0);
  objc_storeStrong((id *)&self->_historyService, 0);
}

- (void)beginURLCompletionSession:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *(_DWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1_2(&dword_1A3D90000, a2, a3, "Process %d is missing history entitlement. Denying access.", (uint8_t *)a1);
}

- (void)initializeCloudHistoryWithConfiguration:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Cloud History cannot be run in the Safari process", a5, a6, a7, a8, 0);
}

- (void)getCompletionListItemsForQuery:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Attempted to get completion list items without an active Safari connection.", a5, a6, a7, a8, 0);
}

@end
