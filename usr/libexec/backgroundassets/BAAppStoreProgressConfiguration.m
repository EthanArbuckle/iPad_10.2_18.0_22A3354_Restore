@implementation BAAppStoreProgressConfiguration

- (BAAppStoreProgressConfiguration)init
{
  BAAppStoreProgressConfiguration *v2;
  BAAppStoreProgressConfiguration *v3;
  NSSet *v4;
  NSSet *appBundleIdentifiers;
  id updateHandler;
  qos_class_t v7;
  dispatch_queue_global_t global_queue;
  uint64_t v9;
  OS_dispatch_queue *handlerQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *duplicateEventCache;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BAAppStoreProgressConfiguration;
  v2 = -[BAAppStoreProgressConfiguration init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new(NSSet);
    appBundleIdentifiers = v3->_appBundleIdentifiers;
    v3->_appBundleIdentifiers = v4;

    updateHandler = v3->_updateHandler;
    v3->_updateHandler = 0;

    v7 = qos_class_self();
    global_queue = dispatch_get_global_queue(v7, 0);
    v9 = objc_claimAutoreleasedReturnValue(global_queue);
    handlerQueue = v3->_handlerQueue;
    v3->_handlerQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new(NSMutableDictionary);
    duplicateEventCache = v3->_duplicateEventCache;
    v3->_duplicateEventCache = v11;

  }
  return v3;
}

- (BAAppStoreProgressConfiguration)initWithCoder:(id)a3
{
  id v4;
  BAAppStoreProgressConfiguration *v5;
  uint64_t v6;
  BAAppStoreProgressConfiguration *v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  uint64_t v12;
  NSSet *appBundleIdentifiers;
  NSMutableDictionary *v14;
  NSMutableDictionary *duplicateEventCache;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BAAppStoreProgressConfiguration;
  v5 = -[BAAppStoreProgressConfiguration init](&v17, "init");
  v7 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_opt_class(NSSet, v6);
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(NSString, v9), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("BA_AppBundleIdentifiers")));
    appBundleIdentifiers = v7->_appBundleIdentifiers;
    v7->_appBundleIdentifiers = (NSSet *)v12;

    v14 = objc_opt_new(NSMutableDictionary);
    duplicateEventCache = v7->_duplicateEventCache;
    v7->_duplicateEventCache = v14;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundleIdentifiers, CFSTR("BA_AppBundleIdentifiers"));

  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAppBundleIdentifiers:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *appBundleIdentifiers;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (NSSet *)objc_msgSend(v4, "copy");
  appBundleIdentifiers = self->_appBundleIdentifiers;
  self->_appBundleIdentifiers = v5;

  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSMutableDictionary count](self->_duplicateEventCache, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_duplicateEventCache, "allKeys", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (!-[NSSet containsObject:](self->_appBundleIdentifiers, "containsObject:", v14))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_duplicateEventCache, "removeObjectsForKeys:", v8);
  objc_autoreleasePoolPop(v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setUpdateHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;
  id updateHandler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = objc_msgSend(v5, "copy");

  updateHandler = self->_updateHandler;
  self->_updateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setHandlerQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *handlerQueue;

  v4 = (OS_dispatch_queue *)a3;
  os_unfair_lock_lock(&self->_lock);
  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateEventCache, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifiers, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end
