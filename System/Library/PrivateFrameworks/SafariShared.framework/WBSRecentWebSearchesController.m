@implementation WBSRecentWebSearchesController

- (void)addRecentSearch:(id)a3
{
  WBSRecentWebSearchEntry *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "_shouldTrackSearches") & 1) != 0)
  {
    v4 = -[WBSRecentWebSearchEntry initWithSearchString:]([WBSRecentWebSearchEntry alloc], "initWithSearchString:", v5);
    -[WBSRecentWebSearchesController _addRecentSearchEntry:](self, "_addRecentSearchEntry:", v4);

    -[WBSRecentWebSearchesController _saveRecentSearches](self, "_saveRecentSearches");
  }

}

- (id)recentSearches
{
  return -[WBSRecentWebSearchesController recentSearchesMatchingPrefix:](self, "recentSearchesMatchingPrefix:", 0);
}

- (id)recentWebSearcheEntries
{
  -[WBSRecentWebSearchesController _loadRecentSearchesIfNeeded](self, "_loadRecentSearchesIfNeeded");
  return self->_recentSearchEntries;
}

- (id)recentSearchesMatchingPrefix:(id)a3
{
  id v4;
  BOOL v5;
  NSMutableArray *recentSearchEntries;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v4 = a3;
  -[WBSRecentWebSearchesController _loadRecentSearchesIfNeeded](self, "_loadRecentSearchesIfNeeded");
  v5 = objc_msgSend(v4, "length") == 0;
  recentSearchEntries = self->_recentSearchEntries;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__WBSRecentWebSearchesController_recentSearchesMatchingPrefix___block_invoke;
  v10[3] = &unk_1E4B3ECB8;
  v12 = v5;
  v7 = v4;
  v11 = v7;
  -[NSMutableArray safari_mapAndFilterObjectsUsingBlock:](recentSearchEntries, "safari_mapAndFilterObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __63__WBSRecentWebSearchesController_recentSearchesMatchingPrefix___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 40) || objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", *(_QWORD *)(a1 + 32)))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)clearRecentSearches
{
  NSMutableArray *v3;
  NSMutableArray *recentSearchEntries;

  -[WBSRecentWebSearchesController _loadRecentSearchesIfNeeded](self, "_loadRecentSearchesIfNeeded");
  if (-[NSMutableArray count](self->_recentSearchEntries, "count"))
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recentSearchEntries = self->_recentSearchEntries;
    self->_recentSearchEntries = v3;

    -[WBSRecentWebSearchesController _saveRecentSearches](self, "_saveRecentSearches");
  }
}

- (void)clearRecentSearchesAddedAfterDate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSRecentWebSearchesController _loadRecentSearchesIfNeeded](self, "_loadRecentSearchesIfNeeded");
  v5 = -[NSMutableArray count](self->_recentSearchEntries, "count");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = v5;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_recentSearchEntries;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "compare:", v4) == 1;

        if (v13)
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeObjectsInArray:](self->_recentSearchEntries, "removeObjectsInArray:", v6);
  if (v14 != -[NSMutableArray count](self->_recentSearchEntries, "count"))
    -[WBSRecentWebSearchesController _saveRecentSearches](self, "_saveRecentSearches");

}

- (void)clearRecentSearch:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSRecentWebSearchesController _loadRecentSearchesIfNeeded](self, "_loadRecentSearchesIfNeeded");
  v13 = -[NSMutableArray count](self->_recentSearchEntries, "count");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_recentSearchEntries;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "searchString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeObjectsInArray:](self->_recentSearchEntries, "removeObjectsInArray:", v5);
  if (v13 != -[NSMutableArray count](self->_recentSearchEntries, "count"))
    -[WBSRecentWebSearchesController _saveRecentSearches](self, "_saveRecentSearches");

}

- (void)_addRecentSearchEntry:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[WBSRecentWebSearchesController _loadRecentSearchesIfNeeded](self, "_loadRecentSearchesIfNeeded");
    -[NSMutableArray removeObject:](self->_recentSearchEntries, "removeObject:", v6);
    -[NSMutableArray insertObject:atIndex:](self->_recentSearchEntries, "insertObject:atIndex:", v6, 0);
    v4 = -[NSMutableArray count](self->_recentSearchEntries, "count");
    v5 = objc_msgSend((id)objc_opt_class(), "_maximumNumberOfSearchesToTrack");
    if (v4 > v5)
      -[NSMutableArray removeObjectsInRange:](self->_recentSearchEntries, "removeObjectsInRange:", v5, v4 - v5);
  }

}

- (void)_saveRecentSearches
{
  NSMutableArray *v3;
  NSMutableArray *recentSearchEntries;
  void *v5;
  id v6;

  if (!self->_recentSearchEntries)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recentSearchEntries = self->_recentSearchEntries;
    self->_recentSearchEntries = v3;

  }
  -[WBSRecentWebSearchesController _recentSearchesDictionaries](self, "_recentSearchesDictionaries");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultsKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSRecentWebSearchesController _saveRecentSearchDictionaries:toUserDefaultsUsingKey:](self, "_saveRecentSearchDictionaries:toUserDefaultsUsingKey:", v6, v5);

}

- (id)_recentSearchesDictionaries
{
  return (id)-[NSMutableArray safari_mapObjectsUsingBlock:](self->_recentSearchEntries, "safari_mapObjectsUsingBlock:", &__block_literal_global_89);
}

id __61__WBSRecentWebSearchesController__recentSearchesDictionaries__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dictionaryRepresentation");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_saveRecentSearchDictionaries:(id)a3 toUserDefaultsUsingKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, v5);

}

- (id)_recentSearchDictionariesFromUserDefaultsUsingKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_loadRecentSearchesIfNeeded
{
  NSMutableArray *v3;
  NSMutableArray *recentSearchEntries;
  void *v5;
  id v6;
  _QWORD v7[5];

  if (!self->_recentSearchEntries)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recentSearchEntries = self->_recentSearchEntries;
    self->_recentSearchEntries = v3;

    objc_msgSend((id)objc_opt_class(), "_defaultsKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSRecentWebSearchesController _recentSearchDictionariesFromUserDefaultsUsingKey:](self, "_recentSearchDictionariesFromUserDefaultsUsingKey:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__WBSRecentWebSearchesController__loadRecentSearchesIfNeeded__block_invoke;
    v7[3] = &unk_1E4B3ED20;
    v7[4] = self;
    objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v7);
    -[WBSRecentWebSearchesController _saveRecentSearches](self, "_saveRecentSearches");

  }
}

void __61__WBSRecentWebSearchesController__loadRecentSearchesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  WBSRecentWebSearchEntry *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = -[WBSRecentWebSearchEntry initWithDictionaryRepresentation:]([WBSRecentWebSearchEntry alloc], "initWithDictionaryRepresentation:", v5);
    objc_msgSend(v3, "_addRecentSearchEntry:", v4);

  }
}

+ (BOOL)_shouldTrackSearches
{
  return 0;
}

+ (unint64_t)_maximumNumberOfSearchesToTrack
{
  return 10;
}

+ (id)_defaultsKey
{
  return CFSTR("RecentWebSearches");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentSearchEntries, 0);
}

@end
