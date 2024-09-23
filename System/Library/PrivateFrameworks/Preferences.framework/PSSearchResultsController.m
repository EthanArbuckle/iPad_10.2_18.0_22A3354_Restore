@implementation PSSearchResultsController

- (PSSearchResultsController)init
{
  PSSearchResultsController *v2;
  uint64_t v3;
  NSMutableDictionary *iconViewMap;
  uint64_t v5;
  NSMutableArray *reusableIconViews;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSSearchResultsController;
  v2 = -[PSSearchResultsController init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    iconViewMap = v2->_iconViewMap;
    v2->_iconViewMap = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    reusableIconViews = v2->_reusableIconViews;
    v2->_reusableIconViews = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)loadView
{
  id v3;
  UITableView *v4;
  UITableView *tableView;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  v6 = (void *)objc_opt_new();
  -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", v6);

  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  -[UITableView setLayoutMarginsFollowReadableWidth:](self->_tableView, "setLayoutMarginsFollowReadableWidth:", 0);
  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  +[PSListController appearance](PSListController, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "usesDarkTheme"))
    v8 = 2;
  else
    v8 = 0;
  -[UITableView setIndicatorStyle:](self->_tableView, "setIndicatorStyle:", v8);

  -[PSSearchResultsController setView:](self, "setView:", self->_tableView);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  -[PSSearchResultsController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabBarController");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PSSearchResultsController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSearchResultsController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaLayoutGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutFrame");
    v9 = v8;

    objc_msgSend(v4, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v11 = v9 + CGRectGetHeight(v14);

    -[UITableView setContentInset:](self->_tableView, "setContentInset:", v11, 0.0, v11, 0.0);
    objc_msgSend(v13, "tabBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v11, 0.0, CGRectGetHeight(v15), 0.0);

  }
}

- (void)reloadData
{
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)setSearchResults:(id)a3
{
  PSSearchResults *v5;
  PSSearchResults *v6;

  v5 = (PSSearchResults *)a3;
  if (self->_searchResults != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchResults, a3);
    -[PSSearchResultsController reloadData](self, "reloadData");
    v5 = v6;
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[PSSearchResults numberOfEntriesInSectionAtIndex:](self->_searchResults, "numberOfEntriesInSectionAtIndex:", a4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[PSSearchResults numberOfSectionEntries](self->_searchResults, "numberOfSectionEntries", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  PSSearchResults *searchResults;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;

  searchResults = self->_searchResults;
  v6 = a3;
  -[PSSearchResults entryAtIndexPath:](searchResults, "entryAtIndexPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  objc_msgSend(v8, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc((Class)v8), "initWithStyle:reuseIdentifier:", 3, v9);
  v16 = 0;
  objc_msgSend(v7, "detailTextWithEffectiveTitle:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  objc_msgSend(v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v10, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v11);

  objc_msgSend(v10, "setShouldIndentSeparator:", 1);
  objc_msgSend(v10, "setShouldIndentContent:", 0);

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  PSSearchResults *searchResults;
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  searchResults = self->_searchResults;
  v7 = a4;
  v8 = a3;
  -[PSSearchResults entryAtIndexPath:](searchResults, "entryAtIndexPath:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "searchResultsController:didSelectSearchEntry:", self, v10);

  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 0);
}

- (void)_removeIconViewForSection:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iconViewMap, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableArray addObject:](self->_reusableIconViews, "addObject:", v4);
    objc_msgSend(v4, "removeFromSuperview");
    -[NSMutableDictionary removeObjectForKey:](self->_iconViewMap, "removeObjectForKey:", v5);
  }

}

- (void)_updateIconViews:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  int *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  UITableView *tableView;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double MaxY;
  uint64_t v51;
  double v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  double v56;
  id WeakRetained;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  id v69;
  id obj;
  double v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;
  CGRect v96;
  CGRect v97;

  v95 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSMutableDictionary allKeys](self->_iconViewMap, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v88 != v7)
            objc_enumerationMutation(v4);
          -[PSSearchResultsController _removeIconViewForSection:](self, "_removeIconViewForSection:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
      }
      while (v6);
    }

  }
  -[UITableView contentOffset](self->_tableView, "contentOffset");
  v10 = v9;
  -[UITableView contentInset](self->_tableView, "contentInset");
  v12 = v11;
  -[UITableView indexPathsForVisibleRows](self->_tableView, "indexPathsForVisibleRows");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v84 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * j), "section"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
    }
    while (v17);
  }
  v69 = v15;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v21 = v14;
  v22 = &OBJC_IVAR___PSSearchModel__waitUntilFinished;
  obj = v21;
  v74 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
  if (v74)
  {
    v72 = v10 + v12;
    v73 = *(_QWORD *)v80;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v80 != v73)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v23);
        v25 = objc_msgSend(v24, "unsignedIntegerValue", v69);
        v26 = v22[179];
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v26), "objectForKeyedSubscript:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        tableView = self->_tableView;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableView rectForRowAtIndexPath:](tableView, "rectForRowAtIndexPath:", v29);
        v31 = v30;
        v33 = v32;
        v35 = v34;

        if (v27)
          goto LABEL_23;
        -[PSSearchResults sectionEntryAtIndex:](self->_searchResults, "sectionEntryAtIndex:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "searchResultsController:iconForSearchEntry:", self, v27);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v58)
          goto LABEL_31;
        if (-[NSMutableArray count](self->_reusableIconViews, "count"))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_reusableIconViews, "objectAtIndexedSubscript:", 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray removeObjectAtIndex:](self->_reusableIconViews, "removeObjectAtIndex:", 0);
        }
        else
        {
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v31, v33, 60.0, v35);
          objc_msgSend(v59, "setContentMode:", 4);
        }
        v22 = &OBJC_IVAR___PSSearchModel__waitUntilFinished;
        objc_msgSend(v59, "setImage:", v58);
        -[UITableView addSubview:](self->_tableView, "addSubview:", v59);
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v26), "setObject:forKeyedSubscript:", v59, v24);

        v27 = v59;
        if (v59)
        {
LABEL_23:
          -[UITableView rectForSection:](self->_tableView, "rectForSection:", v25);
          v37 = v36;
          v39 = v38;
          v41 = v40;
          v43 = v42;
          objc_msgSend(v27, "frame");
          v45 = v44;
          v47 = v46;
          v49 = v48;
          v96.origin.x = v37;
          v96.origin.y = v39;
          v96.size.width = v41;
          v96.size.height = v43;
          MaxY = CGRectGetMaxY(v96);
          v97.origin.x = v45;
          v97.origin.y = v47;
          v97.size.width = v49;
          v97.size.height = v35;
          v51 = (uint64_t)(MaxY - CGRectGetHeight(v97));
          v52 = v72;
          if (v72 < v39)
            v52 = v39;
          if (v51 >= (uint64_t)v52)
            v53 = (uint64_t)v52;
          else
            v53 = v51;
          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "userInterfaceLayoutDirection");

          if (v55 == 1)
          {
            -[UITableView frame](self->_tableView, "frame");
            v45 = v56 - v49;
          }
          objc_msgSend(v27, "setFrame:", v45, (double)v53, v49, v35);
LABEL_31:

        }
        ++v23;
      }
      while (v74 != v23);
      v21 = obj;
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
      v74 = v60;
    }
    while (v60);
  }

  v61 = v69;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(Class *)((char *)&self->super.super.super.isa + v22[179]));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "removeObjectsForKeys:", v63);

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v64 = v62;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v76;
      do
      {
        for (k = 0; k != v66; ++k)
        {
          if (*(_QWORD *)v76 != v67)
            objc_enumerationMutation(v64);
          -[PSSearchResultsController _removeIconViewForSection:](self, "_removeIconViewForSection:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k), v69);
        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
      }
      while (v66);
    }

    v21 = obj;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  -[PSSearchResultsController _updateIconViews:](self, "_updateIconViews:", 0);
}

- (void)tableViewDidFinishReload:(id)a3
{
  -[PSSearchResultsController _updateIconViews:](self, "_updateIconViews:", 1);
}

- (PSSearchResults)searchResults
{
  return self->_searchResults;
}

- (PSSearchResultsControllerDelegate)delegate
{
  return (PSSearchResultsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_reusableIconViews, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
