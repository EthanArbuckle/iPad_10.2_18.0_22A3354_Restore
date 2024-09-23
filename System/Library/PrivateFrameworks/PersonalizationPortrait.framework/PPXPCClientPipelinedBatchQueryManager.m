@implementation PPXPCClientPipelinedBatchQueryManager

void __71__PPXPCClientPipelinedBatchQueryManager_cancelPendingQueriesWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PPXPCClientPipelinedBatchQueryManager_cancelPendingQueriesWithError___block_invoke_2;
  v7[3] = &unk_1E226AD38;
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleReplyWithName:(id)a3 batch:(id)a4 isLast:(BOOL)a5 error:(id)a6 queryId:(unint64_t)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *queryContexts;
  void *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = self->_queryContexts;
  objc_sync_enter(v18);
  queryContexts = self->_queryContexts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](queryContexts, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v18);
  if (v21)
  {
    objc_msgSend(v21, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__PPXPCClientPipelinedBatchQueryManager_handleReplyWithName_batch_isLast_error_queryId_completion___block_invoke;
    block[3] = &unk_1E226AD10;
    v27 = v15;
    v28 = v21;
    v31 = a5;
    v29 = v16;
    v30 = v17;
    dispatch_async(v22, block);

  }
  else
  {
    v23 = atomic_load(&self->_queryId);
    pp_xpc_client_log_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23 <= a7)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v14;
        v34 = 2048;
        v35 = a7;
        _os_log_error_impl(&dword_18BE3A000, v25, OS_LOG_TYPE_ERROR, "Received batch reply of type %@ for unknown queryId %llu.", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v14;
      v34 = 2048;
      v35 = a7;
      _os_log_debug_impl(&dword_18BE3A000, v25, OS_LOG_TYPE_DEBUG, "Received batch reply of type %@ for old queryId %llu.", buf, 0x16u);
    }

    (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
  }

}

- (PPXPCClientPipelinedBatchQueryManager)initWithName:(id)a3
{
  id v5;
  PPXPCClientPipelinedBatchQueryManager *v6;
  PPXPCClientPipelinedBatchQueryManager *v7;
  uint64_t v8;
  NSMutableDictionary *queryContexts;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  void *v16;
  void *v17;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPXPCClientSupport.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PPXPCClientPipelinedBatchQueryManager;
  v6 = -[PPXPCClientPipelinedBatchQueryManager init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    atomic_store(0, &v6->_queryId);
    v8 = objc_opt_new();
    queryContexts = v7->_queryContexts;
    v7->_queryContexts = (NSMutableDictionary *)v8;

    v10 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-completion"), v5));
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PPXPCClientSupport.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("utf8Name"));

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

  }
  return v7;
}

- (BOOL)syncExecuteQueryWithName:(id)a3 error:(id *)a4 queryInitializer:(id)a5 handleBatch:(id)a6
{
  void (**v9)(id, unint64_t);
  id v10;
  unint64_t *p_queryId;
  unint64_t v12;
  dispatch_block_t v13;
  void *v14;
  id v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *queryContexts;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  void *v21;
  char v22;
  id v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v25 = a3;
  v9 = (void (**)(id, unint64_t))a5;
  v10 = a6;
  p_queryId = &self->_queryId;
  do
    v12 = __ldaxr(p_queryId);
  while (__stlxr(v12 + 1, p_queryId));
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4414;
  v34 = __Block_byref_object_dispose__4415;
  v35 = 0;
  v13 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_4416);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setQueue:", self->_queue);
  objc_msgSend(v14, "setHandleBatch:", v10);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __101__PPXPCClientPipelinedBatchQueryManager_syncExecuteQueryWithName_error_queryInitializer_handleBatch___block_invoke_2;
  v26[3] = &unk_1E226ACE8;
  v28 = &v36;
  v29 = &v30;
  v26[4] = self;
  v15 = v13;
  v27 = v15;
  objc_msgSend(v14, "setFinalizeCall:", v26);
  v16 = self->_queryContexts;
  objc_sync_enter(v16);
  queryContexts = self->_queryContexts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](queryContexts, "setObject:forKeyedSubscript:", v14, v18);

  objc_sync_exit(v16);
  v9[2](v9, v12);
  dispatch_block_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  v19 = self->_queryContexts;
  objc_sync_enter(v19);
  v20 = self->_queryContexts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", 0, v21);

  objc_sync_exit(v19);
  if (a4)
    *a4 = objc_retainAutorelease((id)v31[5]);
  v22 = *((_BYTE *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

uint64_t __99__PPXPCClientPipelinedBatchQueryManager_handleReplyWithName_batch_isLast_error_queryId_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (!v3)
  {
    v6 = *(_QWORD *)(a1 + 48);
    v5 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v2, "handleBatch");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) + 8);

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = *(void **)(a1 + 40);
    v5 = 1;
    v6 = 0;
LABEL_5:
    objc_msgSend(v2, "finalizeCallWithSuccess:error:", v5, v6);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __101__PPXPCClientPipelinedBatchQueryManager_syncExecuteQueryWithName_error_queryInitializer_handleBatch___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);
  v5 = obj;
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24), *(dispatch_block_t *)(a1 + 40));

}

+ (void)assertBatch:(id)a3 forQueryName:(id)a4 hasExpectedContainedType:(Class)a5
{
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPXPCClientSupport.m"), 272, CFSTR("Received incorrect batch type for query named %@"), v8);

    }
  }

}

- (void)cancelPendingQueriesWithError:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *queryContexts;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = self->_queryContexts;
  objc_sync_enter(v5);
  queryContexts = self->_queryContexts;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PPXPCClientPipelinedBatchQueryManager_cancelPendingQueriesWithError___block_invoke;
  v8[3] = &unk_1E226AD60;
  v7 = v4;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queryContexts, "enumerateKeysAndObjectsUsingBlock:", v8);

  objc_sync_exit(v5);
}

uint64_t __71__PPXPCClientPipelinedBatchQueryManager_cancelPendingQueriesWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finalizeCallWithSuccess:error:", 0, *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queryContexts, 0);
}

@end
