@implementation IMMemoryCache

- (void)setTotalCostLimit:(unint64_t)a3
{
  self->_totalCostLimit = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (IMMemoryCache)init
{
  IMMemoryCache *v2;
  uint64_t v3;
  NSMutableDictionary *items;
  uint64_t v5;
  NSMutableArray *itemsArray;
  uint64_t v7;
  NSOperationQueue *queue;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  double v11;
  IMMemoryCache *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IMMemoryCache;
  v2 = -[IMMemoryCache init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    items = v2->_items;
    v2->_items = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    itemsArray = v2->_itemsArray;
    v2->_itemsArray = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    queue = v2->_queue;
    v2->_queue = (NSOperationQueue *)v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    v9 = dispatch_queue_create("com.apple.itunesmobile.immemorycache", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v2->_lastCheckTime = v11;
    v12 = v2;
  }

  return v2;
}

- (id)allKeys
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__IMMemoryCache_allKeys__block_invoke;
  v5[3] = &unk_1EA0C5248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __24__IMMemoryCache_allKeys__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    v16 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__IMMemoryCache_objectForKey___block_invoke;
    block[3] = &unk_1EA0C52C8;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(accessQueue, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __30__IMMemoryCache_objectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v13;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemsArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v13, "timeStamp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "pf_indexOfObjectWithValue:forKeyPath:", v5, CFSTR("timeStamp"));

    if (v6 == 0x7FFFFFFFFFFFFFFFLL
      && (NSLog(CFSTR("%s Initial Object mismatch"), "-[IMMemoryCache objectForKey:]_block_invoke"),
          objc_msgSend(*(id *)(a1 + 32), "itemsArray"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v13),
          v7,
          v6 == 0x7FFFFFFFFFFFFFFFLL))
    {
      NSLog(CFSTR("%s Complete Object mismatch"), "-[IMMemoryCache objectForKey:]_block_invoke");
      objc_msgSend(*(id *)(a1 + 32), "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "itemsArray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectAtIndex:", v6);

      objc_msgSend(*(id *)(a1 + 32), "itemsArray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v13);

      objc_msgSend(v13, "setTimeStamp:", mach_absolute_time());
      objc_msgSend(v13, "item");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;
    }

    v3 = v13;
  }

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[_IMMemoryCacheItem cacheItemWithItem:key:cost:](_IMMemoryCacheItem, "cacheItemWithItem:key:cost:", a3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IMMemoryCache _addItem:forKey:](self, "_addItem:forKey:", v7, v6);

}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  +[_IMMemoryCacheItem cacheItemWithItem:key:cost:](_IMMemoryCacheItem, "cacheItemWithItem:key:cost:", a3, v8, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IMMemoryCache _addItem:forKey:](self, "_addItem:forKey:", v9, v8);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    accessQueue = self->_accessQueue;
    block[1] = 3221225472;
    block[2] = __36__IMMemoryCache_removeObjectForKey___block_invoke;
    block[3] = &unk_1EA0C5098;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(accessQueue, block);

    v4 = v6;
  }

}

uint64_t __36__IMMemoryCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllObjects
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__IMMemoryCache_removeAllObjects__block_invoke;
  block[3] = &unk_1EA0C4FB0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __33__IMMemoryCache_removeAllObjects__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setCount:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setTotalCost:", 0);
  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "itemsArray");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (void)removeObjectsForKeyWithPrefix:(id)a3
{
  NSObject *accessQueue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__IMMemoryCache_removeObjectsForKeyWithPrefix___block_invoke;
    block[3] = &unk_1EA0C5098;
    block[4] = self;
    v7 = v5;
    dispatch_sync(accessQueue, block);

  }
}

void __47__IMMemoryCache_removeObjectsForKeyWithPrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPrefix:", *(_QWORD *)(a1 + 40), (_QWORD)v10))
          objc_msgSend(*(id *)(a1 + 32), "_removeObjectForKey:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)_shouldRemoveIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  NSMutableDictionary *items;
  void *v17;
  BOOL v18;

  -[NSMutableArray objectAtIndex:](self->_itemsArray, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "conformsToProtocol"))
    goto LABEL_3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "discardContentIfPossible");

  objc_msgSend(v4, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isContentDiscarded");

  if (!v7)
  {
    v18 = 0;
  }
  else
  {
LABEL_3:
    -[IMMemoryCache delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[IMMemoryCache delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cache:willEvictObject:", self, v11);

    }
    v12 = objc_msgSend(v4, "cost");
    v13 = *(int64x2_t *)&self->_totalCost;
    v14.i64[0] = -1;
    v14.i64[1] = -1;
    v15.i64[1] = -1;
    v15.i64[0] = v12;
    v15.i64[0] = vsubq_s64(v13, v15).u64[0];
    v15.i64[1] = vaddq_s64(v13, v14).i64[1];
    *(int64x2_t *)&self->_totalCost = v15;
    items = self->_items;
    objc_msgSend(v4, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](items, "removeObjectForKey:", v17);

    v18 = 1;
  }

  return v18;
}

- (void)checkLimitsAndEvictObjects
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__IMMemoryCache_checkLimitsAndEvictObjects__block_invoke;
  block[3] = &unk_1EA0C4FB0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __43__IMMemoryCache_checkLimitsAndEvictObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkLimitsAndEvictObjects");
}

- (void)_checkLimitsAndEvictObjects
{
  unint64_t totalCostLimit;
  unint64_t count;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t countLimit;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v14;

  totalCostLimit = self->_totalCostLimit;
  if (totalCostLimit && self->_totalCost > totalCostLimit)
  {
    count = self->_count;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (count)
    {
      v6 = 0;
      v7 = count - 1;
      do
      {
        if (-[IMMemoryCache _shouldRemoveIndex:](self, "_shouldRemoveIndex:", v6))
          objc_msgSend(v5, "addIndex:", v6);
      }
      while (self->_totalCost > self->_totalCostLimit && v7 != v6++);
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_itemsArray, "removeObjectsAtIndexes:", v5);

  }
  countLimit = self->_countLimit;
  if (countLimit)
  {
    v10 = self->_count;
    if (v10 > countLimit)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v12 = v10 - 1;
      do
      {
        if (-[IMMemoryCache _shouldRemoveIndex:](self, "_shouldRemoveIndex:", v11))
          objc_msgSend(v14, "addIndex:", v11);
      }
      while (self->_count > self->_countLimit && v12 != v11++);
      -[NSMutableArray removeObjectsAtIndexes:](self->_itemsArray, "removeObjectsAtIndexes:", v14);

    }
  }
}

- (void)_checkLimits
{
  double v3;
  unint64_t countLimit;
  unint64_t totalCostLimit;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (v3 - self->_lastCheckTime > 0.1
    && ((countLimit = self->_countLimit) != 0 && self->_count > countLimit
     || (totalCostLimit = self->_totalCostLimit) != 0 && self->_totalCost > totalCostLimit))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_lastCheckTime = v6;
    -[IMMemoryCache _checkLimitsAndEvictObjects](self, "_checkLimitsAndEvictObjects");
  }
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)totalCost
{
  return self->_totalCost;
}

- (unint64_t)costForObjectWithKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__IMMemoryCache_costForObjectWithKey___block_invoke;
    block[3] = &unk_1EA0C52C8;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(accessQueue, block);
    v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

void __38__IMMemoryCache_costForObjectWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, "cost");
    v3 = v5;
  }
  else
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

}

- (int64_t)numberOfCachedItems
{
  NSObject *accessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__IMMemoryCache_numberOfCachedItems__block_invoke;
  v5[3] = &unk_1EA0C5248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __36__IMMemoryCache_numberOfCachedItems__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "itemsArray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)description
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__IMMemoryCache_description__block_invoke;
  v5[3] = &unk_1EA0C5248;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__IMMemoryCache_description__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = objc_opt_class();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "items");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v16, "count");
  objc_msgSend(*(id *)(a1 + 32), "itemsArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(*(id *)(a1 + 32), "count");
  v7 = objc_msgSend(*(id *)(a1 + 32), "countLimit");
  v8 = objc_msgSend(*(id *)(a1 + 32), "totalCost");
  v9 = objc_msgSend(*(id *)(a1 + 32), "totalCostLimit");
  objc_msgSend(*(id *)(a1 + 32), "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v15, "initWithFormat:", CFSTR("<%@: %p>; Item Dictionary Count: %d; Item Array Count: %d; Internal Count: %d; Count Limit: %d; Current Cost: %d; Cost Limit: %d; Items: %@"),
          v14,
          v2,
          v3,
          v5,
          v6,
          v7,
          v8,
          v9,
          v10);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

- (void)_addItem:(id)a3 forKey:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__IMMemoryCache__addItem_forKey___block_invoke;
    block[3] = &unk_1EA0C51D0;
    block[4] = self;
    v10 = v6;
    v11 = v8;
    dispatch_sync(accessQueue, block);

  }
}

uint64_t __33__IMMemoryCache__addItem_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setTimeStamp:", mach_absolute_time());
  objc_msgSend(*(id *)(a1 + 32), "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "itemsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setCount:", objc_msgSend(*(id *)(a1 + 32), "count") + 1);
  if (objc_msgSend(*(id *)(a1 + 48), "cost"))
    objc_msgSend(*(id *)(a1 + 32), "setTotalCost:", objc_msgSend(*(id *)(a1 + 32), "totalCost") + objc_msgSend(*(id *)(a1 + 48), "cost"));
  return objc_msgSend(*(id *)(a1 + 32), "_checkLimits");
}

- (void)_removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *items;
  NSMutableArray *itemsArray;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    -[NSMutableDictionary objectForKey:](self->_items, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      --self->_count;
      v7 = objc_msgSend(v5, "cost");
      items = self->_items;
      self->_totalCost -= v7;
      -[NSMutableDictionary removeObjectForKey:](items, "removeObjectForKey:", v12);
      itemsArray = self->_itemsArray;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "timeStamp"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSMutableArray pf_indexOfObjectWithValue:forKeyPath:](itemsArray, "pf_indexOfObjectWithValue:forKeyPath:", v10, CFSTR("timeStamp"));

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        -[NSMutableArray removeObjectAtIndex:](self->_itemsArray, "removeObjectAtIndex:", v11);
    }

    v4 = v12;
  }

}

- (NSString)name
{
  return self->_name;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (BOOL)evictsItemsWithDiscardedContent
{
  return self->_evictsItemsWithDiscardedContent;
}

- (void)setEvictsItemsWithDiscardedContent:(BOOL)a3
{
  self->_evictsItemsWithDiscardedContent = a3;
}

- (unint64_t)totalCostLimit
{
  return self->_totalCostLimit;
}

- (unint64_t)countLimit
{
  return self->_countLimit;
}

- (void)setCountLimit:(unint64_t)a3
{
  self->_countLimit = a3;
}

- (NSMutableArray)itemsArray
{
  return self->_itemsArray;
}

- (void)setItemsArray:(id)a3
{
  objc_storeStrong((id *)&self->_itemsArray, a3);
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void)setTotalCost:(unint64_t)a3
{
  self->_totalCost = a3;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (double)lastCheckTime
{
  return self->_lastCheckTime;
}

- (void)setLastCheckTime:(double)a3
{
  self->_lastCheckTime = a3;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemsArray, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
