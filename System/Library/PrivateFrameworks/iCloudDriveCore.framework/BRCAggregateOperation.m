@implementation BRCAggregateOperation

- (BRCAggregateOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 subOperations:(id)a5
{
  id v8;
  BRCAggregateOperation *v9;
  uint64_t v10;
  NSArray *subOperations;
  uint64_t v12;
  NSMutableDictionary *resultDictionary;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BRCAggregateOperation;
  v9 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v15, sel_initWithName_syncContext_sessionContext_, CFSTR("wrapperOperation"), a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    subOperations = v9->_subOperations;
    v9->_subOperations = (NSArray *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v12 = objc_claimAutoreleasedReturnValue();
    resultDictionary = v9->_resultDictionary;
    v9->_resultDictionary = (NSMutableDictionary *)v12;

  }
  return v9;
}

- (void)main
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSArray *obj;
  _QWORD block[6];
  _QWORD v14[5];
  NSObject *v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = dispatch_group_create();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__47;
  v23[4] = __Block_byref_object_dispose__47;
  v24 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_subOperations;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        dispatch_group_enter(v3);
        objc_msgSend(v8, "setIgnoreMissingRemoteClientProxy:", 1);
        objc_msgSend(v8, "finishBlock");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __29__BRCAggregateOperation_main__block_invoke;
        v14[3] = &unk_24FE48690;
        v14[4] = self;
        v17 = v23;
        v18 = v5 + v7;
        v10 = v9;
        v16 = v10;
        v15 = v3;
        objc_msgSend(v8, "setFinishBlock:", v14);
        -[_BRCOperation addSubOperation:](self, "addSubOperation:", v8);

        ++v7;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      v5 += v7;
    }
    while (v4);
  }

  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__BRCAggregateOperation_main__block_invoke_2;
  block[3] = &unk_24FE42B50;
  block[4] = self;
  block[5] = v23;
  dispatch_group_notify(v3, v11, block);

  _Block_object_dispose(v23, 8);
}

void __29__BRCAggregateOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9)
  {
    if (v5)
    {
      objc_storeStrong(v8, a3);
      if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "cancel");
    }
    else if (v13)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 528);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v12);

    }
  }
  objc_sync_exit(v6);

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v13, v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __29__BRCAggregateOperation_main__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    v3 = 0;
  else
    v3 = v2[66];
  return objc_msgSend(v2, "completedWithResult:error:", v3);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[BRCAggregateOperation wrapperOperationCompletionHandler](self, "wrapperOperationCompletionHandler");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[BRCAggregateOperation setWrapperOperationCompletionHandler:](self, "setWrapperOperationCompletionHandler:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRCAggregateOperation;
  -[_BRCFrameworkOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)wrapperOperationCompletionHandler
{
  return self->_wrapperOperationCompletionHandler;
}

- (void)setWrapperOperationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wrapperOperationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_subOperations, 0);
}

@end
