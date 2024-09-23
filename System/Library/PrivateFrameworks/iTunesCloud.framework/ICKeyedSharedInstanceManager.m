@implementation ICKeyedSharedInstanceManager

- (id)sharedInstanceForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)MEMORY[0x1A1AFA708]();
  -[NSMutableDictionary objectForKey:](self->_stronglyHeldSharedInstances, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[NSMapTable objectForKey:](self->_weaklyHeldSharedInstances, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      (*((void (**)(void))self->_instantiationHandler + 2))();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_weaklyHeldSharedInstances, "setObject:forKey:", v6, v4);
    }
  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

- (void)decrementUsageCountForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *usageCounts;
  void *v9;
  id v10;

  v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)MEMORY[0x1A1AFA708]();
  -[NSMutableDictionary objectForKey:](self->_usageCounts, "objectForKey:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 == 1)
  {
    -[NSMutableDictionary objectForKey:](self->_stronglyHeldSharedInstances, "objectForKey:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_stronglyHeldSharedInstances, "removeObjectForKey:", v10);
    -[NSMapTable setObject:forKey:](self->_weaklyHeldSharedInstances, "setObject:forKey:", v9, v10);
    -[NSMutableDictionary removeObjectForKey:](self->_usageCounts, "removeObjectForKey:", v10);
  }
  else
  {
    usageCounts = self->_usageCounts;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](usageCounts, "setObject:forKey:", v9, v10);
  }

  objc_autoreleasePoolPop(v5);
  os_unfair_lock_unlock(p_lock);

}

- (void)incrementUsageCountForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *usageCounts;
  void *v10;
  id v11;

  v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)MEMORY[0x1A1AFA708]();
  -[NSMutableDictionary objectForKey:](self->_usageCounts, "objectForKey:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (!v7)
  {
    -[NSMapTable objectForKey:](self->_weaklyHeldSharedInstances, "objectForKey:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](self->_weaklyHeldSharedInstances, "removeObjectForKey:", v11);
    -[NSMutableDictionary setObject:forKey:](self->_stronglyHeldSharedInstances, "setObject:forKey:", v8, v11);

  }
  usageCounts = self->_usageCounts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](usageCounts, "setObject:forKey:", v10, v11);

  objc_autoreleasePoolPop(v5);
  os_unfair_lock_unlock(p_lock);

}

- (ICKeyedSharedInstanceManager)initWithInstantiationHandler:(id)a3
{
  id v4;
  ICKeyedSharedInstanceManager *v5;
  ICKeyedSharedInstanceManager *v6;
  uint64_t v7;
  id instantiationHandler;
  NSMutableDictionary *v9;
  NSMutableDictionary *stronglyHeldSharedInstances;
  uint64_t v11;
  NSMapTable *weaklyHeldSharedInstances;
  NSMutableDictionary *v13;
  NSMutableDictionary *usageCounts;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICKeyedSharedInstanceManager;
  v5 = -[ICKeyedSharedInstanceManager init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    instantiationHandler = v6->_instantiationHandler;
    v6->_instantiationHandler = (id)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stronglyHeldSharedInstances = v6->_stronglyHeldSharedInstances;
    v6->_stronglyHeldSharedInstances = v9;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    weaklyHeldSharedInstances = v6->_weaklyHeldSharedInstances;
    v6->_weaklyHeldSharedInstances = (NSMapTable *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    usageCounts = v6->_usageCounts;
    v6->_usageCounts = v13;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageCounts, 0);
  objc_storeStrong((id *)&self->_weaklyHeldSharedInstances, 0);
  objc_storeStrong((id *)&self->_stronglyHeldSharedInstances, 0);
  objc_storeStrong(&self->_instantiationHandler, 0);
}

@end
