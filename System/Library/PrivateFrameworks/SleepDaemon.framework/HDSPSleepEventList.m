@implementation HDSPSleepEventList

- (HDSPSleepEventList)init
{
  HDSPSleepEventList *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *eventsByProvider;
  NSArray *sortedEvents;
  HDSPSleepEventList *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDSPSleepEventList;
  v2 = -[HDSPSleepEventList init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    eventsByProvider = v2->_eventsByProvider;
    v2->_eventsByProvider = v3;

    sortedEvents = v2->_sortedEvents;
    v2->_sortedEvents = (NSArray *)MEMORY[0x24BDBD1A8];

    v6 = v2;
  }

  return v2;
}

- (void)addEvents:(id)a3 provider:(id)a4
{
  id v6;
  NSMutableDictionary *eventsByProvider;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a3;
  v6 = a4;
  eventsByProvider = self->_eventsByProvider;
  objc_msgSend(v6, "providerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](eventsByProvider, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = self->_eventsByProvider;
    objc_msgSend(v6, "providerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__HDSPSleepEventList_addEvents_provider___block_invoke;
  v14[3] = &unk_24D4E56D8;
  v15 = v9;
  v12 = v9;
  objc_msgSend(v13, "na_each:", v14);
  -[HDSPSleepEventList _sortEvents](self, "_sortEvents");

}

void __41__HDSPSleepEventList_addEvents_provider___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

- (void)_sortEvents
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *sortedEvents;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_eventsByProvider;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_eventsByProvider, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8), (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  HKSPSleepEventComparator();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingComparator:", v11);

  v12 = (NSArray *)objc_msgSend(v3, "copy");
  sortedEvents = self->_sortedEvents;
  self->_sortedEvents = v12;

}

- (void)removeEventsForProvider:(id)a3
{
  NSMutableDictionary *eventsByProvider;
  void *v5;

  eventsByProvider = self->_eventsByProvider;
  objc_msgSend(a3, "providerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](eventsByProvider, "removeObjectForKey:", v5);

  -[HDSPSleepEventList _sortEvents](self, "_sortEvents");
}

- (void)removeEvents:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_eventsByProvider;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_eventsByProvider, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __35__HDSPSleepEventList_removeEvents___block_invoke;
        v13[3] = &unk_24D4E56D8;
        v14 = v11;
        v12 = v11;
        objc_msgSend(v4, "na_each:", v13);

        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[HDSPSleepEventList _sortEvents](self, "_sortEvents");
}

void __35__HDSPSleepEventList_removeEvents___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

- (void)removeAllEvents
{
  NSArray *sortedEvents;

  -[NSMutableDictionary removeAllObjects](self->_eventsByProvider, "removeAllObjects");
  sortedEvents = self->_sortedEvents;
  self->_sortedEvents = (NSArray *)MEMORY[0x24BDBD1A8];

}

- (id)nextEvent
{
  return -[NSArray firstObject](self->_sortedEvents, "firstObject");
}

- (id)overdueEventsForDate:(id)a3
{
  id v4;
  NSArray *sortedEvents;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  sortedEvents = self->_sortedEvents;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__HDSPSleepEventList_overdueEventsForDate___block_invoke;
  v9[3] = &unk_24D4E5450;
  v10 = v4;
  v6 = v4;
  -[NSArray na_filter:](sortedEvents, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __43__HDSPSleepEventList_overdueEventsForDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_isBeforeOrSameAsDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)allEvents
{
  return self->_sortedEvents;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HDSPSleepEventList succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepEventList allEvents](self, "allEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v4, CFSTR("sleepEvents"), &stru_24D4E68A0, 0);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HDSPSleepEventList descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableDictionary)eventsByProvider
{
  return self->_eventsByProvider;
}

- (NSArray)sortedEvents
{
  return self->_sortedEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedEvents, 0);
  objc_storeStrong((id *)&self->_eventsByProvider, 0);
}

@end
