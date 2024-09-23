@implementation CategoriesDataSource

- (CategoriesDataSource)initWithSearchModel:(id)a3
{
  id v5;
  CategoriesDataSource *v6;
  CategoriesDataSource *v7;
  NSMutableArray *v8;
  NSMutableArray *model;
  NSArray *categories;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *recents;
  uint64_t v15;
  NSMutableArray *v16;
  NSObject *v17;
  _QWORD block[4];
  CategoriesDataSource *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CategoriesDataSource;
  v6 = -[CategoriesDataSource init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchModel, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    model = v7->_model;
    v7->_model = v8;

    categories = v7->_categories;
    v7->_categories = (NSArray *)MEMORY[0x24BDBD1A8];

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("STSRecentQueries"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");
    recents = v7->_recents;
    v7->_recents = (NSMutableArray *)v13;

    if (!v7->_recents)
    {
      v15 = objc_opt_new();
      v16 = v7->_recents;
      v7->_recents = (NSMutableArray *)v15;

    }
    dispatch_get_global_queue(9, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__CategoriesDataSource_initWithSearchModel___block_invoke;
    block[3] = &unk_24E7457A8;
    v20 = v7;
    dispatch_async(v17, block);

  }
  return v7;
}

uint64_t __44__CategoriesDataSource_initWithSearchModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateModel");
}

- (void)updateModel
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  STSCategoryResult *v6;
  void *v7;
  NSMutableArray *recents;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id WeakRetained;
  STSCategoryResult *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  -[NSMutableArray removeAllObjects](self->_model, "removeAllObjects");
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = -[NSMutableArray count](self->_recents, "count");
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    v6 = objc_alloc_init(STSCategoryResult);
    -[STSCategoryResult setType:](v6, "setType:", 2);
    STSLocalizedString(CFSTR("RECENT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCategoryResult setTitle:](v6, "setTitle:", v7);

    -[STSCategoryResult setClearButtonHidden:](v6, "setClearButtonHidden:", 0);
    -[NSMutableArray addObject:](self->_model, "addObject:", v6);
    recents = self->_recents;
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __35__CategoriesDataSource_updateModel__block_invoke;
    v17[3] = &unk_24E7457D0;
    v17[4] = self;
    v18 = v3;
    -[NSMutableArray enumerateObjectsUsingBlock:](recents, "enumerateObjectsUsingBlock:", v17);

  }
  v14 = objc_alloc_init(STSCategoryResult);
  -[STSCategoryResult setType:](v14, "setType:", 2);
  STSLocalizedString(CFSTR("CATEGORIES"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSCategoryResult setTitle:](v14, "setTitle:", v9);

  -[STSCategoryResult setClearButtonHidden:](v14, "setClearButtonHidden:", 1);
  -[NSMutableArray addObject:](self->_model, "addObject:", v14);
  -[STSSearchModel categoryList](self->_searchModel, "categoryList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __35__CategoriesDataSource_updateModel__block_invoke_2;
  v15[3] = &unk_24E7457F8;
  v15[4] = self;
  v16 = v3;
  v12 = v3;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  objc_msgSend(WeakRetained, "searchModelUpdated");

}

void __35__CategoriesDataSource_updateModel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  STSCategoryResult *v8;

  v3 = a2;
  v8 = objc_alloc_init(STSCategoryResult);
  -[STSCategoryResult setType:](v8, "setType:", 0);
  -[STSCategoryResult setTitle:](v8, "setTitle:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F98]), "initWithSuggestion:query:score:type:", v3, &stru_24E7469D8, 3, 0.0);
  -[STSCategoryResult setSuggestion:](v8, "setSuggestion:", v4);

  v5 = objc_alloc_init(MEMORY[0x24BE84F90]);
  objc_msgSend(MEMORY[0x24BE85018], "textWithString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_searchResultIdentifierForSuggestion:recent:", v3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", v7);
  objc_msgSend(v5, "setType:", 16);
  objc_msgSend(v5, "setResultBundleId:", CFSTR("com.apple.hashtagimages.categorylist.recents.recent"));
  objc_msgSend(v5, "setSectionBundleIdentifier:", CFSTR("com.apple.hashtagimages.categorylist.recents"));
  -[STSCategoryResult setSearchResult:](v8, "setSearchResult:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v8);

}

void __35__CategoriesDataSource_updateModel__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  STSCategoryResult *v17;

  v5 = a2;
  v17 = objc_alloc_init(STSCategoryResult);
  -[STSCategoryResult setType:](v17, "setType:", 1);
  objc_msgSend(v5, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSCategoryResult setTitle:](v17, "setTitle:", v6);

  -[STSCategoryResult setSuggestion:](v17, "setSuggestion:", v5);
  v7 = objc_alloc_init(MEMORY[0x24BE84F90]);
  objc_msgSend(v5, "fbr");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFbr:", v8);

  v9 = (void *)MEMORY[0x24BE85018];
  objc_msgSend(v5, "suggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v11);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v5, "suggestion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_searchResultIdentifierForSuggestion:recent:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v14);

  objc_msgSend(v7, "setResultBundleId:", CFSTR("com.apple.hashtagimages.categorylist.categories.category"));
  objc_msgSend(v7, "setSectionBundleIdentifier:", CFSTR("com.apple.hashtagimages.categorylist.categories"));
  objc_msgSend(v5, "prediction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = 15;
  else
    v16 = 17;
  objc_msgSend(v7, "setType:", v16);
  -[STSCategoryResult setSearchResult:](v17, "setSearchResult:", v7);
  if (a3 <= 0xF)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v17);
  }

}

- (void)_commitClearRecents
{
  NSMutableArray *v3;
  NSMutableArray *recents;
  id WeakRetained;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  recents = self->_recents;
  self->_recents = v3;

  -[CategoriesDataSource updateModel](self, "updateModel");
  -[CategoriesDataSource sendRankSectionsFeedback](self, "sendRankSectionsFeedback");
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  objc_msgSend(WeakRetained, "sendVisibleResultsFeedback");

}

- (id)_searchResultIdentifierForSuggestion:(id)a3 recent:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const __CFString *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    if (v4)
      v6 = CFSTR("msgscat-recent:%@");
    else
      v6 = CFSTR("msgscat-cat:%@");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)recentQueries
{
  return (id)-[NSMutableArray copy](self->_recents, "copy");
}

- (void)updateRecents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") < 4)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
  }
  else
  {
    objc_msgSend(v4, "subarrayWithRange:", 0, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7 = objc_msgSend(v6, "count");
  if (v7 == -[NSMutableArray count](self->_recents, "count"))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __38__CategoriesDataSource_updateRecents___block_invoke;
    v8[3] = &unk_24E745820;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
    if (!*((_BYTE *)v10 + 24))
      goto LABEL_9;
  }
  else
  {
    *((_BYTE *)v10 + 24) = 1;
  }
  objc_storeStrong((id *)&self->_recents, v6);
  -[CategoriesDataSource updateModel](self, "updateModel");
LABEL_9:
  _Block_object_dispose(&v9, 8);

}

void __38__CategoriesDataSource_updateRecents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v5 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (void)addQueryToRecents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *recents;
  id v10;
  uint64_t v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v15, "length");
  v8 = v15;
  if (v7)
  {
    recents = self->_recents;
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __42__CategoriesDataSource_addQueryToRecents___block_invoke;
    v20 = &unk_24E745848;
    v10 = v15;
    v21 = v10;
    v11 = -[NSMutableArray indexOfObjectPassingTest:](recents, "indexOfObjectPassingTest:", &v17);
    v12 = self->_recents;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray insertObject:atIndex:](v12, "insertObject:atIndex:", v10, 0);
      if ((unint64_t)-[NSMutableArray count](self->_recents, "count") >= 4)
        -[NSMutableArray removeLastObject](self->_recents, "removeLastObject");
    }
    else
    {
      -[NSMutableArray objectAtIndex:](v12, "objectAtIndex:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_recents, "removeObjectAtIndex:", v11);
      -[NSMutableArray insertObject:atIndex:](self->_recents, "insertObject:atIndex:", v13, 0);

    }
    -[CategoriesDataSource updateModel](self, "updateModel", v15, v17, v18, v19, v20);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", self->_recents, CFSTR("STSRecentQueries"));
    objc_msgSend(v14, "synchronize");
    -[CategoriesDataSource updateModel](self, "updateModel");

    v8 = v16;
  }

}

BOOL __42__CategoriesDataSource_addQueryToRecents___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", a2) == 0;
}

- (id)headerTitleForRow:(int64_t)a3
{
  __CFString *v3;

  if (a3 || !-[NSMutableArray count](self->_recents, "count"))
    v3 = CFSTR("CATEGORIES");
  else
    v3 = CFSTR("RECENT");
  STSLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isGroupRow:(int64_t)a3
{
  if (!a3)
    return 1;
  return -[NSMutableArray count](self->_recents, "count") && -[NSMutableArray count](self->_recents, "count") + 1 == a3;
}

- (int64_t)numberOfRows
{
  return -[NSMutableArray count](self->_model, "count");
}

- (id)stringValueForRowAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndex:](self->_model, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didSelectItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[NSMutableArray objectAtIndex:](self->_model, "objectAtIndex:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CategoriesDataSource addQueryToRecents:](self, "addQueryToRecents:", v4);

  objc_msgSend(v13, "searchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didEngageCategoryResult:suggestion:", v7, v8);

  }
  if (objc_msgSend(v13, "type") == 1)
  {
    objc_msgSend(v13, "suggestion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prediction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CategoriesDataSource selectionDelegate](self, "selectionDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryViewController:didSelectCategory:suggested:", self, v12, v10 != 0);
LABEL_7:

    goto LABEL_8;
  }
  if (!objc_msgSend(v13, "type"))
  {
    -[CategoriesDataSource selectionDelegate](self, "selectionDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryViewController:didSelectRecent:", self, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)rowHasClearButton:(int64_t)a3
{
  void *v3;
  char v4;

  -[NSMutableArray objectAtIndex:](self->_model, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "clearButtonHidden") ^ 1;

  return v4;
}

- (void)sendRankSectionsFeedback
{
  id v3;
  id v4;
  NSMutableArray *model;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  model = self->_model;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__CategoriesDataSource_sendRankSectionsFeedback__block_invoke;
  v9[3] = &unk_24E745870;
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v8 = v3;
  -[NSMutableArray enumerateObjectsUsingBlock:](model, "enumerateObjectsUsingBlock:", v9);
  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didLoadCategoryResults:recents:queryId:", v6, v8, -[STSSearchModel categoryListRequestQueryId](self->_searchModel, "categoryListRequestQueryId"));

}

void __48__CategoriesDataSource_sendRankSectionsFeedback__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "type") != 2)
  {
    if (objc_msgSend(v5, "type"))
      v3 = *(void **)(a1 + 40);
    else
      v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "searchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (id)visibleResultsForIndexPaths:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__CategoriesDataSource_visibleResultsForIndexPaths___block_invoke;
  v11[3] = &unk_24E745898;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __52__CategoriesDataSource_visibleResultsForIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectAtIndex:", objc_msgSend(a2, "row"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type") != 2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v5, "searchResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (STSSearchModelUpdateDelegate)updateDelegate
{
  return (STSSearchModelUpdateDelegate *)objc_loadWeakRetained((id *)&self->_updateDelegate);
}

- (void)setUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updateDelegate, a3);
}

- (STSCategorySelectionDelegate)selectionDelegate
{
  return (STSCategorySelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (NSMutableArray)recents
{
  return self->_recents;
}

- (void)setRecents:(id)a3
{
  objc_storeStrong((id *)&self->_recents, a3);
}

- (NSMutableArray)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
  objc_storeStrong((id *)&self->_searchModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_updateDelegate);
}

@end
