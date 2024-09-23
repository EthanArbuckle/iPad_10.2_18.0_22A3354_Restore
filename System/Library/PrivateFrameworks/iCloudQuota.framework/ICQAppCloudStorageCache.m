@implementation ICQAppCloudStorageCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  return (id)sharedInstance_cache;
}

void __41__ICQAppCloudStorageCache_sharedInstance__block_invoke()
{
  ICQAppCloudStorageCache *v0;
  void *v1;

  v0 = objc_alloc_init(ICQAppCloudStorageCache);
  v1 = (void *)sharedInstance_cache;
  sharedInstance_cache = (uint64_t)v0;

}

- (ICQAppCloudStorageCache)init
{
  ICQAppCloudStorageCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *hashMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQAppCloudStorageCache;
  v2 = -[ICQAppCloudStorageCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    hashMap = v2->_hashMap;
    v2->_hashMap = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setCloudStorage:(id)a3 byApp:(id)a4 forAltDSID:(id)a5
{
  os_unfair_lock_s *p_cacheLock;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a5;
  p_cacheLock = &self->_cacheLock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_lock(&self->_cacheLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_hashMap, "objectForKeyedSubscript:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hashMap, "setObject:forKeyedSubscript:", v12, v14);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_hashMap, "objectForKeyedSubscript:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v9);

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)cloudStorageByApp:(id)a3 forAltDSID:(id)a4
{
  os_unfair_lock_s *p_cacheLock;
  id v7;
  id v8;
  void *v9;
  void *v10;

  p_cacheLock = &self->_cacheLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_cacheLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_hashMap, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cacheLock);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashMap, 0);
}

@end
