@implementation CollectionOrderStorage

- (CollectionOrderStorage)init
{
  CollectionOrderStorage *v2;
  CollectionOrderStorage *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CollectionOrderStorage;
  v2 = -[CollectionOrderStorage init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CollectionOrderStorage _loadOrder](v2, "_loadOrder");
  return v3;
}

- (void)_loadOrder
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *orderedIdentifiers;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("__internal_CollectionOrderStorage")));
  v5 = (void *)v4;
  v6 = &__NSArray0__struct;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithArray:](NSMutableOrderedSet, "orderedSetWithArray:", v7));
  orderedIdentifiers = self->_orderedIdentifiers;
  self->_orderedIdentifiers = v8;

}

- (void)_saveOrder
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_orderedIdentifiers, "array"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("__internal_CollectionOrderStorage"));

}

- (void)removeCollections:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSMutableOrderedSet *orderedIdentifiers;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        orderedIdentifiers = self->_orderedIdentifiers;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
        -[NSMutableOrderedSet removeObject:](orderedIdentifiers, "removeObject:", v11);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)editCollection:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  NSMutableOrderedSet *orderedIdentifiers;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  if (v5)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("__internal_CollectionSavedLinesIdentifier")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("__internal_CollectionSavedPlacesIdentifier")) & 1) == 0)
    {
      v6 = objc_msgSend(v8, "isLegacyFavoritesCollection");
      orderedIdentifiers = self->_orderedIdentifiers;
      if (v6)
      {
        -[NSMutableOrderedSet addObject:](orderedIdentifiers, "addObject:", v5);
      }
      else
      {
        -[NSMutableOrderedSet removeObject:](orderedIdentifiers, "removeObject:", v5);
        -[NSMutableOrderedSet insertObject:atIndex:](self->_orderedIdentifiers, "insertObject:atIndex:", v5, 0);
      }
    }
    -[CollectionOrderStorage _saveOrder](self, "_saveOrder");
  }

}

- (id)orderCollections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *i;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v23;
  NSMutableOrderedSet *obj;
  void *v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v27 = objc_msgSend(v4, "mutableCopy");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
    v23 = v5;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", &stru_1011DFE88);
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", v6));
      objc_msgSend(v27, "removeObjectAtIndex:", v7);
      objc_msgSend(v25, "addObject:", v8);

    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = self->_orderedIdentifiers;
    v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v13 = v27;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v29;
            while (2)
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(_QWORD *)v29 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
                v20 = objc_msgSend(v19, "isEqualToString:", v12);

                if (v20)
                {
                  objc_msgSend(v25, "addObject:", v18);
                  objc_msgSend(v13, "removeObject:", v18);
                  goto LABEL_19;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              if (v15)
                continue;
              break;
            }
          }
LABEL_19:

        }
        v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v10);
    }

    objc_msgSend(v25, "addObjectsFromArray:", v27);
    v21 = objc_msgSend(v25, "copy");

    v5 = v23;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedIdentifiers, 0);
}

@end
