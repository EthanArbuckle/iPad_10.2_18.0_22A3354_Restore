@implementation TPSTargetingCache

- (int64_t)cacheResultForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -1;
  if (objc_msgSend(v4, "length"))
  {
    -[TPSTargetingCache syncQueue](self, "syncQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__TPSTargetingCache_cacheResultForIdentifier___block_invoke;
    block[3] = &unk_1EA1E0E30;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, block);

  }
  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)addCacheResult:(int64_t)a3 forIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  TPSTargetingCache *v10;
  int64_t v11;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[TPSTargetingCache syncQueue](self, "syncQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__TPSTargetingCache_addCacheResult_forIdentifier___block_invoke;
    block[3] = &unk_1EA1E0E58;
    v10 = self;
    v11 = a3;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

void __50__TPSTargetingCache_addCacheResult_forIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __50__TPSTargetingCache_addCacheResult_forIdentifier___block_invoke_cold_1(a1, v2);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cacheResultDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));

}

void __46__TPSTargetingCache_cacheResultForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cacheResultDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "integerValue") != -1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "integerValue");

}

- (NSMutableDictionary)cacheResultDictionary
{
  return self->_cacheResultDictionary;
}

- (TPSTargetingCache)init
{
  TPSTargetingCache *v2;
  uint64_t v3;
  NSMutableDictionary *cacheResultDictionary;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *syncQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSTargetingCache;
  v2 = -[TPSTargetingCache init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cacheResultDictionary = v2->_cacheResultDictionary;
    v2->_cacheResultDictionary = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.tips.targetingCache.sync", v5);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_cacheResultDictionary, 0);
}

- (void)reset
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__TPSTargetingCache_reset__block_invoke;
  block[3] = &unk_1EA1DF818;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

void __26__TPSTargetingCache_reset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __26__TPSTargetingCache_reset__block_invoke_cold_1(v2);

  objc_msgSend(*(id *)(a1 + 32), "cacheResultDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (void)setCacheResultDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_cacheResultDictionary, a3);
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

void __50__TPSTargetingCache_addCacheResult_forIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138412546;
  v5 = v2;
  v6 = 2048;
  v7 = v3;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "Adding targeting result to cache for precondition (%@): %ld", (uint8_t *)&v4, 0x16u);
}

void __26__TPSTargetingCache_reset__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DAC2F000, log, OS_LOG_TYPE_DEBUG, "Removing all targeting cache entries...", v1, 2u);
}

@end
