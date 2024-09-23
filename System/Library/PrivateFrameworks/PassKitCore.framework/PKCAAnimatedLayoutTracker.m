@implementation PKCAAnimatedLayoutTracker

+ (PKCAAnimatedLayoutTracker)_create
{
  PKCAAnimatedLayoutTracker *result;
  objc_super v1;

  objc_opt_self();
  result = [PKCAAnimatedLayoutTracker alloc];
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)PKCAAnimatedLayoutTracker;
    return (PKCAAnimatedLayoutTracker *)objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (PKCAAnimatedLayoutTracker)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v2;

  if (self->_completions)
  {
    __break(1u);
  }
  else
  {
    v2.receiver = self;
    v2.super_class = (Class)PKCAAnimatedLayoutTracker;
    -[PKCAAnimatedLayoutTracker dealloc](&v2, sel_dealloc);
  }
}

- (id)beginTrackingAnimation
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
  v3 = -[PKCAAnimatedLayoutTracker _beginTrackingAbsoluteAnimation](v2);

  return v3;
}

- (_QWORD)_effectiveTracker
{
  id v1;
  void *v2;
  void *v3;
  _QWORD *v4;

  if (!a1)
    return 0;
  v1 = a1;
  v2 = v1;
  v3 = (void *)*((_QWORD *)v1 + 5);
  if (!v3)
    return v1;
  do
  {
    v4 = v3;

    v3 = (void *)v4[5];
    v2 = v4;
  }
  while (v3);
  return v4;
}

- (_QWORD)_beginTrackingAbsoluteAnimation
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  PKDeallocationGuard *v6;
  PKDeallocationGuard *v7;
  _QWORD aBlock[4];
  PKDeallocationGuard *v9;
  void *v10;
  _QWORD v11[5];

  v1 = result;
  if (!result)
    return v1;
  v2 = result[1];
  v3 = v2 + 1;
  v4 = v2 == -1;
  v5 = v4 << 63 >> 63;
  result[1] = v3;
  if (v5 == v4 && (v5 & 0x8000000000000000) == 0)
  {
    v6 = [PKDeallocationGuard alloc];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke;
    v11[3] = &unk_1E2ABE120;
    v11[4] = v1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke_3;
    aBlock[3] = &unk_1E2ACF480;
    v9 = -[PKDeallocationGuard initWithBlock:](v6, "initWithBlock:", v11);
    v10 = v1;
    v7 = v9;
    v1 = _Block_copy(aBlock);

    return v1;
  }
  __break(1u);
  return result;
}

- (void)addCompletion:(id)a3
{
  id v4;
  _QWORD *v5;

  v4 = a3;
  v5 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
  -[PKCAAnimatedLayoutTracker _addAbsoluteCompletion:]((uint64_t)v5, v4);

}

- (void)_addAbsoluteCompletion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *aBlock;

  v3 = a2;
  if (!a1)
  {
LABEL_6:

    return;
  }
  if (v3)
  {
    v4 = *(void **)(a1 + 48);
    aBlock = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    v7 = _Block_copy(aBlock);
    objc_msgSend(v4, "addObject:", v7);

    -[PKCAAnimatedLayoutTracker _executeAbsoluteCompletionsIfPossible](a1);
    v3 = aBlock;
    goto LABEL_6;
  }
  __break(1u);
}

- (void)addAbsoluteCompletion:(id)a3
{
  -[PKCAAnimatedLayoutTracker _addAbsoluteCompletion:]((uint64_t)self, a3);
}

- (void)performTransactionWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
  -[PKCAAnimatedLayoutTracker _performAbsoluteTransactionWithBlock:completion:](v8, v7, v6);

}

- (void)_performAbsoluteTransactionWithBlock:(void *)a3 completion:
{
  id v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_4;
  if (v5)
  {
    v7 = -[PKCAAnimatedLayoutTracker _beginTrackingAbsoluteAnimation](a1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__PKCAAnimatedLayoutTracker__performAbsoluteTransactionWithBlock_completion___block_invoke;
    v9[3] = &unk_1E2AC6B98;
    v10 = v6;
    v11 = v7;
    v8 = v7;
    -[PKCAAnimatedLayoutTracker _performIsolatedAbsoluteTransactionWithBlock:completion:]((uint64_t)a1, v5, v9);

LABEL_4:
    return;
  }
  __break(1u);
}

- (void)performAbsoluteTransactionWithBlock:(id)a3 completion:(id)a4
{
  -[PKCAAnimatedLayoutTracker _performAbsoluteTransactionWithBlock:completion:](self, a3, a4);
}

- (void)performIsolatedTransactionWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
  -[PKCAAnimatedLayoutTracker _performIsolatedAbsoluteTransactionWithBlock:completion:]((uint64_t)v8, v7, v6);

}

- (void)_performIsolatedAbsoluteTransactionWithBlock:(void *)a3 completion:
{
  id v5;
  PKCAAnimatedLayoutTracker *v6;
  PKCAAnimatedLayoutTracker *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  id v16;
  unint64_t suspended;
  void (**v18)(void);

  v18 = a2;
  v5 = a3;
  if (!a1)
    goto LABEL_12;
  if (v18)
  {
    v6 = +[PKCAAnimatedLayoutTracker _create]();
    v7 = v6;
    if (!v6
      || (v8 = v6->_suspended, v9 = v8 + 1, v10 = v8 == -1, v11 = v10 << 63 >> 63, v6->_suspended = v9, v11 == v10)
      && (v11 & 0x8000000000000000) == 0)
    {
      v12 = (void *)MEMORY[0x19400CFE8]();
      v14 = *(void **)(a1 + 40);
      v13 = (id *)(a1 + 40);
      v15 = v14;
      objc_storeStrong(v13, v7);
      v18[2]();
      v16 = *v13;
      *v13 = v15;

      objc_autoreleasePoolPop(v12);
      if (v5)
        -[PKCAAnimatedLayoutTracker addCompletion:](v7, "addCompletion:", v5);
      if (!v7)
        goto LABEL_11;
      suspended = v7->_suspended;
      v7->_suspended = suspended - 1;
      if (suspended)
      {
        -[PKCAAnimatedLayoutTracker _executeAbsoluteCompletionsIfPossible]((uint64_t)v7);
LABEL_11:

LABEL_12:
        return;
      }
    }
  }
  __break(1u);
}

- (void)performIsolatedAbsoluteTransactionWithBlock:(id)a3 completion:(id)a4
{
  -[PKCAAnimatedLayoutTracker _performIsolatedAbsoluteTransactionWithBlock:completion:]((uint64_t)self, a3, a4);
}

- (void)trackAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  if (!v4
    || (v5 = v4, objc_msgSend(v4, "delegate"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    __break(1u);
  }
  else
  {
    v7 = -[PKCAAnimatedLayoutTracker _effectiveTracker](self);
    v8 = -[PKCAAnimatedLayoutTracker _beginTrackingAbsoluteAnimation](v7);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__PKCAAnimatedLayoutTracker_trackAnimation___block_invoke;
    v10[3] = &unk_1E2ABE518;
    v11 = v8;
    v9 = v8;
    objc_msgSend(v5, "pkui_setCompletionHandler:", v10);

  }
}

uint64_t __44__PKCAAnimatedLayoutTracker_trackAnimation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke_2;
  block[3] = &unk_1E2ABE120;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke_2(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  -[PKCAAnimatedLayoutTracker _executeAbsoluteCompletionsIfPossible](*(_QWORD *)(a1 + 32));
}

- (void)_executeAbsoluteCompletionsIfPossible
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 8) <= *(_QWORD *)(a1 + 24) + *(_QWORD *)(a1 + 16))
  {
    v2 = *(id *)(a1 + 48);
    v3 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    if (objc_msgSend(v2, "count"))
    {
      v4 = (void *)MEMORY[0x19400CFE8]();
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = v2;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

      objc_autoreleasePoolPop(v4);
    }

  }
}

void __60__PKCAAnimatedLayoutTracker__beginTrackingAbsoluteAnimation__block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v4;

  if (objc_msgSend(*(id *)(a1 + 32), "invalidate"))
  {
    __break(1u);
  }
  else
  {
    v4 = 16;
    if (a2)
      v4 = 24;
    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + v4);
    -[PKCAAnimatedLayoutTracker _executeAbsoluteCompletionsIfPossible](*(_QWORD *)(a1 + 40));
  }
}

uint64_t __77__PKCAAnimatedLayoutTracker__performAbsoluteTransactionWithBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_suspend
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    v1 = -[PKCAAnimatedLayoutTracker _effectiveTracker](a1);
    if (v1 && ((v2 = v1[4], v3 = v2 + 1, v4 = v2 == -1, v5 = v4 << 63 >> 63, v1[4] = v3, v5 ^ v4) || v5 < 0))
      __break(1u);
    else

  }
}

- (void)_resume
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  if (a1)
  {
    v1 = -[PKCAAnimatedLayoutTracker _effectiveTracker](a1);
    if (!v1)
    {
LABEL_5:

      return;
    }
    v2 = v1[4];
    v1[4] = v2 - 1;
    if (v2)
    {
      v3 = v1;
      -[PKCAAnimatedLayoutTracker _executeAbsoluteCompletionsIfPossible]((uint64_t)v1);
      v1 = v3;
      goto LABEL_5;
    }
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_effectiveTracker, 0);
}

@end
