@implementation SBHTableViewIconLibrary

- (SBHTableViewIconLibrary)initWithIconModel:(id)a3
{
  id v4;
  SBHIconLibraryPredicateQueryEngine *v5;
  SBHTableViewIconLibrary *v6;

  v4 = a3;
  v5 = -[SBHIconLibraryAbstractQueryEngine initWithIconModel:]([SBHIconLibraryPredicateQueryEngine alloc], "initWithIconModel:", v4);
  v6 = -[SBHTableViewIconLibrary initWithIconModel:queryEngine:](self, "initWithIconModel:queryEngine:", v4, v5);

  return v6;
}

- (SBHTableViewIconLibrary)initWithIconModel:(id)a3 queryEngine:(id)a4
{
  id v7;
  id v8;
  SBHTableViewIconLibrary *v9;
  SBHTableViewIconLibrary *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHTableViewIconLibrary;
  v9 = -[SBHTableViewIconLibrary init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_iconModel, a3);
    objc_storeStrong((id *)&v10->_queryEngine, a4);
    -[SBHIconLibraryQueryEngine addObserver:](v10->_queryEngine, "addObserver:", v10);
  }

  return v10;
}

- (void)dealloc
{
  SBHIconLibraryQueryEngine *queryEngine;
  SBHIconModel *iconModel;
  objc_super v5;

  -[SBHIconLibraryQueryEngine shutdown](self->_queryEngine, "shutdown");
  queryEngine = self->_queryEngine;
  self->_queryEngine = 0;

  iconModel = self->_iconModel;
  self->_iconModel = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBHTableViewIconLibrary;
  -[SBHTableViewIconLibrary dealloc](&v5, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)executeQuery:(id)a3
{
  -[SBHTableViewIconLibrary executeQuery:completion:](self, "executeQuery:completion:", a3, 0);
}

- (void)executeQuery:(id)a3 completion:(id)a4
{
  id v6;
  NSMapTable *completionHandlerForQuery;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v6)
  {
    completionHandlerForQuery = self->_completionHandlerForQuery;
    if (!completionHandlerForQuery)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v9 = self->_completionHandlerForQuery;
      self->_completionHandlerForQuery = v8;

      completionHandlerForQuery = self->_completionHandlerForQuery;
    }
    v10 = (void *)objc_msgSend(v6, "copy");
    v11 = _Block_copy(v10);
    -[NSMapTable setObject:forKey:](completionHandlerForQuery, "setObject:forKey:", v11, v12);

  }
  -[SBHIconLibraryQueryEngine executeQuery:](self->_queryEngine, "executeQuery:", v12);

}

- (void)engine:(id)a3 queryResultsWereUpdated:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  BSDispatchMain();

}

uint64_t __58__SBHTableViewIconLibrary_engine_queryResultsWereUpdated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchQueryResult:", *(_QWORD *)(a1 + 40));
}

- (void)engine:(id)a3 failedToExecuteQuery:(id)a4 withError:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  BSDispatchMain();

}

void __65__SBHTableViewIconLibrary_engine_failedToExecuteQuery_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  +[SBHIconLibraryQueryResult nullQueryResults](SBHIconLibraryQueryResult, "nullQueryResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v3[2](v3, v2, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "_dispatchQueryResult:", v2);

}

- (void)_dispatchQueryResult:(id)a3
{
  id v5;
  SBHIconLibraryQueryResult *lastQueryResults;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMapTable *completionHandlerForQuery;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  NSMapTable *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  lastQueryResults = self->_lastQueryResults;
  if (!lastQueryResults
    || !-[SBHIconLibraryQueryResult isEqualToQueryResult:](lastQueryResults, "isEqualToQueryResult:", v5))
  {
    objc_storeStrong((id *)&self->_lastQueryResults, a3);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_observers;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11++), "iconLibrary:hasUpdatedQueryResult:", self, v5, (_QWORD)v17);
        }
        while (v9 != v11);
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    completionHandlerForQuery = self->_completionHandlerForQuery;
    objc_msgSend(v5, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](completionHandlerForQuery, "objectForKey:", v13);
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      ((void (**)(_QWORD, id, _QWORD))v14)[2](v14, v5, 0);
      v15 = self->_completionHandlerForQuery;
      objc_msgSend(v5, "query");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](v15, "removeObjectForKey:", v16);

    }
  }

}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (SBHIconLibraryQueryEngine)queryEngine
{
  return self->_queryEngine;
}

- (SBHIconLibraryQueryResult)lastQueryResults
{
  return self->_lastQueryResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastQueryResults, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_queryEngine, 0);
  objc_storeStrong((id *)&self->_completionHandlerForQuery, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
