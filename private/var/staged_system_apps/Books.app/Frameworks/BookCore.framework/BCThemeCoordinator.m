@implementation BCThemeCoordinator

+ (BCThemeCoordinator)shared
{
  if (qword_30D5E0 != -1)
    dispatch_once(&qword_30D5E0, &stru_28D698);
  return (BCThemeCoordinator *)(id)qword_30D5D8;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCThemeCoordinator observersHash](self, "observersHash"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BCThemeCoordinator observersHash](self, "observersHash"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSArray)observers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCThemeCoordinator observersHash](self, "observersHash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));

  return (NSArray *)v3;
}

- (void)observer:(id)a3 didChangeFont:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCThemeCoordinator observers](self, "observers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v13, "coordinator:observer:didChangeFont:") & 1) != 0 && v13 != v6)
          objc_msgSend(v13, "coordinator:observer:didChangeFont:", self, v6, v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)observerDidIncreaseFontSize:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCThemeCoordinator observers](self, "observers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "coordinator:observerDidIncreaseFontSize:") & 1) != 0 && v10 != v4)
          objc_msgSend(v10, "coordinator:observerDidIncreaseFontSize:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)observerDidDecreaseFontSize:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCThemeCoordinator observers](self, "observers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "coordinator:observerDidDecreaseFontSize:") & 1) != 0 && v10 != v4)
          objc_msgSend(v10, "coordinator:observerDidDecreaseFontSize:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)observer:(id)a3 didChangeStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCThemeCoordinator observers](self, "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "coordinator:observer:didChangeStyle:") & 1) != 0 && v12 != v6)
          objc_msgSend(v12, "coordinator:observer:didChangeStyle:", self, v6, a4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)observer:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCThemeCoordinator observers](self, "observers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v12, "coordinator:observer:didChangeLayout:") & 1) != 0 && v12 != v6)
          objc_msgSend(v12, "coordinator:observer:didChangeLayout:", self, v6, a4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BCThemeCoordinator)init
{
  BCThemeCoordinator *v2;
  uint64_t v3;
  NSHashTable *observersHash;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCThemeCoordinator;
  v2 = -[BCThemeCoordinator init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observersHash = v2->_observersHash;
    v2->_observersHash = (NSHashTable *)v3;

  }
  return v2;
}

- (NSHashTable)observersHash
{
  return self->_observersHash;
}

- (void)setObserversHash:(id)a3
{
  objc_storeStrong((id *)&self->_observersHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersHash, 0);
}

@end
