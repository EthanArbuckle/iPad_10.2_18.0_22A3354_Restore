@implementation _WGConcreteDataSource

- (_WGConcreteDataSource)init
{
  _WGConcreteDataSource *v2;
  NSMutableArray *v3;
  NSMutableArray *observers;
  NSMutableDictionary *v5;
  NSMutableDictionary *identifiersToData;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_WGConcreteDataSource;
  v2 = -[_WGConcreteDataSource init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    identifiersToData = v2->_identifiersToData;
    v2->_identifiersToData = v5;

  }
  return v2;
}

- (void)addObserver:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v7)
    -[NSMutableArray addObject:](self->_observers, "addObject:", v7);
  if (v6)
    v6[2](v6);

}

- (void)removeObserver:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v7)
    -[NSMutableArray removeObject:](self->_observers, "removeObject:", v7);
  if (v6)
    v6[2](v6);

}

- (void)dataSource:(id)a3 replaceWithDatum:(id)a4 observerUpdateBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSMutableDictionary *identifiersToData;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7 && v8)
  {
    identifiersToData = self->_identifiersToData;
    objc_msgSend(v7, "datumIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](identifiersToData, "setObject:forKey:", v7, v11);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_observers;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), v7);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

- (void)dataSource:(id)a3 removeDatumWithIdentifier:(id)a4 observerUpdateBlock:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = objc_msgSend(v7, "length");
  if (v8 && v9)
  {
    -[NSMutableDictionary objectForKey:](self->_identifiersToData, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_identifiersToData, "removeObjectForKey:", v7);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = self->_observers;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            v8[2](v8, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), v10);
          }
          while (v13 != v15);
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
  }

}

- (NSArray)dataIdentifiers
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_identifiersToData, "allKeys");
}

- (NSArray)data
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_identifiersToData, "allValues");
}

- (id)datumWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_identifiersToData, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToData, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
