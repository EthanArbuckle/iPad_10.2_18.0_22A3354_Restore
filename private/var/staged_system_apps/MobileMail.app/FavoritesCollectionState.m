@implementation FavoritesCollectionState

- (void)_addVisibleItem:(id)a3 toArray:(id)a4
{
  id v6;
  void *v7;
  id v8;
  unsigned int v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "isVisible"))
  {
    objc_msgSend(v6, "addObject:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subItems"));
    v8 = objc_msgSend(v7, "count");

    if (-[FavoritesCollectionState isEditing](self, "isEditing")
      || (objc_msgSend(v11, "isExpandable") & 1) == 0)
    {
      if (!-[FavoritesCollectionState isEditing](self, "isEditing"))
        goto LABEL_11;
      v9 = objc_msgSend(v11, "isExpandableInEditMode");
    }
    else
    {
      v9 = 1;
    }
    if (v8 && v9 && objc_msgSend(v11, "isExpanded"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subItems"));
      -[FavoritesCollectionState _addSubitems:toArray:](self, "_addSubitems:toArray:", v10, v6);

    }
  }
LABEL_11:

}

- (id)itemWithSyncKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState items](self, "items"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003B910;
  v10[3] = &unk_10051CBC0;
  v6 = v4;
  v11 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v7));

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedItemBySyncKey, 0);
  objc_storeStrong((id *)&self->_expandedItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_selectedItems, 0);
  objc_storeStrong((id *)&self->_visibleItems, 0);
}

- (id)orderedAccountIds
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState items](self, "items", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), "account"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));

        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)addOrUpdateItem:(id)a3 didAdd:(BOOL *)a4 didReplace:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableItems](self, "mutableItems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "syncKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState itemWithSyncKey:](self, "itemWithSyncKey:", v10));

  if (!v11)
  {
    v12 = objc_msgSend(v9, "indexOfObject:", v8);
    if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v12));
      goto LABEL_8;
    }
LABEL_5:
    -[FavoritesCollectionState addItem:ordered:](self, "addItem:ordered:", v8, 1);
    v13 = 0;
    a5 = a4;
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }
  v12 = objc_msgSend(v9, "indexOfObject:", v11);
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  v13 = 0;
LABEL_8:
  if ((objc_msgSend(v8, "isEqual:", v11) & 1) == 0)
  {
    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", v12, v8);
    if (a5)
LABEL_10:
      *a5 = 1;
  }
LABEL_11:

  return v13;
}

- (void)_addMailboxCollectionVisibleItemsToArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState items](self, "items", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if (-[FavoritesCollectionState isEditing](self, "isEditing") || objc_msgSend(v9, "isSelected"))
          -[FavoritesCollectionState _addVisibleItem:toArray:](self, "_addVisibleItem:toArray:", v9, v4);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)invalidateVisibleItems
{
  NSObject *v3;
  NSArray *visibleItems;
  NSArray *selectedItems;

  v3 = objc_claimAutoreleasedReturnValue(+[FavoritesCollectionState log](FavoritesCollectionState, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100391948((uint64_t)self, v3);

  visibleItems = self->_visibleItems;
  self->_visibleItems = 0;

  selectedItems = self->_selectedItems;
  self->_selectedItems = 0;

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C3B4;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9B90 != -1)
    dispatch_once(&qword_1005A9B90, block);
  return (OS_os_log *)(id)qword_1005A9B88;
}

- (void)setItems:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableItems](self, "mutableItems"));
  objc_msgSend(v4, "setArray:", v5);

}

- (BOOL)addItem:(id)a3 ordered:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned __int8 v8;
  int64_t v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableItems](self, "mutableItems"));
  v8 = objc_msgSend(v7, "containsObject:", v6);
  if ((v8 & 1) == 0)
  {
    if (v4
      && (v9 = -[FavoritesCollectionState _indexForNewItem:](self, "_indexForNewItem:", v6), v9 != 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(v7, "insertObject:atIndex:", v6, v9);
    }
    else
    {
      objc_msgSend(v7, "addObject:", v6);
    }
  }

  return v8 ^ 1;
}

- (id)mutableItems
{
  return self->_items;
}

- (FavoritesCollectionState)initWithType:(unint64_t)a3
{
  FavoritesCollectionState *v4;
  NSArray *v5;
  NSArray *items;
  NSArray *v7;
  NSArray *expandedItems;
  NSDictionary *v9;
  NSDictionary *expandedItemBySyncKey;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FavoritesCollectionState;
  v4 = -[FavoritesCollectionState init](&v12, "init");
  if (v4)
  {
    v5 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    items = v4->_items;
    v4->_items = v5;

    v7 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    expandedItems = v4->_expandedItems;
    v4->_expandedItems = v7;

    v9 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    expandedItemBySyncKey = v4->_expandedItemBySyncKey;
    v4->_expandedItemBySyncKey = v9;

    v4->_type = a3;
  }
  return v4;
}

- (id)dictionaryRepresentations
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  const __CFString *v28;
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  _BYTE v33[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState items](self, "items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState expandedItems](self, "expandedItems"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v10), "dictionaryRepresentation"));
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15), "dictionaryRepresentationRemovingSyncKeys", (_QWORD)v20));
        if (v16)
          objc_msgSend(v4, "addObject:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v13);
  }

  if (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes"))
  {
    v30[0] = CFSTR("items");
    v30[1] = CFSTR("expandedItems");
    v31[0] = v3;
    v31[1] = v4;
    v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
  }
  else
  {
    v28 = CFSTR("items");
    v29 = v3;
    v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  }
  v18 = (void *)v17;

  return v18;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)expandedItems
{
  return self->_expandedItems;
}

- (NSArray)visibleItems
{
  NSArray *visibleItems;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray **p_visibleItems;
  NSArray *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  visibleItems = self->_visibleItems;
  if (!visibleItems)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    if (-[FavoritesCollectionState isMailboxesCollection](self, "isMailboxesCollection"))
    {
      -[FavoritesCollectionState _addMailboxCollectionVisibleItemsToArray:](self, "_addMailboxCollectionVisibleItemsToArray:", v4);
    }
    else if (-[FavoritesCollectionState isAccountsCollection](self, "isAccountsCollection"))
    {
      -[FavoritesCollectionState _addAccountsCollectionVisibleItemsToArray:](self, "_addAccountsCollectionVisibleItemsToArray:", v4);
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState items](self, "items", 0));
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v14;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v5);
            -[FavoritesCollectionState _addVisibleItem:toArray:](self, "_addVisibleItem:toArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8), v4);
            v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v6);
      }

    }
    v9 = (NSArray *)objc_msgSend(v4, "copy");
    v11 = self->_visibleItems;
    p_visibleItems = &self->_visibleItems;
    *p_visibleItems = v9;

    visibleItems = *p_visibleItems;
  }
  return visibleItems;
}

- (BOOL)isMailboxesCollection
{
  return self->_type == 1;
}

- (id)mutableExpandedItems
{
  return self->_expandedItems;
}

- (id)mutableExpandedItemBySyncKey
{
  return self->_expandedItemBySyncKey;
}

- (BOOL)isAccountsCollection
{
  return self->_type == 3;
}

- (BOOL)addExpandedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  id v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  FavoritesCollectionState *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncKey"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableExpandedItems](self, "mutableExpandedItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableExpandedItemBySyncKey](self, "mutableExpandedItemBySyncKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
    v10 = v9 == 0;

    if (!v9)
    {
      objc_msgSend(v6, "addObject:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncKey"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v11);

    }
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[FavoritesCollectionState log](FavoritesCollectionState, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = (id)objc_opt_class(self);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      v16 = 138412802;
      v17 = v14;
      v18 = 2048;
      v19 = self;
      v20 = 2114;
      v21 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "<%@: %p> Attempting to add an expanded item without a sync key: %{public}@", (uint8_t *)&v16, 0x20u);

    }
    v10 = 0;
  }

  return v10;
}

- (id)addOrUpdateExpandedItem:(id)a3 didAdd:(BOOL *)a4 didReplace:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  FavoritesCollectionState *v26;
  __int16 v27;
  void *v28;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "syncKey"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableExpandedItems](self, "mutableExpandedItems"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableExpandedItemBySyncKey](self, "mutableExpandedItemBySyncKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "syncKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState expandedItemWithSyncKey:](self, "expandedItemWithSyncKey:", v12));

    if (v13)
    {
      v14 = objc_msgSend(v10, "indexOfObject:", v13);
      if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = 0;
LABEL_12:
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v14));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "syncKey"));

        objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v14, v8);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "syncKey"));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v19);

        if (a5)
          *a5 = 1;

LABEL_15:
        goto LABEL_16;
      }
    }
    else
    {
      v14 = objc_msgSend(v10, "indexOfObject:", v8);
      if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v14));
        goto LABEL_12;
      }
    }
    -[FavoritesCollectionState addExpandedItem:](self, "addExpandedItem:", v8);
    v15 = 0;
    if (a4)
      *a4 = 1;
    goto LABEL_15;
  }
  v16 = objc_claimAutoreleasedReturnValue(+[FavoritesCollectionState log](FavoritesCollectionState, "log"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v21 = (id)objc_opt_class(self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_publicDescription"));
    v23 = 138412802;
    v24 = v21;
    v25 = 2048;
    v26 = self;
    v27 = 2114;
    v28 = v22;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "<%@: %p> Attempting to add/update an expanded item without a sync key: %{public}@", (uint8_t *)&v23, 0x20u);

  }
  v15 = 0;
LABEL_16:

  return v15;
}

+ (id)displayOrder
{
  if (qword_1005A9BA0 != -1)
    dispatch_once(&qword_1005A9BA0, &stru_10051CB78);
  return (id)qword_1005A9B98;
}

- (int64_t)_indexForNewItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t i;
  void *v9;

  v4 = a3;
  if (qword_1005A9BB0 != -1)
    dispatch_once(&qword_1005A9BB0, &stru_10051CB98);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState items](self, "items"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FavoritesCollectionState displayOrder](FavoritesCollectionState, "displayOrder"));
    v7 = objc_msgSend(v6, "indexOfObject:", objc_opt_class(v4));
    for (i = 0; ; ++i)
    {
      if (i >= (unint64_t)objc_msgSend(v5, "count"))
      {
        i = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_12;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));
      if ((objc_msgSend(v9, "isEqual:", qword_1005A9BA8) & 1) == 0
        && (uint64_t)v7 < (uint64_t)objc_msgSend(v6, "indexOfObject:", objc_opt_class(v9)))
      {
        break;
      }

    }
LABEL_12:

  }
  else
  {
    i = 0x7FFFFFFFFFFFFFFFLL;
  }

  return i;
}

- (id)expandedItemWithSyncKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState expandedItemBySyncKey](self, "expandedItemBySyncKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)removeItemWithSyncKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableItems](self, "mutableItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState itemWithSyncKey:](self, "itemWithSyncKey:", v4));
  if (v6)
    objc_msgSend(v5, "removeObject:", v6);

  return v6;
}

- (void)_addSubitems:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        -[FavoritesCollectionState _addVisibleItem:toArray:](self, "_addVisibleItem:toArray:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), v7, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_addAccountsCollectionVisibleItemsToArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  unsigned int v13;
  unsigned int v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState items](self, "items"));
  v6 = 0;
  v7 = 0;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isVisible"))
        {
          v12 = v11;

          ++v6;
          v7 = v12;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v13 = -[FavoritesCollectionState isEditing](self, "isEditing");
  if (v6 == 1)
    v14 = v13;
  else
    v14 = 0;
  if (v14 == 1)
  {
    objc_msgSend(v7, "setExpanded:", 1);
LABEL_16:
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subItems"));
    -[FavoritesCollectionState _addSubitems:toArray:](self, "_addSubitems:toArray:", v15, v4);
    goto LABEL_17;
  }
  if (v6 == 1)
    goto LABEL_16;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v15);
        -[FavoritesCollectionState _addVisibleItem:toArray:](self, "_addVisibleItem:toArray:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), v4, (_QWORD)v19);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }
LABEL_17:

}

- (id)removeItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableItems](self, "mutableItems"));
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    objc_msgSend(v5, "removeObject:", v4);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)removeExpandedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  FavoritesCollectionState *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncKey"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableExpandedItems](self, "mutableExpandedItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableExpandedItemBySyncKey](self, "mutableExpandedItemBySyncKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncKey"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

    if (v9)
    {
      objc_msgSend(v6, "removeObject:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncKey"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v10);

      v9 = v4;
    }

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[FavoritesCollectionState log](FavoritesCollectionState, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = (id)objc_opt_class(self);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      v15 = 138412802;
      v16 = v13;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "<%@: %p> Attempting to remove an expanded item without a sync key: %{public}@", (uint8_t *)&v15, 0x20u);

    }
    v9 = 0;
  }

  return v9;
}

- (NSArray)selectedItems
{
  NSArray *selectedItems;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  selectedItems = self->_selectedItems;
  if (!selectedItems)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState items](self, "items"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_filter:", &stru_10051CC00));
    v6 = self->_selectedItems;
    self->_selectedItems = v5;

    selectedItems = self->_selectedItems;
  }
  return (NSArray *)-[NSArray copy](selectedItems, "copy");
}

- (void)setExpandedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableExpandedItems](self, "mutableExpandedItems"));
  objc_msgSend(v4, "setArray:", v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState mutableExpandedItemBySyncKey](self, "mutableExpandedItemBySyncKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("syncKey")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:](NSDictionary, "dictionaryWithObjects:forKeys:", v8, v6));
  objc_msgSend(v5, "setDictionary:", v7);

}

- (unint64_t)countOfVisibleItems
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesCollectionState items](self, "items"));
  v3 = objc_msgSend(v2, "ef_countObjectsPassingTest:", &stru_10051CC20);

  return (unint64_t)v3;
}

- (NSDictionary)expandedItemBySyncKey
{
  return self->_expandedItemBySyncKey;
}

- (void)setExpandedItemBySyncKey:(id)a3
{
  objc_storeStrong((id *)&self->_expandedItemBySyncKey, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

@end
