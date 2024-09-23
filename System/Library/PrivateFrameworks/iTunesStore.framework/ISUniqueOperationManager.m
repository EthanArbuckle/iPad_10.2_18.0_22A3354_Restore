@implementation ISUniqueOperationManager

- (ISUniqueOperationManager)init
{
  ISUniqueOperationManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISUniqueOperationManager;
  v2 = -[ISUniqueOperationManager init](&v4, sel_init);
  if (v2)
  {
    v2->_contexts = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISUniqueOperationManager;
  -[ISUniqueOperationManager dealloc](&v3, sel_dealloc);
}

+ (void)setSharedInstance:(id)a3
{
  pthread_mutex_lock(&__SharedInstanceLock_0);
  if ((id)__SharedInstance_0 != a3)
  {

    __SharedInstance_0 = (uint64_t)a3;
  }
  pthread_mutex_unlock(&__SharedInstanceLock_0);
}

+ (id)sharedInstance
{
  id v3;
  id v4;

  pthread_mutex_lock(&__SharedInstanceLock_0);
  v3 = (id)__SharedInstance_0;
  if (!__SharedInstance_0)
  {
    v3 = objc_alloc_init((Class)a1);
    __SharedInstance_0 = (uint64_t)v3;
  }
  v4 = v3;
  pthread_mutex_unlock(&__SharedInstanceLock_0);
  return v4;
}

- (void)checkInOperation:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  objc_msgSend(-[ISUniqueOperationManager _activeContext](self, "_activeContext"), "addOperation:", a3);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)checkOutOperation:(id)a3
{
  ISUniqueOperationContext *v5;
  ISUniqueOperationContext *v6;

  -[NSLock lock](self->_lock, "lock");
  v5 = -[ISUniqueOperationManager _contextForOperation:](self, "_contextForOperation:", a3);
  if (v5)
  {
    v6 = v5;
    -[ISUniqueOperationContext removeOperation:](v5, "removeOperation:", a3);
    if (!-[ISUniqueOperationContext countOfOperations](v6, "countOfOperations"))
    {
      if (self->_activeContext == v6)
      {

        self->_activeContext = 0;
      }
      -[NSMutableArray removeObject:](self->_contexts, "removeObject:", v6);
    }
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)lockWithIdentifier:(id)a3
{
  NSMutableDictionary *lockPool;
  id v6;
  id v7;

  -[NSLock lock](self->_lock, "lock");
  lockPool = self->_lockPool;
  if (!lockPool)
  {
    lockPool = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->_lockPool = lockPool;
  }
  v6 = (id)-[NSMutableDictionary objectForKey:](lockPool, "objectForKey:", a3);
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1648]);
    objc_msgSend(v6, "setName:", a3);
    -[NSMutableDictionary setObject:forKey:](self->_lockPool, "setObject:forKey:", v6, a3);
    v7 = v6;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v6;
}

- (id)predecessorForKey:(id)a3 operation:(id)a4
{
  id v7;

  -[NSLock lock](self->_lock, "lock");
  v7 = (id)objc_msgSend(-[ISUniqueOperationManager _contextForOperation:](self, "_contextForOperation:", a4), "uniqueOperationForKey:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  return v7;
}

- (void)setPredecessorIfNeeded:(id)a3 forKey:(id)a4
{
  id v7;

  -[NSLock lock](self->_lock, "lock");
  v7 = -[ISUniqueOperationManager _contextForOperation:](self, "_contextForOperation:", a3);
  if (!objc_msgSend(v7, "uniqueOperationForKey:", a4))
    objc_msgSend(v7, "setUniqueOperation:forKey:", a3, a4);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)uniqueOperationFinished:(id)a3 forKey:(id)a4
{
  id v7;

  -[NSLock lock](self->_lock, "lock");
  v7 = -[ISUniqueOperationManager _contextForOperation:](self, "_contextForOperation:", a3);
  if ((id)objc_msgSend(v7, "uniqueOperationForKey:", a4) == a3)
    objc_msgSend(v7, "setUniqueOperation:forKey:", 0, a4);
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)_activeContext
{
  id result;
  ISUniqueOperationContext *v4;

  result = self->_activeContext;
  if (!result)
  {
    v4 = objc_alloc_init(ISUniqueOperationContext);
    self->_activeContext = v4;
    -[NSMutableArray addObject:](self->_contexts, "addObject:", v4);
    return self->_activeContext;
  }
  return result;
}

- (id)_contextForOperation:(id)a3
{
  NSMutableArray *contexts;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  contexts = self->_contexts;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](contexts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(contexts);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "containsOperation:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](contexts, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

@end
