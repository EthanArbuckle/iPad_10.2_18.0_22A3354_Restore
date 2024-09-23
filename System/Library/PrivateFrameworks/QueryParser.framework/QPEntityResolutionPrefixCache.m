@implementation QPEntityResolutionPrefixCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_12);
  return (id)sharedCache_cache;
}

void __44__QPEntityResolutionPrefixCache_sharedCache__block_invoke()
{
  QPEntityResolutionPrefixCache *v0;
  void *v1;

  v0 = -[QPEntityResolutionPrefixCache initWithMaxCount:minPrefixLength:]([QPEntityResolutionPrefixCache alloc], "initWithMaxCount:minPrefixLength:", 50, 2);
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = (uint64_t)v0;

}

- (QPEntityResolutionPrefixCache)initWithMaxCount:(int64_t)a3 minPrefixLength:(int64_t)a4
{
  QPEntityResolutionPrefixCache *v6;
  QPEntityResolutionPrefixCache *v7;
  int64_t v8;
  uint64_t v9;
  NSMutableOrderedSet *cache;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)QPEntityResolutionPrefixCache;
  v6 = -[QPEntityResolutionPrefixCache init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = 2;
    if (a3 > 2)
      v8 = a3;
    v6->_maxCount = v8;
    v6->_minPrefixLength = a4;
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    cache = v7->_cache;
    v7->_cache = (NSMutableOrderedSet *)v9;

  }
  return v7;
}

- (BOOL)hasPreviouslyGroundedPrefixOfToken:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  int64_t v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_minPrefixLength >= (int)objc_msgSend(v4, "length"))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v5 = -1;
    v6 = 1;
    do
    {
      objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") + v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[NSMutableOrderedSet containsObject:](self->_cache, "containsObject:", v7);

      if (v8)
        break;
      ++v6;
      v9 = (int)objc_msgSend(v4, "length") - self->_minPrefixLength;
      if (v9 >= 2)
        v9 = 2;
      --v5;
    }
    while (v9 >= v6);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (void)cacheGroundedToken:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableOrderedSet **p_cache;
  unint64_t v7;
  int64_t maxCount;
  void *v9;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= self->_minPrefixLength)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    p_cache = &self->_cache;
    if ((-[NSMutableOrderedSet containsObject:](self->_cache, "containsObject:", v4) & 1) == 0)
    {
      v7 = -[NSMutableOrderedSet count](self->_cache, "count");
      maxCount = self->_maxCount;
      if (v7 >= maxCount)
      {
        -[NSMutableOrderedSet removeObjectsInRange:](*p_cache, "removeObjectsInRange:", 0, maxCount / 2);
        if (entityResolutionPrefixCacheLogger_token != -1)
          dispatch_once(&entityResolutionPrefixCacheLogger_token, &__block_literal_global_19);
        v9 = (void *)entityResolutionPrefixCacheLogger_log;
        if (os_log_type_enabled((os_log_t)entityResolutionPrefixCacheLogger_log, OS_LOG_TYPE_DEBUG))
          -[QPEntityResolutionPrefixCache cacheGroundedToken:].cold.1((void **)p_cache, v9);
      }
      -[NSMutableOrderedSet addObject:](*p_cache, "addObject:", v4);
    }
    os_unfair_lock_unlock(p_lock);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)cacheGroundedToken:(void *)a1 .cold.1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  v4 = 134217984;
  v5 = objc_msgSend(v2, "count");
  _os_log_debug_impl(&dword_218E10000, v3, OS_LOG_TYPE_DEBUG, "Pruned old items in cache. Remaining: %lu", (uint8_t *)&v4, 0xCu);

}

@end
