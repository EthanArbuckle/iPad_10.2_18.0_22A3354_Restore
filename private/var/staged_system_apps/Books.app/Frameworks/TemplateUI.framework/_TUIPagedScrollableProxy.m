@implementation _TUIPagedScrollableProxy

- (_TUIPagedScrollableProxy)init
{
  _TUIPagedScrollableProxy *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TUIPagedScrollableProxy;
  v2 = -[_TUIPagedScrollableProxy init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)updateWithPageIndex:(unint64_t)a3 pageCount:(unint64_t)a4
{
  NSHashTable *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (self->_pageIndex != a3 || self->_pageCount != a4)
  {
    self->_pageIndex = a3;
    self->_pageCount = a4;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_observers;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "pagedScrollableDidChange:", self, (_QWORD)v10);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)pagedScrollableActionChangeToPageIndex:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  objc_msgSend(WeakRetained, "pagedScrollableActionChangeToPageIndex:", a3);

}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (TUIPagedScrollableAction)action
{
  return (TUIPagedScrollableAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void)setAction:(id)a3
{
  objc_storeWeak((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
