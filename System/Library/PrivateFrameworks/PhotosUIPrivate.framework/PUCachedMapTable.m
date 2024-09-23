@implementation PUCachedMapTable

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    -[PUCachedMapTable _mapTable](self, "_mapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)v4[2];
    v4[2] = v6;

    -[PUCachedMapTable _cachedObjects](self, "_cachedObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");
    v10 = (void *)v4[3];
    v4[3] = v9;

  }
  return v4;
}

- (unint64_t)accurateCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PUCachedMapTable _mapTable](self, "_mapTable", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = v5;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        --v8;
      }
      while (v8);
      v6 += v5;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUCachedMapTable _mapTable](self, "_mapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUCachedMapTable _objectWasRecentlyUsed:](self, "_objectWasRecentlyUsed:", v6);
  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PUCachedMapTable _mapTable](self, "_mapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUCachedMapTable _cachedObjects](self, "_cachedObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v5);

  }
  -[PUCachedMapTable _mapTable](self, "_mapTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[PUCachedMapTable _mapTableCreateIfNeeded:](self, "_mapTableCreateIfNeeded:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

  -[PUCachedMapTable _objectWasRecentlyUsed:](self, "_objectWasRecentlyUsed:", v8);
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  void (**v5)(id, uint64_t, void *, unsigned __int8 *);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unsigned __int8 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCachedMapTable.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  -[PUCachedMapTable _mapTable](self, "_mapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
      objc_msgSend(v6, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v5[2](v5, v12, v13, &v20);
      v14 = v20;

      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v9)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (void)removeAllObjects
{
  void *v3;
  id v4;

  -[PUCachedMapTable _mapTable](self, "_mapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PUCachedMapTable _cachedObjects](self, "_cachedObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (id)keyEnumerator
{
  void *v2;
  void *v3;

  -[PUCachedMapTable _mapTableCreateIfNeeded:](self, "_mapTableCreateIfNeeded:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mapTableCreateIfNeeded:(BOOL)a3
{
  NSMapTable *mapTable;
  BOOL v5;
  NSMapTable *v6;
  NSMapTable *v7;

  mapTable = self->__mapTable;
  if (mapTable)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, -[PUCachedMapTable _initialCapacity](self, "_initialCapacity"));
    v7 = self->__mapTable;
    self->__mapTable = v6;

    mapTable = self->__mapTable;
  }
  return mapTable;
}

- (id)_cachedObjectsCreateIfNeeded:(BOOL)a3
{
  NSMutableOrderedSet *cachedObjects;
  BOOL v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;

  cachedObjects = self->__cachedObjects;
  if (cachedObjects)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", -[PUCachedMapTable _initialCapacity](self, "_initialCapacity", a3));
    v6 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->__cachedObjects;
    self->__cachedObjects = v6;

    cachedObjects = self->__cachedObjects;
  }
  return cachedObjects;
}

- (unint64_t)_initialCapacity
{
  unint64_t v2;

  v2 = -[PUCachedMapTable cacheCountLimit](self, "cacheCountLimit");
  if (2 * v2)
    return 2 * v2;
  else
    return 64;
}

- (void)_objectWasRecentlyUsed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[PUCachedMapTable _cachedObjectsCreateIfNeeded:](self, "_cachedObjectsCreateIfNeeded:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v8)
    {
      if (objc_msgSend(v5, "containsObject:", v8))
        objc_msgSend(v5, "removeObject:", v8);
      objc_msgSend(v5, "addObject:", v8);
      v7 = -[PUCachedMapTable cacheCountLimit](self, "cacheCountLimit");
      if (objc_msgSend(v5, "count") > v7)
        objc_msgSend(v5, "removeObjectsInRange:", 0, objc_msgSend(v5, "count") - v7);
    }

    v4 = v8;
  }

}

- (unint64_t)cacheCountLimit
{
  return self->_cacheCountLimit;
}

- (void)setCacheCountLimit:(unint64_t)a3
{
  self->_cacheCountLimit = a3;
}

- (NSMapTable)_mapTable
{
  return self->__mapTable;
}

- (NSMutableOrderedSet)_cachedObjects
{
  return self->__cachedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedObjects, 0);
  objc_storeStrong((id *)&self->__mapTable, 0);
}

@end
