@implementation TRICancelableCKOperation

- (TRICancelableCKOperation)initWithOperation:(id)a3
{
  id v4;
  TRICancelableCKOperation *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _PASLock *lock;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRICancelableCKOperation;
  v5 = -[TRICancelableCKOperation init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    v7 = objc_opt_new();
    v8 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v7;

    *(_BYTE *)(v6 + 16) = 0;
    if (v4)
      objc_msgSend(*(id *)(v6 + 8), "addObject:", v4);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v6);
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v9;

  }
  return v5;
}

- (void)addOperation:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__TRICancelableCKOperation_addOperation___block_invoke;
  v7[3] = &unk_1E9331C60;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __41__TRICancelableCKOperation_addOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 16))
    return objc_msgSend(*(id *)(a1 + 32), "cancel");
  else
    return objc_msgSend(*(id *)(a2 + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isCanceled
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__TRICancelableCKOperation_isCanceled__block_invoke;
  v5[3] = &unk_1E9331C88;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__TRICancelableCKOperation_isCanceled__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 16);
  return result;
}

- (void)cancel
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_10);
}

void __34__TRICancelableCKOperation_cancel__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2[1];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cancel", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_msgSend(v2[1], "removeAllObjects");
  *((_BYTE *)v2 + 16) = 1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
