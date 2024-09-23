@implementation SUScriptObjectInvocationBatch

- (SUScriptObjectInvocationBatch)init
{
  SUScriptObjectInvocationBatch *v2;
  NSLock *v3;
  NSLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptObjectInvocationBatch;
  v2 = -[SUScriptObjectInvocationBatch init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v3;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *invocationQueue;
  NSLock *lock;
  __CFDictionary *proxies;
  objc_super v6;

  invocationQueue = self->_invocationQueue;
  self->_invocationQueue = 0;

  lock = self->_lock;
  self->_lock = 0;

  proxies = self->_proxies;
  if (proxies)
  {
    CFRelease(proxies);
    self->_proxies = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SUScriptObjectInvocationBatch;
  -[SUScriptObjectInvocationBatch dealloc](&v6, sel_dealloc);
}

- (id)batchProxyForObject:(id)a3
{
  id v4;
  __CFDictionary *proxies;
  SUScriptObjectBatchProxy *v6;

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  proxies = self->_proxies;
  if (!proxies)
  {
    proxies = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x24BDBD6B0]);
    self->_proxies = proxies;
  }
  CFDictionaryGetValue(proxies, v4);
  v6 = (SUScriptObjectBatchProxy *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(SUScriptObjectBatchProxy);
    -[SUScriptObjectBatchProxy setInvocationBatch:](v6, "setInvocationBatch:", self);
    -[SUScriptObjectBatchProxy setTarget:](v6, "setTarget:", v4);
    CFDictionarySetValue(self->_proxies, v4, v6);
  }
  -[NSLock unlock](self->_lock, "unlock");

  return v6;
}

- (void)checkOutBatchTarget:(id)a3
{
  __CFDictionary *proxies;
  void *v5;
  void *v6;
  id key;

  key = a3;
  -[NSLock lock](self->_lock, "lock");
  proxies = self->_proxies;
  if (proxies)
  {
    CFDictionaryGetValue(proxies, key);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "setTarget:", 0);
      CFDictionaryRemoveValue(self->_proxies, key);
    }

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (id)copyQueuedInvocationsForObject:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NSLock lock](self->_lock, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_invocationQueue;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "target", (_QWORD)v14);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[NSLock unlock](self->_lock, "unlock");
  return v5;
}

- (void)dequeueInvocations
{
  NSMutableArray *invocationQueue;
  void *v4;
  id v5;

  -[NSLock lock](self->_lock, "lock");
  v5 = (id)-[NSMutableArray copy](self->_invocationQueue, "copy");
  invocationQueue = self->_invocationQueue;
  self->_invocationQueue = 0;

  -[NSLock unlock](self->_lock, "unlock");
  if (objc_msgSend(v5, "count"))
  {
    -[SUScriptObjectInvocationBatch rootObject](self, "rootObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willPerformBatchedInvocations");
    objc_msgSend(v5, "makeObjectsPerformSelector:", sel_invoke);
    objc_msgSend(v4, "didPerformBatchedInvocations");

  }
}

- (void)_delayedDequeueInvocations
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  WebThreadRunOnMainThread();
}

uint64_t __59__SUScriptObjectInvocationBatch__delayedDequeueInvocations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dequeueInvocations");
}

- (void)enqueueInvocation:(id)a3
{
  NSLock *lock;
  id v5;
  NSMutableArray *v6;
  NSMutableArray *invocationQueue;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  if (!self->_invocationQueue)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    invocationQueue = self->_invocationQueue;
    self->_invocationQueue = v6;

  }
  objc_msgSend(v5, "retainArguments");
  -[NSMutableArray addObject:](self->_invocationQueue, "addObject:", v5);

  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedDequeueInvocations, 0);
  -[SUScriptObjectInvocationBatch performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedDequeueInvocations, 0, 0.0);
}

- (SUScriptObject)rootObject
{
  SUScriptObject *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_rootObject;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setRootObject:(id)a3
{
  SUScriptObject *v4;
  SUScriptObject *rootObject;
  SUScriptObject *v6;

  v4 = (SUScriptObject *)a3;
  -[NSLock lock](self->_lock, "lock");
  rootObject = self->_rootObject;
  self->_rootObject = v4;
  v6 = v4;

  -[NSLock unlock](self->_lock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_invocationQueue, 0);
}

@end
