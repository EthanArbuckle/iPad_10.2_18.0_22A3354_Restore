@implementation SBKAsynchronousTask

- (SBKAsynchronousTask)initWithHandlerQueue:(id)a3 timeout:(double)a4 debugDescription:(id)a5
{
  id v9;
  id v10;
  SBKAsynchronousTask *v11;
  SBKAsynchronousTask *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  void *v15;
  NSObject *v16;
  dispatch_source_t v17;
  OS_dispatch_source *timeoutTimer;
  NSObject *v19;
  _QWORD handler[4];
  SBKAsynchronousTask *v22;
  objc_super v23;

  v9 = a3;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBKAsynchronousTask;
  v11 = -[SBKAsynchronousTask init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_handlerQueue, a3);
    v13 = dispatch_queue_create(0, 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v12->_timeout = a4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKAsynchronousTask setCompletions:](v12, "setCompletions:", v15);

    objc_storeStrong((id *)&v12->_debugDescription, a5);
    v16 = dispatch_queue_create(0, 0);
    v17 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v16);
    timeoutTimer = v12->_timeoutTimer;
    v12->_timeoutTimer = (OS_dispatch_source *)v17;

    dispatch_source_set_timer((dispatch_source_t)v12->_timeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v19 = v12->_timeoutTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __69__SBKAsynchronousTask_initWithHandlerQueue_timeout_debugDescription___block_invoke;
    handler[3] = &unk_24E2A8240;
    v22 = v12;
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume((dispatch_object_t)v12->_timeoutTimer);

  }
  return v12;
}

- (id)debugDescription
{
  return self->_debugDescription;
}

- (void)dealloc
{
  OS_dispatch_queue *handlerQueue;
  OS_dispatch_queue *queue;
  objc_super v5;

  -[SBKAsynchronousTask _invalidateTimer](self, "_invalidateTimer");
  -[SBKAsynchronousTask setResult:](self, "setResult:", 0);
  -[SBKAsynchronousTask setError:](self, "setError:", 0);
  -[SBKAsynchronousTask setFinishedHandler:](self, "setFinishedHandler:", 0);
  -[SBKAsynchronousTask setExpirationHandler:](self, "setExpirationHandler:", 0);
  handlerQueue = self->_handlerQueue;
  if (handlerQueue)
  {
    self->_handlerQueue = 0;

  }
  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SBKAsynchronousTask;
  -[SBKAsynchronousTask dealloc](&v5, sel_dealloc);
}

- (void)_invalidateTimer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SBKAsynchronousTask__invalidateTimer__block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SBKAsynchronousTask;
  -[SBKAsynchronousTask description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKAsynchronousTask debugDescription](self, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ '%@'"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setExpirationHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SBKAsynchronousTask_setExpirationHandler___block_invoke;
  block[3] = &unk_24E2A8178;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)expirationHandler
{
  NSObject *queue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1570;
  v10 = __Block_byref_object_dispose__1571;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__SBKAsynchronousTask_expirationHandler__block_invoke;
  v5[3] = &unk_24E2A8118;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (void *)MEMORY[0x2207AF7FC](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setFinishedHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SBKAsynchronousTask_setFinishedHandler___block_invoke;
  block[3] = &unk_24E2A8178;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)finishedHandler
{
  NSObject *queue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1570;
  v10 = __Block_byref_object_dispose__1571;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SBKAsynchronousTask_finishedHandler__block_invoke;
  v5[3] = &unk_24E2A8118;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (void *)MEMORY[0x2207AF7FC](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_onQueueFireExpirationHandlerIfNecesary
{
  void *v3;
  id expirationHandler;
  int cancelType;
  NSObject *handlerQueue;
  _QWORD block[5];
  id v8;
  int v9;

  v3 = (void *)MEMORY[0x2207AF7FC](self->_expirationHandler, a2);
  if (v3)
  {
    expirationHandler = self->_expirationHandler;
    self->_expirationHandler = 0;

    cancelType = self->_cancelType;
    handlerQueue = self->_handlerQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SBKAsynchronousTask__onQueueFireExpirationHandlerIfNecesary__block_invoke;
    block[3] = &unk_24E2A8050;
    block[4] = self;
    v9 = cancelType;
    v8 = v3;
    dispatch_async(handlerQueue, block);

  }
}

- (void)setCancelType:(int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  int v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__SBKAsynchronousTask_setCancelType___block_invoke;
  v4[3] = &unk_24E2A8078;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (int)cancelType
{
  NSObject *queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__SBKAsynchronousTask_cancelType__block_invoke;
  v5[3] = &unk_24E2A8118;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setResult:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  SBKAsynchronousTask *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SBKAsynchronousTask_setResult___block_invoke;
  block[3] = &unk_24E2A81C8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)result
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__SBKAsynchronousTask_result__block_invoke;
  v5[3] = &unk_24E2A8118;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  SBKAsynchronousTask *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SBKAsynchronousTask_setError___block_invoke;
  block[3] = &unk_24E2A81C8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (NSError)error
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__SBKAsynchronousTask_error__block_invoke;
  v5[3] = &unk_24E2A8118;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (void)beginTaskOperation
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  SBKAsynchronousTask *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_21E4FD000, v4, OS_LOG_TYPE_DEFAULT, "beginTaskOperation %@", buf, 0xCu);
  }

  -[SBKAsynchronousTask finishedHandler](self, "finishedHandler");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[SBKAsynchronousTask expirationHandler](self, "expirationHandler"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKAsynchronousTask.m"), 201, CFSTR("must have a finish and expiration handler specified"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SBKAsynchronousTask_beginTaskOperation__block_invoke;
  block[3] = &unk_24E2A8240;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *handlerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SBKAsynchronousTask setResult:](self, "setResult:", v6);
  -[SBKAsynchronousTask setError:](self, "setError:", v7);
  -[SBKAsynchronousTask setExpirationHandler:](self, "setExpirationHandler:", 0);
  handlerQueue = self->_handlerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SBKAsynchronousTask_finishTaskOperationWithResult_error___block_invoke;
  block[3] = &unk_24E2A80C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(handlerQueue, block);

}

- (void)endTaskOperation
{
  -[SBKAsynchronousTask finishTaskOperationWithResult:error:](self, "finishTaskOperationWithResult:error:", 0, 0);
  -[SBKAsynchronousTask invalidate](self, "invalidate");
}

- (void)_invalidateAssertion:(BOOL)a3
{
  NSObject *queue;
  void *v4;
  _QWORD block[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SBKAsynchronousTask__invalidateAssertion___block_invoke;
  block[3] = &unk_24E2A80F0;
  v6 = a3;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(queue, block);
  v4 = (void *)v8[5];
  if (v4)
    objc_msgSend(v4, "invalidate");
  _Block_object_dispose(&v7, 8);

}

- (void)invalidate
{
  -[SBKAsynchronousTask _invalidateTimer](self, "_invalidateTimer");
  -[SBKAsynchronousTask setExpirationHandler:](self, "setExpirationHandler:", 0);
  -[SBKAsynchronousTask setFinishedHandler:](self, "setFinishedHandler:", 0);
  -[SBKAsynchronousTask _invalidateAssertion:](self, "_invalidateAssertion:", 0);
}

- (void)addTaskCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x2207AF7FC]();
    v9 = (id)objc_msgSend(v6, "copy");

    -[SBKAsynchronousTask completions](self, "completions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x2207AF7FC](v9);
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)invokeTaskCompletionBlocksWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[6];
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[6];
  _QWORD v22[3];
  char v23;

  v4 = a3;
  -[SBKAsynchronousTask completions](self, "completions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[SBKAsynchronousTask setCompletions:](self, "setCompletions:", 0);
  -[SBKAsynchronousTask result](self, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBKAsynchronousTask error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  queue = self->_queue;
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke;
  block[3] = &unk_24E2A8118;
  block[4] = self;
  block[5] = v22;
  dispatch_sync(queue, block);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_2;
  v16[3] = &unk_24E2A8140;
  v11 = dispatch_group_create();
  v17 = v11;
  v12 = v4;
  v20 = v12;
  v13 = v7;
  v18 = v13;
  v14 = v8;
  v19 = v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v16);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_4;
  v15[3] = &unk_24E2A8118;
  v15[4] = self;
  v15[5] = v22;
  dispatch_group_notify(v11, MEMORY[0x24BDAC9B8], v15);

  _Block_object_dispose(v22, 8);
}

- (MSVTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_taskAssertion, a3);
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong(&self->_finishedHandler, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_debugDescription, 0);
}

uint64_t __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    *(_BYTE *)(v1 + 40) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_3;
  block[3] = &unk_24E2A8290;
  v11 = *(id *)(a1 + 56);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, block);

}

uint64_t __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_4(uint64_t result)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return objc_msgSend(*(id *)(result + 32), "_invalidateAssertion:", 1);
  return result;
}

void __59__SBKAsynchronousTask_invokeTaskCompletionBlocksWithBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __44__SBKAsynchronousTask__invalidateAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 40) || *(_BYTE *)(a1 + 48))
  {
    *(_BYTE *)(v2 + 40) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = 0;

  }
}

void __59__SBKAsynchronousTask_finishTaskOperationWithResult_error___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "finishedHandler");
  v2 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 138412802;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_21E4FD000, v3, OS_LOG_TYPE_DEFAULT, "Invoking completion handler for %@, result = %@, error = %@", (uint8_t *)&v7, 0x20u);
    }

    v2[2](v2);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __41__SBKAsynchronousTask_beginTaskOperation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  id v11;
  id location;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BE65CC0]), "initWithName:pid:subsystem:reason:flags:", CFSTR("SBKAsynchronousTask"), getpid(), CFSTR("com.apple.amp.StoreBookkeeper"), 2, 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__SBKAsynchronousTask_beginTaskOperation__block_invoke_2;
  v10[3] = &unk_24E2A80A0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setInvalidationHandler:", v10);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (v6)
  {
    dispatch_suspend(v6);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 32);
    v9 = dispatch_time(0, (uint64_t)(*(double *)(v7 + 48) * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __41__SBKAsynchronousTask_beginTaskOperation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateTimer");
  objc_msgSend(WeakRetained, "setCancelType:", 1);

}

void __28__SBKAsynchronousTask_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

void __32__SBKAsynchronousTask_setError___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 72);
  v3 = (id *)(v2 + 72);
  if (v1 != v4)
    objc_storeStrong(v3, v1);
}

void __29__SBKAsynchronousTask_result__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

void __33__SBKAsynchronousTask_setResult___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 64);
  v3 = (id *)(v2 + 64);
  if (v1 != v4)
    objc_storeStrong(v3, v1);
}

uint64_t __33__SBKAsynchronousTask_cancelType__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 56) != 0;
  return result;
}

uint64_t __37__SBKAsynchronousTask_setCancelType___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 56))
  {
    *(_DWORD *)(v2 + 56) = v1;
    result = *(_QWORD *)(result + 32);
    if (*(_DWORD *)(result + 56))
      return objc_msgSend((id)result, "_onQueueFireExpirationHandlerIfNecesary");
  }
  return result;
}

uint64_t __62__SBKAsynchronousTask__onQueueFireExpirationHandlerIfNecesary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(a1 + 48);
    v6 = 138412546;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_21E4FD000, v2, OS_LOG_TYPE_DEFAULT, "Invoking expiration handler for %@, with cancelType = %d", (uint8_t *)&v6, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __38__SBKAsynchronousTask_finishedHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __42__SBKAsynchronousTask_setFinishedHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 40);
  if (v2 != *(void **)(*(_QWORD *)(a1 + 32) + 88))
  {
    v3 = objc_msgSend(v2, "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v3;

  }
}

void __40__SBKAsynchronousTask_expirationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __44__SBKAsynchronousTask_setExpirationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 40);
  if (v2 != *(void **)(*(_QWORD *)(a1 + 32) + 80))
  {
    v3 = objc_msgSend(v2, "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v3;

  }
}

void __39__SBKAsynchronousTask__invalidateTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

uint64_t __69__SBKAsynchronousTask_initWithHandlerQueue_timeout_debugDescription___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21E4FD000, v2, OS_LOG_TYPE_ERROR, "[SBKAsynchronousTask] WARNING: task timed out: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_invalidateTimer");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAssertion:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setCancelType:", 2);
}

@end
