@implementation PMObjectCache

+ (id)sharedInstance
{
  id result;

  result = (id)s_sharedInstance;
  if (!s_sharedInstance)
  {
    result = -[PMObjectCache initWithCacheSize:]([PMObjectCache alloc], "initWithCacheSize:", 1024);
    s_sharedInstance = (uint64_t)result;
  }
  return result;
}

+ (void)releaseSharedInstance
{
  if (s_sharedInstance)
  {
    objc_msgSend((id)s_sharedInstance, "shutdownCache");

    s_sharedInstance = 0;
  }
}

- (PMObjectCache)initWithCacheSize:(unint64_t)a3
{
  PMObjectCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PMObjectCache;
  v4 = -[PMObjectCache init](&v6, sel_init);
  if (v4)
  {
    v4->_cacheLock = (NSRecursiveLock *)objc_opt_new();
    v4->_purgesInProgress = 0;
    v4->_mapTable = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0x10000, 0);
    v4->_currentSize = 0;
    v4->_setSize = a3;
    v4->_maxSize = a3;
    v4->_reservedMemory = 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if ((PMObjectCache *)s_sharedInstance == self)
    s_sharedInstance = 0;
  __dmb(0xBu);
  -[NSRecursiveLock lock](self->_cacheLock, "lock");
  -[NSMapTable removeAllObjects](self->_mapTable, "removeAllObjects");

  self->_mapTable = 0;
  -[NSRecursiveLock unlock](self->_cacheLock, "unlock");

  v3.receiver = self;
  v3.super_class = (Class)PMObjectCache;
  -[PMObjectCache dealloc](&v3, sel_dealloc);
}

- (unint64_t)reservedMemorySize
{
  return self->_reservedMemory;
}

- (unint64_t)currentSize
{
  return self->_reservedMemory + self->_currentSize;
}

- (unint64_t)getCacheMemoryUsed
{
  unint64_t v3;

  -[NSRecursiveLock lock](self->_cacheLock, "lock");
  v3 = -[PMObjectCache currentSize](self, "currentSize");
  -[NSRecursiveLock unlock](self->_cacheLock, "unlock");
  return v3;
}

- (unint64_t)getCacheSize
{
  unint64_t setSize;

  -[NSRecursiveLock lock](self->_cacheLock, "lock");
  setSize = self->_setSize;
  -[NSRecursiveLock unlock](self->_cacheLock, "unlock");
  return setSize;
}

- (void)setCacheSize:(unint64_t)a3
{
  unint64_t v5;

  -[NSRecursiveLock lock](self->_cacheLock, "lock");
  if (a3 <= 1)
    v5 = 1;
  else
    v5 = a3;
  self->_setSize = v5;
  self->_maxSize = v5;
  -[NSRecursiveLock unlock](self->_cacheLock, "unlock");
}

- (int)addObject:(id)a3 cacheKey:(id)a4 size:(unint64_t)a5 cost:(double)a6 retDidAddObject:(BOOL *)a7
{
  int result;
  id v14;
  PMObjectCacheEntry *v15;
  double v16;
  double v17;

  *a7 = 0;
  result = -50;
  if (a3 && a4)
  {
    -[NSRecursiveLock lock](self->_cacheLock, "lock");
    v14 = -[NSMapTable objectForKey:](self->_mapTable, "objectForKey:", a4);
    if (v14)
    {
      objc_msgSend(v14, "setLastAccess:", self->_numberOfCalls);
    }
    else
    {
      v15 = -[PMObjectCacheEntry initWithKey:cacheItem:size:cost:forCache:]([PMObjectCacheEntry alloc], "initWithKey:cacheItem:size:cost:forCache:", a4, a3, a5, self, a6);
      -[PMObjectCacheEntry setValue:cost:maxCacheSize:](v15, "setValue:cost:maxCacheSize:", self->_numberOfCalls, self->_setSize, a6);
      *(float *)&v16 = self->_responseRate;
      *(float *)&v17 = self->_penalty;
      -[PMObjectCacheEntry resetValue:responseRate:penalty:](v15, "resetValue:responseRate:penalty:", self->_numberOfCalls, v16, v17);
      -[NSMapTable setObject:forKey:](self->_mapTable, "setObject:forKey:", v15, a4);
      self->_currentSize += a5;
      *a7 = 1;

    }
    ++self->_numberOfCalls;
    -[NSRecursiveLock unlock](self->_cacheLock, "unlock");
    return 0;
  }
  return result;
}

- (int)addObject:(id)a3 cacheKey:(id)a4 size:(unint64_t)a5 cost:(double)a6
{
  char v7;

  v7 = 0;
  return -[PMObjectCache addObject:cacheKey:size:cost:retDidAddObject:](self, "addObject:cacheKey:size:cost:retDidAddObject:", a3, a4, a5, &v7, a6);
}

- (id)copyObjectForKeyImpl:(id)a3 cost:(double *)a4 updateAccessTime:(BOOL)a5
{
  id v5;
  _BOOL4 v6;
  id v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  if (a3)
  {
    v6 = a5;
    -[NSRecursiveLock lock](self->_cacheLock, "lock");
    v9 = -[NSMapTable objectForKey:](self->_mapTable, "objectForKey:", v5);
    if (v9)
    {
      v10 = v9;
      v5 = (id)objc_msgSend(v9, "getItem");
      if (a4)
      {
        objc_msgSend(v10, "cost");
        *(_QWORD *)a4 = v11;
      }
      if (v6)
        objc_msgSend(v10, "setLastAccess:", self->_numberOfCalls++);
    }
    else
    {
      v5 = 0;
    }
    -[NSRecursiveLock unlock](self->_cacheLock, "unlock");
  }
  return v5;
}

- (id)copyObjectForKey:(id)a3 cost:(double *)a4
{
  return -[PMObjectCache copyObjectForKeyImpl:cost:updateAccessTime:](self, "copyObjectForKeyImpl:cost:updateAccessTime:", a3, a4, 1);
}

- (id)copyObjectForKeyDontUpdateAccessTime:(id)a3 cost:(double *)a4
{
  return -[PMObjectCache copyObjectForKeyImpl:cost:updateAccessTime:](self, "copyObjectForKeyImpl:cost:updateAccessTime:", a3, a4, 0);
}

- (void)removeObjectForKey:(id)a3
{
  id v5;

  if (a3)
  {
    -[NSRecursiveLock lock](self->_cacheLock, "lock");
    v5 = -[NSMapTable objectForKey:](self->_mapTable, "objectForKey:", a3);
    if (v5)
    {
      self->_currentSize -= objc_msgSend(v5, "getSize");
      -[NSMapTable removeObjectForKey:](self->_mapTable, "removeObjectForKey:", a3);
    }
    -[NSRecursiveLock unlock](self->_cacheLock, "unlock");
  }
}

- (void)clearCache
{
  -[NSRecursiveLock lock](self->_cacheLock, "lock");
  -[NSMapTable removeAllObjects](self->_mapTable, "removeAllObjects");
  self->_currentSize = 0;
  -[NSRecursiveLock unlock](self->_cacheLock, "unlock");
}

- (void)reserveCacheMemory:(int64_t)a3
{
  -[NSRecursiveLock lock](self->_cacheLock, "lock");
  self->_reservedMemory += a3;
  -[NSRecursiveLock unlock](self->_cacheLock, "unlock");
}

@end
