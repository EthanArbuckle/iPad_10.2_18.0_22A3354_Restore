@implementation VUIAppDocumentUpdateEventStore

- (VUIAppDocumentUpdateEventStore)init
{
  VUIAppDocumentUpdateEventStore *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *eventByEventDescriptor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIAppDocumentUpdateEventStore;
  v2 = -[VUIAppDocumentUpdateEventStore init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    eventByEventDescriptor = v2->_eventByEventDescriptor;
    v2->_eventByEventDescriptor = v3;

  }
  return v2;
}

- (NSArray)events
{
  void *v2;
  void *v3;

  -[VUIAppDocumentUpdateEventStore eventByEventDescriptor](self, "eventByEventDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSMutableDictionary)eventByEventDescriptor
{
  return self->_eventByEventDescriptor;
}

- (void)addEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIAppDocumentUpdateEventStore addEvents:](self, "addEvents:", v6, v7, v8);
}

- (void)addEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIAppDocumentUpdateEventStore eventByEventDescriptor](self, "eventByEventDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "descriptor", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "coalescedEvent:", v11);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = v11;
        }
        v16 = v15;
        objc_msgSend(v5, "vui_setOrRemoveObject:forKey:", v15, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)removeEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VUIAppDocumentUpdateEventStore eventByEventDescriptor](self, "eventByEventDescriptor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)removeAllEvents
{
  id v2;

  -[VUIAppDocumentUpdateEventStore eventByEventDescriptor](self, "eventByEventDescriptor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12.receiver = self;
  v12.super_class = (Class)VUIAppDocumentUpdateEventStore;
  -[VUIAppDocumentUpdateEventStore description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIAppDocumentUpdateEventStore eventByEventDescriptor](self, "eventByEventDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("eventByEventDescriptor"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@>"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setEventByEventDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_eventByEventDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventByEventDescriptor, 0);
}

@end
