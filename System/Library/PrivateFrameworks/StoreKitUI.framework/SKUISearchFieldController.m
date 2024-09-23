@implementation SKUISearchFieldController

- (SKUISearchFieldController)initWithContentsController:(id)a3 clientContext:(id)a4
{
  id v6;
  SKUISearchFieldController *v7;
  NSOperationQueue *v8;
  NSOperationQueue *operationQueue;
  id v10;
  SKUISearchFieldTableView *v11;
  SKUISearchFieldTableView *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  UITableViewController *searchResultsController;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SKUISearchController *v22;
  SKUISearchController *searchController;
  SKUISearchController *v24;
  SKUISearchController *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  objc_super v34;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISearchFieldController initWithContentsController:clientContext:].cold.1();
  }
  v34.receiver = self;
  v34.super_class = (Class)SKUISearchFieldController;
  v7 = -[SKUISearchFieldController init](&v34, sel_init);
  if (v7)
  {
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v8;

    v10 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_contentsController, v10);

    v11 = [SKUISearchFieldTableView alloc];
    v12 = -[SKUISearchFieldTableView initWithFrame:style:](v11, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SKUISearchFieldTableView setTrendingSearchDelegate:](v12, "setTrendingSearchDelegate:", v7);
    objc_msgSend(v6, "trendingSearchProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISearchFieldTableView setTrendingSearchProvider:](v12, "setTrendingSearchProvider:", v13);

    v14 = -[SKUISearchFieldController _presentsInPopover:](v7, "_presentsInPopover:", v6);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D60]), "initWithStyle:", 0);
    searchResultsController = v7->_searchResultsController;
    v7->_searchResultsController = (UITableViewController *)v15;

    -[UITableViewController setTableView:](v7->_searchResultsController, "setTableView:", v12);
    -[UITableViewController tableView](v7->_searchResultsController, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDataSource:", v7);

    -[UITableViewController tableView](v7->_searchResultsController, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v7);

    -[UITableViewController tableView](v7->_searchResultsController, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v20);

    if (v14)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7->_searchResultsController);
      v22 = -[SKUISearchController initWithSearchResultsController:]([SKUISearchController alloc], "initWithSearchResultsController:", v21);
      searchController = v7->_searchController;
      v7->_searchController = v22;

    }
    else
    {
      v24 = -[SKUISearchController initWithSearchResultsController:]([SKUISearchController alloc], "initWithSearchResultsController:", v7->_searchResultsController);
      v25 = v7->_searchController;
      v7->_searchController = v24;

      -[UITableViewController setAutomaticallyAdjustsScrollViewInsets:](v7->_searchResultsController, "setAutomaticallyAdjustsScrollViewInsets:", 0);
      -[UITableViewController tableView](v7->_searchResultsController, "tableView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setContentInsetAdjustmentBehavior:", 101);
    }

    -[SKUISearchController setHidesNavigationBarDuringPresentation:](v7->_searchController, "setHidesNavigationBarDuringPresentation:", 0);
    -[SKUISearchController setDelegate:](v7->_searchController, "setDelegate:", v7);
    -[SKUISearchController setSearchResultsUpdater:](v7->_searchController, "setSearchResultsUpdater:", v7);
    -[SKUISearchController searchBar](v7->_searchController, "searchBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDrawsBackground:", 0);
    objc_msgSend(v26, "setAutocapitalizationType:", 0);
    objc_msgSend(v26, "setAutocorrectionType:", 1);
    objc_msgSend(v26, "setDelegate:", v7);
    objc_msgSend(v26, "setSearchBarStyle:", 2);
    v27 = objc_loadWeakRetained(&location);
    objc_msgSend(v27, "navigationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "navigationBar");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "barStyle");

    if (v30 == 1)
    {
      objc_msgSend(v26, "searchField");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTextColor:", v32);

    }
    if (v6)
      -[SKUISearchFieldController setClientContext:](v7, "setClientContext:", v6);

  }
  objc_destroyWeak(&location);
  return v7;
}

- (SKUISearchFieldController)initWithContentsController:(id)a3
{
  id v4;
  SKUISearchFieldController *v5;

  v4 = a3;
  v5 = -[SKUISearchFieldController initWithContentsController:clientContext:](self, "initWithContentsController:clientContext:", v4, 0);

  return v5;
}

- (BOOL)displaysSearchBarInNavigationBar
{
  return -[SKUISearchController hidesNavigationBarDuringPresentation](self->_searchController, "hidesNavigationBarDuringPresentation") ^ 1;
}

- (BOOL)canBecomeActive
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((-[SKUISearchController isActive](self->_searchController, "isActive") & 1) != 0)
    return 0;
  -[SKUISearchController searchBar](self->_searchController, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (void)becomeActive
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[SKUISearchController transitionCoordinator](self->_searchController, "transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__SKUISearchFieldController_becomeActive__block_invoke;
    v6[3] = &unk_1E739FF90;
    v6[4] = self;
    objc_msgSend(v3, "animateAlongsideTransition:completion:", 0, v6);
  }
  else
  {
    -[SKUISearchController searchBar](self->_searchController, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

  }
}

void __41__SKUISearchFieldController_becomeActive__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "searchBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)resignActive:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  if (-[SKUISearchController isActive](self->_searchController, "isActive"))
  {
    if (v3)
    {
      -[SKUISearchController setActive:](self->_searchController, "setActive:", 0);
    }
    else
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __42__SKUISearchFieldController_resignActive___block_invoke;
      v5[3] = &unk_1E739FD38;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
    }
  }
}

uint64_t __42__SKUISearchFieldController_resignActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setActive:", 0);
}

- (UISearchBar)searchBar
{
  return (UISearchBar *)-[SKUISearchController searchBar](self->_searchController, "searchBar");
}

- (void)setDisplaysSearchBarInNavigationBar:(BOOL)a3
{
  -[SKUISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", !a3);
}

- (void)setNumberOfSearchResults:(int64_t)a3
{
  SKUIClientContext *clientContext;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_numberOfSearchResults != a3)
  {
    self->_numberOfSearchResults = a3;
    if (a3)
    {
      clientContext = self->_clientContext;
      if (a3 == 1)
        v5 = CFSTR("SEARCH_FIELD_ONE_RESULT");
      else
        v5 = CFSTR("SEARCH_FIELD_PLURAL_RESULTS");
      if (clientContext)
        -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", v5);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numberOfSearchResults);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[SKUISearchController _setSuffix:](self->_searchController, "_setSuffix:", v9);
    }
    else
    {
      v9 = 0;
      -[SKUISearchController _setSuffix:](self->_searchController, "_setSuffix:", 0);
    }

  }
}

- (void)setClientContext:(id)a3
{
  UITableViewController *searchResultsController;
  SKUIClientContext *clientContext;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_clientContext, a3);
  searchResultsController = self->_searchResultsController;
  clientContext = self->_clientContext;
  if (clientContext)
    -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SEARCH_SUGGESTIONS"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SEARCH_SUGGESTIONS"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController setTitle:](searchResultsController, "setTitle:", v7);

  -[SKUISearchFieldController _reloadTrendingVisibility](self, "_reloadTrendingVisibility");
}

- (void)setSearchBarAccessoryText:(id)a3
{
  NSString *v4;
  NSString *searchBarAccessoryText;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_searchBarAccessoryText) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    searchBarAccessoryText = self->_searchBarAccessoryText;
    self->_searchBarAccessoryText = v4;

    -[SKUISearchController _setSuffix:](self->_searchController, "_setSuffix:", self->_searchBarAccessoryText);
  }

}

- (void)setSearchTerm:(id)a3
{
  SKUISearchController *searchController;
  id v5;
  void *v6;
  void *v7;

  searchController = self->_searchController;
  v5 = a3;
  -[SKUISearchController searchBar](searchController, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  -[SKUISearchFieldController _reloadTrendingVisibility](self, "_reloadTrendingVisibility");
}

- (void)setShowsResultsForEmptyField:(BOOL)a3
{
  -[SKUISearchController _setShowResultsForEmptySearch:](self->_searchController, "_setShowResultsForEmptySearch:", a3);
}

- (void)setDelegate:(id)a3
{
  SKUISearchFieldDelegate **p_delegate;
  id v5;
  char v6;
  char v7;
  char v8;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFD | v6;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFB | v8;
}

- (BOOL)showsResultsForEmptyField
{
  return -[SKUISearchController _showResultsForEmptySearch](self->_searchController, "_showResultsForEmptySearch");
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  void *v5;
  SKUISearchRequest *v6;

  v4 = a3;
  v6 = objc_alloc_init(SKUISearchRequest);
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchRequest setTerm:](v6, "setTerm:", v5);

  -[SKUISearchFieldController _loadResultsForSearchRequest:](self, "_loadResultsForSearchRequest:", v6);
  objc_msgSend(v4, "resignFirstResponder");

  -[SKUISearchController setActive:](self->_searchController, "setActive:", 0);
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  char v4;
  id WeakRetained;
  void *v6;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = objc_msgSend(WeakRetained, "searchFieldControllerShouldBeginEditing:", self);

  }
  else
  {
    v4 = 1;
  }
  -[UITableViewController tableView](self->_searchResultsController, "tableView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchFieldController _adjustInsetsForResultsTableView:](self, "_adjustInsetsForResultsTableView:", v6);

  return v4;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  SKUISearchFieldDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 2) != 0)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "searchFieldController:searchBarDidChangeText:", self, v6);

  }
}

- (BOOL)searchBarShouldClear:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isFirstResponder") & 1) != 0
    || -[SKUISearchFieldController _presentsInPopover:](self, "_presentsInPopover:", self->_clientContext))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "setText:", 0);
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUISearchFieldController searchBar:textDidChange:](self, "searchBar:textDidChange:", v4, v6);

    -[SKUISearchFieldController becomeActive](self, "becomeActive");
    v5 = 0;
  }

  return v5;
}

- (void)willPresentSearchController:(id)a3
{
  void *v4;

  -[UITableViewController tableView](self->_searchResultsController, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchFieldController _adjustInsetsForResultsTableView:](self, "_adjustInsetsForResultsTableView:", v4);

  -[SKUISearchFieldController _reloadData](self, "_reloadData");
}

- (void)presentSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  if (-[SKUISearchFieldController _presentsInPopover:](self, "_presentsInPopover:", self->_clientContext))
  {
    objc_msgSend(v4, "setModalPresentationStyle:", 7);
    objc_msgSend(v4, "popoverPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

  }
  -[SKUISearchFieldController contentsController](self, "contentsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefinesPresentationContext:", 1);

  -[SKUISearchFieldController contentsController](self, "contentsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SKUISearchFieldController_presentSearchController___block_invoke;
  v8[3] = &unk_1E739FD38;
  v8[4] = self;
  objc_msgSend(v7, "presentViewController:animated:completion:", v4, 1, v8);

}

void __53__SKUISearchFieldController_presentSearchController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "autoresizingMask");

    if ((v4 & 2) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "superview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
}

- (void)willDismissSearchController:(id)a3
{
  id v3;

  -[SKUISearchFieldController contentsController](self, "contentsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefinesPresentationContext:", 0);

}

- (void)searchControllerWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__SKUISearchFieldController_searchControllerWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E739FF90;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v4);
}

void __92__SKUISearchFieldController_searchControllerWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[4], "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_adjustInsetsForResultsTableView:", v2);

}

- (id)searchControllerClientContext:(id)a3
{
  return self->_clientContext;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setPermittedArrowDirections:", 1);
  -[SKUISearchController searchBar](self->_searchController, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceView:", v5);

  -[SKUISearchController searchBar](self->_searchController, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v4, "setSourceRect:");

  -[SKUISearchController searchBar](self->_searchController, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPassthroughViews:", v8);

}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v3;

  -[SKUISearchFieldController contentsController](self, "contentsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefinesPresentationContext:", 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("a"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("a"));
  -[SKUICompletionList completions](self->_completionList, "completions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alternateTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v10, "alternateTitle");
  else
    objc_msgSend(v10, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v13);

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[SKUICompletionList completions](self->_completionList, "completions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SKUISearchRequest *v22;

  v5 = a4;
  v22 = objc_alloc_init(SKUISearchRequest);
  -[SKUISearchController searchBar](self->_searchController, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchRequest setSearchHintOriginalTerm:](v22, "setSearchHintOriginalTerm:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchRequest setSearchHintIndex:](v22, "setSearchHintIndex:", v8);

  -[SKUICompletionList completions](self->_completionList, "completions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchRequest setTerm:](v22, "setTerm:", v12);
  v13 = objc_alloc(MEMORY[0x1E0C99E98]);
  objc_msgSend(v11, "URLString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:", v14);

  -[SKUISearchRequest setURL:](v22, "setURL:", v15);
  objc_msgSend(v11, "alternateTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchController searchBar](self->_searchController, "searchBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16)
    v20 = v16;
  else
    v20 = v12;
  objc_msgSend(v18, "setText:", v20);

  -[SKUISearchFieldController _loadResultsForSearchRequest:](self, "_loadResultsForSearchRequest:", v22);
  -[SKUISearchController searchBar](self->_searchController, "searchBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resignFirstResponder");

  -[SKUISearchController setActive:](self->_searchController, "setActive:", 0);
}

- (void)trendingSearchPageView:(id)a3 didSelectSearch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SKUISearchRequest *v12;

  v5 = a4;
  v12 = objc_alloc_init(SKUISearchRequest);
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "URLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchRequest setURL:](v12, "setURL:", v8);

  objc_msgSend(v5, "term");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUISearchRequest setTerm:](v12, "setTerm:", v9);
  -[SKUISearchController searchBar](self->_searchController, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);

  -[SKUISearchFieldController _loadResultsForSearchRequest:](self, "_loadResultsForSearchRequest:", v12);
  -[SKUISearchController setActive:](self->_searchController, "setActive:", 0);

}

- (id)URLForTrendingSearchPageView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[SKUISearchFieldController trendingSearchURLString](self, "trendingSearchURLString", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_presentsInPopover:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  int v7;

  v3 = a3;
  if (SKUIUserInterfaceIdiom(v3) == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    if (v6 <= SKUICompactThreshold())
      LOBYTE(v7) = 0;
    else
      v7 = objc_msgSend(v3, "shouldForceTransientSearchControllerBahavior") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_adjustInsetsForResultsTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;

  v25 = a3;
  -[SKUISearchFieldController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SKUIUserInterfaceIdiom(v4) == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    if (v7 > SKUICompactThreshold())
    {
      v8 = -[SKUIClientContext shouldForceTransientSearchControllerBahavior](self->_clientContext, "shouldForceTransientSearchControllerBahavior");

      if (!v8)
        goto LABEL_9;
      goto LABEL_7;
    }

  }
LABEL_7:
  objc_msgSend(v25, "contentInset");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v25, "contentOffset");
  v18 = v17;
  v20 = v19;
  -[SKUISearchFieldController contentsController](self, "contentsController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "length");
  v24 = v23;

  if (v24 != v10)
  {
    objc_msgSend(v25, "setContentInset:", v24, v12, v14, v16);
    objc_msgSend(v25, "setScrollIndicatorInsets:", v24, v12, v14, v16);
    objc_msgSend(v25, "setContentOffset:", v18, v20 - (v24 - v10));
  }
LABEL_9:

}

- (void)_loadResultsForSearchRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  -[SKUISearchFieldController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    objc_msgSend(v4, "searchFieldController:requestSearch:", self, v12);
  }
  else
  {
    objc_msgSend(v12, "term");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v6 || v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        v11 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v11, "searchFieldController:requestSearchWithURL:metricsEvent:", self, v8, 0);

      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "searchFieldController:requestSearchWithSearchTerm:metricsEvent:", self, v6, 0);
    }

  }
}

- (void)_reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SSVLoadURLOperation *v10;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v12;
  void *v13;
  SSVLoadURLOperation *v14;
  void *v15;
  SSVLoadURLOperation *v16;
  SKUICompletionList *completionList;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  -[SKUISearchController searchBar](self->_searchController, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    -[SKUISearchFieldController searchHintsURLString](self, "searchHintsURLString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_initWeak(&location, self);
      -[SKUIClientContext URLBag](self->_clientContext, "URLBag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __40__SKUISearchFieldController__reloadData__block_invoke;
      v21[3] = &unk_1E73A3C50;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v18, "loadValueForKey:completionBlock:", CFSTR("searchHints"), v21);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
      goto LABEL_7;
    }
    -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
    -[SSVLoadURLOperation cancel](self->_loadOperation, "cancel");
    v6 = (void *)MEMORY[0x1E0C99E98];
    -[SKUISearchFieldController searchHintsURLString](self, "searchHintsURLString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingQueryParameter:value:", CFSTR("term"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v9);
    loadOperation = self->_loadOperation;
    self->_loadOperation = v10;

    v12 = self->_loadOperation;
    +[SSVURLDataConsumer consumer](SKUICompletionDataConsumer, "consumer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setDataConsumer:](v12, "setDataConsumer:", v13);

    v14 = self->_loadOperation;
    -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setStoreFrontSuffix:](v14, "setStoreFrontSuffix:", v15);

    objc_initWeak(&location, self);
    v16 = self->_loadOperation;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __40__SKUISearchFieldController__reloadData__block_invoke_3;
    v19[3] = &unk_1E73A7330;
    objc_copyWeak(&v20, &location);
    -[SSVLoadURLOperation setOutputBlock:](v16, "setOutputBlock:", v19);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->_loadOperation);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SKUISearchFieldController _setResponse:error:](self, "_setResponse:error:", 0, 0);
    -[SKUISearchFieldController _loadResultsForSearchRequest:](self, "_loadResultsForSearchRequest:", 0);
    completionList = self->_completionList;
    self->_completionList = 0;

    -[UITableViewController tableView](self->_searchResultsController, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");
  }

LABEL_7:
  -[SKUISearchFieldController _reloadTrendingVisibility](self, "_reloadTrendingVisibility");

}

void __40__SKUISearchFieldController__reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__SKUISearchFieldController__reloadData__block_invoke_2;
    v4[3] = &unk_1E73A3138;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v6);
  }

}

void __40__SKUISearchFieldController__reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setSearchHintsURLString:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_reloadData");
    WeakRetained = v3;
  }

}

void __40__SKUISearchFieldController__reloadData__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SKUISearchFieldController__reloadData__block_invoke_4;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __40__SKUISearchFieldController__reloadData__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_reloadTrendingVisibility
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  BOOL v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    if (v6 <= SKUICompactThreshold())
    {

    }
    else
    {
      v7 = -[SKUIClientContext shouldForceTransientSearchControllerBahavior](self->_clientContext, "shouldForceTransientSearchControllerBahavior");

      if (v7)
        return;
      -[UITableViewController tableView](self->_searchResultsController, "tableView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[SKUIClientContext trendingSearchProvider](self->_clientContext, "trendingSearchProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTrendingSearchProvider:", v8);

      v9 = -[SKUISearchController isActive](self->_searchController, "isActive");
      -[SKUISearchController searchBar](self->_searchController, "searchBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
        v13 = 0;
      else
        v13 = v9;
      objc_msgSend(v14, "setTrendingSearchesVisible:", v13);
    }

  }
}

- (void)_setResponse:(id)a3 error:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (v12)
  {
    -[SKUISearchController searchBar](self->_searchController, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      objc_storeStrong((id *)&self->_completionList, a3);
      -[UITableViewController tableView](self->_searchResultsController, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadData");

    }
  }

}

- (UIViewController)contentsController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_contentsController);
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SKUISearchFieldDelegate)delegate
{
  return (SKUISearchFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)searchBarAccessoryText
{
  return self->_searchBarAccessoryText;
}

- (NSString)searchHintsURLString
{
  return self->_searchHintsURLString;
}

- (void)setSearchHintsURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)trendingSearchURLString
{
  return self->_trendingSearchURLString;
}

- (void)setTrendingSearchURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)numberOfSearchResults
{
  return self->_numberOfSearchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchURLString, 0);
  objc_storeStrong((id *)&self->_searchHintsURLString, 0);
  objc_storeStrong((id *)&self->_searchBarAccessoryText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_contentsController);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_completionList, 0);
}

- (void)initWithContentsController:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISearchFieldController initWithContentsController:clientContext:]";
}

@end
