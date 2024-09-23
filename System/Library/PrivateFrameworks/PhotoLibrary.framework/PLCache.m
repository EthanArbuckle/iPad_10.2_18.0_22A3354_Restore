@implementation PLCache

- (PLCache)initWithCountLimit:(int64_t)a3 totalCostLimit:(int64_t)a4
{
  PLCache *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLCache;
  v6 = -[PLCache init](&v8, sel_init);
  if (v6)
  {
    v6->_cacheEntries = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    v6->_countLimit = a3;
    v6->_totalCostLimit = a4;
    pthread_mutex_init(&v6->_lock, 0);
    v6->_lru.tqh_first = 0;
    v6->_lru.tqh_last = &v6->_lru.tqh_first;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)PLCache;
  -[PLCache dealloc](&v3, sel_dealloc);
}

- (id)objectForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;
  lruEntry *v9;
  lruEntry **v10;
  void *v11;
  lruEntry **tqh_last;
  id v13;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_cacheEntries, "objectForKey:", a3);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "lruListEntry");
    v9 = *(lruEntry **)(v8 + 16);
    v10 = *(lruEntry ***)(v8 + 24);
    if (v9)
    {
      v9->var2.var1 = v10;
      v10 = *(lruEntry ***)(v8 + 24);
    }
    else
    {
      self->_lru.tqh_last = v10;
    }
    *v10 = v9;
    tqh_last = self->_lru.tqh_last;
    *(_QWORD *)(v8 + 16) = 0;
    *(_QWORD *)(v8 + 24) = tqh_last;
    *tqh_last = (lruEntry *)v8;
    self->_lru.tqh_last = (lruEntry **)(v8 + 16);
    v11 = (void *)objc_msgSend(v7, "object");
    v13 = v11;
  }
  else
  {
    v11 = 0;
  }
  pthread_mutex_unlock(p_lock);
  return v11;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[PLCache setObject:forKey:cost:](self, "setObject:forKey:cost:", a3, a4, 0);
}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(int64_t)a5
{
  _opaque_pthread_mutex_t *p_lock;
  PLCacheEntry *v10;
  PLCacheEntry *v11;
  uint64_t v12;
  uint64_t v13;
  lruEntry *v14;
  lruEntry **v15;
  lruEntry **tqh_last;
  lruEntry *tqh_first;
  lruEntry *var0;
  int64_t currentCount;
  lruEntry **var1;
  id v21;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v10 = (PLCacheEntry *)-[NSMutableDictionary objectForKey:](self->_cacheEntries, "objectForKey:", a4);
  if (v10)
  {
    v11 = v10;
    v12 = -[PLCacheEntry lruListEntry](v10, "lruListEntry");
    v13 = v12;
    v14 = *(lruEntry **)(v12 + 16);
    v15 = *(lruEntry ***)(v12 + 24);
    if (v14)
    {
      v14->var2.var1 = v15;
      v15 = *(lruEntry ***)(v12 + 24);
    }
    else
    {
      self->_lru.tqh_last = v15;
    }
    *v15 = v14;
  }
  else
  {
    v11 = objc_alloc_init(PLCacheEntry);
    -[NSMutableDictionary setObject:forKey:](self->_cacheEntries, "setObject:forKey:", v11, a4);

    ++self->_currentCount;
    v13 = -[PLCacheEntry lruListEntry](v11, "lruListEntry");
    *(_QWORD *)v13 = a4;
  }
  -[PLCacheEntry setObject:](v11, "setObject:", a3);
  self->_currentCost += a5 - *(_QWORD *)(v13 + 8);
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 8) = a5;
  tqh_last = self->_lru.tqh_last;
  *(_QWORD *)(v13 + 24) = tqh_last;
  *tqh_last = (lruEntry *)v13;
  self->_lru.tqh_last = (lruEntry **)(v13 + 16);
  tqh_first = self->_lru.tqh_first;
  if (tqh_first)
  {
    do
    {
      var0 = tqh_first->var2.var0;
      currentCount = self->_currentCount;
      if (currentCount <= self->_countLimit && self->_currentCost <= self->_totalCostLimit)
        break;
      var1 = tqh_first->var2.var1;
      if (var0)
      {
        var0->var2.var1 = var1;
        var1 = tqh_first->var2.var1;
      }
      else
      {
        self->_lru.tqh_last = var1;
      }
      *var1 = var0;
      self->_currentCount = currentCount - 1;
      v21 = tqh_first->var0;
      self->_currentCost -= tqh_first->var1;
      -[NSMutableDictionary removeObjectForKey:](self->_cacheEntries, "removeObjectForKey:", v21);
      tqh_first = var0;
    }
    while (var0);
  }
  pthread_mutex_unlock(p_lock);
}

- (void)removeObjectForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  _QWORD *v7;
  lruEntry *v8;
  lruEntry **v9;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_cacheEntries, "objectForKey:", a3);
  if (v6)
  {
    v7 = (_QWORD *)objc_msgSend(v6, "lruListEntry");
    v8 = (lruEntry *)v7[2];
    v9 = (lruEntry **)v7[3];
    if (v8)
    {
      v8->var2.var1 = v9;
      v9 = (lruEntry **)v7[3];
    }
    else
    {
      self->_lru.tqh_last = v9;
    }
    *v9 = v8;
    --self->_currentCount;
    self->_currentCost -= v7[1];
    -[NSMutableDictionary removeObjectForKey:](self->_cacheEntries, "removeObjectForKey:", a3);
  }
  pthread_mutex_unlock(p_lock);
}

- (void)removeAllObjects
{
  PLCache *v2;
  _opaque_pthread_mutex_t *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](v2->_cacheEntries, "removeAllObjects");
  v2->_lru.tqh_first = 0;
  v2 = (PLCache *)((char *)v2 + 112);
  v2->_cacheEntries = (NSMutableDictionary *)v2;
  v2[-1]._currentCost = 0;
  *(_QWORD *)v2[-1]._lock.__opaque = 0;
  pthread_mutex_unlock(p_lock);
}

@end
