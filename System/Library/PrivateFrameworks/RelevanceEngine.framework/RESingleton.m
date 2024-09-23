@implementation RESingleton

+ (void)_incrementSingletonCache
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  v2 = SingletonCacheUsageCount;
  if (!SingletonCacheUsageCount)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)SingletonCache;
    SingletonCache = v3;

    v2 = SingletonCacheUsageCount;
  }
  SingletonCacheUsageCount = v2 + 1;
  os_unfair_recursive_lock_unlock();
}

+ (id)sharedInstance
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a1, "_classKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend((id)SingletonCache, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (SingletonCache)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
    objc_msgSend((id)SingletonCache, "setObject:forKeyedSubscript:", v4, v2);
  }
  os_unfair_recursive_lock_unlock();

  return v4;
}

+ (id)_classKey
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RESingleton;
  return -[RESingleton init](&v3, sel_init);
}

+ (void)_decrementSingletonCache
{
  void *v2;

  os_unfair_recursive_lock_lock_with_options();
  if (!--SingletonCacheUsageCount)
  {
    v2 = (void *)SingletonCache;
    SingletonCache = 0;

  }
  os_unfair_recursive_lock_unlock();
}

@end
