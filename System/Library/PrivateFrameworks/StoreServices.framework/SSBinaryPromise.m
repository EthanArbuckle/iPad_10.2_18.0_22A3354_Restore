@implementation SSBinaryPromise

- (SSBinaryPromise)init
{
  SSBinaryPromise *v2;
  SSPromise *v3;
  SSPromise *backingPromise;
  NSObject *v5;
  _QWORD block[4];
  SSBinaryPromise *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSBinaryPromise;
  v2 = -[SSBinaryPromise init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SSPromise);
    backingPromise = v2->_backingPromise;
    v2->_backingPromise = v3;

    +[SSBinaryPromise _globalPromiseStorageAccessQueue](SSBinaryPromise, "_globalPromiseStorageAccessQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__SSBinaryPromise_init__block_invoke;
    block[3] = &unk_1E47B8790;
    v8 = v2;
    dispatch_sync(v5, block);

  }
  return v2;
}

void __23__SSBinaryPromise_init__block_invoke(uint64_t a1)
{
  id v2;

  +[SSBinaryPromise _globalPromiseStorage](SSBinaryPromise, "_globalPromiseStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

+ (id)promiseWithError:(id)a3
{
  id v3;
  SSBinaryPromise *v4;

  v3 = a3;
  v4 = objc_alloc_init(SSBinaryPromise);
  -[SSBinaryPromise finishWithError:](v4, "finishWithError:", v3);

  return v4;
}

+ (id)promiseWithPromise:(id)a3
{
  id v3;
  SSBinaryPromise *v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a3;
  v4 = objc_alloc_init(SSBinaryPromise);
  objc_initWeak(&location, v4);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__SSBinaryPromise_promiseWithPromise___block_invoke;
  v9[3] = &unk_1E47BB8C0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "addSuccessBlock:", v9);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __38__SSBinaryPromise_promiseWithPromise___block_invoke_2;
  v7[3] = &unk_1E47BAC68;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "addErrorBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

void __38__SSBinaryPromise_promiseWithPromise___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishWithSuccess");

}

void __38__SSBinaryPromise_promiseWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "finishWithError:", v3);

}

+ (id)promiseWithSuccess
{
  SSBinaryPromise *v2;

  v2 = objc_alloc_init(SSBinaryPromise);
  -[SSBinaryPromise finishWithSuccess](v2, "finishWithSuccess");
  return v2;
}

- (void)addErrorBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addErrorBlock:", v4);

}

- (void)addFinishBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__SSBinaryPromise_addFinishBlock___block_invoke;
  v7[3] = &unk_1E47BB2D0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addFinishBlock:", v7);

}

void __34__SSBinaryPromise_addFinishBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "BOOLValue"), v5);

}

- (void)addSuccessBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__SSBinaryPromise_addSuccessBlock___block_invoke;
  v7[3] = &unk_1E47BB8E8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addSuccessBlock:", v7);

}

uint64_t __35__SSBinaryPromise_addSuccessBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)finishWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SSBinaryPromise backingPromise](self, "backingPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "finishWithError:", v4);

  -[SSBinaryPromise _removeFromGlobalPromiseStorage](self, "_removeFromGlobalPromiseStorage");
  return v6;
}

- (BOOL)finishWithSuccess
{
  void *v3;
  char v4;

  -[SSBinaryPromise backingPromise](self, "backingPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

  -[SSBinaryPromise _removeFromGlobalPromiseStorage](self, "_removeFromGlobalPromiseStorage");
  return v4;
}

- (BOOL)resultWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[SSBinaryPromise backingPromise](self, "backingPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v5 != 0;

  return (char)a3;
}

- (BOOL)resultWithTimeout:(double)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  -[SSBinaryPromise backingPromise](self, "backingPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultWithTimeout:error:", a4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = v7 != 0;

  return (char)a4;
}

- (void)waitUntilFinished
{
  id v2;

  -[SSBinaryPromise backingPromise](self, "backingPromise");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilFinished");

}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v4;

  -[SSBinaryPromise backingPromise](self, "backingPromise");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "waitUntilFinishedWithTimeout:", a3);

}

- (id)completionHandlerAdapter
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, int, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __43__SSBinaryPromise_completionHandlerAdapter__block_invoke;
  v8 = &unk_1E47BB910;
  objc_copyWeak(&v9, &location);
  v2 = (void *)MEMORY[0x1A8585DF0](&v5);
  v3 = (void *)objc_msgSend(v2, "copy", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __43__SSBinaryPromise_completionHandlerAdapter__block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "finishWithSuccess");
  else
    objc_msgSend(WeakRetained, "finishWithError:", v7);

}

- (id)promiseAdapter
{
  SSPromise *v3;
  uint64_t v4;
  SSPromise *v5;
  SSPromise *v6;
  SSPromise *v7;
  SSPromise *v8;
  _QWORD v10[4];
  SSPromise *v11;
  _QWORD v12[4];
  SSPromise *v13;

  v3 = objc_alloc_init(SSPromise);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33__SSBinaryPromise_promiseAdapter__block_invoke;
  v12[3] = &unk_1E47B8790;
  v5 = v3;
  v13 = v5;
  -[SSBinaryPromise addSuccessBlock:](self, "addSuccessBlock:", v12);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __33__SSBinaryPromise_promiseAdapter__block_invoke_2;
  v10[3] = &unk_1E47B9F78;
  v6 = v5;
  v11 = v6;
  -[SSBinaryPromise addErrorBlock:](self, "addErrorBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

uint64_t __33__SSBinaryPromise_promiseAdapter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

uint64_t __33__SSBinaryPromise_promiseAdapter__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

+ (id)_globalPromiseStorage
{
  if (_globalPromiseStorage_onceToken != -1)
    dispatch_once(&_globalPromiseStorage_onceToken, &__block_literal_global_10);
  return (id)_globalPromiseStorage_sGlobalPromiseStorage;
}

void __40__SSBinaryPromise__globalPromiseStorage__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_globalPromiseStorage_sGlobalPromiseStorage;
  _globalPromiseStorage_sGlobalPromiseStorage = (uint64_t)v0;

}

+ (id)_globalPromiseStorageAccessQueue
{
  if (_globalPromiseStorageAccessQueue_onceToken != -1)
    dispatch_once(&_globalPromiseStorageAccessQueue_onceToken, &__block_literal_global_8);
  return (id)_globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue;
}

void __51__SSBinaryPromise__globalPromiseStorageAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.StoreServices.SSBinaryPromise.globalPromiseStorageAccessQueue", 0);
  v1 = (void *)_globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue;
  _globalPromiseStorageAccessQueue_sGlobalPromiseStorageQueue = (uint64_t)v0;

}

- (void)_removeFromGlobalPromiseStorage
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  +[SSBinaryPromise _globalPromiseStorageAccessQueue](SSBinaryPromise, "_globalPromiseStorageAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__SSBinaryPromise__removeFromGlobalPromiseStorage__block_invoke;
  v3[3] = &unk_1E47BA068;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__SSBinaryPromise__removeFromGlobalPromiseStorage__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[SSBinaryPromise _globalPromiseStorage](SSBinaryPromise, "_globalPromiseStorage");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObject:", WeakRetained);

  }
}

- (SSPromise)backingPromise
{
  return self->_backingPromise;
}

- (void)setBackingPromise:(id)a3
{
  objc_storeStrong((id *)&self->_backingPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingPromise, 0);
}

@end
