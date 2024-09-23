@implementation SKUIGiftContactSearchController

- (void)dealloc
{
  objc_super v3;

  if (self->_searchTaskIdentifier)
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
  -[CNAutocompleteResultsTableViewController setDelegate:](self->_searchResultsViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftContactSearchController;
  -[SKUIGiftContactSearchController dealloc](&v3, sel_dealloc);
}

- (BOOL)cancelSearch
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSNumber *searchTaskIdentifier;
  NSNumber *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftContactSearchController cancelSearch].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  searchTaskIdentifier = self->_searchTaskIdentifier;
  if (searchTaskIdentifier)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:", self->_searchTaskIdentifier);
    v12 = self->_searchTaskIdentifier;
    self->_searchTaskIdentifier = 0;

  }
  return searchTaskIdentifier != 0;
}

- (int64_t)numberOfResults
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftContactSearchController numberOfResults].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return -[NSArray count](self->_results, "count");
}

- (void)resetSearch
{
  -[SKUIGiftContactSearchController cancelSearch](self, "cancelSearch");
  -[SKUIGiftContactSearchController _setResults:](self, "_setResults:", 0);
}

- (void)searchForText:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  NSMutableArray *autocompleteSearchResults;
  CNAutocompleteSearchManager *searchManager;
  uint64_t v16;
  CNAutocompleteSearchManager *v17;
  CNAutocompleteSearchManager *v18;
  NSNumber *v19;
  NSNumber *searchTaskIdentifier;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGiftContactSearchController searchForText:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (!self->_autocompleteSearchResults)
  {
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    autocompleteSearchResults = self->_autocompleteSearchResults;
    self->_autocompleteSearchResults = v13;

  }
  -[SKUIGiftContactSearchController cancelSearch](self, "cancelSearch");
  -[NSMutableArray removeAllObjects](self->_autocompleteSearchResults, "removeAllObjects");
  if (objc_msgSend(v4, "length"))
  {
    searchManager = self->_searchManager;
    if (!searchManager)
    {
      v16 = SKUIContactsAutocompleteUIFramework();
      v17 = (CNAutocompleteSearchManager *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("CNAutocompleteSearchManager"), v16)), "initWithAutocompleteSearchType:", 0);
      v18 = self->_searchManager;
      self->_searchManager = v17;

      -[CNAutocompleteSearchManager setSearchTypes:](self->_searchManager, "setSearchTypes:", 3);
      searchManager = self->_searchManager;
    }
    -[CNAutocompleteSearchManager searchForText:withAutocompleteFetchContext:consumer:](searchManager, "searchForText:withAutocompleteFetchContext:consumer:", v4, 0, self);
    v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    searchTaskIdentifier = self->_searchTaskIdentifier;
    self->_searchTaskIdentifier = v19;

  }
  else
  {
    -[SKUIGiftContactSearchController _finishSearchWithResults:](self, "_finishSearchWithResults:", 0);
  }

}

- (UIView)searchResultsView
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UIView *searchResultsView;
  UIView *v12;
  UIView *v13;
  void *v14;
  void *v15;
  UIView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftContactSearchController searchResultsView].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  searchResultsView = self->_searchResultsView;
  if (!searchResultsView)
  {
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v13 = self->_searchResultsView;
    self->_searchResultsView = v12;

    -[SKUIGiftContactSearchController searchResultsViewController](self, "searchResultsViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = self->_searchResultsView;
    objc_msgSend(v15, "frame");
    -[UIView setFrame:](v16, "setFrame:");
    -[UIView bounds](self->_searchResultsView, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v15, "setAutoresizingMask:", 18);
    objc_msgSend(v15, "setFrame:", v18, v20, v22, v24);
    -[UIView addSubview:](self->_searchResultsView, "addSubview:", v15);

    searchResultsView = self->_searchResultsView;
  }
  return searchResultsView;
}

- (CNAutocompleteResultsTableViewController)searchResultsViewController
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CNAutocompleteResultsTableViewController *searchResultsViewController;
  CNAutocompleteResultsTableViewController *v12;
  CNAutocompleteResultsTableViewController *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftContactSearchController searchResultsViewController].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  searchResultsViewController = self->_searchResultsViewController;
  if (!searchResultsViewController)
  {
    v12 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x1E0D13640]);
    v13 = self->_searchResultsViewController;
    self->_searchResultsViewController = v12;

    -[CNAutocompleteResultsTableViewController setDelegate:](self->_searchResultsViewController, "setDelegate:", self);
    searchResultsViewController = self->_searchResultsViewController;
  }
  return searchResultsViewController;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIGiftContactSearchController consumeAutocompleteSearchResults:taskID:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  if (objc_msgSend(v7, "isEqualToNumber:", self->_searchTaskIdentifier))
    -[NSMutableArray addObjectsFromArray:](self->_autocompleteSearchResults, "addObjectsFromArray:", v6);

}

- (void)finishedSearchingForAutocompleteResults
{
  -[SKUIGiftContactSearchController _finishSearchWithResults:](self, "_finishSearchWithResults:", self->_autocompleteSearchResults);
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  char v19;
  void *v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        -[SKUIGiftContactSearchController autocompleteResultsController:didSelectRecipient:atIndex:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v20, "searchController:didSelectRecipient:", self, v9);
  }
  else
  {
    objc_msgSend(v8, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deselectRowAtIndexPath:animated:", v21, 1);

  }
}

- (void)_finishSearchWithResults:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[SKUIGiftContactSearchController _setResults:](self, "_setResults:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "searchControllerDidFinishSearch:", self);

  }
}

- (void)_setResults:(id)a3
{
  NSArray *v4;
  NSArray *results;
  NSArray *v6;
  void *v7;
  id v8;

  if (self->_results != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    results = self->_results;
    self->_results = v4;

    v6 = self->_results;
    -[SKUIGiftContactSearchController searchResultsViewController](self, "searchResultsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRecipients:", v6);

    -[CNAutocompleteResultsTableViewController tableView](self->_searchResultsViewController, "tableView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (SKUIGiftContactSearchDelegate)delegate
{
  return (SKUIGiftContactSearchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_searchResultsView, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_searchResultsViewController, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autocompleteSearchResults, 0);
}

- (void)cancelSearch
{
  OUTLINED_FUNCTION_1();
}

- (void)numberOfResults
{
  OUTLINED_FUNCTION_1();
}

- (void)searchForText:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)searchResultsView
{
  OUTLINED_FUNCTION_1();
}

- (void)searchResultsViewController
{
  OUTLINED_FUNCTION_1();
}

- (void)consumeAutocompleteSearchResults:(uint64_t)a3 taskID:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)autocompleteResultsController:(uint64_t)a3 didSelectRecipient:(uint64_t)a4 atIndex:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
