@implementation STUInMemoryEventStore

- (STUInMemoryEventStore)init
{
  STUInMemoryEventStore *v2;
  uint64_t v3;
  NSHashTable *mEvents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUInMemoryEventStore;
  v2 = -[STUInMemoryEventStore init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 0));
    mEvents = v2->mEvents;
    v2->mEvents = (NSHashTable *)v3;

  }
  return v2;
}

- (BOOL)storeEvent:(id)a3 error:(id *)a4
{
  -[NSHashTable addObject:](self->mEvents, "addObject:", a3, a4);
  return 1;
}

- (id)eventLogWithStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc((Class)CRKEventLog);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUInMemoryEventStore eventsSinceDate:](self, "eventsSinceDate:", v8));
  v11 = objc_msgSend(v9, "initWithStartDate:endDate:events:", v8, v7, v10);

  return v11;
}

- (id)eventsSinceDate:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSHashTable *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->mEvents;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date", (_QWORD)v15));
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "earlierDate:", v12));

        if (v13 == v4)
          -[NSMutableSet addObject:](v5, "addObject:", v11);
      }
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)purgeEventsBeforeDate:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = -[NSHashTable copy](self->mEvents, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "earlierDate:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));

        if (v13 == v14)
          -[NSHashTable removeObject:](self->mEvents, "removeObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEvents, 0);
}

@end
