@implementation SSVOperation

- (SSVOperation)init
{
  SSVOperation *v2;
  id v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  NSObject *v6;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSVOperation;
  v2 = -[SSVOperation init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.%@.%p"), objc_opt_class(), v2));
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_serialQueue;
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v6, v7);

  }
  return v2;
}

- (void)addChildRequest:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__SSVOperation_addChildRequest___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

uint64_t __32__SSVOperation_addChildRequest___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 256);
    *(_QWORD *)(v4 + 256) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)dispatchAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_serialQueue, a3);
}

- (void)dispatchSync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_serialQueue, a3);
}

- (void)removeChildRequest:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__SSVOperation_removeChildRequest___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

uint64_t __35__SSVOperation_removeChildRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
}

- (void)runChildOperation:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSVOperation_runChildOperation___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v7 = v4;
  v13 = v7;
  dispatch_async(serialQueue, block);
  objc_msgSend(v7, "main");

  v8 = self->_serialQueue;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __34__SSVOperation_runChildOperation___block_invoke_2;
  v10[3] = &unk_1E47B8768;
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  dispatch_async(v8, v10);

}

void __34__SSVOperation_runChildOperation___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(a1 + 40));
}

void __34__SSVOperation_runChildOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 248);
  if (v3 == v2)
  {
    *(_QWORD *)(v1 + 248) = 0;

  }
}

- (void)cancel
{
  NSObject *serialQueue;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__39;
  v24 = __Block_byref_object_dispose__39;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__39;
  v18 = __Block_byref_object_dispose__39;
  v19 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__SSVOperation_cancel__block_invoke;
  block[3] = &unk_1E47BD7A8;
  block[4] = self;
  block[5] = &v20;
  block[6] = &v14;
  dispatch_sync(serialQueue, block);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)v15[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v26, 16);
    }
    while (v5);
  }

  objc_msgSend((id)v21[5], "cancel");
  v8.receiver = self;
  v8.super_class = (Class)SSVOperation;
  -[SSVOperation cancel](&v8, sel_cancel);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

void __22__SSVOperation_cancel__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 248));
  v2 = objc_msgSend(*(id *)(a1[4] + 256), "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = a1[4];
  v6 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = 0;

  v7 = a1[4];
  v8 = *(void **)(v7 + 256);
  *(_QWORD *)(v7 + 256) = 0;

}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_childRequests, 0);
  objc_storeStrong((id *)&self->_childOperation, 0);
}

@end
