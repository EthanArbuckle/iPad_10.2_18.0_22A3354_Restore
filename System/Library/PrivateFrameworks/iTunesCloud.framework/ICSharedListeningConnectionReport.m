@implementation ICSharedListeningConnectionReport

- (ICSharedListeningConnectionReport)init
{
  ICSharedListeningConnectionReport *v2;
  uint64_t v3;
  NSMapTable *allEvents;
  uint64_t v5;
  NSMutableArray *topLevelEvents;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSharedListeningConnectionReport;
  v2 = -[ICSharedListeningConnectionReport init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    allEvents = v2->_allEvents;
    v2->_allEvents = (NSMapTable *)v3;

    v5 = objc_opt_new();
    topLevelEvents = v2->_topLevelEvents;
    v2->_topLevelEvents = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)startEvent:(id)a3
{
  -[ICSharedListeningConnectionReport startEvent:withParentEvent:](self, "startEvent:withParentEvent:", a3, 0);
}

- (void)startEvent:(id)a3 withParentEvent:(id)a4
{
  id v6;
  ICSharedListeningConnectionReportEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = -[ICSharedListeningConnectionReportEvent initWithName:]([ICSharedListeningConnectionReportEvent alloc], "initWithName:", v11);
  if (v6)
  {
    -[ICSharedListeningConnectionReport allEvents](self, "allEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubEvent:", v7);

  }
  else
  {
    -[ICSharedListeningConnectionReport topLevelEvents](self, "topLevelEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);
  }

  -[ICSharedListeningConnectionReport allEvents](self, "allEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v7, v11);

}

- (void)endEvent:(id)a3
{
  -[ICSharedListeningConnectionReport endEvent:withError:](self, "endEvent:withError:", a3, 0);
}

- (void)endEvent:(id)a3 withError:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "date");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningConnectionReport allEvents](self, "allEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEndDate:", v11);
  objc_msgSend(v10, "setError:", v7);

}

- (NSString)formattedReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  double v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  objc_msgSend(&stru_1E4391778, "stringByPaddingToLength:withString:startingAtIndex:", 30, CFSTR("-"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR("\nShared Listening Report\n"));
  objc_msgSend(&stru_1E4391778, "stringByPaddingToLength:withString:startingAtIndex:", 30, CFSTR("-"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  -[ICSharedListeningConnectionReport sharedListeningSessionIdentifier](self, "sharedListeningSessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Shared listening session ID: %@\n"), v6);

  -[ICSharedListeningConnectionReport groupSessionIdentifier](self, "groupSessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Group session ID: %@\n\n"), v7);

  -[ICSharedListeningConnectionReport topLevelEvents](self, "topLevelEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningConnectionReport _addEvents:toReportString:eventLevel:](self, "_addEvents:toReportString:eventLevel:", v8, v3, 0);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[ICSharedListeningConnectionReport topLevelEvents](self, "topLevelEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "duration");
        v13 = v13 + v15;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("\nTotal time: %.3f seconds.\n"), *(_QWORD *)&v13);
  objc_msgSend(&stru_1E4391778, "stringByPaddingToLength:withString:startingAtIndex:", 30, CFSTR("-"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v16);

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  return (NSString *)v3;
}

- (void)_addEvents:(id)a3 toReportString:(id)a4 eventLevel:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 4 * a5;
    v13 = a5 + 1;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
        objc_msgSend(&stru_1E4391778, "stringByPaddingToLength:withString:startingAtIndex:", v12, CFSTR(" "), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v17);

        objc_msgSend(v16, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "duration");
        objc_msgSend(v9, "appendFormat:", CFSTR("%@: %.3fs."), v18, v19);

        objc_msgSend(v16, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v16, "error");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendFormat:", CFSTR(" Error: %@."), v21);

        }
        objc_msgSend(v9, "appendString:", CFSTR("\n"));
        objc_msgSend(v16, "subEvents");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23)
        {
          objc_msgSend(v16, "subEvents");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICSharedListeningConnectionReport _addEvents:toReportString:eventLevel:](self, "_addEvents:toReportString:eventLevel:", v24, v9, v13);

        }
        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

}

- (id)analyticsPayload
{
  return CFSTR("NO");
}

- (NSString)sharedListeningSessionIdentifier
{
  return self->_sharedListeningSessionIdentifier;
}

- (void)setSharedListeningSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)groupSessionIdentifier
{
  return self->_groupSessionIdentifier;
}

- (void)setGroupSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)topLevelEvents
{
  return self->_topLevelEvents;
}

- (void)setTopLevelEvents:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelEvents, a3);
}

- (NSMapTable)allEvents
{
  return self->_allEvents;
}

- (void)setAllEvents:(id)a3
{
  objc_storeStrong((id *)&self->_allEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEvents, 0);
  objc_storeStrong((id *)&self->_topLevelEvents, 0);
  objc_storeStrong((id *)&self->_groupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedListeningSessionIdentifier, 0);
}

@end
