@implementation SFCache

- (SFCache)init
{
  SFCache *v3;

  v3 = -[SFCache initWithPolicy:timeToLive:size:]([SFCache alloc], "initWithPolicy:timeToLive:size:", 0, 10, 0.0);

  return v3;
}

- (SFCache)initWithPolicy:(unint64_t)a3
{
  SFCache *v4;

  v4 = -[SFCache initWithPolicy:timeToLive:size:]([SFCache alloc], "initWithPolicy:timeToLive:size:", a3, 10, 0.0);

  return v4;
}

- (SFCache)initWithPolicy:(unint64_t)a3 timeToLive:(double)a4 size:(unint64_t)a5
{
  SFCache *v5;
  SFCache *v8;
  SFCache *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *cacheEntries;
  objc_super v13;

  v5 = (SFCache *)a5;
  if (a5)
  {
    v13.receiver = self;
    v13.super_class = (Class)SFCache;
    v8 = -[SFCache init](&v13, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_cachePolicy = a3;
      v8->_cacheSize = (unint64_t)v5;
      v8->_entryTimeToLive = a4;
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      cacheEntries = v9->_cacheEntries;
      v9->_cacheEntries = v10;

    }
    self = v9;
    v5 = self;
  }

  return v5;
}

- (id)_entryForKey:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v4 = a3;
  v5 = self->_cacheEntries;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cacheEntries, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (self->_entryTimeToLive == 0.0
      || (objc_msgSend(v6, "lastUsed"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "timeIntervalSinceNow"),
          v10 = v9,
          v11 = -self->_entryTimeToLive,
          v8,
          v10 > v11))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLastUsed:", v12);
    }
    else
    {
      v12 = v7;
      v7 = 0;
    }

  }
  objc_sync_exit(v5);

  return v7;
}

- (void)_insertCacheEntry:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  id v8;
  NSMutableDictionary *cacheEntries;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v13 = a3;
  v6 = a4;
  v7 = self->_cacheEntries;
  objc_sync_enter(v7);
  if (-[NSMutableDictionary count](self->_cacheEntries, "count") >= self->_cacheSize)
  {
    if (self->_entryTimeToLive == 0.0)
    {
      v10 = 0;
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      cacheEntries = self->_cacheEntries;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __36__SFCache__insertCacheEntry_forKey___block_invoke;
      v14[3] = &unk_251938B78;
      v14[4] = self;
      v10 = v8;
      v15 = v10;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cacheEntries, "enumerateKeysAndObjectsUsingBlock:", v14);

      if (v10)
      {
        if (objc_msgSend(v10, "count"))
        {
          if (objc_msgSend(v10, "count"))
            -[NSMutableDictionary removeObjectsForKeys:](self->_cacheEntries, "removeObjectsForKeys:", v10);
        }
        else
        {
          -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_cacheEntries, "keysSortedByValueUsingComparator:", &__block_literal_global);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "subarrayWithRange:", 0, self->_cacheSize >> 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectsForKeys:](self->_cacheEntries, "removeObjectsForKeys:", v12);

        }
      }
    }

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheEntries, "setObject:forKeyedSubscript:", v13, v6);
  objc_sync_exit(v7);

}

void __36__SFCache__insertCacheEntry_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "lastUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;
  v8 = -*(double *)(*(_QWORD *)(a1 + 32) + 24);

  if (v7 <= v8)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

uint64_t __36__SFCache__insertCacheEntry_forKey___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUsed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_removeCacheEntryWithKey:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_cacheEntries;
  objc_sync_enter(v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheEntries, "setObject:forKeyedSubscript:", 0, v5);
  objc_sync_exit(v4);

}

- (unint64_t)count
{
  NSMutableDictionary *v3;
  unint64_t v4;

  v3 = self->_cacheEntries;
  objc_sync_enter(v3);
  v4 = -[NSMutableDictionary count](self->_cacheEntries, "count");
  objc_sync_exit(v3);

  return v4;
}

- (id)entryForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SFCache _entryForKey:](self, "_entryForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addEntry:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  SFCacheEntry *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[SFCache _entryForKey:](self, "_entryForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "item");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "isEqual:", v9);

    if ((v10 & 1) == 0)
      -[SFCache _removeCacheEntryWithKey:](self, "_removeCacheEntryWithKey:", v6);
  }
  v11 = -[SFCacheEntry initWithCacheItem:]([SFCacheEntry alloc], "initWithCacheItem:", v12);
  -[SFCache _insertCacheEntry:forKey:](self, "_insertCacheEntry:forKey:", v11, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheEntries, 0);
}

@end
