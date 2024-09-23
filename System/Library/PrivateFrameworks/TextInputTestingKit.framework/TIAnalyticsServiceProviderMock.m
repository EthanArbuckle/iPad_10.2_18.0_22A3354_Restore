@implementation TIAnalyticsServiceProviderMock

- (TIAnalyticsServiceProviderMock)init
{
  TIAnalyticsServiceProviderMock *v2;
  uint64_t v3;
  NSMutableDictionary *allEvents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIAnalyticsServiceProviderMock;
  v2 = -[TIAnalyticsServiceProviderMock init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    allEvents = v2->_allEvents;
    v2->_allEvents = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (id)eventsWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TIAnalyticsServiceProviderMock allEvents](self, "allEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    -[TIAnalyticsServiceProviderMock allEvents](self, "allEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (int64_t)countEvent:(id)a3
{
  void *v3;
  int64_t v4;

  -[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)countEvent:(id)a3 filteredWithPredicate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  -[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  return v9;
}

- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  -[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIAnalyticsServiceProviderMock sumIntegerField:forEvents:](self, "sumIntegerField:forEvents:", v6, v7);

  return v8;
}

- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;

  v8 = a5;
  v9 = a3;
  -[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[TIAnalyticsServiceProviderMock sumIntegerField:forEvents:](self, "sumIntegerField:forEvents:", v9, v11);
  return v12;
}

- (int64_t)sumIntegerField:(id)a3 forEvents:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "objectForKey:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += objc_msgSend(v12, "integerValue");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)sumFloatField:(id)a3 forEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;

  v6 = a3;
  -[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIAnalyticsServiceProviderMock sumFloatField:forEvents:](self, "sumFloatField:forEvents:", v6, v7);
  v9 = v8;

  return v9;
}

- (double)sumFloatField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v8 = a5;
  v9 = a3;
  -[TIAnalyticsServiceProviderMock eventsWithName:](self, "eventsWithName:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIAnalyticsServiceProviderMock sumFloatField:forEvents:](self, "sumFloatField:forEvents:", v9, v11);
  v13 = v12;

  return v13;
}

- (double)sumFloatField:(id)a3 forEvents:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  float v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKey:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        v10 = v10 + v13;

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (void)clear
{
  id v2;

  -[TIAnalyticsServiceProviderMock allEvents](self, "allEvents");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMutableDictionary)allEvents
{
  return self->_allEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEvents, 0);
}

@end
