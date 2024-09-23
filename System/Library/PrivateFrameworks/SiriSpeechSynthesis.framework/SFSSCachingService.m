@implementation SFSSCachingService

- (SFSSCachingService)init
{
  SFSSCachingService *v2;
  NSCache *v3;
  NSCache *memoryCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSSCachingService;
  v2 = -[SFSSCachingService init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    memoryCache = v2->_memoryCache;
    v2->_memoryCache = v3;

    -[NSCache setCountLimit:](v2->_memoryCache, "setCountLimit:", 100);
    -[NSCache setEvictsObjectsWithDiscardedContent:](v2->_memoryCache, "setEvictsObjectsWithDiscardedContent:", 1);
  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SFSSCachingService memoryCache](self, "memoryCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SFSSCachingService memoryCache](self, "memoryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clear
{
  id v2;

  -[SFSSCachingService memoryCache](self, "memoryCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSCache)memoryCache
{
  return self->_memoryCache;
}

- (void)setMemoryCache:(id)a3
{
  objc_storeStrong((id *)&self->_memoryCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryCache, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_512);
  return (id)sharedInstance___sharedInstance;
}

void __36__SFSSCachingService_sharedInstance__block_invoke()
{
  SFSSCachingService *v0;
  void *v1;

  v0 = objc_alloc_init(SFSSCachingService);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

@end
