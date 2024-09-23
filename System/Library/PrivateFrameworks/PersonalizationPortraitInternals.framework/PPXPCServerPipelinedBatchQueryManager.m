@implementation PPXPCServerPipelinedBatchQueryManager

- (PPXPCServerPipelinedBatchQueryManager)initWithPipelineDepth:(int64_t)a3 pipelinedCallTimeoutNsec:(unint64_t)a4 maxConcurrentRequestsPerConnection:(unint64_t)a5
{
  PPXPCServerPipelinedBatchQueryManager *v8;
  PPXPCServerPipelinedBatchQueryManager *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *concurrentRequestSem;
  uint64_t v12;
  NSMutableDictionary *queryReplyThrottleSemaphores;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PPXPCServerPipelinedBatchQueryManager;
  v8 = -[PPXPCServerPipelinedBatchQueryManager init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_pipelineDepth = a3;
    v8->_pipelinedCallTimeoutNsec = a4;
    v10 = dispatch_semaphore_create(a5);
    concurrentRequestSem = v9->_concurrentRequestSem;
    v9->_concurrentRequestSem = (OS_dispatch_semaphore *)v10;

    v12 = objc_opt_new();
    queryReplyThrottleSemaphores = v9->_queryReplyThrottleSemaphores;
    v9->_queryReplyThrottleSemaphores = (NSMutableDictionary *)v12;

    atomic_store(0, (unsigned __int8 *)&v9->_isInterrupted);
  }
  return v9;
}

intptr_t __118__PPXPCServerPipelinedBatchQueryManager_sendBatchedResultForQueryWithName_queryId_batchGenerator_sendError_sendBatch___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __73__PPXPCServerPipelinedBatchQueryManager_waitForBlockWithRequestThrottle___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24));
  return (id)objc_opt_self();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryReplyThrottleSemaphores, 0);
  objc_storeStrong((id *)&self->_concurrentRequestSem, 0);
}

- (void)waitForBlockWithRequestThrottle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  blockNotifyQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v6, &__block_literal_global_22);

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_concurrentRequestSem, 0xFFFFFFFFFFFFFFFFLL);
  blockNotifyQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PPXPCServerPipelinedBatchQueryManager_waitForBlockWithRequestThrottle___block_invoke_2;
  v9[3] = &unk_1E7E1FCE8;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_block_notify(v4, v7, v9);

}

- (void)sendBatchedResultForQueryWithName:(id)a3 queryId:(unint64_t)a4 batchGenerator:(id)a5 sendError:(id)a6 sendBatch:(id)a7
{
  void (**v12)(id, unsigned __int8 *, id *);
  void (**v13)(id, id);
  NSMutableDictionary *v14;
  NSMutableDictionary *queryReplyThrottleSemaphores;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  char v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  uint64_t v36;
  char v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *v39;
  void *v40;
  void (**v41)(id, void *, uint64_t, _QWORD *);
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  _QWORD v45[4];
  NSObject *v46;
  __int128 *v47;
  id v48;
  unsigned __int8 v49;
  uint8_t buf[4];
  NSObject *v51;
  __int16 v52;
  unint64_t v53;
  uint64_t v54;
  NSObject *v55;
  __int128 v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v12 = (void (**)(id, unsigned __int8 *, id *))a5;
  v13 = (void (**)(id, id))a6;
  v41 = (void (**)(id, void *, uint64_t, _QWORD *))a7;
  v14 = self->_queryReplyThrottleSemaphores;
  objc_sync_enter(v14);
  queryReplyThrottleSemaphores = self->_queryReplyThrottleSemaphores;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](queryReplyThrottleSemaphores, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v23 = dispatch_semaphore_create(self->_pipelineDepth);
    v24 = self->_queryReplyThrottleSemaphores;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v23, v25);

    objc_sync_exit(v14);
    v49 = 0;
    *(_QWORD *)&v56 = 0;
    *((_QWORD *)&v56 + 1) = &v56;
    v57 = 0x2020000000;
    v58 = 0;
    v42 = *MEMORY[0x1E0CB2FE0];
    v43 = *MEMORY[0x1E0CB2D68];
    while (1)
    {
      v26 = (void *)MEMORY[0x1C3BD6630]();
      v48 = 0;
      v27 = atomic_load((unsigned __int8 *)(*((_QWORD *)&v56 + 1) + 24));
      if ((v27 & 1) != 0)
        break;
      v12[2](v12, &v49, &v48);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
        goto LABEL_10;
      v13[2](v13, v48);
      v29 = 0;
LABEL_20:

      objc_autoreleasePoolPop(v26);
      if (v49)
        v37 = 0;
      else
        v37 = v29;
      if ((v37 & 1) == 0)
      {
        -[PPXPCServerPipelinedBatchQueryManager _unblockQueryReplyThrottleSemaphore:](self, "_unblockQueryReplyThrottleSemaphore:", v23);
        v38 = self->_queryReplyThrottleSemaphores;
        objc_sync_enter(v38);
        v39 = self->_queryReplyThrottleSemaphores;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", 0, v40);

        objc_sync_exit(v38);
        _Block_object_dispose(&v56, 8);
        v14 = (NSMutableDictionary *)v23;
        goto LABEL_25;
      }
    }
    v49 = 1;
    v28 = (void *)MEMORY[0x1E0C9AA60];
LABEL_10:
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v23, (double)self->_pipelinedCallTimeoutNsec / 1000000000.0) == 1)
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("timeout while handling pipelined results for query \"%@\" with queryId %llu"), v44, a4);
      pp_xpc_server_log_handle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v30;
        _os_log_impl(&dword_1C392E000, v31, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v54 = v43;
      v55 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v32, "initWithDomain:code:userInfo:", v42, 5, v33);

      v13[2](v13, v34);
    }
    else
    {
      v35 = atomic_load((unsigned __int8 *)&self->_isInterrupted);
      if ((v35 & 1) == 0)
      {
        v36 = v49;
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __118__PPXPCServerPipelinedBatchQueryManager_sendBatchedResultForQueryWithName_queryId_batchGenerator_sendError_sendBatch___block_invoke;
        v45[3] = &unk_1E7E1A628;
        v47 = &v56;
        v46 = v23;
        v41[2](v41, v28, v36, v45);
        v29 = 1;
        v30 = v46;
LABEL_19:

        goto LABEL_20;
      }
      pp_xpc_server_log_handle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v51 = v44;
        v52 = 2048;
        v53 = a4;
        _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEFAULT, "Prematurely terminating pending query \"%@\" with queryId %llu due to connection failure.", buf, 0x16u);
      }
    }
    v29 = 0;
    goto LABEL_19;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("query \"%@\" can't be started because queryId %llu is already in use"), v44, a4);
  pp_xpc_server_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v56) = 138412290;
    *(_QWORD *)((char *)&v56 + 4) = v18;
    _os_log_error_impl(&dword_1C392E000, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v56, 0xCu);
  }

  v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v59 = *MEMORY[0x1E0CB2D68];
  v60[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v21);

  v13[2](v13, v22);
  objc_sync_exit(v14);
LABEL_25:

}

- (void)_unblockQueryReplyThrottleSemaphore:(id)a3
{
  unint64_t v5;

  if (self->_pipelineDepth)
  {
    v5 = 0;
    do
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)a3);
      ++v5;
    }
    while (v5 < self->_pipelineDepth);
  }
}

- (void)runSynchronouslyWithRequestThrottle:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;

  v4 = (void (**)(_QWORD))a3;
  blockNotifyQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, &__block_literal_global_13339);

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_concurrentRequestSem, 0xFFFFFFFFFFFFFFFFLL);
  v4[2](v4);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_concurrentRequestSem);
}

- (void)runConcurrentlyWithRequestThrottle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  qos_class_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  blockNotifyQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v6, &__block_literal_global_20_13338);

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_concurrentRequestSem, 0xFFFFFFFFFFFFFFFFLL);
  v7 = qos_class_self();
  dispatch_get_global_queue(v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PPXPCServerPipelinedBatchQueryManager_runConcurrentlyWithRequestThrottle___block_invoke_2;
  block[3] = &unk_1E7E1F488;
  v12 = v5;
  v13 = v4;
  block[4] = self;
  v9 = v5;
  v10 = v4;
  dispatch_async(v8, block);

}

- (void)unblockPendingQueries
{
  NSMutableDictionary *queryReplyThrottleSemaphores;
  NSMutableDictionary *obj;
  _QWORD v5[5];

  atomic_store(1u, (unsigned __int8 *)&self->_isInterrupted);
  obj = self->_queryReplyThrottleSemaphores;
  objc_sync_enter(obj);
  queryReplyThrottleSemaphores = self->_queryReplyThrottleSemaphores;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PPXPCServerPipelinedBatchQueryManager_unblockPendingQueries__block_invoke;
  v5[3] = &unk_1E7E1A600;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queryReplyThrottleSemaphores, "enumerateKeysAndObjectsUsingBlock:", v5);
  objc_sync_exit(obj);

}

uint64_t __62__PPXPCServerPipelinedBatchQueryManager_unblockPendingQueries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unblockQueryReplyThrottleSemaphore:");
}

id __76__PPXPCServerPipelinedBatchQueryManager_runConcurrentlyWithRequestThrottle___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 24));
  return (id)objc_opt_self();
}

@end
