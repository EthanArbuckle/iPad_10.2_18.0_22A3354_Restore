@implementation SUItemList

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUItemList;
  -[SUItemList dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = -[NSMutableArray mutableCopyWithZone:](self->_groups, "mutableCopyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[NSDictionary copyWithZone:](self->_hintText, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 24) = self->_ignoresEmptySections;
  return (id)v5;
}

- (id)copyItems
{
  id v3;
  NSMutableArray *groups;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  groups = self->_groups;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(groups);
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "items"));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  v15 = 0;
  v5 = -[NSMutableArray count](self->_groups, "count");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v7), "items");
      v9 = objc_msgSend(v8, "count");
      v10 = v15;
      if (v9 >= 1 && v15 == 0)
      {
        v12 = v9;
        v13 = 1;
        do
        {
          v14 = objc_msgSend(v8, "objectAtIndex:", v13 - 1);
          (*((void (**)(id, uint64_t, uint64_t, unsigned __int8 *))a3 + 2))(a3, v14, objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v13 - 1, v7), &v15);
          v10 = v15;
          if (v13 >= v12)
            break;
          ++v13;
        }
        while (!v15);
      }
      ++v7;
    }
    while (v7 < v6 && !v10);
  }
}

- (id)indexPathOfItem:(id)a3
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__SUItemList_indexPathOfItem___block_invoke;
  v5[3] = &unk_24DE7CCF0;
  v5[4] = a3;
  v5[5] = &v6;
  -[SUItemList enumerateItemsUsingBlock:](self, "enumerateItemsUsingBlock:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

_QWORD *__30__SUItemList_indexPathOfItem___block_invoke(_QWORD *result, uint64_t a2, void *a3, _BYTE *a4)
{
  _QWORD *v5;

  if (result[4] == a2)
  {
    v5 = result;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(v5[5] + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

- (id)indexPathOfItemWithIdentifier:(unint64_t)a3
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SUItemList_indexPathOfItemWithIdentifier___block_invoke;
  v5[3] = &unk_24DE7CD18;
  v5[4] = &v6;
  v5[5] = a3;
  -[SUItemList enumerateItemsUsingBlock:](self, "enumerateItemsUsingBlock:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __44__SUItemList_indexPathOfItemWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id result;

  result = (id)objc_msgSend(a2, "itemIdentifier");
  if (result == *(id *)(a1 + 40))
  {
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

- (id)itemAtIndexPath:(id)a3
{
  if (objc_msgSend(a3, "length") != 2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUItemList.m"), 100, CFSTR("Index path must contain 2 indices"));
  return (id)objc_msgSend((id)objc_msgSend(-[SUItemList _groupAtExternalIndex:](self, "_groupAtExternalIndex:", objc_msgSend(a3, "indexAtPosition:", 0)), "items"), "objectAtIndex:", objc_msgSend(a3, "indexAtPosition:", 1));
}

- (id)itemsForSectionAtIndex:(int64_t)a3
{
  return (id)objc_msgSend(-[SUItemList _groupAtExternalIndex:](self, "_groupAtExternalIndex:", a3), "items");
}

- (int64_t)numberOfItems
{
  NSMutableArray *groups;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  groups = self->_groups;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(groups);
      v5 += objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "items"), "count");
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (int64_t)numberOfSections
{
  int64_t v3;
  NSMutableArray *groups;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSMutableArray count](self->_groups, "count");
  if (self->_ignoresEmptySections)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    groups = self->_groups;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(groups);
          v3 = (__PAIR128__(v3, objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "items"), "count"))- 1) >> 64;
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
  }
  return v3;
}

- (int64_t)sectionIndexForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v7;
  int64_t v8;

  if (!self->_ignoresEmptySections || a4 < 1)
    return a4;
  v7 = 0;
  v8 = a4;
  do
    v8 = (__PAIR128__(v8, objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v7++), "items"), "count"))- 1) >> 64;
  while (a4 != v7);
  return v8;
}

- (NSArray)sectionIndexTitles
{
  NSArray *v3;
  NSMutableArray *groups;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  groups = self->_groups;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(groups);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "indexBarTitle");
        if (objc_msgSend(v9, "length"))
          -[NSArray addObject:](v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](groups, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)sectionItemForSectionAtIndex:(int64_t)a3
{
  id v4;
  void *v5;

  v4 = -[SUItemList _groupAtExternalIndex:](self, "_groupAtExternalIndex:", a3);
  v5 = v4;
  if (self->_ignoresEmptySections && !objc_msgSend((id)objc_msgSend(v4, "items"), "count"))
    v5 = 0;
  return (id)objc_msgSend(v5, "separatorItem");
}

- (void)insertItems:(id)a3 atIndexPath:(id)a4
{
  id v8;
  uint64_t v9;
  void *v10;

  if (objc_msgSend(a4, "length") != 2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUItemList.m"), 165, CFSTR("Index path must contain 2 indices"));
  v8 = -[SUItemList _groupAtExternalIndex:](self, "_groupAtExternalIndex:", objc_msgSend(a4, "indexAtPosition:", 0));
  v9 = objc_msgSend(a4, "indexAtPosition:", 1);
  v10 = (void *)objc_msgSend(v8, "items");
  objc_msgSend(v10, "insertObjects:atIndexes:", a3, objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v9, objc_msgSend(a3, "count")));
}

- (void)removeItemAtIndexPath:(id)a3
{
  if (objc_msgSend(a3, "length") != 2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUItemList.m"), 172, CFSTR("Index path must contain 2 indices"));
  objc_msgSend((id)objc_msgSend(-[SUItemList _groupAtExternalIndex:](self, "_groupAtExternalIndex:", objc_msgSend(a3, "indexAtPosition:", 0)), "items"), "removeObjectAtIndex:", objc_msgSend(a3, "indexAtPosition:", 1));
}

- (void)replaceItemAtIndexPath:(id)a3 withItems:(id)a4
{
  -[SUItemList removeItemAtIndexPath:](self, "removeItemAtIndexPath:");
  -[SUItemList insertItems:atIndexPath:](self, "insertItems:atIndexPath:", a4, a3);
}

- (void)setItems:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  SUItemListGroup *v10;

  self->_groups = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = objc_alloc_init(SUItemListGroup);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend(a3, "count");
  if (v6 >= 1)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v9 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      if (objc_msgSend(v9, "itemType") == 7)
      {
        if (i)
        {
          -[SUItemListGroup setItems:](v10, "setItems:", v5);

          -[NSMutableArray addObject:](self->_groups, "addObject:", v10);
          v10 = objc_alloc_init(SUItemListGroup);
          v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        }
        -[SUItemListGroup setSeparatorItem:](v10, "setSeparatorItem:", v9);
      }
      else
      {
        objc_msgSend(v5, "addObject:", v9);
      }
    }
  }
  -[SUItemListGroup setItems:](v10, "setItems:", v5);

  -[NSMutableArray addObject:](self->_groups, "addObject:", v10);
}

- (void)setItemsFromPropertyList:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = +[SUItemDataSource sharedDataSource](SUItemDataSource, "sharedDataSource");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(a3);
        v11 = objc_msgSend(v6, "newItemWithItemDictionary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v5, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  -[SUItemList _removeHiddenItemsFromArray:](self, "_removeHiddenItemsFromArray:", v5);
  -[SUItemList setItems:](self, "setItems:", v5);

}

- (id)hintTextForKey:(id)a3
{
  if (a3)
    return -[NSDictionary objectForKey:](self->_hintText, "objectForKey:");
  else
    return 0;
}

- (void)setHintText:(id)a3
{
  NSDictionary *hintText;

  hintText = self->_hintText;
  if (hintText != a3)
  {

    self->_hintText = (NSDictionary *)a3;
  }
}

- (id)_groupAtExternalIndex:(int64_t)a3
{
  uint64_t v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  if (self->_ignoresEmptySections)
  {
    v5 = -[NSMutableArray count](self->_groups, "count");
    if ((a3 & 0x8000000000000000) == 0)
    {
      v6 = v5;
      if (v5 >= 1)
      {
        v7 = 0;
        do
        {
          if (!objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v7), "items"), "count"))++a3;
          v8 = v7++ < a3;
          v8 = v8 && v7 < v6;
        }
        while (v8);
      }
    }
  }
  if (a3 >= (unint64_t)-[NSMutableArray count](self->_groups, "count"))
    return 0;
  else
    return (id)-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", a3);
}

- (void)_removeHiddenItemsFromArray:(id)a3
{
  uint64_t v4;
  unint64_t v5;

  v4 = objc_msgSend(a3, "count");
  if (v4 >= 1)
  {
    v5 = v4 + 1;
    do
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v5 - 2), "isDisplayable:", 0) & 1) == 0)
        objc_msgSend(a3, "removeObjectAtIndex:", v5 - 2);
      --v5;
    }
    while (v5 > 1);
  }
}

- (BOOL)ignoresEmptySections
{
  return self->_ignoresEmptySections;
}

- (void)setIgnoresEmptySections:(BOOL)a3
{
  self->_ignoresEmptySections = a3;
}

@end
