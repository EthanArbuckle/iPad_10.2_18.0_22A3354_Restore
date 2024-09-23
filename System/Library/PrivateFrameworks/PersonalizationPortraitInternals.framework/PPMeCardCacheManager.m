@implementation PPMeCardCacheManager

- (PPMeCardCacheManager)initWithPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  PPMeCardCacheManager *v7;
  id v8;
  PPMeCardCacheManager *v9;
  PPMeCardCacheManager *v10;
  _QWORD v12[4];
  id v13;
  PPMeCardCacheManager *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  if (initWithPath___pasOnceToken11 != -1)
    dispatch_once(&initWithPath___pasOnceToken11, &__block_literal_global_4069);
  v5 = (id)initWithPath___pasExprOnceResult;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4070;
  v20 = __Block_byref_object_dispose__4071;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__PPMeCardCacheManager_initWithPath___block_invoke_40;
  v12[3] = &unk_1E7E19938;
  v15 = &v16;
  v6 = v4;
  v13 = v6;
  v7 = self;
  v14 = v7;
  objc_msgSend(v5, "runWithLockAcquired:", v12);
  v8 = (id)v17[5];

  v9 = v14;
  v10 = (PPMeCardCacheManager *)v8;

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)accessCacheWithBlock:(id)a3
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
  v7[2] = __45__PPMeCardCacheManager_accessCacheWithBlock___block_invoke;
  v7[3] = &unk_1E7E168C8;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __45__PPMeCardCacheManager_accessCacheWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__PPMeCardCacheManager_initWithPath___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PPMeCardCache *v12;
  id v13;
  id *v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v19;
  objc_super v20;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v19.receiver = *(id *)(a1 + 40);
    v19.super_class = (Class)PPMeCardCacheManager;
    v7 = objc_msgSendSuper2(&v19, sel_init);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v10 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", CFSTR("me_card.pb"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v10);
      v12 = [PPMeCardCache alloc];
      v13 = v11;
      if (v12)
      {
        v20.receiver = v12;
        v20.super_class = (Class)PPMeCardCache;
        v14 = (id *)objc_msgSendSuper2(&v20, sel_init);
        v15 = v14;
        if (v14)
          objc_storeStrong(v14 + 1, v11);
      }
      else
      {
        v15 = 0;
      }

      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v15);
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v18 = *(void **)(v17 + 8);
      *(_QWORD *)(v17 + 8) = v16;

    }
  }

}

void __37__PPMeCardCacheManager_initWithPath___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)initWithPath___pasExprOnceResult;
  initWithPath___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

@end
