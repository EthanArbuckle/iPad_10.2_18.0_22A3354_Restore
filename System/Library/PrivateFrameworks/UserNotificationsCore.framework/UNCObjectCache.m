@implementation UNCObjectCache

- (UNCObjectCache)init
{
  UNCObjectCache *v2;
  uint64_t v3;
  NSHashTable *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UNCObjectCache;
  v2 = -[UNCObjectCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 5);
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSHashTable *)v3;

  }
  return v2;
}

- (id)cacheObject:(id)a3
{
  id v4;
  NSHashTable *v5;
  void *v6;
  id v7;
  id location;

  v4 = a3;
  v5 = self->_cache;
  objc_sync_enter(v5);
  -[NSHashTable member:](self->_cache, "member:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);

  v7 = objc_loadWeakRetained(&location);
  if (!v7)
  {
    -[NSHashTable removeObject:](self->_cache, "removeObject:", v4);
    -[NSHashTable addObject:](self->_cache, "addObject:", v4);
    v7 = v4;
  }
  objc_destroyWeak(&location);
  objc_sync_exit(v5);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
