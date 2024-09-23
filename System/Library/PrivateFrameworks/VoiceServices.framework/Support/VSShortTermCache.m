@implementation VSShortTermCache

- (VSShortTermCache)init
{
  VSShortTermCache *v2;
  NSCache *v3;
  NSCache *cache;
  NSMutableDictionary *v5;
  NSMutableDictionary *cacheTimer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSShortTermCache;
  v2 = -[VSShortTermCache init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cache = v2->_cache;
    v2->_cache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cacheTimer = v2->_cacheTimer;
    v2->_cacheTimer = v5;

  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4 timeToLive:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[VSShortTermCache cacheTimer](self, "cacheTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timeToLiveTimerFired_, v9, 0, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSShortTermCache cache](self, "cache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v8, v9);

  -[VSShortTermCache cacheTimer](self, "cacheTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v12, v9);

  VSGetLogDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v17 = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_21AA84000, v15, OS_LOG_TYPE_INFO, "Added short term cache:%@ for key:'%@'", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTimer:forMode:", v12, *MEMORY[0x24BDBCA90]);

}

- (void)timeToLiveTimerFired:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSShortTermCache removeObjectForKey:](self, "removeObjectForKey:", v4);

  objc_msgSend(v5, "invalidate");
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSShortTermCache cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[VSShortTermCache cacheTimer](self, "cacheTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "invalidate");
  -[VSShortTermCache cacheTimer](self, "cacheTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v4);

  VSGetLogDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21AA84000, v9, OS_LOG_TYPE_INFO, "Removed short term cache for key:'%@'", (uint8_t *)&v10, 0xCu);
  }

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSShortTermCache cache](self, "cache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeAllObjects
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VSShortTermCache cacheTimer](self, "cacheTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[VSShortTermCache cacheTimer](self, "cacheTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[VSShortTermCache cache](self, "cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  VSGetLogDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_INFO, "Removed short term cache for all keys", v11, 2u);
  }

}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSMutableDictionary)cacheTimer
{
  return self->_cacheTimer;
}

- (void)setCacheTimer:(id)a3
{
  objc_storeStrong((id *)&self->_cacheTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheTimer, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2198);
  return (id)sharedInstance___sharedInstance;
}

void __34__VSShortTermCache_sharedInstance__block_invoke()
{
  VSShortTermCache *v0;
  void *v1;

  v0 = objc_alloc_init(VSShortTermCache);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

@end
