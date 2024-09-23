@implementation TUIFeedContent

+ (id)feedContentFromDictionaries:(id)a3 stackName:(id)a4
{
  return +[TUIFeedContent feedContentFromDictionaries:stackName:initialContentReadyEntryIndex:](TUIFeedContent, "feedContentFromDictionaries:stackName:initialContentReadyEntryIndex:", a3, a4, 0x7FFFFFFFFFFFFFFFLL);
}

+ (id)feedContentFromDictionaries:(id)a3 stackName:(id)a4 initialContentReadyEntryIndex:(unint64_t)a5
{
  id v7;
  id v8;
  TUIFeedContent *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[TUIFeedContent initWithDictionaries:stackName:initialContentReadyEntryIndex:]([TUIFeedContent alloc], "initWithDictionaries:stackName:initialContentReadyEntryIndex:", v8, v7, a5);

  return v9;
}

+ (TUIFeedContent)feedContentWithEntries:(id)a3 stackName:(id)a4
{
  return +[TUIFeedContent feedContentWithEntries:stackName:initialContentReadyEntryIndex:](TUIFeedContent, "feedContentWithEntries:stackName:initialContentReadyEntryIndex:", a3, a4, 0x7FFFFFFFFFFFFFFFLL);
}

+ (TUIFeedContent)feedContentWithEntries:(id)a3 stackName:(id)a4 initialContentReadyEntryIndex:(unint64_t)a5
{
  id v7;
  id v8;
  TUIFeedContent *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  v9 = -[TUIFeedContent initWithStackName:initialContentReadyEntryIndex:]([TUIFeedContent alloc], "initWithStackName:initialContentReadyEntryIndex:", v7, a5);

  v10 = objc_msgSend(v8, "mutableCopy");
  -[TUIFeedContent setEntries:](v9, "setEntries:", v10);

  return v9;
}

- (TUIFeedContent)initWithStackName:(id)a3 initialContentReadyEntryIndex:(unint64_t)a4
{
  id v7;
  TUIFeedContent *v8;
  TUIFeedContent *v9;
  void **p_currentStackName;
  TUIMutableDynamicValue *v11;
  void *v12;
  NSMutableSet *v13;
  NSMutableSet *stackNames;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUIFeedContent;
  v8 = -[TUIFeedContent init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    p_currentStackName = (void **)&v8->_currentStackName;
    objc_storeStrong((id *)&v8->_currentStackName, a3);
    if (!v9->_currentStackName)
    {
      v11 = -[TUIDynamicValue initWithValue:]([TUIMutableDynamicValue alloc], "initWithValue:", CFSTR("default"));
      v12 = *p_currentStackName;
      *p_currentStackName = v11;

    }
    v13 = objc_opt_new(NSMutableSet);
    stackNames = v9->_stackNames;
    v9->_stackNames = v13;

    v9->_initialContentReadyEntryIndex = a4;
  }

  return v9;
}

- (TUIFeedContent)initWithDictionaries:(id)a3 stackName:(id)a4 initialContentReadyEntryIndex:(unint64_t)a5
{
  id v8;
  TUIFeedContent *v9;
  NSMutableArray *v10;
  NSMutableArray *entries;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v8 = a3;
  v9 = -[TUIFeedContent initWithStackName:initialContentReadyEntryIndex:](self, "initWithStackName:initialContentReadyEntryIndex:", a4, a5);
  if (v9)
  {
    v10 = objc_opt_new(NSMutableArray);
    entries = v9->_entries;
    v9->_entries = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUIFeedEntry feedEntryFromDictionary:](TUIFeedEntry, "feedEntryFromDictionary:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v17), (_QWORD)v20));
          if (v18)
            objc_msgSend(v12, "addObject:", v18);

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    -[TUIFeedContent setEntries:](v9, "setEntries:", v12);
  }

  return v9;
}

- (NSMutableArray)entries
{
  return (NSMutableArray *)-[NSMutableArray copy](self->_entries, "copy");
}

- (void)setEntries:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableSet *stackNames;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a3;
  objc_storeStrong((id *)&self->_entries, a3);
  -[NSMutableSet removeAllObjects](self->_stackNames, "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        stackNames = self->_stackNames;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "stackNames", (_QWORD)v13));
        -[NSMutableSet unionSet:](stackNames, "unionSet:", v12);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent entries](self, "entries"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("description")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",\n\t")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> (\n\t%@\n)"), v5, self, v8));

  return v9;
}

- (NSMutableSet)stackNames
{
  return self->_stackNames;
}

- (void)setStackNames:(id)a3
{
  objc_storeStrong((id *)&self->_stackNames, a3);
}

- (TUIMutableDynamicValue)currentStackName
{
  return self->_currentStackName;
}

- (unint64_t)initialContentReadyEntryIndex
{
  return self->_initialContentReadyEntryIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStackName, 0);
  objc_storeStrong((id *)&self->_stackNames, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
