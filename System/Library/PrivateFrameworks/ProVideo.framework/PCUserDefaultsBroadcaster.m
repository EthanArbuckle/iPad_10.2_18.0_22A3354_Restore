@implementation PCUserDefaultsBroadcaster

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_53);
  return (id)sharedInstance_sharedInstance;
}

PCUserDefaultsBroadcaster *__43__PCUserDefaultsBroadcaster_sharedInstance__block_invoke()
{
  PCUserDefaultsBroadcaster *result;

  result = objc_alloc_init(PCUserDefaultsBroadcaster);
  sharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (PCUserDefaultsBroadcaster)init
{
  PCUserDefaultsBroadcaster *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PCUserDefaultsBroadcaster;
  v2 = -[PCUserDefaultsBroadcaster init](&v4, sel_init);
  if (v2)
    v2->_userDefaultsBroadcasted = (NSMutableDictionary *)objc_opt_new();
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCUserDefaultsBroadcaster;
  -[PCUserDefaultsBroadcaster dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3 ofUserDefaults:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a4);
        objc_msgSend(-[PCUserDefaultsBroadcaster observersForUserDefault:](self, "observersForUserDefault:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++)), "addObject:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  objc_sync_exit(self);
}

- (void)removeObserver:(id)a3 ofUserDefaults:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = -[NSMutableDictionary objectForKey:](self->_userDefaultsBroadcasted, "objectForKey:", v10);
        if (v11)
          -[PCUserDefaultsBroadcaster removeObserver:forUserDefault:fromObservers:](self, "removeObserver:forUserDefault:fromObservers:", a3, v10, v11);
      }
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  objc_sync_exit(self);
}

- (BOOL)hasObserversOfUserDefault:(id)a3
{
  return !-[PCUserDefaultsBroadcaster isWeakReferenceHashTableEmpty:](self, "isWeakReferenceHashTableEmpty:", -[NSMutableDictionary objectForKey:](self->_userDefaultsBroadcasted, "objectForKey:", a3));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v8 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_userDefaultsBroadcasted, "objectForKey:", a3), "copy");
  objc_sync_exit(self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "userDefaultDidChange:", a3);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)observersForUserDefault:(id)a3
{
  void *v5;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_userDefaultsBroadcasted, "objectForKey:");
  if (!v5)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    -[NSMutableDictionary setObject:forKey:](self->_userDefaultsBroadcasted, "setObject:forKey:", v5, a3);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "addObserver:forKeyPath:options:context:", self, a3, 0, 0);
  }
  return v5;
}

- (void)removeObserver:(id)a3 forUserDefault:(id)a4 fromObservers:(id)a5
{
  objc_msgSend(a5, "removeObject:", a3);
  if (-[PCUserDefaultsBroadcaster isWeakReferenceHashTableEmpty:](self, "isWeakReferenceHashTableEmpty:", a5))
    -[PCUserDefaultsBroadcaster removeObserversForUserDefault:](self, "removeObserversForUserDefault:", a4);
}

- (BOOL)isWeakReferenceHashTableEmpty:(id)a3
{
  if (!a3)
    return 1;
  if (objc_msgSend(a3, "count"))
    return objc_msgSend((id)objc_msgSend(a3, "objectEnumerator"), "nextObject") == 0;
  return 1;
}

- (void)removeObserversForUserDefault:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "removeObserver:forKeyPath:", self, a3);
  -[NSMutableDictionary removeObjectForKey:](self->_userDefaultsBroadcasted, "removeObjectForKey:", a3);
}

@end
