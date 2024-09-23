@implementation TLTimelineSessionOperation

- (TLTimelineSessionOperation)initWithProvider:(id)a3 operations:(id)a4 providerTimeout:(double)a5 operationTimeout:(double)a6
{
  id v11;
  id v12;
  TLTimelineSessionOperation *v13;
  TLTimelineSessionOperation *v14;
  void *v15;
  NSOperationQueue *v16;
  NSOperationQueue *operationQueue;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TLTimelineSessionOperation;
  v13 = -[TLTimelineSessionOperation init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_providerTimeout = a5;
    v13->_operationTimeout = a6;
    objc_storeStrong((id *)&v13->_provider, a3);
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v14->_operations, v15);
    v16 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v14->_operationQueue;
    v14->_operationQueue = v16;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v14->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    objc_initWeak(&location, v14);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __91__TLTimelineSessionOperation_initWithProvider_operations_providerTimeout_operationTimeout___block_invoke_2;
    v20[3] = &unk_24CE30E48;
    objc_copyWeak(&v21, &location);
    v19.receiver = v14;
    v19.super_class = (Class)TLTimelineSessionOperation;
    -[TLTimelineSessionOperation setCompletionBlock:](&v19, sel_setCompletionBlock_, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v14;
}

uint64_t __91__TLTimelineSessionOperation_initWithProvider_operations_providerTimeout_operationTimeout___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = a2;
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "relativePriority"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = (void *)objc_opt_class();

  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "relativePriority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "compare:", v7);

  return v8;
}

void __91__TLTimelineSessionOperation_initWithProvider_operations_providerTimeout_operationTimeout___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sessionError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(WeakRetained, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TLOperationDomain"), 400, &unk_24CE33908);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v2;
  }
  objc_msgSend(WeakRetained, "sessionCompletionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "sessionCompletionBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v1);

  }
  objc_msgSend(WeakRetained, "setSessionCompletionBlock:", 0);

}

- (void)cancel
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TLTimelineSessionOperation operations](self, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[TLTimelineSessionOperation operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLTimelineSessionOperation operations](self, "operations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperations:waitUntilFinished:", v9, 1);

  v10.receiver = self;
  v10.super_class = (Class)TLTimelineSessionOperation;
  -[TLTimelineSessionOperation cancel](&v10, sel_cancel);
}

- (void)main
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  dispatch_time_t v8;
  double v9;
  dispatch_time_t v10;
  TLTimelineSessionOperation *v11;
  dispatch_group_t v12;
  void *v13;
  TLTimelineSessionOperation *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  TLTimelineSessionOperation *v20;
  TLTimelineSessionOperation *v21;
  uint64_t *v22;
  dispatch_time_t v23;
  _QWORD v24[5];
  NSObject *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  -[TLTimelineSessionOperation provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = dispatch_group_create();
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v37 = 0;
      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__1;
      v32 = __Block_byref_object_dispose__1;
      v33 = 0;
      dispatch_group_enter(v4);
      v5 = MEMORY[0x24BDAC760];
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __34__TLTimelineSessionOperation_main__block_invoke;
      v24[3] = &unk_24CE30F20;
      v24[4] = self;
      v26 = &v34;
      v27 = &v28;
      v6 = v4;
      v25 = v6;
      objc_msgSend(v3, "tl_getDataSourceWithCompletion:", v24);
      -[TLTimelineSessionOperation providerTimeout](self, "providerTimeout");
      v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
      -[TLTimelineSessionOperation operationTimeout](self, "operationTimeout");
      v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_group_wait(v6, v8);
      v11 = self;
      objc_sync_enter(v11);
      if (*((_BYTE *)v35 + 24))
      {
        if (v29[5])
        {
          objc_sync_exit(v11);

          v12 = dispatch_group_create();
          -[TLTimelineSessionOperation operations](v11, "operations");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v5;
          v19[1] = 3221225472;
          v19[2] = __34__TLTimelineSessionOperation_main__block_invoke_2;
          v19[3] = &unk_24CE30F98;
          v22 = &v28;
          v14 = v12;
          v20 = v14;
          v21 = v11;
          v23 = v10;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);

          v11 = v14;
LABEL_12:

          _Block_object_dispose(&v28, 8);
          _Block_object_dispose(&v34, 8);
          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TLOperationDomain"), 910, &unk_24CE339A8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLTimelineSessionOperation setSessionError:](v11, "setSessionError:", v18);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TLOperationDomain"), 909, &unk_24CE33980);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLTimelineSessionOperation setSessionError:](v11, "setSessionError:", v18);
      }

      objc_sync_exit(v11);
      goto LABEL_12;
    }
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = &unk_24CE33958;
    v17 = 905;
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = &unk_24CE33930;
    v17 = 900;
  }
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("TLOperationDomain"), v17, v16);
  v6 = objc_claimAutoreleasedReturnValue();
  -[TLTimelineSessionOperation setSessionError:](self, "setSessionError:", v6);
LABEL_13:

}

void __34__TLTimelineSessionOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  objc_sync_exit(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __34__TLTimelineSessionOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unint64_t i;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  void *v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "setDataSource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(v6, "operationCompletionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v8 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __34__TLTimelineSessionOperation_main__block_invoke_3;
  v31[3] = &unk_24CE30F48;
  v31[4] = *(_QWORD *)(a1 + 40);
  v34 = &v35;
  v26 = v7;
  v33 = v26;
  v32 = *(id *)(a1 + 32);
  objc_msgSend(v6, "setOperationCompletionBlock:", v31);
  objc_msgSend(*(id *)(a1 + 40), "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v6);

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), *(_QWORD *)(a1 + 56));
  v10 = *(id *)(a1 + 40);
  objc_sync_enter(v10);
  if (!*((_BYTE *)v36 + 24))
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v39[0] = CFSTR("description");
    v39[1] = CFSTR("operationName");
    v40[0] = CFSTR("Operation timed out");
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("TLOperationDomain"), 930, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setSessionError:", v15);
  }
  objc_msgSend(*(id *)(a1 + 40), "sessionError");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v10);

  if (v27)
  {
    v16 = dispatch_group_create();
    for (i = a3 + 1; ; ++i)
    {
      objc_msgSend(*(id *)(a1 + 40), "operations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = i < objc_msgSend(v18, "count");

      if (!v19)
        break;
      objc_msgSend(*(id *)(a1 + 40), "operations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndex:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "cancel");
      objc_msgSend(v21, "operationCompletionBlock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v16);
      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __34__TLTimelineSessionOperation_main__block_invoke_4;
      v28[3] = &unk_24CE30F70;
      v23 = v22;
      v30 = v23;
      v29 = v16;
      objc_msgSend(v21, "setOperationCompletionBlock:", v28);
      objc_msgSend(*(id *)(a1 + 40), "operationQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addOperation:", v21);

      dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), *(_QWORD *)(a1 + 56));
    }
    *a4 = 1;

  }
  _Block_object_dispose(&v35, 8);

}

void __34__TLTimelineSessionOperation_main__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  objc_sync_exit(v7);

  if (v6)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v17[0] = CFSTR("Operation failed");
    v16[0] = CFSTR("description");
    v16[1] = CFSTR("operationName");
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v10;
    v16[2] = CFSTR("operationError");
    v17[2] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("TLOperationDomain"), 920, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(id *)(a1 + 32);
    objc_sync_enter(v13);
    objc_msgSend(*(id *)(a1 + 32), "setSessionError:", v12);
    objc_sync_exit(v13);

  }
  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  v15 = *(id *)(a1 + 32);
  objc_sync_enter(v15);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  objc_sync_exit(v15);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __34__TLTimelineSessionOperation_main__block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (TLTimelineDataSourceProvider)provider
{
  return self->_provider;
}

- (NSArray)operations
{
  return self->_operations;
}

- (double)providerTimeout
{
  return self->_providerTimeout;
}

- (double)operationTimeout
{
  return self->_operationTimeout;
}

- (id)sessionCompletionBlock
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setSessionCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSError)sessionError
{
  return (NSError *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSessionError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionError, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_sessionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
