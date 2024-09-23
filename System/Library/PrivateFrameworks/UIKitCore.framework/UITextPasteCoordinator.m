@implementation UITextPasteCoordinator

- (UITextPasteCoordinator)initWithDelegate:(id)a3
{
  id v4;
  UITextPasteCoordinator *v5;
  UITextPasteCoordinator *v6;
  uint64_t v7;
  NSMutableArray *items;
  OS_dispatch_group *wait;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextPasteCoordinator;
  v5 = -[UITextPasteCoordinator init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_opt_new();
    items = v6->_items;
    v6->_items = (NSMutableArray *)v7;

    wait = v6->_wait;
    v6->_wait = 0;

  }
  return v6;
}

- (void)addItem:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_items;
    objc_sync_enter(v5);
    -[NSMutableArray addObject:](self->_items, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)setResult:(id)a3 forItem:(id)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = self->_items;
    objc_sync_enter(v7);
    v8 = -[NSMutableArray indexOfObject:](self->_items, "indexOfObject:", v6);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_sync_exit(v7);

    }
    else
    {
      v9 = v10;
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NSMutableArray setObject:atIndexedSubscript:](self->_items, "setObject:atIndexedSubscript:", v9, v8);
      if (!v10)

      objc_sync_exit(v7);
      -[UITextPasteCoordinator _determineFinished](self, "_determineFinished");
    }
  }

}

- (BOOL)performBlockingWait:(double)a3
{
  NSObject *wait;
  OS_dispatch_group *v6;
  OS_dispatch_group *v7;
  dispatch_time_t v8;
  intptr_t v9;
  OS_dispatch_group *v10;

  wait = self->_wait;
  if (!wait)
  {
    v6 = (OS_dispatch_group *)dispatch_group_create();
    v7 = self->_wait;
    self->_wait = v6;

    dispatch_group_enter((dispatch_group_t)self->_wait);
    wait = self->_wait;
  }
  v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v9 = dispatch_group_wait(wait, v8);
  if (v9)
  {
    v10 = self->_wait;
    self->_wait = 0;

  }
  else
  {
    -[UITextPasteCoordinator _finish](self, "_finish");
  }
  return v9 == 0;
}

- (void)_determineFinished
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OS_dispatch_group *v8;
  OS_dispatch_group *wait;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = self->_items;
  objc_sync_enter(v3);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_items;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            objc_sync_exit(v3);
            goto LABEL_14;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_sync_exit(v3);
  v8 = self->_wait;
  if (v8)
  {
    v3 = (NSMutableArray *)v8;
    wait = self->_wait;
    self->_wait = 0;

    dispatch_group_leave(&v3->super.super);
  }
  else
  {
    -[UITextPasteCoordinator _finish](self, "_finish", v10);
    v3 = 0;
  }
LABEL_14:

}

- (void)_finish
{
  NSMutableArray *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self->_items;
  objc_sync_enter(v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_items;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v9, (_QWORD)v11);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "coordinator:endPastingItems:", self, v4);

}

- (UITextPasteCoordinatorDelegate)delegate
{
  return (UITextPasteCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wait, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
