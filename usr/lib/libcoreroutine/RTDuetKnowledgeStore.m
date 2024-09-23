@implementation RTDuetKnowledgeStore

- (RTDuetKnowledgeStore)init
{
  RTDuetKnowledgeStore *v2;
  RTDuetKnowledgeStore *v3;
  RTDuetKnowledgeStore *v4;
  NSObject *v5;
  const char *v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  dispatch_queue_t v10;
  OS_dispatch_queue *requestQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RTDuetKnowledgeStore;
  v2 = -[RTDuetKnowledgeStore init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (const char *)-[RTDuetKnowledgeStore UTF8String](objc_retainAutorelease(v4), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v4);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = (const char *)objc_msgSend(v7, "UTF8String");

    }
    v8 = dispatch_queue_create(v6, v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create_with_target_V2("RTDuetKnowledgeStore-requests", 0, (dispatch_queue_t)v4->_queue);
    requestQueue = v4->_requestQueue;
    v4->_requestQueue = (OS_dispatch_queue *)v10;

  }
  return v3;
}

- (void)executeQuery:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__RTDuetKnowledgeStore_executeQuery_completion___block_invoke;
  block[3] = &unk_1E9299330;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(requestQueue, block);

}

void __48__RTDuetKnowledgeStore_executeQuery_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  dispatch_suspend(*(dispatch_object_t *)(a1[4] + 24));
  if (!*(_QWORD *)(a1[4] + 8))
  {
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStoreWithDirectReadOnlyAccess");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = a1[4];
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v2;

  }
  v5 = a1[4];
  v6 = *(void **)(v5 + 8);
  if (v6)
    objc_msgSend(v6, "executeQuery:responseQueue:withCompletion:", a1[5], *(_QWORD *)(v5 + 32), a1[6]);
  else
    (*(void (**)(void))(a1[6] + 16))();

}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_requestQueue);
}

- (void)reset
{
  NSObject *requestQueue;
  _QWORD block[5];

  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__RTDuetKnowledgeStore_reset__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(requestQueue, block);
}

void __29__RTDuetKnowledgeStore_reset__block_invoke(uint64_t a1)
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

- (void)saveEvents:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__RTDuetKnowledgeStore_saveEvents_completion___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(requestQueue, block);

}

uint64_t __46__RTDuetKnowledgeStore_saveEvents_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a1[4];
  v3 = *(void **)(v2 + 16);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    v2 = a1[4];
    v3 = *(void **)(v2 + 16);
  }
  return objc_msgSend(v3, "saveObjects:responseQueue:withCompletion:", a1[5], *(_QWORD *)(v2 + 32), a1[6]);
}

- (void)clearEventsFromStream:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *requestQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__RTDuetKnowledgeStore_clearEventsFromStream_completion___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(requestQueue, block);

}

void __57__RTDuetKnowledgeStore_clearEventsFromStream_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
  }
  v7 = *(_QWORD *)(v2 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__RTDuetKnowledgeStore_clearEventsFromStream_completion___block_invoke_2;
  v9[3] = &unk_1E92A2FA8;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "deleteAllEventsInEventStream:responseQueue:withCompletion:", v8, v7, v9);

}

uint64_t __57__RTDuetKnowledgeStore_clearEventsFromStream_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 != 0);
}

- (_DKKnowledgeQuerying)knowledgeStoreQuery
{
  return self->_knowledgeStoreQuery;
}

- (void)setKnowledgeStoreQuery:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStoreQuery, a3);
}

- (_DKKnowledgeStore)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStoreQuery, 0);
}

@end
