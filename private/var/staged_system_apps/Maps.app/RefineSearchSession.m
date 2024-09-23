@implementation RefineSearchSession

- (RefineSearchSession)initWithObjects:(id)a3 forType:(int)a4
{
  id v6;
  RefineSearchSession *v7;
  RefineSearchSession *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSArray *v17;
  NSArray *items;
  RefineSearchSession *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v25.receiver = self;
    v25.super_class = (Class)RefineSearchSession;
    v7 = -[RefineSearchSession init](&v25, "init");
    v8 = v7;
    if (v7)
    {
      v7->_resultsItemsInitialized = 0;
      v7->_listType = a4;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14);
            v16 = objc_alloc_init((Class)GEOSuggestionItem);
            objc_msgSend(v16, "setSuggestionString:", v15, (_QWORD)v21);
            objc_msgSend(v9, "addObject:", v16);

            v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v12);
      }

      v17 = (NSArray *)objc_msgSend(v9, "copy");
      items = v8->_items;
      v8->_items = v17;

    }
    self = v8;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)updateWithSelection:(unint64_t)a3
{
  id v5;

  if (-[NSArray count](self->_items, "count") > a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a3));
    objc_msgSend(v5, "setTappingCount:", objc_msgSend(v5, "tappingCount") + 1);

  }
}

- (void)updateWithFilterView:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "visibleSuggestions"));
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
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "tag");
        if (v9 < (id)-[NSArray count](self->_items, "count"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v9));
          v11 = v10;
          if (self->_resultsItemsInitialized)
            objc_msgSend(v10, "setEventuallyVisible:", 1);
          else
            objc_msgSend(v10, "setInitiallyVisible:", 1);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  self->_resultsItemsInitialized = 1;

}

- (id)description
{
  uint64_t listType;
  __CFString *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  NSArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  listType = self->_listType;
  if (listType >= 3)
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), listType));
  else
    v4 = off_1011BBF78[listType];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_items;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestionString"));
        if (objc_msgSend(v10, "initiallyVisible"))
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        if (objc_msgSend(v10, "eventuallyVisible"))
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v9, "stringByAppendingFormat:", CFSTR("\nListSession %@ initVisible %@ eventVisible %@ tap %d"), v11, v12, v13, objc_msgSend(v10, "tappingCount")));

        v8 = (char *)v8 + 1;
        v9 = v4;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v4;
}

- (NSArray)items
{
  return self->_items;
}

- (int)listType
{
  return self->_listType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
