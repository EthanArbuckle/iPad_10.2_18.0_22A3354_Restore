@implementation PVInputBitmapCache

- (PVInputBitmapCache)init
{
  PVInputBitmapCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PVInputBitmapCache;
  v2 = -[PVInputBitmapCache init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cache = v2->_cache;
    v2->_cache = v3;

    v2->_countLimit = 3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_didRecieveMemoryWarning_, *MEMORY[0x1E0CEB298], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB298], 0);

  v4.receiver = self;
  v4.super_class = (Class)PVInputBitmapCache;
  -[PVInputBitmapCache dealloc](&v4, sel_dealloc);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_cache, "setObject:forKey:", a3, a4);
  -[PVInputBitmapCache purge:](self, "purge:", 0);
}

- (id)objectForKey:(id)a3
{
  -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setCountLimit:(unint64_t)a3
{
  self->_countLimit = a3;
  -[PVInputBitmapCache purge:](self, "purge:", 0);
}

- (void)purge:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableDictionary **p_cache;
  void *v6;
  NSMutableDictionary *cache;
  unint64_t v9;
  uint64_t i;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  p_cache = &self->_cache;
  -[NSMutableDictionary keysSortedByValueUsingComparator:](self->_cache, "keysSortedByValueUsingComparator:", &__block_literal_global_7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](*p_cache, "count") > self->_countLimit || v3)
  {
    cache = self->_cache;
    if (v3)
    {
      v9 = -[NSMutableDictionary count](cache, "count");
      if (!v9)
        goto LABEL_11;
    }
    else
    {
      v9 = -[NSMutableDictionary count](cache, "count") - self->_countLimit;
      if (!v9)
        goto LABEL_11;
    }
    for (i = 0; i != v9; ++i)
    {
      v11 = self->_cache;
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v12);

    }
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    while (2)
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v18, (_QWORD)v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          objc_msgSend(v19, "lastUsedTime");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timeIntervalSinceDate:", v21);
          v23 = v22;

          if (v23 <= 1.0)
          {

            goto LABEL_23;
          }
          -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", v18);
        }

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_23:

}

uint64_t __28__PVInputBitmapCache_purge___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastUsedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUsedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

- (void)didRecieveMemoryWarning:(id)a3
{
  objc_msgSend((id)sInputBitmapCacheLock, "lock", a3);
  -[PVInputBitmapCache purge:](self, "purge:", 1);
  objc_msgSend((id)sInputBitmapCacheLock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
