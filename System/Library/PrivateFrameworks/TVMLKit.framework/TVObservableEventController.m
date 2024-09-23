@implementation TVObservableEventController

- (void)dispatchEvent:(id)a3 sender:(id)a4 withUserInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
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
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observerRecords, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "handleEvent:sender:withUserInfo:", v8, v9, v10);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)addObserver:(id)a3 forEvent:(id)a4
{
  id v6;
  NSMutableDictionary *observerRecords;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMapTable *v10;
  NSMapTable *eventsByObserver;
  void *v12;
  void *v13;
  NSMapTable *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  observerRecords = self->_observerRecords;
  if (!observerRecords)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_observerRecords;
    self->_observerRecords = v8;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    eventsByObserver = self->_eventsByObserver;
    self->_eventsByObserver = v10;

    observerRecords = self->_observerRecords;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](observerRecords, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observerRecords, "setObject:forKeyedSubscript:", v12, v6);
  }
  objc_msgSend(v12, "addObject:", v15);
  -[NSMapTable objectForKey:](self->_eventsByObserver, "objectForKey:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = self->_eventsByObserver;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v14, "setObject:forKey:", v13, v15);
  }
  objc_msgSend(v13, "addObject:", v6);

}

- (void)removeObserver:(id)a3 forEvent:(id)a4
{
  NSMutableDictionary *observerRecords;
  id v6;
  id v7;

  observerRecords = self->_observerRecords;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](observerRecords, "objectForKeyedSubscript:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_eventsByObserver, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[TVObservableEventController removeObserver:forEvent:](self, "removeObserver:forEvent:", v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsByObserver, 0);
  objc_storeStrong((id *)&self->_observerRecords, 0);
}

@end
