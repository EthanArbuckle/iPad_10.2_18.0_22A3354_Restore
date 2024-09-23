@implementation STReferenceCountedCache

- (void)decrementReferenceCountForKey:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  -[STReferenceCountedCache cachedObjectForKey:](self, "cachedObjectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[STReferenceCountedCache _referenceCountForKey:]((uint64_t)self, (uint64_t)v19);
    if (v5 < 2)
    {
      v11 = self ? self->_referenceCounts : 0;
      -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v19);
    }
    else
    {
      v6 = v5 - 1;
      v7 = self ? self->_referenceCounts : 0;
      v8 = (void *)MEMORY[0x1E0CB37E8];
      v9 = v7;
      objc_msgSend(v8, "numberWithInteger:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v19);

    }
    if (self)
    {
      v12 = self->_cache;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[NSMutableDictionary allKeys](v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (!-[STReferenceCountedCache _referenceCountForKey:]((uint64_t)self, v18))
              -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v15);
      }

    }
  }

}

- (uint64_t)_referenceCountForKey:(uint64_t)result
{
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(*(id *)(result + 16), "objectForKey:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

    return v3;
  }
  return result;
}

- (void)incrementReferenceCountForKey:(id)a3
{
  void *v4;
  uint64_t v5;
  NSMutableDictionary *referenceCounts;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[STReferenceCountedCache cachedObjectForKey:](self, "cachedObjectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[STReferenceCountedCache _referenceCountForKey:]((uint64_t)self, (uint64_t)v10) + 1;
    if (self)
      referenceCounts = self->_referenceCounts;
    else
      referenceCounts = 0;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = referenceCounts;
    objc_msgSend(v7, "numberWithInteger:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v10);

  }
}

- (id)cachedObjectForKey:(id)a3
{
  if (self)
    self = (STReferenceCountedCache *)self->_cache;
  return (id)-[STReferenceCountedCache objectForKey:](self, "objectForKey:", a3);
}

- (void)cacheObject:(id)a3 forKey:(id)a4
{
  if (self)
    self = (STReferenceCountedCache *)self->_cache;
  -[STReferenceCountedCache setObject:forKey:](self, "setObject:forKey:", a3, a4);
}

- (STReferenceCountedCache)init
{
  STReferenceCountedCache *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  uint64_t v5;
  NSMutableDictionary *referenceCounts;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STReferenceCountedCache;
  v2 = -[STReferenceCountedCache init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    referenceCounts = v2->_referenceCounts;
    v2->_referenceCounts = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)clearObjectForKey:(id)a3
{
  NSMutableDictionary *referenceCounts;

  if (self)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", a3);
    referenceCounts = self->_referenceCounts;
  }
  else
  {
    objc_msgSend(0, "removeObjectForKey:", a3);
    referenceCounts = 0;
  }
  -[NSMutableDictionary removeObjectForKey:](referenceCounts, "removeObjectForKey:", a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceCounts, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
