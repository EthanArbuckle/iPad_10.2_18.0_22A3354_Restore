@implementation WBSCache

- (WBSCache)init
{
  WBSCache *v2;
  NSCache *v3;
  NSCache *cache;
  uint64_t v5;
  NSMapTable *weakObjectsTable;
  id v7;
  const char *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *cacheQueue;
  WBSCache *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSCache;
  v2 = -[WBSCache init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v2->_cache;
    v2->_cache = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    weakObjectsTable = v2->_weakObjectsTable;
    v2->_weakObjectsTable = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSCache.%p"), v2);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    v9 = dispatch_queue_create(v8, MEMORY[0x1E0C80D50]);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v9;

    v11 = v2;
  }

  return v2;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *cacheQueue;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD *);
  void *v12;
  WBSCache *v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  cacheQueue = self->_cacheQueue;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __25__WBSCache_objectForKey___block_invoke;
  v12 = &unk_1E4B2A670;
  v15 = &v21;
  v13 = self;
  v6 = v4;
  v14 = v6;
  v16 = &v17;
  dispatch_sync(cacheQueue, &v9);
  if (*((_BYTE *)v18 + 24))
    -[WBSCache _recacheObjectForKey:](self, "_recacheObjectForKey:", v6, v9, v10, v11, v12, v13);
  v7 = (id)v22[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v7;
}

void __25__WBSCache_objectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
  }
}

- (void)_recacheObjectForKey:(id)a3
{
  id v4;
  NSObject *cacheQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  cacheQueue = self->_cacheQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__WBSCache__recacheObjectForKey___block_invoke;
  v7[3] = &unk_1E4B2A118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(cacheQueue, v7);

}

void __33__WBSCache__recacheObjectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
    v2 = v3;
  }

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *cacheQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WBSCache_setObject_forKey___block_invoke;
  block[3] = &unk_1E4B2A5F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(cacheQueue, block);

}

uint64_t __29__WBSCache_setObject_forKey___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", a1[5], a1[6]);
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[5], a1[6]);
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *cacheQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  cacheQueue = self->_cacheQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__WBSCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E4B2A118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(cacheQueue, v7);

}

uint64_t __31__WBSCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllObjects
{
  NSObject *cacheQueue;
  _QWORD block[5];

  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__WBSCache_removeAllObjects__block_invoke;
  block[3] = &unk_1E4B2A078;
  block[4] = self;
  dispatch_barrier_async(cacheQueue, block);
}

uint64_t __28__WBSCache_removeAllObjects__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_weakObjectsTable, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
