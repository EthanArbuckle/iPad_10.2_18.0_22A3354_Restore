@implementation SKUIURLBag

+ (ISOperationQueue)bagQueue
{
  if (bagQueue_onceToken != -1)
    dispatch_once(&bagQueue_onceToken, &__block_literal_global_19);
  return (ISOperationQueue *)(id)bagQueue_bagQueue;
}

uint64_t __22__SKUIURLBag_bagQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DDC190]);
  v1 = (void *)bagQueue_bagQueue;
  bagQueue_bagQueue = (uint64_t)v0;

  return objc_msgSend((id)bagQueue_bagQueue, "setName:", CFSTR("com.apple.storekit.bag-queue"));
}

+ (id)URLBagForContext:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("+[SKUIURLBag URLBagForContext:] is not supported"));
  return 0;
}

- (void)getTrustForURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke;
  v10[3] = &unk_1E73A45A0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SSURLBag dispatchAsync:](self, "dispatchAsync:", v10);

}

void __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id *v7;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  char v14;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[9];
  if (v4)
  {
    v5 = objc_msgSend(v4, "urlIsTrusted:", *(_QWORD *)(a1 + 40));
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke_2;
    block[3] = &unk_1E73A33F8;
    v7 = &v13;
    v13 = *(id *)(a1 + 48);
    v14 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke_3;
    v9[3] = &unk_1E73A4578;
    v7 = &v11;
    v11 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_enqueueOperationWithContext:completionBlock:", a2, v9);
    v6 = v10;
  }

}

uint64_t __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __45__SKUIURLBag_getTrustForURL_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "urlIsTrusted:", v5), v6);

}

- (void)invalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __24__SKUIURLBag_invalidate__block_invoke;
  v2[3] = &unk_1E73A45C8;
  v2[4] = self;
  -[SSURLBag dispatchAsync:](self, "dispatchAsync:", v2);
}

void __24__SKUIURLBag_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setCompletionBlock:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "cancel");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = 0;

}

- (void)loadValueForKey:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke;
  v10[3] = &unk_1E73A45A0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SSURLBag dispatchAsync:](self, "dispatchAsync:", v10);

}

void __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[9];
  if (v4)
  {
    objc_msgSend(v4, "valueForKey:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke_2;
    block[3] = &unk_1E73A17D0;
    v7 = *(id *)(a1 + 48);
    v14 = v5;
    v15 = v7;
    v8 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke_3;
    v10[3] = &unk_1E73A4578;
    v12 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_enqueueOperationWithContext:completionBlock:", a2, v10);

    v8 = v12;
  }

}

uint64_t __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __46__SKUIURLBag_loadValueForKey_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(a2, "valueForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__33;
  v26 = __Block_byref_object_dispose__33;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__33;
  v20 = __Block_byref_object_dispose__33;
  v21 = 0;
  v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__SKUIURLBag_valueForKey_error___block_invoke;
  v12[3] = &unk_1E73A45F0;
  v14 = &v16;
  v15 = &v22;
  v8 = v7;
  v13 = v8;
  -[SKUIURLBag loadValueForKey:completionBlock:](self, "loadValueForKey:completionBlock:", v6, v12);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (void *)v23[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = (void *)v23[5];
  }
  v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __32__SKUIURLBag_valueForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)existingBagDictionary
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__SKUIURLBag_existingBagDictionary__block_invoke;
  v4[3] = &unk_1E73A4618;
  v4[4] = self;
  v4[5] = &v5;
  -[SSURLBag dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__SKUIURLBag_existingBagDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "URLBagDictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)loadWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SKUIURLBag_loadWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E73A4668;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSURLBag dispatchAsync:](self, "dispatchAsync:", v6);

}

void __38__SKUIURLBag_loadWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD block[4];
  id v13;
  id v14;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[9];
  if (v4)
  {
    objc_msgSend(v4, "URLBagDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__SKUIURLBag_loadWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E73A17D0;
    v7 = *(id *)(a1 + 40);
    v13 = v5;
    v14 = v7;
    v8 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__SKUIURLBag_loadWithCompletionBlock___block_invoke_3;
    v10[3] = &unk_1E73A4640;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_enqueueOperationWithContext:completionBlock:", a2, v10);
    v8 = v11;
  }

}

uint64_t __38__SKUIURLBag_loadWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __38__SKUIURLBag_loadWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "URLBagDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (id)storeFrontIdentifier
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SKUIURLBag_storeFrontIdentifier__block_invoke;
  v4[3] = &unk_1E73A4618;
  v4[4] = self;
  v4[5] = &v5;
  -[SSURLBag dispatchSync:](self, "dispatchSync:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __34__SKUIURLBag_storeFrontIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "storeFrontIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_enqueueOperationWithContext:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *completionBlocks;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  ISLoadURLBagOperation *v14;
  ISLoadURLBagOperation *operation;
  ISLoadURLBagOperation *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *);
  void *v21;
  id v22;
  id v23;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "copy");
  completionBlocks = self->_completionBlocks;
  if (!completionBlocks)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = self->_completionBlocks;
    self->_completionBlocks = v10;

    completionBlocks = self->_completionBlocks;
  }
  v12 = _Block_copy(v8);
  -[NSMutableArray addObject:](completionBlocks, "addObject:", v12);

  if (!self->_operation)
  {
    if (self->_forceInvalidationForNextLoad)
    {
      v13 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v13, "setIgnoresCaches:", 1);

      self->_forceInvalidationForNextLoad = 0;
      v6 = v13;
    }
    v14 = (ISLoadURLBagOperation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC170]), "initWithBagContext:", v6);
    operation = self->_operation;
    self->_operation = v14;

    objc_initWeak(&location, self->_operation);
    objc_initWeak(&from, self);
    v16 = self->_operation;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __59__SKUIURLBag__enqueueOperationWithContext_completionBlock___block_invoke;
    v21 = &unk_1E739FEA0;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, &location);
    -[ISLoadURLBagOperation setCompletionBlock:](v16, "setCompletionBlock:", &v18);
    objc_msgSend((id)objc_opt_class(), "bagQueue", v18, v19, v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addOperation:", self->_operation);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

void __59__SKUIURLBag__enqueueOperationWithContext_completionBlock___block_invoke(id *a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v1 = a1;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v1 += 5;
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "URLBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_finishOperationWithURLBag:error:", v4, v6);

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "setCompletionBlock:", 0);

}

- (void)_finishOperationWithURLBag:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SKUIURLBag *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__SKUIURLBag__finishOperationWithURLBag_error___block_invoke;
  v10[3] = &unk_1E73A4690;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[SSURLBag dispatchAsync:](self, "dispatchAsync:", v10);

}

void __47__SKUIURLBag__finishOperationWithURLBag_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 72), v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setCompletionBlock:", 0);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = 0;

  v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "copy");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = 0;

  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SKUIURLBag__finishOperationWithURLBag_error___block_invoke_2;
  block[3] = &unk_1E73A02E8;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 48);
  v9 = v5;
  dispatch_async(v8, block);

}

void __47__SKUIURLBag__finishOperationWithURLBag_error___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
