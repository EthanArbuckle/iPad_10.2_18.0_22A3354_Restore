@implementation _UINavigationBarItemStack

- (int64_t)effectiveDisplayModeForItemInCurrentStack:(id)a3
{
  void *v5;
  int64_t v6;

  if (a3)
    return -[_UINavigationBarItemStack _effectiveDisplayModeForItem:inStack:](self, "_effectiveDisplayModeForItem:inStack:", a3, self->_items);
  -[_UINavigationBarItemStack topItem](self, "topItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UINavigationBarItemStack _effectiveDisplayModeForItem:inStack:](self, "_effectiveDisplayModeForItem:inStack:", v5, self->_items);

  return v6;
}

- (BOOL)isPushing
{
  return self->_state == 1;
}

- (BOOL)isPopping
{
  return self->_state == 2;
}

- (int64_t)_effectiveDisplayModeForItem:(id)a3 inStack:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "item", (_QWORD)v16);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "largeTitleDisplayMode");
        if (v13)
          v9 = v13;

        if (v12 == v5)
        {

          goto LABEL_16;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  v14 = objc_msgSend(v5, "largeTitleDisplayMode");
  if (v14)
    v9 = v14;
LABEL_16:

  return v9;
}

- (UINavigationItem)topItem
{
  void *v2;
  void *v3;

  -[_UINavigationBarItemStack topEntry](self, "topEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationItem *)v3;
}

- (_UINavigationBarItemStackEntry)topEntry
{
  return (_UINavigationBarItemStackEntry *)-[NSMutableArray lastObject](self->_items, "lastObject");
}

- (int)state
{
  return self->_state;
}

- (int64_t)itemCount
{
  return -[NSMutableArray count](self->_items, "count");
}

- (UINavigationItem)backItem
{
  void *v2;
  void *v3;

  -[_UINavigationBarItemStack backEntry](self, "backEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationItem *)v3;
}

- (_UINavigationBarItemStackEntry)backEntry
{
  uint64_t v3;
  void *v4;

  v3 = -[NSMutableArray count](self->_items, "count");
  if (v3 < 2)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v3 - 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (_UINavigationBarItemStackEntry *)v4;
}

- (UINavigationItem)previousTopItem
{
  void *v2;
  void *v3;

  -[_UINavigationBarItemStack previousTopEntry](self, "previousTopEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationItem *)v3;
}

- (_UINavigationBarItemStackEntry)previousTopEntry
{
  return (_UINavigationBarItemStackEntry *)-[NSArray lastObject](self->_previousItems, "lastObject");
}

- (UINavigationItem)previousBackItem
{
  void *v2;
  void *v3;

  -[_UINavigationBarItemStack previousBackEntry](self, "previousBackEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UINavigationItem *)v3;
}

- (_UINavigationBarItemStackEntry)previousBackEntry
{
  uint64_t v3;
  void *v4;

  v3 = -[NSArray count](self->_previousItems, "count");
  if (v3 < 2)
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_previousItems, "objectAtIndexedSubscript:", v3 - 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (_UINavigationBarItemStackEntry *)v4;
}

- (void)setItems:(id)a3 withTransitionAssistant:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *previousItems;
  id v9;

  v9 = a3;
  v6 = a4;
  if (self->_state)
    NSLog(CFSTR("changing items while animating can result in a corrupted navigation bar"));
  v7 = (NSArray *)-[NSMutableArray copy](self->_items, "copy");
  previousItems = self->_previousItems;
  self->_previousItems = v7;

  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
  _WrapItemsAndAddToArray(self->_items, v9);
  -[_UINavigationBarItemStack _prepareTransitionWithAssistant:](self, "_prepareTransitionWithAssistant:", v6);
  -[_UINavigationBarItemStack _updateChangeObserversFor:](self, "_updateChangeObserversFor:", self->_items);
  self->_state = 3;

}

- (_UINavigationBarTransitionAssistant)transitionAssistant
{
  return self->_transitionAssistant;
}

- (void)pushItem:(id)a3 withTransitionAssistant:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *previousItems;
  NSMutableArray *items;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (self->_state)
    NSLog(CFSTR("nested push animation can result in a corrupted navigation bar"));
  v7 = (NSArray *)-[NSMutableArray copy](self->_items, "copy");
  previousItems = self->_previousItems;
  self->_previousItems = v7;

  items = self->_items;
  v10 = +[_UINavigationBarItemStackEntry newEntryForItem:](_UINavigationBarItemStackEntry, "newEntryForItem:", v11);
  -[NSMutableArray addObject:](items, "addObject:", v10);

  -[_UINavigationBarItemStack _prepareTransitionWithAssistant:](self, "_prepareTransitionWithAssistant:", v6);
  -[_UINavigationBarItemStack _updateChangeObserversFor:](self, "_updateChangeObserversFor:", self->_items);
  self->_state = 1;

}

- (void)setChangeObserver:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_changeObserver, obj);
    -[_UINavigationBarItemStack _updateChangeObserversFor:](self, "_updateChangeObserversFor:", self->_items);
    v5 = obj;
    if (self->_previousItems)
    {
      -[_UINavigationBarItemStack _updateChangeObserversFor:](self, "_updateChangeObserversFor:");
      v5 = obj;
    }
  }

}

- (void)_updateChangeObserversFor:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "item", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_setChangeObserver:", WeakRetained);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (_UINavigationBarItemStack)initWithItems:(id)a3
{
  id v4;
  _UINavigationBarItemStack *v5;
  uint64_t v6;
  NSMutableArray *items;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarItemStack;
  v5 = -[_UINavigationBarItemStack init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    items = v5->_items;
    v5->_items = (NSMutableArray *)v6;

    _WrapItemsAndAddToArray(v5->_items, v4);
    -[_UINavigationBarItemStack topItem](v5, "topItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_movingToTopOfStack");
    objc_msgSend(v8, "_movedToTopOfStack:", 1);

  }
  return v5;
}

- (void)_prepareTransitionWithAssistant:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_transitionAssistant, a3);
  v5 = a3;
  -[_UINavigationBarTransitionAssistant startInteractiveTransition](self->_transitionAssistant, "startInteractiveTransition");

  -[_UINavigationBarItemStack previousTopItem](self, "previousTopItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_movingFromTopOfStack");

  -[_UINavigationBarItemStack topItem](self, "topItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_movingToTopOfStack");

}

- (void)completeOperation
{
  void *v3;
  void *v4;

  if (self->_state)
  {
    -[_UINavigationBarItemStack previousTopItem](self, "previousTopItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_movedFromTopOfStack:", 1);

    -[_UINavigationBarItemStack topItem](self, "topItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_movedToTopOfStack:", 1);

    -[_UINavigationBarItemStack _completeTransition](self, "_completeTransition");
  }
}

- (_UINavigationBarItemStack)init
{
  return -[_UINavigationBarItemStack initWithItems:](self, "initWithItems:", 0);
}

- (BOOL)isPushingOrPopping
{
  return -[_UINavigationBarItemStack isPushing](self, "isPushing")
      || -[_UINavigationBarItemStack isPopping](self, "isPopping");
}

- (void)_completeTransition
{
  NSArray *previousItems;

  previousItems = self->_previousItems;
  self->_previousItems = 0;

  -[_UINavigationBarItemStack _cleanupTransitionAssistant](self, "_cleanupTransitionAssistant");
  self->_state = 0;
}

- (void)_cleanupTransitionAssistant
{
  int state;
  BOOL v4;
  _UINavigationBarTransitionAssistant *transitionAssistant;

  state = self->_state;
  v4 = -[_UINavigationBarTransitionAssistant needsLifetimeExtended](self->_transitionAssistant, "needsLifetimeExtended");
  if (!state && !v4)
  {
    transitionAssistant = self->_transitionAssistant;
    self->_transitionAssistant = 0;

  }
}

- (NSArray)items
{
  void *v3;
  NSMutableArray *v4;
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

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_items;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "item", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)stackItemsAreEqualTo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  v5 = -[NSMutableArray count](self->_items, "count");
  v6 = v5;
  if (v4)
  {
    if (v5 == objc_msgSend(v4, "count"))
    {
      if (v6 < 1)
      {
        v7 = 1;
      }
      else
      {
        v7 = 0;
        for (i = 0; i != v6; v7 = i >= v6)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", i);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndexedSubscript:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if ((v11 & 1) == 0)
            break;
          ++i;
        }
      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = v5 == 0;
  }

  return v7;
}

- (void)iterateItems:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42___UINavigationBarItemStack_iterateItems___block_invoke;
  v6[3] = &unk_1E16B5F10;
  v7 = v4;
  v5 = v4;
  -[_UINavigationBarItemStack iterateEntries:](self, "iterateEntries:", v6);

}

- (void)iterateEntries:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_items;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionAssistant, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_previousItems, 0);
}

- (void)popItemWithTransitionAssistant:(id)a3
{
  NSArray *v4;
  NSArray *previousItems;
  id v6;

  v6 = a3;
  if (self->_state)
    NSLog(CFSTR("nested pop animation can result in a corrupted navigation bar"));
  v4 = (NSArray *)-[NSMutableArray copy](self->_items, "copy");
  previousItems = self->_previousItems;
  self->_previousItems = v4;

  -[NSMutableArray removeLastObject](self->_items, "removeLastObject");
  -[_UINavigationBarItemStack _prepareTransitionWithAssistant:](self, "_prepareTransitionWithAssistant:", v6);
  self->_state = 2;

}

- (void)cancelOperation
{
  void *v3;
  void *v4;

  if (self->_state)
  {
    -[_UINavigationBarItemStack previousTopItem](self, "previousTopItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_movedFromTopOfStack:", 0);

    -[_UINavigationBarItemStack topItem](self, "topItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_movedToTopOfStack:", 0);

    -[NSMutableArray setArray:](self->_items, "setArray:", self->_previousItems);
    -[_UINavigationBarItemStack _completeTransition](self, "_completeTransition");
  }
}

- (void)beginInteractiveTransition
{
  -[_UINavigationBarTransitionAssistant setNeedsLifetimeExtended:](self->_transitionAssistant, "setNeedsLifetimeExtended:", 1);
}

- (void)endInteractiveTransition
{
  -[_UINavigationBarTransitionAssistant setNeedsLifetimeExtended:](self->_transitionAssistant, "setNeedsLifetimeExtended:", 0);
  -[_UINavigationBarItemStack _cleanupTransitionAssistant](self, "_cleanupTransitionAssistant");
}

- (void)_shim_pushNestedNavigationItem:(id)a3
{
  id v4;
  NSMutableArray *items;
  void *v6;
  id v7;

  v4 = a3;
  -[_UINavigationBarItemStack topItem](self, "topItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_movingFromTopOfStack");
  objc_msgSend(v4, "_movingToTopOfStack");
  items = self->_items;
  +[_UINavigationBarItemStackEntry entryForItem:replaceExistingWithNew:](_UINavigationBarItemStackEntry, "entryForItem:replaceExistingWithNew:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](items, "addObject:", v6);

  objc_msgSend(v7, "_movedFromTopOfStack:", 1);
  objc_msgSend(v4, "_movedToTopOfStack:", 1);

}

- (id)_shim_popNestedNavigationItem
{
  void *v3;
  void *v4;

  -[_UINavigationBarItemStack topItem](self, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarItemStack backItem](self, "backItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_movingFromTopOfStack");
  objc_msgSend(v4, "_movingToTopOfStack");
  -[NSMutableArray removeLastObject](self->_items, "removeLastObject");
  objc_msgSend(v3, "_movedFromTopOfStack:", 1);
  objc_msgSend(v4, "_movedToTopOfStack:", 1);

  return v3;
}

- (void)reverseIterateEntries:(id)a3
{
  id v4;
  NSMutableArray *items;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  items = self->_items;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51___UINavigationBarItemStack_reverseIterateEntries___block_invoke;
  v7[3] = &unk_1E16B5F38;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](items, "enumerateObjectsWithOptions:usingBlock:", 2, v7);

}

- (int64_t)effectiveDisplayModeForItemInPreviousStack:(id)a3
{
  void *v5;
  int64_t v6;

  if (a3)
    return -[_UINavigationBarItemStack _effectiveDisplayModeForItem:inStack:](self, "_effectiveDisplayModeForItem:inStack:", a3, self->_previousItems);
  -[_UINavigationBarItemStack previousTopItem](self, "previousTopItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UINavigationBarItemStack _effectiveDisplayModeForItem:inStack:](self, "_effectiveDisplayModeForItem:inStack:", v5, self->_previousItems);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarItemStack;
  -[_UINavigationBarItemStack description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = self->_state - 1;
  if (v5 >= 3)
  {
    -[_UINavigationBarItemStack topEntry](self, "topEntry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backEntry](self, "backEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" topEntry=%p backEntry=%p items=%p"), v8, v9, self->_items, v11);
  }
  else
  {
    objc_msgSend(v4, "appendString:", off_1E16B5F58[v5]);
    -[_UINavigationBarItemStack topEntry](self, "topEntry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack backEntry](self, "backEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" topEntry=%p backEntry=%p items=%p"), v6, v7, self->_items);

    -[_UINavigationBarItemStack previousTopEntry](self, "previousTopEntry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarItemStack previousBackEntry](self, "previousBackEntry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" previousTopEntry=%p previousBackEntry=%p previousItems=%p transitionAssistant=%p"), v8, v9, self->_previousItems, self->_transitionAssistant);
  }

  return v4;
}

- (_UINavigationItemChangeObserver)changeObserver
{
  return (_UINavigationItemChangeObserver *)objc_loadWeakRetained((id *)&self->_changeObserver);
}

@end
