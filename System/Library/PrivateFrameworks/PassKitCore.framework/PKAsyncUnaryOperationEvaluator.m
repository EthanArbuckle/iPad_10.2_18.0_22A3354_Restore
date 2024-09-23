@implementation PKAsyncUnaryOperationEvaluator

void __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)evaluateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id completion;
  PKAsyncUnaryOperationEvaluator *v7;
  PKAsyncUnaryOperationEvaluator *v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_started)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKAsyncUnaryOperationEvaluator (%p): operations may only be started once."), self);
  self->_started = 1;
  v5 = _Block_copy(v4);
  completion = self->_completion;
  self->_completion = v5;

  os_unfair_lock_unlock(&self->_lock);
  if (-[PKAsyncUnaryOperationEvaluator _performOperation](self, "_performOperation"))
    v7 = 0;
  else
    v7 = self;
  v8 = v7;

  return v8;
}

void __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6;
  unsigned __int8 *v7;
  uint64_t v9;
  os_unfair_lock_s *v10;
  int v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v6 = a2;
  v7 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v16 = v6;
  do
  {
    if (__ldaxr(v7))
    {
      __clrex();
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKAsyncUnaryOperationEvaluator (%p): operation completion must only be called once."), *(_QWORD *)(a1 + 32), v6);
      goto LABEL_22;
    }
  }
  while (__stlxr(1u, v7));
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("PKAsyncUnaryOperationComposer: operation must maintain non-nil input."));
  v9 = *(_QWORD *)_performOperation_WaitingListHead();
  v10 = *(os_unfair_lock_s **)(a1 + 32);
  if (v9)
  {
    while (*(os_unfair_lock_s **)v9 != v10)
    {
      v9 = *(_QWORD *)(v9 + 8);
      if (!v9)
        goto LABEL_9;
    }
    v11 = 0;
    *(_BYTE *)(v9 + 16) = 1;
    v10 = *(os_unfair_lock_s **)(a1 + 32);
  }
  else
  {
LABEL_9:
    v11 = 1;
  }
  os_unfair_lock_lock(v10 + 2);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 56);
  *(_QWORD *)(v13 + 56) = 0;

  if (v11)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
  v15 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    *(_BYTE *)(v15 + 50) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    if (v12)
    {
      objc_msgSend(v12, "_cancel");
LABEL_18:
      objc_msgSend(v12, "_invalidate");
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 8));
    if (v12)
      goto LABEL_18;
  }
  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "_performOperation");

LABEL_22:
}

- (BOOL)_performOperation
{
  PKAsyncUnaryOperationEvaluator ***v3;
  int v4;
  uint64_t *v5;
  char v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  int v11;
  char v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  PKAsyncOperationState *v14;
  PKAsyncOperationState *runningOperationState;
  uint64_t v16;
  void *v17;
  PKDeallocationGuard *v18;
  id v19;
  id v20;
  PKDeallocationGuard *v21;
  PKDeallocationGuard *v22;
  id v23;
  void *v24;
  id v25;
  void (**v26)(void *, BOOL, id, PKAsyncUnaryOperationEvaluator *);
  _BOOL4 escaped;
  id value;
  id completion;
  NSMutableArray *operations;
  PKAsyncUnaryOperationEvaluator **v32;
  PKAsyncUnaryOperationEvaluator ***v33;
  int v34;
  PKAsyncOperationState *v35;
  uint64_t v36;
  _QWORD v37[4];
  PKDeallocationGuard *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD aBlock[6];
  _QWORD v44[3];
  char v45;
  PKAsyncUnaryOperationEvaluator *v46;
  PKAsyncUnaryOperationEvaluator **v47;
  uint64_t v48;

  v3 = (PKAsyncUnaryOperationEvaluator ***)_performOperation_WaitingListHead();
  v4 = 0;
  v5 = (uint64_t *)MEMORY[0x1E0C99768];
  v47 = *v3;
  v48 = 0;
  v46 = self;
  v32 = v47;
  v33 = v3;
  *v3 = &v46;
  v36 = *v5;
  v6 = 1;
  do
  {
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v45 = 0;
    v7 = (void *)MEMORY[0x19400CFE8]();
    os_unfair_lock_lock(&self->_lock);
    if (self->_runningOperationState)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v36, CFSTR("PKAsyncUnaryOperationEvaluator (%p): implementation error - attempting to perform operations simultaneously."), self);
    v8 = self->_value;
    if (self->_canceled)
      goto LABEL_5;
    if (!-[NSMutableArray count](self->_operations, "count"))
      goto LABEL_5;
    -[NSMutableArray lastObject](self->_operations, "lastObject");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_5;
    -[NSMutableArray removeLastObject](self->_operations, "removeLastObject");
    v14 = -[PKAsyncOperationState _init]([PKAsyncOperationState alloc], "_init");
    runningOperationState = self->_runningOperationState;
    self->_runningOperationState = v14;

    v35 = v14;
    if (!v35)
    {
      self->_canceled = 1;

LABEL_5:
      os_unfair_lock_unlock(&self->_lock);
      v9 = 5;
      v10 = 1;
      v4 = 1;
      goto LABEL_6;
    }
    v34 = v4;
    os_unfair_lock_unlock(&self->_lock);
    LOBYTE(v48) = 0;
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke;
    aBlock[3] = &unk_1E2ADDA88;
    aBlock[4] = self;
    aBlock[5] = v44;
    v17 = _Block_copy(aBlock);
    v18 = [PKDeallocationGuard alloc];
    v40[0] = v16;
    v40[1] = 3221225472;
    v40[2] = __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke_2;
    v40[3] = &unk_1E2ABDA18;
    v19 = v17;
    v42 = v19;
    v20 = v8;
    v41 = v20;
    v21 = -[PKDeallocationGuard initWithBlock:](v18, "initWithBlock:", v40);
    v37[0] = v16;
    v37[1] = 3221225472;
    v37[2] = __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke_3;
    v37[3] = &unk_1E2AC5330;
    v22 = v21;
    v38 = v22;
    v23 = v19;
    v39 = v23;
    ((void (**)(_QWORD, PKAsyncOperationState *, id, _QWORD *))v13)[2](v13, v35, v20, v37);

    v10 = 0;
    v9 = 0;
    v4 = v34;
LABEL_6:

    objc_autoreleasePoolPop(v7);
    if ((_BYTE)v48)
      v11 = 4;
    else
      v11 = 5;
    if ((_BYTE)v48)
      v12 = 1;
    else
      v12 = v10;
    if (!v10)
      v9 = v11;
    v6 &= v12;
    _Block_object_dispose(v44, 8);
  }
  while (v9 != 5);
  *v33 = v32;
  if ((v4 & 1) != 0)
  {
    v24 = (void *)MEMORY[0x19400CFE8]();
    os_unfair_lock_lock(&self->_lock);
    v25 = self->_value;
    v26 = (void (**)(void *, BOOL, id, PKAsyncUnaryOperationEvaluator *))_Block_copy(self->_completion);
    escaped = self->_escaped;
    value = self->_value;
    self->_value = 0;

    completion = self->_completion;
    self->_completion = 0;

    operations = self->_operations;
    self->_operations = 0;

    os_unfair_lock_unlock(&self->_lock);
    if (v26)
      v26[2](v26, escaped, v25, self);

    objc_autoreleasePoolPop(v24);
  }
  return v6;
}

- (id)_initWithOperations:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  PKAsyncUnaryOperationEvaluator *v8;
  PKAsyncUnaryOperationEvaluator *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *operations;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PKAsyncUnaryOperationEvaluator;
  v8 = -[PKAsyncUnaryOperationEvaluator init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v6, "count");
    if (v10)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
      operations = v9->_operations;
      v9->_operations = (NSMutableArray *)v11;

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v6, "reverseObjectEnumerator", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v22;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v22 != v16)
              objc_enumerationMutation(v13);
            v18 = v9->_operations;
            v19 = _Block_copy(*(const void **)(*((_QWORD *)&v21 + 1) + 8 * v17));
            -[NSMutableArray addObject:](v18, "addObject:", v19);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v15);
      }

    }
    objc_storeStrong(&v9->_value, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningOperationState, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_operations, 0);
}

- (void)dealloc
{
  unsigned __int8 v3;
  objc_super v4;

  if (self->_completion)
  {
    v3 = atomic_load((unsigned __int8 *)&self->_crashed);
    if ((v3 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKAsyncUnaryOperationEvaluator (%p): implementation error - deallocated before pipeline completed."), self);
  }
  v4.receiver = self;
  v4.super_class = (Class)PKAsyncUnaryOperationEvaluator;
  -[PKAsyncUnaryOperationEvaluator dealloc](&v4, sel_dealloc);
}

- (BOOL)isCanceled
{
  PKAsyncUnaryOperationEvaluator *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canceled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (PKAsyncUnaryOperationEvaluator)init
{

  return 0;
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  PKAsyncOperationState *runningOperationState;
  PKAsyncOperationState *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_canceled || (self->_canceled = 1, (runningOperationState = self->_runningOperationState) == 0))
    v5 = 0;
  else
    v5 = runningOperationState;
  os_unfair_lock_unlock(p_lock);
  -[PKAsyncOperationState _cancel](v5, "_cancel");

}

uint64_t __51__PKAsyncUnaryOperationEvaluator__performOperation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

@end
