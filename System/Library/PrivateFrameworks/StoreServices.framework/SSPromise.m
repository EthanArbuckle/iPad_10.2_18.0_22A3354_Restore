@implementation SSPromise

void __17__SSPromise_init__block_invoke(uint64_t a1)
{
  id v2;

  +[SSPromise _globalPromiseStorage](SSPromise, "_globalPromiseStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

void __36__SSPromise_finishWithResult_error___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SSPromise _globalPromiseStorage](SSPromise, "_globalPromiseStorage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObject:", WeakRetained);

}

+ (id)_globalPromiseStorage
{
  if (_globalPromiseStorage_onceToken_0 != -1)
    dispatch_once(&_globalPromiseStorage_onceToken_0, &__block_literal_global_20_1);
  return (id)_globalPromiseStorage_sGlobalPromiseStorage_0;
}

- (id)thenWithBlock:(id)a3
{
  id v4;
  SSPromise *v5;
  id v6;
  SSPromise *v7;
  SSPromise *v8;
  SSPromise *v9;
  _QWORD v11[4];
  SSPromise *v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __27__SSPromise_thenWithBlock___block_invoke;
  v11[3] = &unk_1E47BEDB8;
  objc_copyWeak(&v14, &location);
  v6 = v4;
  v13 = v6;
  v7 = v5;
  v12 = v7;
  -[SSPromise addFinishBlock:](self, "addFinishBlock:", v11);
  v8 = v12;
  v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (void)addFinishBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[SSPromise completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__SSPromise_addFinishBlock___block_invoke;
  v12[3] = &unk_1E47B8AC0;
  v13 = v5;
  v14 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __28__SSPromise_addFinishBlock___block_invoke_2;
  v9[3] = &unk_1E47BED90;
  v10 = v13;
  v11 = v14;
  v7 = v14;
  v8 = v13;
  -[SSPromise _addBlock:orCallWithResult:](self, "_addBlock:orCallWithResult:", v12, v9);

}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  SSPromiseResult *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v46;
  uint64_t v47;
  _QWORD block[4];
  id v49;
  _BYTE location[12];
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  v8 = (void *)v7;
  if (!v6 || !v7)
  {
    if (v6 | v7)
      goto LABEL_26;
    SSPromiseLogConfig();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v23 = v22 | 2;
    else
      v23 = v22;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v23 &= 2u;
    if (v23)
    {
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = objc_opt_class();
      v24 = *(id *)&location[4];
      LODWORD(v47) = 12;
      v46 = location;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
        goto LABEL_25;
      goto LABEL_12;
    }
LABEL_24:

    goto LABEL_25;
  }
  SSPromiseLogConfig();
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
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    v11 &= 2u;
  if (!v11)
    goto LABEL_24;
  *(_DWORD *)location = 138543874;
  *(_QWORD *)&location[4] = objc_opt_class();
  v51 = 2114;
  v52 = v6;
  v53 = 2114;
  v54 = v8;
  v13 = *(id *)&location[4];
  LODWORD(v47) = 32;
  v46 = location;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, location, v47);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);

  }
LABEL_25:

LABEL_26:
  -[SSPromise stateLock](self, "stateLock", v46);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lock");

  -[SSPromise stateLock](self, "stateLock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "condition");

  if (v27 == 1)
  {
    SSPromiseLogConfig();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = objc_msgSend(v32, "shouldLog");
    if (objc_msgSend(v32, "shouldLogToDisk"))
      v34 = v33 | 2;
    else
      v34 = v33;
    objc_msgSend(v32, "OSLogObject");
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      v34 &= 2u;
    if (v34)
    {
      v36 = (void *)objc_opt_class();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v36;
      v37 = v36;
      LODWORD(v47) = 12;
      v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_39:

        -[SSPromise stateLock](self, "stateLock");
        v28 = (SSPromiseResult *)objc_claimAutoreleasedReturnValue();
        -[SSPromiseResult unlock](v28, "unlock");
        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v38, 4, location, v47);
      v35 = objc_claimAutoreleasedReturnValue();
      free(v38);
      SSFileLog(v32, CFSTR("%@"), v39, v40, v41, v42, v43, v44, (uint64_t)v35);
    }

    goto LABEL_39;
  }
  v28 = -[SSPromiseResult initWithResult:error:]([SSPromiseResult alloc], "initWithResult:error:", v6, v8);
  -[SSPromise setPromiseResult:](self, "setPromiseResult:", v28);
  -[SSPromise stateLock](self, "stateLock");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "unlockWithCondition:", 1);

  -[SSPromise completionBlocks](self, "completionBlocks");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "flushCompletionBlocksWithPromiseResult:", v28);

  objc_initWeak((id *)location, self);
  +[SSPromise _globalPromiseStorageAccessQueue](SSPromise, "_globalPromiseStorageAccessQueue");
  v31 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SSPromise_finishWithResult_error___block_invoke;
  block[3] = &unk_1E47BA068;
  objc_copyWeak(&v49, (id *)location);
  dispatch_async(v31, block);

  objc_destroyWeak(&v49);
  objc_destroyWeak((id *)location);
LABEL_40:

  return v27 != 1;
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (SSPromiseCompletionBlocks)completionBlocks
{
  return self->_completionBlocks;
}

- (void)_addBlock:(id)a3 orCallWithResult:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);

  v11 = (void (**)(void))a3;
  v6 = (void (**)(id, void *))a4;
  -[SSPromise stateLock](self, "stateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  -[SSPromise promiseResult](self, "promiseResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SSPromise stateLock](self, "stateLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

    v6[2](v6, v8);
  }
  else
  {
    v11[2]();
    -[SSPromise stateLock](self, "stateLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlock");

  }
}

- (SSPromiseResult)promiseResult
{
  return self->_promiseResult;
}

- (void)setPromiseResult:(id)a3
{
  objc_storeStrong((id *)&self->_promiseResult, a3);
}

- (SSPromise)init
{
  SSPromise *v2;
  SSPromiseCompletionBlocks *v3;
  SSPromiseCompletionBlocks *completionBlocks;
  uint64_t v5;
  NSConditionLock *stateLock;
  NSObject *v7;
  _QWORD block[4];
  SSPromise *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSPromise;
  v2 = -[SSPromise init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SSPromiseCompletionBlocks);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v5;

    +[SSPromise _globalPromiseStorageAccessQueue](SSPromise, "_globalPromiseStorageAccessQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __17__SSPromise_init__block_invoke;
    block[3] = &unk_1E47B8790;
    v10 = v2;
    dispatch_sync(v7, block);

  }
  return v2;
}

+ (id)_globalPromiseStorageAccessQueue
{
  if (_globalPromiseStorageAccessQueue_onceToken_0 != -1)
    dispatch_once(&_globalPromiseStorageAccessQueue_onceToken_0, &__block_literal_global_22_1);
  return (id)_globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue_0;
}

- (BOOL)finishWithResult:(id)a3
{
  return -[SSPromise finishWithResult:error:](self, "finishWithResult:error:", a3, 0);
}

+ (void)_finishPromise:(id)a3 withPromise:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__SSPromise__finishPromise_withPromise___block_invoke;
  v12[3] = &unk_1E47BEE80;
  v7 = v5;
  v13 = v7;
  v8 = a4;
  objc_msgSend(v8, "addSuccessBlock:", v12);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __40__SSPromise__finishPromise_withPromise___block_invoke_2;
  v10[3] = &unk_1E47B9F78;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "addErrorBlock:", v10);

}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[SSPromise completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__SSPromise_addSuccessBlock___block_invoke;
  v12[3] = &unk_1E47B8AC0;
  v13 = v5;
  v14 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __29__SSPromise_addSuccessBlock___block_invoke_2;
  v9[3] = &unk_1E47BED90;
  v10 = v13;
  v11 = v14;
  v7 = v14;
  v8 = v13;
  -[SSPromise _addBlock:orCallWithResult:](self, "_addBlock:orCallWithResult:", v12, v9);

}

- (void)addErrorBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[SSPromise completionBlocks](self, "completionBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __27__SSPromise_addErrorBlock___block_invoke;
  v12[3] = &unk_1E47B8AC0;
  v13 = v5;
  v14 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __27__SSPromise_addErrorBlock___block_invoke_2;
  v9[3] = &unk_1E47BED90;
  v10 = v13;
  v11 = v14;
  v7 = v14;
  v8 = v13;
  -[SSPromise _addBlock:orCallWithResult:](self, "_addBlock:orCallWithResult:", v12, v9);

}

void __27__SSPromise_thenWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v8)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    +[SSPromise promiseWithError:](SSPromise, "promiseWithError:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_finishPromise:withPromise:", *(_QWORD *)(a1 + 32), v7);

}

uint64_t __29__SSPromise_addSuccessBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSuccessBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __28__SSPromise_addFinishBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCompletionBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__SSPromise__finishPromise_withPromise___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

+ (SSPromise)promiseWithResult:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "finishWithResult:", v3);

  return (SSPromise *)v4;
}

uint64_t __29__SSPromise_addSuccessBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callSuccessBlock:withPromiseResult:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __27__SSPromise_addErrorBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callErrorBlock:withPromiseResult:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __27__SSPromise_addErrorBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addErrorBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __28__SSPromise_addFinishBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callCompletionBlock:withPromiseResult:", *(_QWORD *)(a1 + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_promiseResult, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

- (id)resultWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSPromise resultBeforeDate:error:](self, "resultBeforeDate:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[SSPromise stateLock](self, "stateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lockWhenCondition:beforeDate:", 1, v6);

  if ((v8 & 1) != 0)
  {
    -[SSPromise promiseResult](self, "promiseResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPromise stateLock](self, "stateLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlock");

    objc_msgSend(v9, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 && !v11)
    {
      objc_msgSend(v9, "error");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 149, 0, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)completionHandlerAdapter
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __37__SSPromise_completionHandlerAdapter__block_invoke;
  v8 = &unk_1E47BA090;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1A8585DF0](&v5);
  v3 = (void *)objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __34__SSPromise__globalPromiseStorage__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_globalPromiseStorage_sGlobalPromiseStorage_0;
  _globalPromiseStorage_sGlobalPromiseStorage_0 = (uint64_t)v0;

}

void __45__SSPromise__globalPromiseStorageAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.StoreServices.SSPromise.globalPromiseStorageAccessQueue", 0);
  v1 = (void *)_globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue_0;
  _globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue_0 = (uint64_t)v0;

}

void __37__SSPromise_completionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "finishWithResult:error:", v6, v5);

}

+ (SSPromise)promiseWithError:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "finishWithError:", v3);

  return (SSPromise *)v4;
}

+ (SSPromise)promiseWithAll:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "_configureAllPromise:withResults:promises:currentPromiseIndex:", v4, v5, v3, 0);

  return (SSPromise *)v4;
}

+ (SSPromise)promiseWithAny:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend((id)objc_opt_class(), "_configureAnyPromise:withPomises:currentPromiseIndex:", v4, v3, 0);

  return (SSPromise *)v4;
}

- (BOOL)isCancelled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[SSPromise stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (-[SSPromise _isFinished](self, "_isFinished"))
  {
    v4 = (void *)objc_opt_class();
    -[SSPromise promiseResult](self, "promiseResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "_errorIsCanceledError:", v6);

  }
  else
  {
    v7 = 0;
  }
  -[SSPromise stateLock](self, "stateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  return v7;
}

- (BOOL)isFinished
{
  void *v3;
  void *v4;

  -[SSPromise stateLock](self, "stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = -[SSPromise _isFinished](self, "_isFinished");
  -[SSPromise stateLock](self, "stateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSPromise resultBeforeDate:error:](self, "resultBeforeDate:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)waitUntilFinished
{
  id v2;

  v2 = -[SSPromise resultWithError:](self, "resultWithError:", 0);
}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v3;

  v3 = -[SSPromise resultWithTimeout:error:](self, "resultWithTimeout:error:", 0, a3);
}

- (id)catchWithBlock:(id)a3
{
  id v4;
  SSPromise *v5;
  id v6;
  SSPromise *v7;
  SSPromise *v8;
  SSPromise *v9;
  _QWORD v11[4];
  SSPromise *v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __28__SSPromise_catchWithBlock___block_invoke;
  v11[3] = &unk_1E47BEDB8;
  objc_copyWeak(&v14, &location);
  v6 = v4;
  v13 = v6;
  v7 = v5;
  v12 = v7;
  -[SSPromise addFinishBlock:](self, "addFinishBlock:", v11);
  v8 = v12;
  v9 = v7;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __28__SSPromise_catchWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_finishPromise:withPromise:", *(_QWORD *)(a1 + 32), v7);

}

- (BOOL)cancel
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SSPromise finishWithResult:error:](self, "finishWithResult:error:", 0, v3);

  return (char)self;
}

- (BOOL)finishWithError:(id)a3
{
  return -[SSPromise finishWithResult:error:](self, "finishWithResult:error:", 0, a3);
}

- (id)BOOLCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, char, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __41__SSPromise_BOOLCompletionHandlerAdapter__block_invoke;
  v8 = &unk_1E47BB910;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1A8585DF0](&v5);
  v3 = (void *)objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __41__SSPromise_BOOLCompletionHandlerAdapter__block_invoke(uint64_t a1, char a2, void *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:error:", v7, v8);

  }
  else
  {
    objc_msgSend(WeakRetained, "finishWithResult:error:", 0, v8);
  }

}

- (id)errorOnlyCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __46__SSPromise_errorOnlyCompletionHandlerAdapter__block_invoke;
  v8 = &unk_1E47BAC68;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1A8585DF0](&v5);
  v3 = (void *)objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __46__SSPromise_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "finishWithError:", v5);
  else
    objc_msgSend(WeakRetained, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

}

- (id)nilValueCompletionHandlerAdapter
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __45__SSPromise_nilValueCompletionHandlerAdapter__block_invoke;
  v8 = &unk_1E47BA090;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1A8585DF0](&v5);
  v3 = (void *)objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __45__SSPromise_nilValueCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (v9 | v5)
  {
    if (v9)
      objc_msgSend(WeakRetained, "finishWithResult:");
    else
      objc_msgSend(WeakRetained, "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v8);

  }
}

+ (void)_configureAllPromise:(id)a3 withResults:(id)a4 promises:(id)a5 currentPromiseIndex:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  unint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectAtIndexedSubscript:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1);
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__SSPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke;
  v24[3] = &unk_1E47BEDE0;
  objc_copyWeak(v28, &location);
  v15 = v11;
  v25 = v15;
  v28[1] = (id)a6;
  v16 = v12;
  v26 = v16;
  v17 = v10;
  v27 = v17;
  objc_msgSend(v13, "addSuccessBlock:", v24);
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __75__SSPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke_2;
  v20[3] = &unk_1E47BEE08;
  v23 = a6;
  v18 = v16;
  v21 = v18;
  v19 = v17;
  v22 = v19;
  objc_msgSend(v13, "addErrorBlock:", v20);

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

}

void __75__SSPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  id WeakRetained;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  v5 = *(_QWORD *)(a1 + 64);
  if (v5 == objc_msgSend(*(id *)(a1 + 40), "count") - 1)
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "_configureAllPromise:withResults:promises:currentPromiseIndex:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + 1);

}

void __75__SSPromise__configureAllPromise_withResults_promises_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t i;
  void *v4;
  id v5;

  v5 = a2;
  for (i = *(_QWORD *)(a1 + 48) + 1; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);

}

+ (void)_configureAnyPromise:(id)a3 withPomises:(id)a4 currentPromiseIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  _QWORD v20[4];
  id v21;
  id v22;
  unint64_t v23;
  id location;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "objectAtIndexedSubscript:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1);
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__SSPromise__configureAnyPromise_withPomises_currentPromiseIndex___block_invoke;
  v20[3] = &unk_1E47BEE30;
  v23 = a5;
  v12 = v9;
  v21 = v12;
  v13 = v8;
  v22 = v13;
  objc_msgSend(v10, "addSuccessBlock:", v20);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __66__SSPromise__configureAnyPromise_withPomises_currentPromiseIndex___block_invoke_2;
  v16[3] = &unk_1E47BEE58;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a5;
  v14 = v12;
  v17 = v14;
  v15 = v13;
  v18 = v15;
  objc_msgSend(v10, "addErrorBlock:", v16);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __66__SSPromise__configureAnyPromise_withPomises_currentPromiseIndex___block_invoke(uint64_t a1, void *a2)
{
  unint64_t i;
  void *v4;
  id v5;

  v5 = a2;
  for (i = *(_QWORD *)(a1 + 48) + 1; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);

}

void __66__SSPromise__configureAnyPromise_withPomises_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 == objc_msgSend(*(id *)(a1 + 32), "count") - 1)
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  else
    objc_msgSend(WeakRetained, "_configureAnyPromise:withPomises:currentPromiseIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56) + 1);

}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    v5 = objc_msgSend(v3, "code") == 3072;
  else
    v5 = 0;

  return v5;
}

uint64_t __40__SSPromise__finishPromise_withPromise___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (BOOL)_isFinished
{
  void *v2;
  BOOL v3;

  -[SSPromise stateLock](self, "stateLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "condition") == 1;

  return v3;
}

- (void)setCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocks, a3);
}

- (void)setStateLock:(id)a3
{
  objc_storeStrong((id *)&self->_stateLock, a3);
}

@end
