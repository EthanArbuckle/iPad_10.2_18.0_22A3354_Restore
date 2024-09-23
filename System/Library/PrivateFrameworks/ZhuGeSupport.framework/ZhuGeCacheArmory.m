@implementation ZhuGeCacheArmory

- (ZhuGeCacheArmory)initWithName:(id)a3 andCapacity:(id)a4 andCacheType:(Class)a5
{
  id v9;
  id v10;
  ZhuGeCacheArmory *v11;
  ZhuGeCacheArmory *v12;
  uint64_t v13;
  NSMutableArray *cacheList;
  uint64_t v15;
  NSMutableDictionary *cacheDict;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ZhuGeCacheArmory;
  v11 = -[ZhuGeCacheArmory init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    initPthreadRecursiveMutex(&v11->aRecursiveMutex);
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v12->_capacity, a4);
    objc_storeStrong((id *)&v12->_cacheType, a5);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSNumber integerValue](v12->_capacity, "integerValue"));
    cacheList = v12->_cacheList;
    v12->_cacheList = (NSMutableArray *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSNumber integerValue](v12->_capacity, "integerValue"));
    cacheDict = v12->_cacheDict;
    v12->_cacheDict = (NSMutableDictionary *)v15;

  }
  return v12;
}

- (void)clearCache
{
  _opaque_pthread_mutex_t *p_aRecursiveMutex;
  void *v4;
  void *v5;

  p_aRecursiveMutex = &self->aRecursiveMutex;
  pthread_mutex_lock(&self->aRecursiveMutex);
  -[ZhuGeCacheArmory cacheDict](self, "cacheDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[ZhuGeCacheArmory cacheList](self, "cacheList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  pthread_mutex_unlock(p_aRecursiveMutex);
}

- (void)delCacheForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_aRecursiveMutex;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_aRecursiveMutex = &self->aRecursiveMutex;
  pthread_mutex_lock(&self->aRecursiveMutex);
  if (v9)
  {
    -[ZhuGeCacheArmory cacheList](self, "cacheList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v9);

    if (v6)
    {
      -[ZhuGeCacheArmory cacheDict](self, "cacheDict");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectForKey:", v9);

      -[ZhuGeCacheArmory cacheList](self, "cacheList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v9);

    }
  }
  pthread_mutex_unlock(p_aRecursiveMutex);

}

- (id)getCacheForKey:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_aRecursiveMutex;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v4 = a3;
  p_aRecursiveMutex = &self->aRecursiveMutex;
  pthread_mutex_lock(&self->aRecursiveMutex);
  -[ZhuGeCacheArmory cacheList](self, "cacheList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    -[ZhuGeCacheArmory cacheDict](self, "cacheDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ZhuGeCacheArmory cacheList](self, "cacheList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v4);

    if (v12)
    {
      -[ZhuGeCacheArmory cacheList](self, "cacheList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObject:", v4);

      -[ZhuGeCacheArmory cacheList](self, "cacheList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v4);

    }
  }
  else
  {
    v9 = 0;
  }
  pthread_mutex_unlock(p_aRecursiveMutex);

  return v9;
}

- (BOOL)setCache:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  _opaque_pthread_mutex_t *p_aRecursiveMutex;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v8 = a3;
  v9 = a4;
  p_aRecursiveMutex = &self->aRecursiveMutex;
  pthread_mutex_lock(&self->aRecursiveMutex);
  if (!a5)
  {
    -[ZhuGeCacheArmory name](self, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m", "-[ZhuGeCacheArmory setCache:forKey:withError:]", 91, CFSTR("In %@, error p-pointer is nil!"), v30, v31, v32, (uint64_t)v29);

    v28 = 0;
    goto LABEL_19;
  }
  *a5 = 0;
  if (!v8)
  {
    -[ZhuGeCacheArmory name](self, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m", "-[ZhuGeCacheArmory setCache:forKey:withError:]", 97, CFSTR("In %@, aCache pointer is nil!"), v34, v35, v36, (uint64_t)v33);
LABEL_17:

    v40 = (void *)MEMORY[0x24BDD1540];
    v41 = 45;
LABEL_18:
    objc_msgSend(v40, "errorWithZhuGeErrorCode:underlyingError:", v41, 0);
    v28 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!v9)
  {
    -[ZhuGeCacheArmory name](self, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m", "-[ZhuGeCacheArmory setCache:forKey:withError:]", 103, CFSTR("In %@, aKey pointer is nil!"), v37, v38, v39, (uint64_t)v33);
    goto LABEL_17;
  }
  -[ZhuGeCacheArmory cacheList](self, "cacheList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v9);

  if (v12)
    -[ZhuGeCacheArmory delCacheForKey:](self, "delCacheForKey:", v9);
  if (-[ZhuGeCacheArmory cacheType](self, "cacheType"))
  {
    -[ZhuGeCacheArmory cacheType](self, "cacheType");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[ZhuGeCacheArmory name](self, "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeCache.m", "-[ZhuGeCacheArmory setCache:forKey:withError:]", 115, CFSTR("In %@, key \"%@\" got a wrong cache class type \"%@\"!"), v44, v45, v46, (uint64_t)v43);

      v40 = (void *)MEMORY[0x24BDD1540];
      v41 = 9;
      goto LABEL_18;
    }
  }
  -[ZhuGeCacheArmory capacity](self, "capacity");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[ZhuGeCacheArmory cacheList](self, "cacheList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    -[ZhuGeCacheArmory capacity](self, "capacity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");

    if (v16 >= v18)
    {
      -[ZhuGeCacheArmory cacheList](self, "cacheList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");
      -[ZhuGeCacheArmory capacity](self, "capacity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");

      if (v20 - v22 + 1 >= 1)
      {
        v23 = v20 - v22 + 2;
        do
        {
          -[ZhuGeCacheArmory cacheList](self, "cacheList");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[ZhuGeCacheArmory delCacheForKey:](self, "delCacheForKey:", v25);

          --v23;
        }
        while (v23 > 1);
      }
    }
  }
  -[ZhuGeCacheArmory cacheList](self, "cacheList");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObject:", v9);

  -[ZhuGeCacheArmory cacheDict](self, "cacheDict");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, v9);

  v28 = 1;
LABEL_19:
  pthread_mutex_unlock(p_aRecursiveMutex);

  return v28;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)capacity
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (Class)cacheType
{
  return (Class)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableArray)cacheList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableDictionary)cacheDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDict, 0);
  objc_storeStrong((id *)&self->_cacheList, 0);
  objc_storeStrong((id *)&self->_cacheType, 0);
  objc_storeStrong((id *)&self->_capacity, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
