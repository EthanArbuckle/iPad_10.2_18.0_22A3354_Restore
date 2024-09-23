@implementation SSUniqueExecutionQueue

- (SSUniqueExecutionQueue)initWithBlock:(id)a3
{
  id v4;
  SSUniqueExecutionQueue *v5;
  uint64_t v6;
  id block;
  dispatch_queue_t v8;
  OS_dispatch_queue *callBlockQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *executeBlockQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *promiseAccessQueue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSUniqueExecutionQueue;
  v5 = -[SSUniqueExecutionQueue init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v8 = dispatch_queue_create("com.apple.StoreServices.SSUniqueExecutionQueue.callBlockQueue", MEMORY[0x1E0C80D50]);
    callBlockQueue = v5->_callBlockQueue;
    v5->_callBlockQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.StoreServices.SSUniqueExecutionQueue.executeBlockQueue", 0);
    executeBlockQueue = v5->_executeBlockQueue;
    v5->_executeBlockQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.StoreServices.SSUniqueExecutionQueue.promiseAccessQueue", 0);
    promiseAccessQueue = v5->_promiseAccessQueue;
    v5->_promiseAccessQueue = (OS_dispatch_queue *)v12;

  }
  return v5;
}

- (void)addCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SSUniqueExecutionQueue promiseAccessQueue](self, "promiseAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke;
  block[3] = &unk_1E47BA0E0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  SSPromise *v5;
  SSPromise *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD block[4];
  SSPromise *v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _WORD v51[8];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (!WeakRetained)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = objc_msgSend(v27, "shouldLog");
    if (objc_msgSend(v27, "shouldLogToDisk"))
      v29 = v28 | 2;
    else
      v29 = v28;
    objc_msgSend(v27, "OSLogObject");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      v31 = v29;
    else
      v31 = v29 & 2;
    if (v31)
    {
      v51[0] = 0;
      LODWORD(v40) = 2;
      v32 = (void *)_os_log_send_and_compose_impl();

      if (!v32)
      {
LABEL_30:

        v39 = *(_QWORD *)(a1 + 32);
        SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
        v5 = (SSPromise *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, SSPromise *))(v39 + 16))(v39, 0, v5);
        goto LABEL_32;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v32, 4, v51, v40);
      v30 = objc_claimAutoreleasedReturnValue();
      free(v32);
      SSFileLog(v27, CFSTR("%@"), v33, v34, v35, v36, v37, v38, (uint64_t)v30);
    }

    goto LABEL_30;
  }
  objc_msgSend(WeakRetained, "promise");
  v5 = (SSPromise *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc_init(SSPromise);
    objc_msgSend(v4, "setPromise:", v6);
    v7 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_6;
    v49[3] = &unk_1E47BA090;
    objc_copyWeak(&v50, v2);
    -[SSPromise addFinishBlock:](v6, "addFinishBlock:", v49);
    objc_msgSend(v4, "executeBlockQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_2;
    block[3] = &unk_1E47BA0B8;
    objc_copyWeak(&v48, v2);
    v5 = v6;
    v47 = v5;
    dispatch_async(v8, block);

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
  }
  if (!-[SSPromise isFinished](v5, "isFinished"))
  {
    -[SSPromise addFinishBlock:](v5, "addFinishBlock:", *(_QWORD *)(a1 + 32));
    goto LABEL_32;
  }
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
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    v13 = v11;
  else
    v13 = v11 & 2;
  if (!v13)
    goto LABEL_16;
  v51[0] = 0;
  LODWORD(v40) = 2;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, v51, v40);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog(v9, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v12);
LABEL_16:

  }
  v45 = 0;
  -[SSPromise resultWithError:](v5, "resultWithError:", &v45);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v45;
  objc_msgSend(v4, "callBlockQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_11;
  v41[3] = &unk_1E47B8608;
  v24 = *(id *)(a1 + 32);
  v43 = v22;
  v44 = v24;
  v42 = v21;
  v25 = v22;
  v26 = v21;
  dispatch_async(v23, v41);

LABEL_32:
}

void __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_6(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  _WORD v20[8];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v20[0] = 0;
      LODWORD(v17) = 2;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, v20, v17);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
  objc_msgSend(WeakRetained, "promiseAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_7;
  block[3] = &unk_1E47BA068;
  objc_copyWeak(&v19, v1);
  dispatch_async(v4, block);

  objc_destroyWeak(&v19);
LABEL_16:

}

void __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPromise:", 0);

}

void __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _WORD v29[8];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v14 = v12;
    else
      v14 = v12 & 2;
    if (v14)
    {
      v29[0] = 0;
      LODWORD(v23) = 2;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        v22 = *(void **)(a1 + 32);
        SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "finishWithError:", v8);
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, v29, v23);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
  objc_msgSend(WeakRetained, "block");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v28 = 0;
  ((void (**)(_QWORD, id *))v4)[2](v4, &v28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v28;

  objc_msgSend(v3, "callBlockQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_10;
  block[3] = &unk_1E47B87B8;
  v25 = *(id *)(a1 + 32);
  v26 = v5;
  v27 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

LABEL_16:
}

uint64_t __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __45__SSUniqueExecutionQueue_addCompletionBlock___block_invoke_11(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)callBlockQueue
{
  return self->_callBlockQueue;
}

- (void)setCallBlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callBlockQueue, a3);
}

- (OS_dispatch_queue)executeBlockQueue
{
  return self->_executeBlockQueue;
}

- (void)setExecuteBlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executeBlockQueue, a3);
}

- (SSPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (OS_dispatch_queue)promiseAccessQueue
{
  return self->_promiseAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseAccessQueue, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_executeBlockQueue, 0);
  objc_storeStrong((id *)&self->_callBlockQueue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
