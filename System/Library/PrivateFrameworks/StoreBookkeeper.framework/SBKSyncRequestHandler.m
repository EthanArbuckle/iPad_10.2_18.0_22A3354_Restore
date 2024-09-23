@implementation SBKSyncRequestHandler

- (SBKSyncRequestHandler)initWithBagContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBKSyncRequestHandler *v7;

  v4 = a3;
  SBKStoreAccount();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBKSyncRequestHandler initWithBagContext:accountIdentifier:](self, "initWithBagContext:accountIdentifier:", v4, v6);

  return v7;
}

- (SBKSyncRequestHandler)initWithBagContext:(id)a3 accountIdentifier:(id)a4
{
  id v6;
  id v7;
  SBKSyncRequestHandler *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  void *v11;
  void *v12;
  SBKTransactionController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  SBKTransactionController *transactionController;
  SBKSyncResponseData *responseData;
  uint64_t v19;
  NSMutableArray *responseUpdatedKeys;
  uint64_t v21;
  NSMutableArray *responseDeletedKeys;
  uint64_t v23;
  NSMutableArray *responseConflictedKeys;
  uint64_t v25;
  NSMutableDictionary *responseDataByKey;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SBKSyncRequestHandler;
  v8 = -[SBKRequestHandler initWithBagContext:](&v28, sel_initWithBagContext_, v6);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.storebookkeeper.SBKSyncRequestHandler", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountWithUniqueIdentifier:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [SBKTransactionController alloc];
    objc_msgSend(v6, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncRequestURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBKTransactionController initWithDomain:requestURL:forAccount:](v13, "initWithDomain:requestURL:forAccount:", v14, v15, v12);
    transactionController = v8->_transactionController;
    v8->_transactionController = (SBKTransactionController *)v16;

    responseData = v8->_responseData;
    v8->_responseData = 0;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    responseUpdatedKeys = v8->_responseUpdatedKeys;
    v8->_responseUpdatedKeys = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    responseDeletedKeys = v8->_responseDeletedKeys;
    v8->_responseDeletedKeys = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    responseConflictedKeys = v8->_responseConflictedKeys;
    v8->_responseConflictedKeys = (NSMutableArray *)v23;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    responseDataByKey = v8->_responseDataByKey;
    v8->_responseDataByKey = (NSMutableDictionary *)v25;

  }
  return v8;
}

- (void)setResponseDomainVersion:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__SBKSyncRequestHandler_setResponseDomainVersion___block_invoke;
  v9[3] = &unk_24E2A81C8;
  v9[4] = self;
  v10 = v4;
  v7 = v9;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = ___serialSetValue_block_invoke;
  block[3] = &unk_24E2A82E0;
  v12 = v7;
  v8 = v4;
  dispatch_sync(queue, block);

}

- (NSString)responseDomainVersion
{
  NSObject *queue;
  uint64_t v3;
  _QWORD *v4;
  id v5;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  queue = self->_queue;
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SBKSyncRequestHandler_responseDomainVersion__block_invoke;
  v7[3] = &unk_24E2A81F0;
  v7[4] = self;
  v4 = v7;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1762;
  v15 = __Block_byref_object_dispose__1763;
  v16 = 0;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_24E2A8308;
  v9 = v4;
  v10 = &v11;
  dispatch_sync(queue, block);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSString *)v5;
}

- (NSArray)responseUpdatedKeys
{
  NSObject *queue;
  uint64_t v3;
  _QWORD *v4;
  id v5;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  queue = self->_queue;
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SBKSyncRequestHandler_responseUpdatedKeys__block_invoke;
  v7[3] = &unk_24E2A81F0;
  v7[4] = self;
  v4 = v7;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1762;
  v15 = __Block_byref_object_dispose__1763;
  v16 = 0;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_24E2A8308;
  v9 = v4;
  v10 = &v11;
  dispatch_sync(queue, block);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v5;
}

- (NSArray)responseDeletedKeys
{
  NSObject *queue;
  uint64_t v3;
  _QWORD *v4;
  id v5;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  queue = self->_queue;
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SBKSyncRequestHandler_responseDeletedKeys__block_invoke;
  v7[3] = &unk_24E2A81F0;
  v7[4] = self;
  v4 = v7;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1762;
  v15 = __Block_byref_object_dispose__1763;
  v16 = 0;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_24E2A8308;
  v9 = v4;
  v10 = &v11;
  dispatch_sync(queue, block);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v5;
}

- (NSArray)responseConflictedKeys
{
  NSObject *queue;
  uint64_t v3;
  _QWORD *v4;
  id v5;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  queue = self->_queue;
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SBKSyncRequestHandler_responseConflictedKeys__block_invoke;
  v7[3] = &unk_24E2A81F0;
  v7[4] = self;
  v4 = v7;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1762;
  v15 = __Block_byref_object_dispose__1763;
  v16 = 0;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_24E2A8308;
  v9 = v4;
  v10 = &v11;
  dispatch_sync(queue, block);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v5;
}

- (id)responseDataForResponseKey:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__SBKSyncRequestHandler_responseDataForResponseKey___block_invoke;
  v11[3] = &unk_24E2A8218;
  v11[4] = self;
  v12 = v4;
  v7 = v11;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1762;
  v20 = __Block_byref_object_dispose__1763;
  v21 = 0;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = ___serialGetValue_block_invoke;
  block[3] = &unk_24E2A8308;
  v14 = v7;
  v15 = &v16;
  v8 = v4;
  dispatch_sync(queue, block);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)_onQueue_clearTransactionResponseData
{
  SBKSyncResponseData *responseData;
  NSString *overrideResponseDomainVersion;

  responseData = self->_responseData;
  self->_responseData = 0;

  overrideResponseDomainVersion = self->_overrideResponseDomainVersion;
  self->_overrideResponseDomainVersion = 0;

  -[NSMutableArray removeAllObjects](self->_responseUpdatedKeys, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_responseDeletedKeys, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_responseConflictedKeys, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_responseDataByKey, "removeAllObjects");
}

- (void)clearTransactionResponseData
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SBKSyncRequestHandler_clearTransactionResponseData__block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)startTransactionWithSyncAnchor:(id)a3 keysToUpdate:(id)a4 keysToDelete:(id)a5 finishedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(a6, "copy");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__SBKSyncRequestHandler_startTransactionWithSyncAnchor_keysToUpdate_keysToDelete_finishedBlock___block_invoke;
  block[3] = &unk_24E2A8290;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(queue, block);

}

- (void)transaction:(id)a3 willProcessResponseData:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SBKSyncRequestHandler_transaction_willProcessResponseData___block_invoke;
  block[3] = &unk_24E2A81C8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, block);

}

- (void)transaction:(id)a3 processUpdatedKey:(id)a4 data:(id)a5 conflict:(BOOL)a6 isDirty:(BOOL *)a7
{
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  BOOL v19;

  v11 = a4;
  v12 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__SBKSyncRequestHandler_transaction_processUpdatedKey_data_conflict_isDirty___block_invoke;
  block[3] = &unk_24E2A82B8;
  v19 = a6;
  block[4] = self;
  v17 = v12;
  v18 = v11;
  v14 = v11;
  v15 = v12;
  dispatch_sync(queue, block);
  *a7 = 0;

}

- (void)transaction:(id)a3 processDeletedKey:(id)a4 isDirty:(BOOL *)a5
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;

  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SBKSyncRequestHandler_transaction_processDeletedKey_isDirty___block_invoke;
  block[3] = &unk_24E2A81C8;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_sync(queue, block);
  *a5 = 0;

}

- (id)transaction:(id)a3 keyValuePairForUpdatedKey:(id)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKSyncRequestHandler.m"), 158, CFSTR("subclass must supply key-value pair by implementing the SBKSyncTransactionProcessing protocol"));

  return 0;
}

- (SBKSyncResponseData)responseData
{
  return self->_responseData;
}

- (SBKTransactionController)transactionController
{
  return self->_transactionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionController, 0);
  objc_storeStrong((id *)&self->_responseDataByKey, 0);
  objc_storeStrong((id *)&self->_responseConflictedKeys, 0);
  objc_storeStrong((id *)&self->_responseDeletedKeys, 0);
  objc_storeStrong((id *)&self->_responseUpdatedKeys, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_overrideResponseDomainVersion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __63__SBKSyncRequestHandler_transaction_processDeletedKey_isDirty___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __77__SBKSyncRequestHandler_transaction_processUpdatedKey_data_conflict_isDirty___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  uint64_t result;
  uint64_t v5;

  v2 = 40;
  if (!*(_BYTE *)(a1 + 56))
    v2 = 48;
  v3 = &OBJC_IVAR___SBKSyncRequestHandler__responseConflictedKeys;
  if (!*(_BYTE *)(a1 + 56))
    v3 = &OBJC_IVAR___SBKSyncRequestHandler__responseUpdatedKeys;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *v3), "addObject:", *(_QWORD *)(a1 + v2));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));
  return result;
}

void __61__SBKSyncRequestHandler_transaction_willProcessResponseData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v2 = os_log_create("com.apple.amp.StoreBookkeeper", "Sync");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "syncAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_21E4FD000, v2, OS_LOG_TYPE_DEFAULT, "will process response with responseDomainVersion = %@", (uint8_t *)&v4, 0xCu);

  }
}

void __96__SBKSyncRequestHandler_startTransactionWithSyncAnchor_keysToUpdate_keysToDelete_finishedBlock___block_invoke(uint64_t a1)
{
  SBKSyncTransaction *v2;
  void *v3;
  SBKSyncTransaction *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearTransactionResponseData");
  v2 = [SBKSyncTransaction alloc];
  objc_msgSend(*(id *)(a1 + 32), "bagContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBKSyncTransaction initWithStoreBagContext:syncAnchor:keysToUpdate:keysToDelete:conflictDetectionType:](v2, "initWithStoreBagContext:syncAnchor:keysToUpdate:keysToDelete:conflictDetectionType:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend((id)objc_opt_class(), "conflictDetectionType"));

  -[SBKSyncTransaction setTransactionProcessor:](v4, "setTransactionProcessor:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __96__SBKSyncRequestHandler_startTransactionWithSyncAnchor_keysToUpdate_keysToDelete_finishedBlock___block_invoke_2;
  v6[3] = &unk_24E2A8268;
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v5, "scheduleTransaction:withTransactionFinishedBlock:", v4, v6);

}

uint64_t __96__SBKSyncRequestHandler_startTransactionWithSyncAnchor_keysToUpdate_keysToDelete_finishedBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return (*(uint64_t (**)(void))(v1 + 16))();
  else
    return 1;
}

uint64_t __53__SBKSyncRequestHandler_clearTransactionResponseData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearTransactionResponseData");
}

uint64_t __52__SBKSyncRequestHandler_responseDataForResponseKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", *(_QWORD *)(a1 + 40));
}

id __47__SBKSyncRequestHandler_responseConflictedKeys__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 56);
}

id __44__SBKSyncRequestHandler_responseDeletedKeys__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

id __44__SBKSyncRequestHandler_responseUpdatedKeys__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

uint64_t __46__SBKSyncRequestHandler_responseDomainVersion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "syncAnchor");
}

void __50__SBKSyncRequestHandler_setResponseDomainVersion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

+ (int64_t)conflictDetectionType
{
  return 0;
}

@end
