@implementation ICSectionedSearchResults

+ (id)newSearchResultsBySection
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

  }
  return v2;
}

- (ICSectionedSearchResults)init
{
  ICSectionedSearchResults *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ICSectionedSearchResults *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)ICSectionedSearchResults;
  v2 = -[ICSectionedSearchResults init](&v26, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend((id)objc_opt_class(), "newSearchResultsBySection");
    v21 = v2;
    -[ICSectionedSearchResults setSearchResultsBySection:](v2, "setSearchResultsBySection:", v3);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(MEMORY[0x1E0D64258], "sharedIndexer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      v9 = *MEMORY[0x1E0C978B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EED6F490))
          {
            v12 = (void *)MEMORY[0x1E0CB37D0];
            v13 = v11;
            objc_msgSend(v12, "defaultCenter");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "mainThreadContext");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObserver:selector:name:object:", v21, sel_objectsDidChange_, v9, v15);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v21;
    objc_msgSend(v16, "addObserver:selector:name:object:", v21, sel_noteWillBeUndeletedOrUntrashed_, *MEMORY[0x1E0D63810], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v21, sel_noteWillBeUndeletedOrUntrashed_, *MEMORY[0x1E0D63818], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v21, sel_noteWillBeDeletedOrTrashed_, *MEMORY[0x1E0D63808], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v21, sel_noteWillBeDeletedOrTrashed_, *MEMORY[0x1E0D63820], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSectionedSearchResults;
  -[ICSectionedSearchResults dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ICSectionedSearchResults;
  -[ICSectionedSearchResults description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSectionedSearchResults searchResultsBySection](self, "searchResultsBySection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)objectsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[4];
  id v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[ICSectionedSearchResults disableAutomaticUpdates](self, "disableAutomaticUpdates"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C97840]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
      objc_msgSend(v5, "unionSet:", v7);
    v25 = v7;
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A20]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
      objc_msgSend(v5, "unionSet:", v9);
    objc_msgSend(MEMORY[0x1E0C99E20], "set", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EED279C0))
          {
            v17 = v16;
            if ((objc_msgSend(v17, "isDeleted") & 1) != 0 || objc_msgSend(v17, "isHiddenFromSearch"))
            {
              objc_msgSend(v17, "searchIndexingIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(v17, "searchIndexingIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v19);

              }
            }

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v13);
    }

    objc_msgSend(v10, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[ICSectionedSearchResults removeSearchResultsWithIdentifiers:forHiding:](self, "removeSearchResultsWithIdentifiers:forHiding:", v20, 0);

    if (v21
      || (objc_msgSend(v4, "userInfo"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0C97880]),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          v23))
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__ICSectionedSearchResults_objectsDidChange___block_invoke;
      block[3] = &unk_1E5C1F720;
      objc_copyWeak(&v27, &location);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }

  }
}

void __45__ICSectionedSearchResults_objectsDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", CFSTR("ICSearchResultsDidUpdateNotification"), WeakRetained);

  }
}

- (void)noteWillBeUndeletedOrUntrashed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "searchIndexingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 0;
    for (i = 0; i != 3; ++i)
    {
      -[ICSectionedSearchResults searchResultSectionForSectionIndex:](self, "searchResultSectionForSectionIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hiddenSearchResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v16[0] = v12;
        v8 = 1;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSectionedSearchResults addSearchResults:toSection:](self, "addSearchResults:toSection:", v13, i);

        objc_msgSend(v10, "unhiddenSearchResults");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v7);

      }
    }
    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:", CFSTR("ICSearchResultsDidUpdateNotification"), self);

    }
  }

}

- (void)noteWillBeDeletedOrTrashed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  objc_msgSend(v15, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "searchIndexingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
    for (i = 0; i != 3; ++i)
    {
      -[ICSectionedSearchResults searchResultSectionForSectionIndex:](self, "searchResultSectionForSectionIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unhiddenSearchResults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "searchIndexingIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 1;
        -[ICSectionedSearchResults removeSearchResultWithIdentifier:forHiding:](self, "removeSearchResultWithIdentifier:forHiding:", v13, 1);

      }
    }
    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:", CFSTR("ICSearchResultsDidUpdateNotification"), self);

    }
  }

}

- (NSArray)allSearchResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (void)clear
{
  id v3;

  v3 = (id)objc_msgSend((id)objc_opt_class(), "newSearchResultsBySection");
  -[ICSectionedSearchResults setSearchResultsBySection:](self, "setSearchResultsBySection:", v3);

}

- (BOOL)hasSearchResults
{
  unint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = 0;
  v4 = 1;
  do
  {
    -[ICSectionedSearchResults searchResultsBySection](self, "searchResultsBySection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      break;
    v4 = v3++ < 2;
  }
  while (v3 != 3);
  return v4;
}

- (unint64_t)countForSection:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)sectionForSearchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isTopHit") & 1) != 0)
  {
    objc_msgSend(v3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v7 = 0;
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v7 = objc_msgSend(v8, "searchResultsSection");
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ICSectionedSearchResults sectionForSearchResult:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v7 = 1;
  }

LABEL_11:
  return v7;
}

- (id)searchResultAtRow:(int64_t)a3 section:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;

  if (a4 >= 3)
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICSectionedSearchResults searchResultAtRow:section:].cold.1();

  }
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") <= (unint64_t)a3)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)searchResultWithObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[ICSectionedSearchResults allSearchResults](self, "allSearchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__ICSectionedSearchResults_searchResultWithObject___block_invoke;
  v9[3] = &unk_1E5C1F748;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "ic_objectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __51__ICSectionedSearchResults_searchResultWithObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)searchResultSectionForSectionIndex:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3 >= 3)
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICSectionedSearchResults searchResultAtRow:section:].cold.1();

  }
  -[ICSectionedSearchResults searchResultsBySection](self, "searchResultsBySection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)searchResultsInSection:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[ICSectionedSearchResults searchResultSectionForSectionIndex:](self, "searchResultSectionForSectionIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)searchResultObjectsInSection:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 >= 3)
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICSectionedSearchResults searchResultAtRow:section:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  v13 = (void *)objc_msgSend(v6, "copy");

  return v13;
}

- (void)setSearchResults:(id)a3 forSection:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  ICSectionedSearchResults *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_opt_class();
    v12 = v11;
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413314;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    v18 = 2112;
    v19 = v13;
    v20 = 2048;
    v21 = a4;
    v22 = 2112;
    v23 = v7;
    _os_log_debug_impl(&dword_1AC7A1000, v8, OS_LOG_TYPE_DEBUG, "[%@(%p) %@] section %ld results %@", (uint8_t *)&v14, 0x34u);

  }
  if (a4 >= 3)
  {
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICSectionedSearchResults searchResultAtRow:section:].cold.1();

  }
  -[ICSectionedSearchResults searchResultSectionForSectionIndex:](self, "searchResultSectionForSectionIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetToSearchResults:", v7);

}

- (void)addSearchResult:(id)a3 toSection:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  if (a4 >= 3)
  {
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICSectionedSearchResults searchResultAtRow:section:].cold.1();

  }
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  if (a5 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v13, "count") <= a5)
    objc_msgSend(v14, "addObject:", v8);
  else
    objc_msgSend(v14, "insertObject:atIndex:", v8, a5);
  v15 = (void *)objc_msgSend(v14, "copy");
  -[ICSectionedSearchResults setSearchResults:forSection:](self, "setSearchResults:forSection:", v15, a4);

}

- (void)addSearchResults:(id)a3 toSection:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (a4 >= 3)
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICSectionedSearchResults searchResultAtRow:section:].cold.1();

  }
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSectionedSearchResults setSearchResults:forSection:](self, "setSearchResults:forSection:", v12, a4);

}

- (id)removeSearchResultAtRow:(int64_t)a3 section:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  int64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a4 >= 3)
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICSectionedSearchResults searchResultAtRow:section:].cold.1();

  }
  -[ICSectionedSearchResults searchResultAtRow:section:](self, "searchResultAtRow:section:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  if (objc_msgSend(v10, "count") <= (unint64_t)a3
    || (objc_msgSend(v10, "objectAtIndexedSubscript:", a3),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11 != v8))
  {
    v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v16 = 134218498;
      v17 = a3;
      v18 = 2048;
      v19 = a4;
      v20 = 2112;
      v21 = v8;
      _os_log_debug_impl(&dword_1AC7A1000, v12, OS_LOG_TYPE_DEBUG, "Search result mismatch at row %ld section %ld %@", (uint8_t *)&v16, 0x20u);
    }

  }
  objc_msgSend(v8, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchIndexingIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSectionedSearchResults removeSearchResultWithIdentifier:fromSection:forHiding:](self, "removeSearchResultWithIdentifier:fromSection:forHiding:", v14, a4, 1);
  return v8;
}

- (BOOL)removeSearchResultWithIdentifier:(id)a3 fromSection:(unint64_t)a4 forHiding:(BOOL)a5
{
  uint64_t v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  -[ICSectionedSearchResults searchResultSectionForSectionIndex:](self, "searchResultSectionForSectionIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "removeSearchResultForIdentifier:forHiding:", v8, v5);

  return v5;
}

- (BOOL)removeSearchResultWithIdentifier:(id)a3 forHiding:(BOOL)a4
{
  _BOOL8 v4;
  int v7;
  uint64_t i;

  v4 = a4;
  v7 = 0;
  for (i = 0; i != 3; ++i)
    v7 |= -[ICSectionedSearchResults removeSearchResultWithIdentifier:fromSection:forHiding:](self, "removeSearchResultWithIdentifier:fromSection:forHiding:", a3, i, v4);
  return v7 & 1;
}

- (unint64_t)removeSearchResultsWithIdentifiers:(id)a3 forHiding:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        objc_opt_class();
        ICCheckedDynamicCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          v9 += -[ICSectionedSearchResults removeSearchResultWithIdentifier:forHiding:](self, "removeSearchResultWithIdentifier:forHiding:", v12, v4);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)passesVisibilityTesting:(id)a3 forSearchResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;

  v5 = a3;
  objc_msgSend(a4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICSectionedSearchResults sectionForSearchResult:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_11:

LABEL_12:
    v17 = 0;
    goto LABEL_18;
  }
  if (v5
    && !objc_msgSend(v5, "supportsVisibilityTestingType:", objc_msgSend(v6, "visibilityTestingType")))
  {
    goto LABEL_12;
  }
  if (objc_msgSend(v7, "searchResultType") != 1)
  {
    if (!objc_msgSend(v7, "searchResultType"))
    {
      objc_msgSend(v5, "predicateForSearchableNotes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICSectionedSearchResults passesVisibilityTesting:forSearchResult:].cold.2();
    goto LABEL_11;
  }
  objc_msgSend(v5, "predicateForSearchableAttachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v18 = v8;
  if (v8)
    v17 = objc_msgSend(v8, "evaluateWithObject:", v7);
  else
    v17 = 1;

LABEL_18:
  return v17;
}

- (id)searchResultsBySectionForSearchResults:(id)a3 passingVisibilityTesting:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  unint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v25;
    *(_QWORD *)&v10 = 134217984;
    v22 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (-[ICSectionedSearchResults passesVisibilityTesting:forSearchResult:](self, "passesVisibilityTesting:forSearchResult:", v7, v14, v22))
        {
          v15 = -[ICSectionedSearchResults sectionForSearchResult:](self, "sectionForSearchResult:", v14);
          if (v15 >= 3)
          {
            v16 = os_log_create("com.apple.notes", "UI");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v22;
              v29 = v15;
              _os_log_error_impl(&dword_1AC7A1000, v16, OS_LOG_TYPE_ERROR, "Invalid search results sections %lu", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v19);

          }
          objc_msgSend(v18, "addObject:", v14);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v11);
  }

  v20 = (void *)objc_msgSend(v8, "copy");
  return v20;
}

- (unint64_t)addSearchResultsBySection:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  unint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    *(_QWORD *)&v6 = 134217984;
    v16 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v4);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "integerValue", v16);
        if (v11 >= 3)
        {
          v12 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_error_impl(&dword_1AC7A1000, v12, OS_LOG_TYPE_ERROR, "Invalid search results sections %lu", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v8 += objc_msgSend(v14, "count");
        -[ICSectionedSearchResults addSearchResults:toSection:](self, "addSearchResults:toSection:", v14, v11);

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)addSearchResults:(id)a3 removingFoundIdentifiers:(id)a4 passingVisibilityTesting:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;

  v8 = a5;
  v9 = a3;
  -[ICSectionedSearchResults removeSearchResultsWithIdentifiers:forHiding:](self, "removeSearchResultsWithIdentifiers:forHiding:", a4, 0);
  -[ICSectionedSearchResults searchResultsBySectionForSearchResults:passingVisibilityTesting:](self, "searchResultsBySectionForSearchResults:passingVisibilityTesting:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ICSectionedSearchResults addSearchResultsBySection:](self, "addSearchResultsBySection:", v10);
  return v11;
}

- (void)filterSearchResultsUsingVisiblityTesting:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = 0;
  v6 = MEMORY[0x1E0C809B0];
  do
  {
    -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __69__ICSectionedSearchResults_filterSearchResultsUsingVisiblityTesting___block_invoke;
    v10[3] = &unk_1E5C1F770;
    v10[4] = self;
    v8 = v4;
    v11 = v8;
    objc_msgSend(v7, "ic_objectsPassingTest:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSectionedSearchResults setSearchResults:forSection:](self, "setSearchResults:forSection:", v9, v5);

    ++v5;
  }
  while (v5 != 3);

}

uint64_t __69__ICSectionedSearchResults_filterSearchResultsUsingVisiblityTesting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(*(id *)(a1 + 32), "passesVisibilityTesting:forSearchResult:", *(_QWORD *)(a1 + 40), v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)hideSearchResultsForIdentifier:(id)a3
{
  id v4;
  int v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = 0;
  for (i = 0; i != 3; ++i)
  {
    -[ICSectionedSearchResults searchResultsBySection](self, "searchResultsBySection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v5 |= objc_msgSend(v9, "removeSearchResultForIdentifier:forHiding:", v4, 1);
  }

  return v5 & 1;
}

- (BOOL)hideSearchResultsForObjects:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        ICProtocolCast();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        ICDynamicCast();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "searchIndexingIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;

        }
        else
        {
          objc_msgSend(v9, "searchIndexingIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
            goto LABEL_10;
        }
        v6 |= -[ICSectionedSearchResults hideSearchResultsForIdentifier:](self, "hideSearchResultsForIdentifier:", v13);

LABEL_10:
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v5)
        goto LABEL_14;
    }
  }
  LOBYTE(v6) = 0;
LABEL_14:

  return v6 & 1;
}

- (id)indexPathOfSearchResult:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = -[ICSectionedSearchResults sectionForSearchResult:](self, "sectionForSearchResult:", v4);
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)indexPathOfObject:(id)a3
{
  void *v4;
  void *v5;

  -[ICSectionedSearchResults searchResultWithObject:](self, "searchResultWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSectionedSearchResults indexPathOfSearchResult:](self, "indexPathOfSearchResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)replaceSearchResultObject:(id)a3 withObject:(id)a4
{
  void *v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICSearchResult *v18;
  void *v19;
  uint64_t v20;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  ICSearchResultConfiguration *v26;
  ICSearchResultConfiguration *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a4;
  objc_msgSend(a3, "searchIndexingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 1;
  while (1)
  {
    -[ICSectionedSearchResults searchResultsBySection](self, "searchResultsBySection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "identifierToSearchResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      break;

    v8 = v7++ < 2;
    if (v7 == 3)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  v26 = [ICSearchResultConfiguration alloc];
  objc_msgSend(v13, "configuration");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "searchString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v28, "searchSuggestionType");
  objc_msgSend(v13, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v25, "isTopHit");
  objc_msgSend(v13, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "foundAttachmentObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortableSearchableItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[ICSearchResultConfiguration initWithSearchString:searchSuggestionType:isTopHit:foundAttachmentObjectID:sortableSearchableItem:](v26, "initWithSearchString:searchSuggestionType:isTopHit:foundAttachmentObjectID:sortableSearchableItem:", v14, v23, v22, v15, v17);

  v18 = -[ICSearchResult initWithObject:configuration:]([ICSearchResult alloc], "initWithObject:configuration:", v30, v27);
  -[ICSearchResult setMathNote:](v18, "setMathNote:", objc_msgSend(v13, "isMathNote"));
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "indexOfObject:", v13);

  -[ICSectionedSearchResults hideSearchResultsForIdentifier:](self, "hideSearchResultsForIdentifier:", v6);
  -[ICSectionedSearchResults addSearchResult:toSection:atIndex:](self, "addSearchResult:toSection:atIndex:", v18, v7, v20);

LABEL_6:
  return v8;
}

- (void)updateForSortTypeChange
{
  void *v3;
  id v4;

  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSectionedSearchResults searchResultsInSection:](self, "searchResultsInSection:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSectionedSearchResults setSearchResults:forSection:](self, "setSearchResults:forSection:", v4, 1);
  -[ICSectionedSearchResults setSearchResults:forSection:](self, "setSearchResults:forSection:", v3, 2);

}

- (BOOL)disableAutomaticUpdates
{
  return self->_disableAutomaticUpdates;
}

- (void)setDisableAutomaticUpdates:(BOOL)a3
{
  self->_disableAutomaticUpdates = a3;
}

- (NSMutableDictionary)searchResultsBySection
{
  return self->_searchResultsBySection;
}

- (void)setSearchResultsBySection:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsBySection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsBySection, 0);
}

- (void)sectionForSearchResult:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Search result object is nil", a5, a6, a7, a8, 0);
}

- (void)searchResultAtRow:section:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Invalid search results sections %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)passesVisibilityTesting:forSearchResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Invalid search result object type %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
