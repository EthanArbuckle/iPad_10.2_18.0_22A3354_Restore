@implementation HKSPSleepStoreCache

- (HKSPSleepStoreCache)init
{
  return -[HKSPSleepStoreCache initWithSleepStoreProvider:](self, "initWithSleepStoreProvider:", &__block_literal_global_184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sleepStoreProvider, 0);
  objc_storeStrong((id *)&self->_sleepStoresByIdentifier, 0);
}

+ (id)weakCache
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSleepStoreProvider:useWeakReferences:", &__block_literal_global, 1);
}

HKSPSleepStore *__32__HKSPSleepStoreCache_weakCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKSPSleepStore *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[HKSPSleepStore initWithIdentifier:healthStore:]([HKSPSleepStore alloc], "initWithIdentifier:healthStore:", v5, v4);

  return v6;
}

+ (id)strongCache
{
  return objc_alloc_init((Class)a1);
}

HKSPSleepStore *__27__HKSPSleepStoreCache_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKSPSleepStore *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[HKSPSleepStore initWithIdentifier:healthStore:]([HKSPSleepStore alloc], "initWithIdentifier:healthStore:", v5, v4);

  return v6;
}

- (HKSPSleepStoreCache)initWithSleepStoreProvider:(id)a3
{
  return -[HKSPSleepStoreCache initWithSleepStoreProvider:useWeakReferences:](self, "initWithSleepStoreProvider:useWeakReferences:", a3, 0);
}

- (HKSPSleepStoreCache)initWithSleepStoreProvider:(id)a3 useWeakReferences:(BOOL)a4
{
  id v6;
  HKSPSleepStoreCache *v7;
  NSObject *v8;
  uint64_t v9;
  NSMapTable *sleepStoresByIdentifier;
  uint64_t v11;
  id sleepStoreProvider;
  objc_super v14;
  uint8_t buf[4];
  HKSPSleepStoreCache *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPSleepStoreCache;
  v7 = -[HKSPSleepStoreCache init](&v14, sel_init);
  if (v7)
  {
    HKSPLogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    if (a4)
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    else
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    sleepStoresByIdentifier = v7->_sleepStoresByIdentifier;
    v7->_sleepStoresByIdentifier = (NSMapTable *)v9;

    v11 = objc_msgSend(v6, "copy");
    sleepStoreProvider = v7->_sleepStoreProvider;
    v7->_sleepStoreProvider = (id)v11;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)sleepStoreForIdentifier:(id)a3
{
  return -[HKSPSleepStoreCache sleepStoreForIdentifier:healthStore:](self, "sleepStoreForIdentifier:healthStore:", a3, 0);
}

- (id)sleepStoreForIdentifier:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  HKSPSleepStoreCache *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepStoreCache.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  if (v8)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %p"), v7, v8);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v7, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_sleepStoresByIdentifier, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    HKSPLogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1A4F0E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ caching a new sleep store with identifier %@", buf, 0x16u);
    }

    (*((void (**)(void))self->_sleepStoreProvider + 2))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_sleepStoresByIdentifier, "setObject:forKey:", v10, v9);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v10;
}

@end
