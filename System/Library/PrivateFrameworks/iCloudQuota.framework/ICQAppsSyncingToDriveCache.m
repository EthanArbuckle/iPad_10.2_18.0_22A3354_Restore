@implementation ICQAppsSyncingToDriveCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_14);
  return (id)sharedInstance_cache_0;
}

void __44__ICQAppsSyncingToDriveCache_sharedInstance__block_invoke()
{
  ICQAppsSyncingToDriveCache *v0;
  void *v1;

  v0 = objc_alloc_init(ICQAppsSyncingToDriveCache);
  v1 = (void *)sharedInstance_cache_0;
  sharedInstance_cache_0 = (uint64_t)v0;

}

- (ICQAppsSyncingToDriveCache)init
{
  ICQAppsSyncingToDriveCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *hashMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQAppsSyncingToDriveCache;
  v2 = -[ICQAppsSyncingToDriveCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    hashMap = v2->_hashMap;
    v2->_hashMap = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setAppsSyncingToDrive:(id)a3 forAltDSID:(id)a4
{
  os_unfair_lock_s *p_cacheLock;
  id v7;
  id v8;

  p_cacheLock = &self->_cacheLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_cacheLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hashMap, "setObject:forKeyedSubscript:", v8, v7);

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)appsSyncingToDriveforAltDSID:(id)a3
{
  os_unfair_lock_s *p_cacheLock;
  id v5;
  void *v6;

  p_cacheLock = &self->_cacheLock;
  v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_hashMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cacheLock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashMap, 0);
}

@end
