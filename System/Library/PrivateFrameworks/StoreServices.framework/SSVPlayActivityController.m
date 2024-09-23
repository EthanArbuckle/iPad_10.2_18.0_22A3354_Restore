@implementation SSVPlayActivityController

- (SSVPlayActivityController)init
{
  return -[SSVPlayActivityController initWithWritingStyle:](self, "initWithWritingStyle:", 0);
}

- (SSVPlayActivityController)initWithWritingStyle:(unint64_t)a3
{
  SSVPlayActivityController *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  SSVPlayActivityTable *v9;
  SSVPlayActivityTable *table;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SSVPlayActivityController;
  v4 = -[SSVPlayActivityController init](&v12, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.StoreServices.SSVPlayActivityController.accessQueue", MEMORY[0x1E0C80D50]);
    accessQueue = v4->_accessQueue;
    v4->_accessQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.StoreServices.SSVPlayActivityController.serialQueue", 0);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v7;

    v4->_writingStyle = a3;
    v9 = objc_alloc_init(SSVPlayActivityTable);
    table = v4->_table;
    v4->_table = v9;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_hasValidEndpointRevisionInformationDidChangeNotifyToken)
    notify_cancel(self->_endpointRevisionInformationDidChangeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)SSVPlayActivityController;
  -[SSVPlayActivityController dealloc](&v3, sel_dealloc);
}

- (void)acquirePendingPlayActivityEventsForEndpointIdentifier:(id)a3 withStoreAccountID:(unint64_t)a4 completionHandler:(id)a5
{
  -[SSVPlayActivityController _acquirePendingPlayActivityEventsForEndpointIdentifier:withStoreAccountID:shouldFilterStoreAccountID:completionHandler:](self, "_acquirePendingPlayActivityEventsForEndpointIdentifier:withStoreAccountID:shouldFilterStoreAccountID:completionHandler:", a3, a4, 1, a5);
}

- (void)acquirePendingPlayActivityEventsForEndpointIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  -[SSVPlayActivityController _acquirePendingPlayActivityEventsForEndpointIdentifier:withStoreAccountID:shouldFilterStoreAccountID:completionHandler:](self, "_acquirePendingPlayActivityEventsForEndpointIdentifier:withStoreAccountID:shouldFilterStoreAccountID:completionHandler:", a3, 0, 0, a4);
}

- (void)completePendingPlayActivityEvents:(id)a3 forSessionToken:(unint64_t)a4 withResult:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *serialQueue;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD block[4];
  id v22;

  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (a4)
  {
    serialQueue = self->_serialQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_2;
    v16[3] = &unk_1E47BEF50;
    v16[4] = self;
    v17 = v10;
    v19 = a4;
    v20 = a5;
    v18 = v12;
    dispatch_async(serialQueue, v16);

    v14 = v17;
LABEL_5:

    goto LABEL_6;
  }
  if (v11)
  {
    dispatch_get_global_queue(0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke;
    block[3] = &unk_1E47BA738;
    v22 = v12;
    dispatch_async(v15, block);

    v14 = v22;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  id *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  id v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  id v23;
  __int128 v24;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9] == 1)
  {
    v3 = v2[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_3;
    block[3] = &unk_1E47BEF50;
    block[4] = v2;
    v4 = &v22;
    v22 = *(id *)(a1 + 40);
    v24 = *(_OWORD *)(a1 + 56);
    v5 = &v23;
    v23 = *(id *)(a1 + 48);
    dispatch_barrier_async(v3, block);
  }
  else
  {
    objc_msgSend(v2, "_daemonPlayActivityControllerConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_4;
    v17[3] = &unk_1E47BEF78;
    v8 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v4 = &v18;
    v18 = v8;
    v20 = *(_OWORD *)(a1 + 56);
    v5 = &v19;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 64);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_2_36;
    v13[3] = &unk_1E47BEF78;
    v12 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v12;
    v16 = *(_OWORD *)(a1 + 56);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v9, "completePendingPlayActivityEvents:forSessionToken:result:withReplyBlock:", v14, v10, v11, v13);

  }
}

void __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "_revisionsIndexSetForPlayActivityEvents:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_completePendingPlayEventsWithRevisionIndexSet:forSessionToken:withResult:completionHandler:", v3, a1[7], a1[8], a1[6]);

}

void __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v26 = 138413314;
    v27 = v9;
    v28 = 2114;
    v29 = v3;
    v30 = 2048;
    v31 = v10;
    v32 = 2048;
    v33 = v11;
    v34 = 2048;
    v35 = v12;
    LODWORD(v22) = 52;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v26, v22);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v4, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v7);
  }

LABEL_12:
  v20 = *(void **)(a1 + 48);
  if (v20)
  {
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_34;
    block[3] = &unk_1E47B8A98;
    v25 = v20;
    v24 = v3;
    dispatch_async(v21, block);

  }
}

uint64_t __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_2_36(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v26 = 138413314;
    v27 = v9;
    v28 = 2048;
    v29 = v10;
    v30 = 2048;
    v31 = v11;
    v32 = 2048;
    v33 = v12;
    v34 = 2114;
    v35 = v3;
    LODWORD(v22) = 52;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v26, v22);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v4, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v7);
  }

LABEL_12:
  v20 = *(void **)(a1 + 48);
  if (v20)
  {
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_37;
    block[3] = &unk_1E47B8A98;
    v25 = v20;
    v24 = v3;
    dispatch_async(v21, block);

  }
}

uint64_t __108__SSVPlayActivityController_completePendingPlayActivityEvents_forSessionToken_withResult_completionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)completePendingPlayActivityEventPersistentIDs:(id)a3 forSessionToken:(unint64_t)a4 withResult:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *serialQueue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;

  v10 = a3;
  v11 = a6;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__SSVPlayActivityController_completePendingPlayActivityEventPersistentIDs_forSessionToken_withResult_completionHandler___block_invoke;
  block[3] = &unk_1E47BEF50;
  block[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(serialQueue, block);

}

void __120__SSVPlayActivityController_completePendingPlayActivityEventPersistentIDs_forSessionToken_withResult_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;
  __int128 v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__SSVPlayActivityController_completePendingPlayActivityEventPersistentIDs_forSessionToken_withResult_completionHandler___block_invoke_2;
  block[3] = &unk_1E47BEF50;
  block[4] = v2;
  v6 = v3;
  v8 = *(_OWORD *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  dispatch_barrier_async(v4, block);

}

void __120__SSVPlayActivityController_completePendingPlayActivityEventPersistentIDs_forSessionToken_withResult_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "_revisionsIndexSetForPlayActivityEventPersistentIDs:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_completePendingPlayEventsWithRevisionIndexSet:forSessionToken:withResult:completionHandler:", v3, a1[7], a1[8], a1[6]);

}

- (void)flushPendingPlayActivityEventsForEndpointIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[SSVPlayActivityController _daemonPlayActivityControllerConnection](self, "_daemonPlayActivityControllerConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E47BEFA0;
  v18[4] = self;
  v10 = v6;
  v19 = v10;
  v11 = v7;
  v20 = v11;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_2;
  v15[3] = &unk_1E47BEFA0;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  objc_msgSend(v12, "flushPlayActivityEventsForEndPointIdentifier:withReplyBlock:", v14, v15);

}

void __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v24 = 138412802;
    v25 = v9;
    v26 = 2114;
    v27 = v3;
    v28 = 2114;
    v29 = v10;
    LODWORD(v20) = 32;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v20);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_38;
    block[3] = &unk_1E47B8A98;
    v23 = v18;
    v22 = v3;
    dispatch_async(v19, block);

  }
}

uint64_t __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v24 = 138412802;
    v25 = v9;
    v26 = 2114;
    v27 = v10;
    v28 = 2114;
    v29 = v3;
    LODWORD(v20) = 32;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v20);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_39;
    block[3] = &unk_1E47B8A98;
    v23 = v18;
    v22 = v3;
    dispatch_async(v19, block);

  }
}

uint64_t __103__SSVPlayActivityController_flushPendingPlayActivityEventsForEndpointIdentifier_withCompletionHandler___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getHasPendingPlayEventsForEndpointIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__SSVPlayActivityController_getHasPendingPlayEventsForEndpointIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_1E47B8740;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(serialQueue, block);

  }
}

void __96__SSVPlayActivityController_getHasPendingPlayEventsForEndpointIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __96__SSVPlayActivityController_getHasPendingPlayEventsForEndpointIdentifier_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E47BEFC8;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_getFlushSessionInformationForEndpointIdentifier:shouldAcquire:storeAccountID:shouldFilterStoreAccountID:withCompletionHandler:", v2, 0, 0, 0, v3);

}

void __96__SSVPlayActivityController_getHasPendingPlayEventsForEndpointIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a4;
  objc_msgSend(a2, "revisionsIndexSet");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, objc_msgSend(v7, "count") != 0, v6);

}

- (void)getRevisionInformationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *serialQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E47B8AC0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(serialQueue, v7);

  }
}

void __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t *v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__62;
  v26 = __Block_byref_object_dispose__62;
  v27 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__62;
  v19 = __Block_byref_object_dispose__62;
  v20 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke_41;
  v14[3] = &unk_1E47BEFF0;
  v14[4] = v2;
  v14[5] = v21;
  v14[6] = &v15;
  objc_msgSend(v3, "performTransactionWithBlock:", v14);
  if (!v16[5] && !v23[5])
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v23[5];
    v23[5] = v5;

  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E47BF018;
    v10 = v7;
    v11 = v21;
    v12 = &v15;
    v13 = &v22;
    dispatch_async(v8, block);

  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);

}

uint64_t __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke_41(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 56), "currentEventsRevision");
  objc_msgSend(*(id *)(a1[4] + 56), "eventsRevisionVersionToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

uint64_t __73__SSVPlayActivityController_getRevisionInformationWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

- (void)getPlayActivityEventsFromRevision:(unint64_t)a3 toRevision:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  void *v9;
  NSObject *serialQueue;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    if (a4)
    {
      serialQueue = self->_serialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_2;
      block[3] = &unk_1E47BF090;
      block[4] = self;
      v15 = a3;
      v16 = a4;
      v14 = v8;
      dispatch_async(serialQueue, block);
      v11 = v14;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke;
      v17[3] = &unk_1E47BA738;
      v18 = v9;
      dispatch_async(v12, v17);

      v11 = v18;
    }

  }
}

uint64_t __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v10[7];
  __int128 v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__62;
  v14[4] = __Block_byref_object_dispose__62;
  v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__62;
  v12[4] = __Block_byref_object_dispose__62;
  v13 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E47BF040;
  v10[4] = v2;
  v10[5] = v12;
  v11 = *(_OWORD *)(a1 + 48);
  v10[6] = v14;
  objc_msgSend(v3, "performTransactionWithBlock:", v10);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E47BF068;
  v7 = *(id *)(a1 + 40);
  v8 = v12;
  v9 = v14;
  dispatch_async(v5, v6);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);

}

uint64_t __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_3(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v8;
  id obj;

  v1 = *(void **)(a1[4] + 56);
  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  v4 = a1[7];
  v5 = a1[8];
  v6 = *(_QWORD *)(a1[6] + 8);
  v8 = *(id *)(v6 + 40);
  obj = v3;
  objc_msgSend(v1, "getPlayActivityEvents:relevantRevisionsIndexSet:withStartRevision:endRevision:additionalRevisionsIndexSet:ignoredRevisionsIndexSet:error:", &obj, 0, v4, v5, 0, 0, &v8);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v8);
  return 0;
}

uint64_t __96__SSVPlayActivityController_getPlayActivityEventsFromRevision_toRevision_withCompletionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)recordPlayActivityEvents:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *serialQueue;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    v10 &= 2u;
  if (v10)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v29 = 138412546;
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = 2112;
    v32 = v6;
    LODWORD(v23) = 22;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v29, v23);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
  }

LABEL_12:
  if (objc_msgSend(v6, "count"))
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E47B8740;
    block[4] = self;
    v25 = v6;
    v26 = v7;
    dispatch_async(serialQueue, block);

    v21 = v25;
LABEL_16:

    goto LABEL_17;
  }
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke;
    v27[3] = &unk_1E47BA738;
    v28 = v7;
    dispatch_async(v22, v27);

    v21 = v28;
    goto LABEL_16;
  }
LABEL_17:

}

uint64_t __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  SSVPlayActivityDebugLogOperation *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD block[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t *v41;
  _QWORD *v42;
  _QWORD v43[4];
  _QWORD v44[4];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  void *v54;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9] == 1)
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__62;
    v53 = __Block_byref_object_dispose__62;
    v54 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    v43[3] = 0;
    v3 = (void *)v2[7];
    v4 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_3;
    v37[3] = &unk_1E47BF0B8;
    v37[4] = v2;
    v39 = v44;
    v38 = *(id *)(a1 + 40);
    v40 = &v45;
    v41 = &v49;
    v42 = v43;
    objc_msgSend(v3, "performTransactionWithBlock:", v37);
    if (!*((_BYTE *)v46 + 24) && !v50[5])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v50[5];
      v50[5] = v5;

    }
    if (CFPreferencesGetAppBooleanValue(CFSTR("ShouldDebugLogRecordedEvents"), CFSTR("com.apple.PlayActivityFeed"), 0))
    {
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__62;
      v35 = __Block_byref_object_dispose__62;
      v36 = 0;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(NSObject **)(v7 + 8);
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_4;
      block[3] = &unk_1E47B8718;
      block[4] = v7;
      block[5] = &v31;
      dispatch_barrier_sync(v8, block);
      v9 = objc_alloc_init(SSVPlayActivityDebugLogOperation);
      -[SSVPlayActivityDebugLogOperation setPlayActivityEvents:](v9, "setPlayActivityEvents:", *(_QWORD *)(a1 + 40));
      objc_msgSend((id)v32[5], "addOperation:", v9);

      _Block_object_dispose(&v31, 8);
    }
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_5;
    v24[3] = &unk_1E47BF0E0;
    v27 = &v45;
    v28 = v44;
    v29 = v43;
    v11 = *(_QWORD *)(a1 + 32);
    v26 = &v49;
    v24[4] = v11;
    v25 = *(id *)(a1 + 48);
    dispatch_async(v10, v24);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
    v12 = v54;
  }
  else
  {
    objc_msgSend(v2, "_daemonPlayActivityControllerConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_6;
    v21[3] = &unk_1E47BEFA0;
    v15 = *(void **)(a1 + 40);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v15;
    v23 = *(id *)(a1 + 48);
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_2_55;
    v18[3] = &unk_1E47BEFA0;
    v17 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = v17;
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v16, "insertPlayActivityEvents:withReplyBlock:", v19, v18);

    v12 = v22;
  }

}

BOOL __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "currentEventsRevision");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
LABEL_3:
    v7 = 0;
    v8 = v2;
    while (1)
    {
      v9 = v7;
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v3);
      v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
      v2 = v8 + v7 + 1;
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v12 + 40);
      v13 = objc_msgSend(v11, "insertPlayActivityEvent:withRevision:returningError:", v10, v8 + v9 + 1, &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        break;
      v7 = v9 + 1;
      if (v5 == v9 + 1)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v2 = v8 + v7;
        if (v5)
          goto LABEL_3;
        v2 = v8 + v9 + 1;
        break;
      }
    }
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    return 0;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                + 24))
    return 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setCurrentEventsRevision:");
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 0;
}

void __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setName:", CFSTR("com.apple.StoreServices.SSVPlayActivityController.debugLogOperationQueue"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setQualityOfService:", 17);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

uint64_t __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_5(_QWORD *a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)
    && *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24)
    && *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) < *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v8[0] = CFSTR("SSVPlayActivityControllerUserInfoKeyStartRevision");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = CFSTR("SSVPlayActivityControllerUserInfoKeyEndRevision");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SSVPlayActivityControllerDidRecordPlayActivityEventsNotification"), v4, v7);

  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

void __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v24 = 138412802;
    v25 = v9;
    v26 = 2114;
    v27 = v3;
    v28 = 2048;
    v29 = v10;
    LODWORD(v20) = 32;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v20);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_54;
    block[3] = &unk_1E47B8A98;
    v23 = v18;
    v22 = v3;
    dispatch_async(v19, block);

  }
}

uint64_t __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_2_55(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v24 = 138412802;
    v25 = v9;
    v26 = 2048;
    v27 = v10;
    v28 = 2114;
    v29 = v3;
    LODWORD(v20) = 32;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v20);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_56;
    block[3] = &unk_1E47B8A98;
    v23 = v18;
    v22 = v3;
    dispatch_async(v19, block);

  }
}

uint64_t __76__SSVPlayActivityController_recordPlayActivityEvents_withCompletionHandler___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)removeFlushedPlayActivityEventsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__SSVPlayActivityController_removeFlushedPlayActivityEventsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E47B8AC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(accessQueue, v7);

}

void __82__SSVPlayActivityController_removeFlushedPlayActivityEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_loadEndpointIdentifierInformationIfNeeded");
  objc_msgSend((id)objc_opt_class(), "_requiredEndpointIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    v8 = -1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v3, "removeObject:", v10);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "currentRevision");
        objc_msgSend(v11, "additionalPendingRevisionsIndexSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          v14 = objc_msgSend(v13, "firstIndex");
          v15 = v14 - 1;
          if (v12 < v14 - 1)
            v15 = v12;
          if (v14 > 0)
            v12 = v15;
        }
        if (v8 >= v12)
          v8 = v12;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);

    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && !objc_msgSend(v3, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "removePlayActivityEventsUpToRevision:withCompletionHandler:", v8, *(_QWORD *)(a1 + 40));
      goto LABEL_21;
    }
  }
  else
  {

  }
  v16 = *(void **)(a1 + 40);
  if (v16)
  {
    dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SSVPlayActivityController_removeFlushedPlayActivityEventsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E47BA738;
    v19 = v16;
    dispatch_async(v17, block);

  }
LABEL_21:

}

uint64_t __82__SSVPlayActivityController_removeFlushedPlayActivityEventsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removePlayActivityEventsUpToRevision:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *serialQueue;
  id v20;
  uint64_t v21;
  _QWORD block[5];
  id v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    v11 = v9;
  else
    v11 = v9 & 2;
  if (!v11)
    goto LABEL_12;
  v25 = 134217984;
  v26 = a3;
  LODWORD(v21) = 12;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v25, v21);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
LABEL_12:

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke;
  block[3] = &unk_1E47BF180;
  v23 = v6;
  v24 = a3;
  block[4] = self;
  v20 = v6;
  dispatch_async(serialQueue, block);

}

void __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  uint64_t *v26;
  _QWORD v27[8];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  void *v37;

  v2 = (_QWORD *)a1[4];
  if (v2[9] == 1)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__62;
    v36 = __Block_byref_object_dispose__62;
    v37 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 1;
    v3 = (void *)v2[7];
    v4 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_2;
    v27[3] = &unk_1E47BF108;
    v27[4] = v2;
    v27[5] = &v28;
    v5 = a1[6];
    v27[6] = &v32;
    v27[7] = v5;
    objc_msgSend(v3, "performTransactionWithBlock:", v27);
    if (!*((_BYTE *)v29 + 24) && !v33[5])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v33[5];
      v33[5] = v6;

    }
    v8 = (void *)a1[5];
    if (v8)
    {
      dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_3;
      block[3] = &unk_1E47BF130;
      v25 = v8;
      v26 = &v32;
      dispatch_async(v9, block);

    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    v10 = v37;
  }
  else
  {
    objc_msgSend(v2, "_daemonPlayActivityControllerConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v13 = (void *)a1[5];
    v14 = a1[4];
    v23 = a1[6];
    v21[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_4;
    v21[3] = &unk_1E47BF158;
    v21[4] = v14;
    v22 = v13;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)a1[5];
    v17 = a1[6];
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_2_58;
    v18[3] = &unk_1E47BF158;
    v18[4] = a1[4];
    v20 = v17;
    v19 = v16;
    objc_msgSend(v15, "removePlayActivityEventsUptoRevision:withReplyBlock:", v17, v18);

    v10 = v22;
  }

}

uint64_t __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = *(void **)(a1[4] + 56);
  v3 = a1[7];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "removePlayActivityEventsUpToRevision:returningError:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
  return 1;
}

uint64_t __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v24 = 138412802;
    v25 = v9;
    v26 = 2114;
    v27 = v3;
    v28 = 2048;
    v29 = v10;
    LODWORD(v20) = 32;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v20);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  v18 = *(void **)(a1 + 40);
  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_57;
    block[3] = &unk_1E47B8A98;
    v23 = v18;
    v22 = v3;
    dispatch_async(v19, block);

  }
}

uint64_t __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_2_58(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v24 = 138412802;
    v25 = v9;
    v26 = 2048;
    v27 = v10;
    v28 = 2114;
    v29 = v3;
    LODWORD(v20) = 32;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v20);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  v18 = *(void **)(a1 + 40);
  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_59;
    block[3] = &unk_1E47B8A98;
    v23 = v18;
    v22 = v3;
    dispatch_async(v19, block);

  }
}

uint64_t __88__SSVPlayActivityController_removePlayActivityEventsUpToRevision_withCompletionHandler___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setCurrentRevision:(unint64_t)a3 revisionVersionToken:(id)a4 forEndpointIdentifier:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *serialQueue;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  _QWORD block[4];
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v11)
  {
    serialQueue = self->_serialQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E47BF1A8;
    v17[4] = self;
    v21 = a3;
    v18 = v10;
    v19 = v11;
    v20 = v13;
    dispatch_async(serialQueue, v17);

    v15 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v12)
  {
    dispatch_get_global_queue(0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_1E47BA738;
    v23 = v13;
    dispatch_async(v16, block);

    v15 = v23;
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9] == 1)
  {
    v3 = v2[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_3;
    block[3] = &unk_1E47BF1A8;
    v30 = *(_QWORD *)(a1 + 64);
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v26 = v4;
    v27 = v5;
    v28 = *(id *)(a1 + 48);
    v29 = *(id *)(a1 + 56);
    dispatch_barrier_async(v3, block);

    v6 = v26;
  }
  else
  {
    objc_msgSend(v2, "_daemonPlayActivityControllerConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v24 = *(_QWORD *)(a1 + 64);
    v20[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_5;
    v20[3] = &unk_1E47BF1D0;
    v20[4] = v9;
    v21 = v10;
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 64);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_2_62;
    v15[3] = &unk_1E47BF1D0;
    v13 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 48);
    v15[4] = *(_QWORD *)(a1 + 32);
    v19 = v12;
    v16 = v13;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v11, "setRevision:revisionVersionToken:forEndpointIdentifier:withReplyBlock:", v12, v16, v14, v15);

    v6 = v21;
  }

}

void __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  _SSVPlayActivityEndpointRevisionInformation *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v2 = objc_alloc_init(_SSVPlayActivityEndpointRevisionInformation);
  -[_SSVPlayActivityEndpointRevisionInformation setCurrentRevision:](v2, "setCurrentRevision:", *(_QWORD *)(a1 + 64));
  -[_SSVPlayActivityEndpointRevisionInformation setRevisionVersionToken:](v2, "setRevisionVersionToken:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_setEndpointRevisionInformation:forEndpointIdentifier:", v2, *(_QWORD *)(a1 + 48));
  v3 = *(void **)(a1 + 56);
  if (v3)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E47BA738;
    v6 = v3;
    dispatch_async(v4, block);

  }
}

uint64_t __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[8];
    v11 = a1[5];
    v12 = a1[6];
    v26 = 138413314;
    v27 = v9;
    v28 = 2114;
    v29 = v3;
    v30 = 2048;
    v31 = v10;
    v32 = 2114;
    v33 = v11;
    v34 = 2114;
    v35 = v12;
    LODWORD(v22) = 52;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v26, v22);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v4, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v7);
  }

LABEL_12:
  v20 = (void *)a1[7];
  if (v20)
  {
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_61;
    block[3] = &unk_1E47B8A98;
    v25 = v20;
    v24 = v3;
    dispatch_async(v21, block);

  }
}

uint64_t __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_2_62(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[8];
    v11 = a1[5];
    v12 = a1[6];
    v26 = 138413314;
    v27 = v9;
    v28 = 2048;
    v29 = v10;
    v30 = 2114;
    v31 = v11;
    v32 = 2114;
    v33 = v12;
    v34 = 2114;
    v35 = v3;
    LODWORD(v22) = 52;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v26, v22);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v4, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v7);
  }

LABEL_12:
  v20 = (void *)a1[7];
  if (v20)
  {
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_63;
    block[3] = &unk_1E47B8A98;
    v25 = v20;
    v24 = v3;
    dispatch_async(v21, block);

  }
}

uint64_t __113__SSVPlayActivityController_setCurrentRevision_revisionVersionToken_forEndpointIdentifier_withCompletionHandler___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)_requiredEndpointIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SSVPlayActivityControllerEndpointIdentifierJingle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_acquirePendingPlayActivityEventsForEndpointIdentifier:(id)a3 withStoreAccountID:(unint64_t)a4 shouldFilterStoreAccountID:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *serialQueue;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;
  BOOL v19;
  _QWORD block[4];
  id v21;

  v10 = a3;
  v11 = a6;
  if (v11)
  {
    if (v10)
    {
      serialQueue = self->_serialQueue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_2;
      v15[3] = &unk_1E47BF248;
      v15[4] = self;
      v16 = v10;
      v18 = a4;
      v19 = a5;
      v17 = v11;
      dispatch_async(serialQueue, v15);

      v13 = v16;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke;
      block[3] = &unk_1E47BA738;
      v21 = v11;
      dispatch_async(v14, block);

      v13 = v21;
    }

  }
}

uint64_t __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9] == 1)
  {
    v3 = *(unsigned __int8 *)(a1 + 64);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_3;
    v20[3] = &unk_1E47BEFC8;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 56);
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v2, "_getFlushSessionInformationForEndpointIdentifier:shouldAcquire:storeAccountID:shouldFilterStoreAccountID:withCompletionHandler:", v4, 1, v5, v3, v20);
    v6 = v21;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_daemonPlayActivityControllerConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_4;
    v17[3] = &unk_1E47BEFA0;
    v9 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v9;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(unsigned __int8 *)(a1 + 64);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_2_66;
    v14[3] = &unk_1E47BF220;
    v13 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v13;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v10, "acquirePendingPlayActivityEventsForEndpointIdentifier:storeAccountID:shouldFilterStoreAccountID:withReplyBlock:", v15, v11, v12, v14);

    v6 = v18;
  }

}

void __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v9, "sessionToken");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v24 = 138412802;
    v25 = v9;
    v26 = 2114;
    v27 = v3;
    v28 = 2114;
    v29 = v10;
    LODWORD(v20) = 32;
    v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v20);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  }

LABEL_12:
  v18 = *(void **)(a1 + 48);
  if (v18)
  {
    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_65;
    block[3] = &unk_1E47B8A98;
    v23 = v18;
    v22 = v3;
    dispatch_async(v19, block);

  }
}

uint64_t __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_2_66(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  int v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  objc_msgSend(v9, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    v11 &= 2u;
  if (v11)
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "count");
    v16 = *(_QWORD *)(a1 + 40);
    v32 = 138412802;
    v33 = v14;
    v34 = 2048;
    v35 = v15;
    v36 = 2114;
    v37 = v16;
    LODWORD(v26) = 32;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v32, v26);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v17);
    SSFileLog(v9, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v12);
  }

LABEL_12:
  v24 = *(void **)(a1 + 48);
  if (v24)
  {
    dispatch_get_global_queue(0, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_67;
    block[3] = &unk_1E47BF1F8;
    v30 = v24;
    v28 = v7;
    v31 = a3;
    v29 = v8;
    dispatch_async(v25, block);

  }
}

uint64_t __148__SSVPlayActivityController__acquirePendingPlayActivityEventsForEndpointIdentifier_withStoreAccountID_shouldFilterStoreAccountID_completionHandler___block_invoke_67(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[7], a1[5]);
}

- (void)_completePendingPlayEventsWithRevisionIndexSet:(id)a3 forSessionToken:(unint64_t)a4 withResult:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  int v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  int v53;
  int v54;
  NSObject *v55;
  int v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  int v71;
  int v72;
  NSObject *v73;
  int v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  BOOL v83;
  void *v84;
  int v85;
  int v86;
  NSObject *v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  int v100;
  int v101;
  NSObject *v102;
  int v103;
  id v104;
  int v105;
  int v106;
  int v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSMutableArray *pendingFlushingSessions;
  NSObject *v116;
  id v117;
  int *v118;
  int *v119;
  int *v120;
  int *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  SSVPlayActivityController *v127;
  _QWORD v128[4];
  id v129;
  SSVPlayActivityController *v130;
  id v131;
  id v132;
  BOOL v133;
  _QWORD block[4];
  id v135;
  int v136;
  id v137;
  __int16 v138;
  unint64_t v139;
  __int16 v140;
  unint64_t v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  objc_msgSend(v12, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    v16 = v14;
  else
    v16 = v14 & 2;
  if (v16)
  {
    v136 = 138412802;
    v137 = v10;
    v138 = 2048;
    v139 = a4;
    v140 = 2048;
    v141 = a5;
    LODWORD(v122) = 32;
    v118 = &v136;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v136, v122);
    v15 = objc_claimAutoreleasedReturnValue();
    free(v17);
    SSFileLog(v12, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v15);
  }

LABEL_13:
  if (a4)
  {
    -[SSVPlayActivityController _sessionInformationForSessionToken:](self, "_sessionInformationForSessionToken:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26 = objc_msgSend(v25, "shouldLog", v118);
    if (objc_msgSend(v25, "shouldLogToDisk"))
      v27 = v26 | 2;
    else
      v27 = v26;
    objc_msgSend(v25, "OSLogObject");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      v29 = v27;
    else
      v29 = v27 & 2;
    if (v29)
    {
      v136 = 138412290;
      v137 = v24;
      LODWORD(v122) = 12;
      v119 = &v136;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
        goto LABEL_26;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v30, 4, &v136, v122);
      v28 = objc_claimAutoreleasedReturnValue();
      free(v30);
      SSFileLog(v25, CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v28);
    }

LABEL_26:
    objc_msgSend(v24, "endpointIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v83 = 0;
LABEL_124:
      dispatch_get_global_queue(0, 0);
      v116 = objc_claimAutoreleasedReturnValue();
      v128[0] = MEMORY[0x1E0C809B0];
      v128[1] = 3221225472;
      v128[2] = __121__SSVPlayActivityController__completePendingPlayEventsWithRevisionIndexSet_forSessionToken_withResult_completionHandler___block_invoke_70;
      v128[3] = &unk_1E47BF270;
      v133 = v83;
      v129 = v37;
      v130 = self;
      v131 = 0;
      v132 = v11;
      v117 = v37;
      dispatch_async(v116, v128);

      goto LABEL_125;
    }
    objc_msgSend(v24, "revisionsIndexSet");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "mutableCopy");

    if (!objc_msgSend(v10, "count"))
    {
      v83 = 0;
LABEL_119:
      if (objc_msgSend(v39, "count", v119))
      {
        objc_msgSend(v24, "setRevisionsIndexSet:", v39);
      }
      else
      {
        -[NSMutableArray removeObject:](self->_pendingFlushingSessions, "removeObject:", v24);
        if (!-[NSMutableArray count](self->_pendingFlushingSessions, "count"))
        {
          pendingFlushingSessions = self->_pendingFlushingSessions;
          self->_pendingFlushingSessions = 0;

        }
      }

      goto LABEL_124;
    }
    v127 = self;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = objc_msgSend(v40, "shouldLog", v119);
    if (objc_msgSend(v40, "shouldLogToDisk"))
      v42 = v41 | 2;
    else
      v42 = v41;
    objc_msgSend(v40, "OSLogObject");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      v44 = v42;
    else
      v44 = v42 & 2;
    if (v44)
    {
      v136 = 138412546;
      v137 = v10;
      v138 = 2112;
      v139 = (unint64_t)v39;
      LODWORD(v122) = 22;
      v120 = &v136;
      v45 = (void *)_os_log_send_and_compose_impl();

      if (!v45)
        goto LABEL_40;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v45, 4, &v136, v122);
      v43 = objc_claimAutoreleasedReturnValue();
      free(v45);
      SSFileLog(v40, CFSTR("%@"), v46, v47, v48, v49, v50, v51, (uint64_t)v43);
    }

LABEL_40:
    objc_msgSend(v39, "removeIndexes:", v10);
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v52)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v53 = objc_msgSend(v52, "shouldLog", v120);
    if (objc_msgSend(v52, "shouldLogToDisk"))
      v54 = v53 | 2;
    else
      v54 = v53;
    objc_msgSend(v52, "OSLogObject");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      v56 = v54;
    else
      v56 = v54 & 2;
    if (v56)
    {
      v136 = 138412290;
      v137 = v39;
      LODWORD(v122) = 12;
      v121 = &v136;
      v57 = (void *)_os_log_send_and_compose_impl();

      if (!v57)
        goto LABEL_52;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v57, 4, &v136, v122);
      v55 = objc_claimAutoreleasedReturnValue();
      free(v57);
      SSFileLog(v52, CFSTR("%@"), v58, v59, v60, v61, v62, v63, (uint64_t)v55);
    }

LABEL_52:
    v124 = v39;

    v64 = v37;
    v65 = -[SSVPlayActivityController _copyEndpointRevisionInformationForEndpointIdentifier:](v127, "_copyEndpointRevisionInformationForEndpointIdentifier:", v37);
    objc_msgSend(v65, "revisionVersionToken");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "revisionVersionToken");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqualToString:", v67);

    if (v68)
    {
      v123 = v65;
      objc_msgSend(v65, "additionalPendingRevisionsIndexSet");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = (void *)objc_msgSend(v69, "mutableCopy");

      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v70)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v71 = objc_msgSend(v70, "shouldLog", v121);
      if (objc_msgSend(v70, "shouldLogToDisk"))
        v72 = v71 | 2;
      else
        v72 = v71;
      objc_msgSend(v70, "OSLogObject");
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        v74 = v72;
      else
        v74 = v72 & 2;
      v37 = v64;
      if (v74)
      {
        v136 = 138412290;
        v137 = v125;
        LODWORD(v122) = 12;
        v119 = &v136;
        v75 = (void *)_os_log_send_and_compose_impl();

        v39 = v124;
        if (!v75)
        {
LABEL_81:

          if (a5 == 1)
          {
            v104 = v125;
            self = v127;
            if (!v125)
              v104 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            objc_msgSend(v104, "addIndexes:", v10, v119);
            v126 = v104;
            objc_msgSend(v123, "setAdditionalPendingRevisionsIndexSet:", v104);
            +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v99)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v105 = objc_msgSend(v99, "shouldLog");
            if (objc_msgSend(v99, "shouldLogToDisk"))
              v106 = v105 | 2;
            else
              v106 = v105;
            objc_msgSend(v99, "OSLogObject");
            v102 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
              v107 = v106;
            else
              v107 = v106 & 2;
            if (v107)
            {
              v136 = 138412290;
              v137 = v126;
              LODWORD(v122) = 12;
              v119 = &v136;
              goto LABEL_112;
            }
LABEL_114:
            v90 = v123;
            goto LABEL_115;
          }
          v98 = v125;
          self = v127;
          if (!a5 && v125)
          {
            objc_msgSend(v125, "removeIndexes:", v10);
            if (!objc_msgSend(v125, "count"))
            {

              v98 = 0;
            }
            v126 = v98;
            objc_msgSend(v123, "setAdditionalPendingRevisionsIndexSet:", v98, v119);
            +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v99)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v100 = objc_msgSend(v99, "shouldLog");
            if (objc_msgSend(v99, "shouldLogToDisk"))
              v101 = v100 | 2;
            else
              v101 = v100;
            objc_msgSend(v99, "OSLogObject");
            v102 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
              v103 = v101;
            else
              v103 = v101 & 2;
            if (v103)
            {
              v136 = 138412290;
              v137 = v126;
              LODWORD(v122) = 12;
              v119 = &v136;
LABEL_112:
              v108 = (void *)_os_log_send_and_compose_impl();

              v90 = v123;
              if (!v108)
              {
                v98 = v126;
                goto LABEL_117;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v108, 4, &v136, v122);
              v102 = objc_claimAutoreleasedReturnValue();
              free(v108);
              SSFileLog(v99, CFSTR("%@"), v109, v110, v111, v112, v113, v114, (uint64_t)v102);
LABEL_115:
              v98 = v126;

LABEL_117:
              v83 = -[SSVPlayActivityController _setEndpointRevisionInformation:forEndpointIdentifier:](self, "_setEndpointRevisionInformation:forEndpointIdentifier:", v90, v37);
              goto LABEL_118;
            }
            goto LABEL_114;
          }
          v83 = 0;
          v90 = v123;
LABEL_118:

          goto LABEL_119;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v75, 4, &v136, v122);
        v73 = objc_claimAutoreleasedReturnValue();
        free(v75);
        SSFileLog(v70, CFSTR("%@"), v76, v77, v78, v79, v80, v81, (uint64_t)v73);
      }
      else
      {
        v39 = v124;
      }

      goto LABEL_81;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v84)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v85 = objc_msgSend(v84, "shouldLog", v121);
    if (objc_msgSend(v84, "shouldLogToDisk"))
      v86 = v85 | 2;
    else
      v86 = v85;
    objc_msgSend(v84, "OSLogObject");
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      v88 = v86;
    else
      v88 = v86 & 2;
    if (v88)
    {
      LOWORD(v136) = 0;
      LODWORD(v122) = 2;
      v119 = &v136;
      v89 = (void *)_os_log_send_and_compose_impl();

      v90 = v65;
      v37 = v64;
      v91 = v124;
      if (!v89)
      {
LABEL_99:

        v83 = 0;
        v98 = v91;
        v39 = 0;
        self = v127;
        goto LABEL_118;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v89, 4, &v136, v122);
      v87 = objc_claimAutoreleasedReturnValue();
      free(v89);
      SSFileLog(v84, CFSTR("%@"), v92, v93, v94, v95, v96, v97, (uint64_t)v87);
    }
    else
    {
      v90 = v65;
      v37 = v64;
      v91 = v124;
    }

    goto LABEL_99;
  }
  if (v11)
  {
    dispatch_get_global_queue(0, 0);
    v82 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__SSVPlayActivityController__completePendingPlayEventsWithRevisionIndexSet_forSessionToken_withResult_completionHandler___block_invoke;
    block[3] = &unk_1E47BA738;
    v135 = v11;
    dispatch_async(v82, block);

    v24 = v135;
LABEL_125:

  }
}

uint64_t __121__SSVPlayActivityController__completePendingPlayEventsWithRevisionIndexSet_forSessionToken_withResult_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __121__SSVPlayActivityController__completePendingPlayEventsWithRevisionIndexSet_forSessionToken_withResult_completionHandler___block_invoke_70(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64) && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = CFSTR("SSVPlayActivityControllerUserInfoKeyEndpointIdentifier");
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("SSVPlayActivityControllerEndpointRevisionInformationDidChangeNotification"), v4, v5);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (id)_daemonPlayActivityControllerConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *daemonPlayActivityControllerConnection;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  if (!self->_writingStyle && !self->_daemonPlayActivityControllerConnection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.itunescloudd.playactivity"), 0);
    daemonPlayActivityControllerConnection = self->_daemonPlayActivityControllerConnection;
    self->_daemonPlayActivityControllerConnection = v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6A1B60);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_insertPlayActivityEvents_withReplyBlock_, 0, 0);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_insertPlayActivityEvents_withReplyBlock_, 0, 0);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_completePendingPlayActivityEvents_forSessionToken_result_withReplyBlock_, 0, 0);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_acquirePendingPlayActivityEventsForEndpointIdentifier_storeAccountID_shouldFilterStoreAccountID_withReplyBlock_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](self->_daemonPlayActivityControllerConnection, "setRemoteObjectInterface:", v5);
    -[NSXPCConnection setInterruptionHandler:](self->_daemonPlayActivityControllerConnection, "setInterruptionHandler:", &__block_literal_global_28);
    -[NSXPCConnection setInvalidationHandler:](self->_daemonPlayActivityControllerConnection, "setInvalidationHandler:", &__block_literal_global_137);
    -[NSXPCConnection resume](self->_daemonPlayActivityControllerConnection, "resume");

  }
  return self->_daemonPlayActivityControllerConnection;
}

void __68__SSVPlayActivityController__daemonPlayActivityControllerConnection__block_invoke()
{
  void *v0;
  int v1;
  int v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _WORD v13[8];

  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v1 = objc_msgSend(v0, "shouldLog");
  if (objc_msgSend(v0, "shouldLogToDisk"))
    v2 = v1 | 2;
  else
    v2 = v1;
  objc_msgSend(v0, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    v4 = v2;
  else
    v4 = v2 & 2;
  if (!v4)
    goto LABEL_12;
  v13[0] = 0;
  LODWORD(v12) = 2;
  v5 = (void *)_os_log_send_and_compose_impl();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v5, 4, v13, v12);
    v3 = objc_claimAutoreleasedReturnValue();
    free(v5);
    SSFileLog(v0, CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v3);
LABEL_12:

  }
}

void __68__SSVPlayActivityController__daemonPlayActivityControllerConnection__block_invoke_136()
{
  void *v0;
  int v1;
  int v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _WORD v13[8];

  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v1 = objc_msgSend(v0, "shouldLog");
  if (objc_msgSend(v0, "shouldLogToDisk"))
    v2 = v1 | 2;
  else
    v2 = v1;
  objc_msgSend(v0, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    v4 = v2;
  else
    v4 = v2 & 2;
  if (!v4)
    goto LABEL_12;
  v13[0] = 0;
  LODWORD(v12) = 2;
  v5 = (void *)_os_log_send_and_compose_impl();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v5, 4, v13, v12);
    v3 = objc_claimAutoreleasedReturnValue();
    free(v5);
    SSFileLog(v0, CFSTR("%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v3);
LABEL_12:

  }
}

- (id)_copyEndpointRevisionInformationForEndpointIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SSVPlayActivityController _loadEndpointIdentifierInformationIfNeeded](self, "_loadEndpointIdentifierInformationIfNeeded");
  -[NSMutableDictionary objectForKey:](self->_endpointIdentifierToEndpointRevisionInformation, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (void)_getFlushSessionInformationForEndpointIdentifier:(id)a3 shouldAcquire:(BOOL)a4 storeAccountID:(unint64_t)a5 shouldFilterStoreAccountID:(BOOL)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;

  v12 = a3;
  v13 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E47BF330;
  v16[4] = self;
  v17 = v12;
  v20 = a6;
  v21 = a4;
  v18 = v13;
  v19 = a5;
  v14 = v13;
  v15 = v12;
  -[SSVPlayActivityController getRevisionInformationWithCompletionHandler:](self, "getRevisionInformationWithCompletionHandler:", v16);

}

void __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;

  v7 = a3;
  v8 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(v9 + 8);
  v16[2] = __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_2;
  v16[3] = &unk_1E47BF308;
  v16[1] = 3221225472;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v20 = v7;
  v24 = *(_WORD *)(a1 + 64);
  v13 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v22 = a2;
  v23 = v12;
  v21 = v13;
  v14 = v7;
  v15 = v8;
  dispatch_barrier_async(v11, v16);

}

void __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  _SSVPlayActivityEndpointRevisionInformation *v2;
  _SSVPlayActivityEndpointRevisionInformation *v3;
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  _SSVPlayActivityEndpointRevisionInformation *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  unint64_t v23;
  _SSVPlayActivityFlushSessionInformation *v24;
  void *v25;
  const __CFUUID *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  _SSVPlayActivityFlushSessionInformation *v36;
  _QWORD block[4];
  _SSVPlayActivityFlushSessionInformation *v38;
  uint64_t v39;
  id v40;
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  char v44;
  _QWORD v45[4];
  _SSVPlayActivityEndpointRevisionInformation *v46;
  uint64_t v47;
  id v48;
  id v49;
  _QWORD *v50;
  uint64_t *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[5];
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__62;
  v68[4] = __Block_byref_object_dispose__62;
  v69 = *(id *)(a1 + 32);
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__62;
  v66[4] = __Block_byref_object_dispose__62;
  v67 = 0;
  v2 = (_SSVPlayActivityEndpointRevisionInformation *)objc_msgSend(*(id *)(a1 + 40), "_copyEndpointRevisionInformationForEndpointIdentifier:", *(_QWORD *)(a1 + 48));
  v3 = v2;
  if (!v2)
  {
    if (!*(_QWORD *)(a1 + 72))
      goto LABEL_37;
LABEL_10:
    v3 = objc_alloc_init(_SSVPlayActivityEndpointRevisionInformation);
    -[_SSVPlayActivityEndpointRevisionInformation setRevisionVersionToken:](v3, "setRevisionVersionToken:", *(_QWORD *)(a1 + 56));
    goto LABEL_11;
  }
  v4 = *(void **)(a1 + 56);
  -[_SSVPlayActivityEndpointRevisionInformation revisionVersionToken](v2, "revisionVersionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
  {

LABEL_9:
    if (!*(_QWORD *)(a1 + 72))
    {
      v3 = 0;
LABEL_37:

      v24 = 0;
      if (!*(_BYTE *)(a1 + 89))
      {
        v32 = 0;
        v18 = 0;
        goto LABEL_40;
      }
      v18 = 0;
      goto LABEL_39;
    }
    goto LABEL_10;
  }
  v6 = -[_SSVPlayActivityEndpointRevisionInformation currentRevision](v3, "currentRevision") > *(_QWORD *)(a1 + 72);

  if (v6)
    goto LABEL_9;
  if (!*(_QWORD *)(a1 + 72))
    goto LABEL_37;
LABEL_11:
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 40) + 40);
  v8 = 0;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v63 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v12, "endpointIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 48));

        if (v14)
        {
          objc_msgSend(v12, "revisionsIndexSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            if (v8)
              objc_msgSend(v8, "addIndexes:", v15);
            else
              v8 = (void *)objc_msgSend(v15, "mutableCopy");
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v9);
  }

  -[_SSVPlayActivityEndpointRevisionInformation additionalPendingRevisionsIndexSet](v3, "additionalPendingRevisionsIndexSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__62;
  v60 = __Block_byref_object_dispose__62;
  v61 = 0;
  v17 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_3;
  v45[3] = &unk_1E47BF2B8;
  v18 = v3;
  v55 = *(_WORD *)(a1 + 88);
  v19 = *(_QWORD *)(a1 + 40);
  v46 = v18;
  v47 = v19;
  v50 = v66;
  v51 = &v56;
  v20 = *(_QWORD *)(a1 + 80);
  v53 = *(_QWORD *)(a1 + 72);
  v54 = v20;
  v21 = v16;
  v48 = v21;
  v22 = v8;
  v49 = v22;
  v52 = v68;
  objc_msgSend(v17, "performTransactionWithBlock:", v45);
  v23 = objc_msgSend((id)v57[5], "lastIndex");
  if (objc_msgSend((id)v57[5], "count"))
  {
    v24 = objc_alloc_init(_SSVPlayActivityFlushSessionInformation);
    v25 = (void *)objc_msgSend((id)v57[5], "mutableCopy");
    -[_SSVPlayActivityFlushSessionInformation setRevisionsIndexSet:](v24, "setRevisionsIndexSet:", v25);

    -[_SSVPlayActivityFlushSessionInformation setRevisionVersionToken:](v24, "setRevisionVersionToken:", *(_QWORD *)(a1 + 56));
    -[_SSVPlayActivityFlushSessionInformation setEndpointIdentifier:](v24, "setEndpointIdentifier:", *(_QWORD *)(a1 + 48));
    v26 = CFUUIDCreate(0);
    v27 = *(_OWORD *)&CFUUIDGetUUIDBytes(v26);
    CFRelease(v26);
    -[_SSVPlayActivityFlushSessionInformation setSessionToken:](v24, "setSessionToken:", v27);
    if (*(_BYTE *)(a1 + 89))
    {
      -[_SSVPlayActivityEndpointRevisionInformation setAdditionalPendingRevisionsIndexSet:](v18, "setAdditionalPendingRevisionsIndexSet:", v57[5]);
      if (-[_SSVPlayActivityEndpointRevisionInformation currentRevision](v18, "currentRevision") > v23)
        v23 = -[_SSVPlayActivityEndpointRevisionInformation currentRevision](v18, "currentRevision");
      -[_SSVPlayActivityEndpointRevisionInformation setCurrentRevision:](v18, "setCurrentRevision:", v23);
    }
  }
  else
  {
    v24 = 0;
  }

  _Block_object_dispose(&v56, 8);
  if (*(_BYTE *)(a1 + 89))
  {
    if (v24)
    {
      v28 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
      if (!v28)
      {
        v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
        v30 = *(_QWORD *)(a1 + 40);
        v31 = *(void **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = v29;

        v28 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
      }
      objc_msgSend(v28, "addObject:", v24);
    }
LABEL_39:
    objc_msgSend(*(id *)(a1 + 40), "_setEndpointRevisionInformation:forEndpointIdentifier:", v18, *(_QWORD *)(a1 + 48));
    v32 = 1;
    goto LABEL_40;
  }
  v32 = 0;
LABEL_40:
  dispatch_get_global_queue(0, 0);
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_4;
  block[3] = &unk_1E47BF2E0;
  v41 = *(id *)(a1 + 64);
  v42 = v66;
  v43 = v68;
  v44 = v32;
  v34 = *(_QWORD *)(a1 + 40);
  v35 = *(void **)(a1 + 48);
  v38 = v24;
  v39 = v34;
  v40 = v35;
  v36 = v24;
  dispatch_async(v33, block);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);

}

uint64_t __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  id *v9;
  void *v10;
  id *v11;
  uint64_t v12;
  id *v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  id *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id obj;
  id v43;

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentRevision");
  v3 = *(_QWORD *)(a1 + 88);
  if (v2 + 1 <= v3)
    v4 = v2 + 1;
  else
    v4 = 0;
  if (v2 + 1 <= v3)
    v5 = *(_QWORD *)(a1 + 88);
  else
    v5 = 0;
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  v7 = *(unsigned __int8 *)(a1 + 105);
  if (*(_BYTE *)(a1 + 104))
  {
    if (*(_BYTE *)(a1 + 105))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v10 = *(void **)(v8 + 40);
      v9 = (id *)(v8 + 40);
      v43 = v10;
      v11 = &v43;
    }
    else
    {
      v11 = 0;
      v9 = 0;
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v19 = *(void **)(v16 + 40);
    v18 = (id *)(v16 + 40);
    v17 = v19;
    v20 = *(_QWORD *)(a1 + 96);
    v21 = *(_QWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 56);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v25 = *(void **)(v23 + 40);
    v24 = (void **)(v23 + 40);
    v41 = v25;
    obj = v17;
    objc_msgSend(v6, "getPlayActivityEvents:relevantRevisionsIndexSet:withStartRevision:endRevision:storeAccountID:additionalRevisionsIndexSet:ignoredRevisionsIndexSet:error:", v11, &obj, v4, v5, v20, v21, v22, &v41);
    if (v7)
      objc_storeStrong(v9, v43);
    objc_storeStrong(v18, obj);
    v26 = v41;
  }
  else
  {
    if (*(_BYTE *)(a1 + 105))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v14 = *(void **)(v12 + 40);
      v13 = (id *)(v12 + 40);
      v40 = v14;
      v15 = &v40;
    }
    else
    {
      v15 = 0;
      v13 = 0;
    }
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v30 = *(void **)(v27 + 40);
    v29 = (id *)(v27 + 40);
    v28 = v30;
    v31 = *(_QWORD *)(a1 + 48);
    v32 = *(_QWORD *)(a1 + 56);
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v34 = *(void **)(v33 + 40);
    v24 = (void **)(v33 + 40);
    v38 = v34;
    v39 = v28;
    objc_msgSend(v6, "getPlayActivityEvents:relevantRevisionsIndexSet:withStartRevision:endRevision:additionalRevisionsIndexSet:ignoredRevisionsIndexSet:error:", v15, &v39, v4, v5, v31, v32, &v38);
    if (v7)
      objc_storeStrong(v13, v40);
    objc_storeStrong(v29, v39);
    v26 = v38;
  }
  v35 = v26;
  v36 = *v24;
  *v24 = v35;

  return 0;
}

void __156__SSVPlayActivityController__getFlushSessionInformationForEndpointIdentifier_shouldAcquire_storeAccountID_shouldFilterStoreAccountID_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v7 = CFSTR("SSVPlayActivityControllerUserInfoKeyEndpointIdentifier");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SSVPlayActivityControllerEndpointRevisionInformationDidChangeNotification"), v5, v6);

  }
}

- (void)_loadEndpointIdentifierInformationIfNeeded
{
  SSVPlayActivityController *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableDictionary *endpointIdentifierToEndpointRevisionInformation;
  uint64_t v30;
  NSMutableDictionary *v31;
  int *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  SSVPlayActivityController *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  int v43;
  void *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (self->_hasLoadedEndpointRevisionInformation)
    return;
  v2 = self;
  self->_hasLoadedEndpointRevisionInformation = 1;
  -[SSVPlayActivityController _setupNotifyTokenIfNeeded](self, "_setupNotifyTokenIfNeeded");
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SSVPlayActivityEndpointRevisionInformation"), CFSTR("com.apple.itunesstored"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_33;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v34 = v3;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (!v5)
    goto LABEL_32;
  v6 = v5;
  v7 = *(_QWORD *)v40;
  v36 = v4;
  v37 = v2;
  v35 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v40 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          v11 = (void *)MEMORY[0x1E0CB3710];
          v12 = objc_opt_class();
          v38 = 0;
          objc_msgSend(v11, "unarchivedObjectOfClass:fromData:error:", v12, v10, &v38);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v38;
          if (v14)
          {
            +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v16 = objc_msgSend(v15, "shouldLog", v32, v33);
            if (objc_msgSend(v15, "shouldLogToDisk"))
              v17 = v16 | 2;
            else
              v17 = v16;
            objc_msgSend(v15, "OSLogObject");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              v19 = v17;
            else
              v19 = v17 & 2;
            if (v19)
            {
              v20 = (void *)objc_opt_class();
              v43 = 138543618;
              v44 = v20;
              v45 = 2114;
              v46 = v14;
              v21 = v20;
              LODWORD(v33) = 22;
              v32 = &v43;
              v22 = (void *)_os_log_send_and_compose_impl();

              if (v22)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, &v43, v33);
                v18 = objc_claimAutoreleasedReturnValue();
                free(v22);
                SSFileLog(v15, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v18);
                goto LABEL_22;
              }
            }
            else
            {
LABEL_22:

            }
            v4 = v36;
            v2 = v37;
            v7 = v35;
          }
          if (v13)
          {
            endpointIdentifierToEndpointRevisionInformation = v2->_endpointIdentifierToEndpointRevisionInformation;
            if (!endpointIdentifierToEndpointRevisionInformation)
            {
              v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
              v31 = v2->_endpointIdentifierToEndpointRevisionInformation;
              v2->_endpointIdentifierToEndpointRevisionInformation = (NSMutableDictionary *)v30;

              endpointIdentifierToEndpointRevisionInformation = v2->_endpointIdentifierToEndpointRevisionInformation;
            }
            -[NSMutableDictionary setObject:forKey:](endpointIdentifierToEndpointRevisionInformation, "setObject:forKey:", v13, v9, v32);
          }

        }
        continue;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  }
  while (v6);
LABEL_32:

  v3 = v34;
LABEL_33:

}

- (id)_revisionsIndexSetForPlayActivityEvents:(id)a3
{
  id v4;
  SSVPlayActivityTable *table;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__62;
  v16 = __Block_byref_object_dispose__62;
  v17 = 0;
  table = self->_table;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SSVPlayActivityController__revisionsIndexSetForPlayActivityEvents___block_invoke;
  v9[3] = &unk_1E47BF358;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[SSVPlayActivityTable performTransactionWithBlock:](table, "performTransactionWithBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __69__SSVPlayActivityController__revisionsIndexSetForPlayActivityEvents___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "revisionsIndexSetForPlayActivityEvents:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

- (id)_revisionsIndexSetForPlayActivityEventPersistentIDs:(id)a3
{
  id v4;
  SSVPlayActivityTable *table;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__62;
  v16 = __Block_byref_object_dispose__62;
  v17 = 0;
  table = self->_table;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__SSVPlayActivityController__revisionsIndexSetForPlayActivityEventPersistentIDs___block_invoke;
  v9[3] = &unk_1E47BF358;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[SSVPlayActivityTable performTransactionWithBlock:](table, "performTransactionWithBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __81__SSVPlayActivityController__revisionsIndexSetForPlayActivityEventPersistentIDs___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "revisionsIndexSetForPlayActivityEventPersistentIDs:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

- (id)_sessionInformationForSessionToken:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_pendingFlushingSessions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "sessionToken", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_setEndpointRevisionInformation:(id)a3 forEndpointIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSMutableDictionary *endpointIdentifierToEndpointRevisionInformation;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableDictionary *v29;
  int endpointRevisionInformationDidChangeNotifyToken;
  pid_t v31;
  int *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  int v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SSVPlayActivityController _loadEndpointIdentifierInformationIfNeeded](self, "_loadEndpointIdentifierInformationIfNeeded");
  -[NSMutableDictionary objectForKey:](self->_endpointIdentifierToEndpointRevisionInformation, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == v6 || (objc_msgSend(v8, "isEqual:", v6) & 1) != 0)
  {
    v10 = 0;
    goto LABEL_38;
  }
  v11 = (void *)CFPreferencesCopyAppValue(CFSTR("SSVPlayActivityEndpointRevisionInformation"), CFSTR("com.apple.itunesstored"));
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = 0;
    }
  }
  endpointIdentifierToEndpointRevisionInformation = self->_endpointIdentifierToEndpointRevisionInformation;
  if (!v6)
  {
    -[NSMutableDictionary removeObjectForKey:](endpointIdentifierToEndpointRevisionInformation, "removeObjectForKey:", v7);
    if (!-[NSMutableDictionary count](self->_endpointIdentifierToEndpointRevisionInformation, "count"))
    {
      v29 = self->_endpointIdentifierToEndpointRevisionInformation;
      self->_endpointIdentifierToEndpointRevisionInformation = 0;

    }
    v15 = (void *)objc_msgSend(v11, "mutableCopy");
    v16 = 0;
    goto LABEL_26;
  }
  if (!endpointIdentifierToEndpointRevisionInformation)
  {
    v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v14 = self->_endpointIdentifierToEndpointRevisionInformation;
    self->_endpointIdentifierToEndpointRevisionInformation = v13;

    endpointIdentifierToEndpointRevisionInformation = self->_endpointIdentifierToEndpointRevisionInformation;
  }
  -[NSMutableDictionary setObject:forKey:](endpointIdentifierToEndpointRevisionInformation, "setObject:forKey:", v6, v7);
  v15 = (void *)objc_msgSend(v11, "mutableCopy");
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", 0, 1, &v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v37;
  if (v17)
  {
    v36 = v16;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_msgSend(v18, "shouldLog");
    if (objc_msgSend(v18, "shouldLogToDisk"))
      v19 |= 2u;
    objc_msgSend(v18, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      v19 &= 2u;
    if (v19)
    {
      v21 = (void *)objc_opt_class();
      v38 = 138543618;
      v39 = v21;
      v40 = 2114;
      v41 = v17;
      v35 = v21;
      LODWORD(v34) = 22;
      v33 = &v38;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_21:

        v16 = v36;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, &v38, v34);
      v20 = objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog(v18, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v20);
    }

    goto LABEL_21;
  }
LABEL_22:

LABEL_26:
  if (objc_msgSend(v16, "length", v33))
  {
    if (!v15)
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    objc_msgSend(v15, "setObject:forKey:", v16, v7);
  }
  else
  {
    objc_msgSend(v15, "removeObjectForKey:", v7);
  }
  if (!objc_msgSend(v15, "count"))
  {

    v15 = 0;
  }
  if (v11 != v15 && (objc_msgSend(v11, "isEqualToDictionary:", v15) & 1) == 0)
  {
    CFPreferencesSetAppValue(CFSTR("SSVPlayActivityEndpointRevisionInformation"), v15, CFSTR("com.apple.itunesstored"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
    -[SSVPlayActivityController _setupNotifyTokenIfNeeded](self, "_setupNotifyTokenIfNeeded");
    if (self->_hasValidEndpointRevisionInformationDidChangeNotifyToken)
    {
      endpointRevisionInformationDidChangeNotifyToken = self->_endpointRevisionInformationDidChangeNotifyToken;
      v31 = getpid();
      notify_set_state(endpointRevisionInformationDidChangeNotifyToken, v31);
      notify_post("com.apple.StoreServices.SSVPlayActivityControllerEndpointRevisionInformationDidChange");
    }
  }

  v10 = 1;
LABEL_38:

  return v10;
}

- (void)_setupNotifyTokenIfNeeded
{
  NSObject *v3;
  uint32_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_hasSetupEndpointRevisionInformationDidChangeNotifyToken)
  {
    self->_hasSetupEndpointRevisionInformationDidChangeNotifyToken = 1;
    objc_initWeak(&location, self);
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__SSVPlayActivityController__setupNotifyTokenIfNeeded__block_invoke;
    v5[3] = &unk_1E47B9768;
    objc_copyWeak(&v6, &location);
    v4 = notify_register_dispatch("com.apple.StoreServices.SSVPlayActivityControllerEndpointRevisionInformationDidChange", &self->_endpointRevisionInformationDidChangeNotifyToken, v3, v5);

    self->_hasValidEndpointRevisionInformationDidChangeNotifyToken = v4 == 0;
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __54__SSVPlayActivityController__setupNotifyTokenIfNeeded__block_invoke(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  uint64_t state64;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    if (!notify_get_state(a2, &state64))
    {
      v4 = state64;
      if (v4 != getpid())
      {
        CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
        v5 = WeakRetained[1];
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __54__SSVPlayActivityController__setupNotifyTokenIfNeeded__block_invoke_2;
        v6[3] = &unk_1E47B8790;
        v7 = WeakRetained;
        dispatch_barrier_async(v5, v6);

      }
    }
  }

}

void __54__SSVPlayActivityController__setupNotifyTokenIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (unint64_t)writingStyle
{
  return self->_writingStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonPlayActivityControllerConnection, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_pendingFlushingSessions, 0);
  objc_storeStrong((id *)&self->_endpointIdentifierToEndpointRevisionInformation, 0);
  objc_storeStrong((id *)&self->_debugLogOperationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
