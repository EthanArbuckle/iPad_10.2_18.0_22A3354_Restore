@implementation SKUISearchBarController

- (SKUISearchBarController)initWithSearchBarViewElement:(id)a3
{
  id v5;
  SKUISearchBarController *v6;
  SKUISearchBarController *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISearchBarController initWithSearchBarViewElement:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUISearchBarController;
  v6 = -[SKUISearchBarController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewElement, a3);
    -[SKUISearchBarViewElement searchHintsURLString](v7->_viewElement, "searchHintsURLString");
    v8 = objc_claimAutoreleasedReturnValue();
    -[SKUISearchBarViewElement trendingSearchURLString](v7->_viewElement, "trendingSearchURLString");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 | v9)
      v7->_usesSearchFieldController = 1;

  }
  return v7;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = 48;
  if (!self->_usesSearchFieldController)
    v3 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), "setDelegate:", 0);
  -[SKUIFocusedTouchGestureRecognizer removeTarget:action:](self->_cancelTouchGestureRecognizer, "removeTarget:action:", self, 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUISearchBarController;
  -[SKUISearchBarController dealloc](&v4, sel_dealloc);
}

- (void)reloadAfterDocumentUpdate
{
  id v3;

  if (self->_searchFieldController)
  {
    -[SKUISearchBarController _customizeSearchFieldController:](self, "_customizeSearchFieldController:");
    -[SKUISearchFieldController searchBar](self->_searchFieldController, "searchBar");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUISearchBarController _customizeSearchBar:](self, "_customizeSearchBar:", v3);

  }
}

- (BOOL)canBecomeActive
{
  return -[SKUISearchFieldController canBecomeActive](self->_searchFieldController, "canBecomeActive");
}

- (void)becomeActive
{
  -[SKUISearchFieldController becomeActive](self->_searchFieldController, "becomeActive");
}

- (void)resignActive:(BOOL)a3
{
  -[SKUISearchFieldController resignActive:](self->_searchFieldController, "resignActive:", a3);
}

- (UISearchBar)searchBar
{
  id v3;
  UISearchBar *v4;
  UISearchBar *searchBar;
  UISearchBar *v6;
  UISearchBar *v7;

  if (!self->_searchBar)
  {
    if (self->_usesSearchFieldController)
    {
      -[SKUISearchBarController _searchFieldController](self, "_searchFieldController");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "searchBar");
      v4 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
      searchBar = self->_searchBar;
      self->_searchBar = v4;

    }
    else
    {
      v3 = -[SKUISearchBarController _newSearchFieldController](self, "_newSearchFieldController");
      objc_msgSend(v3, "searchBar");
      v6 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
      v7 = self->_searchBar;
      self->_searchBar = v6;

      -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
    }

  }
  return self->_searchBar;
}

- (void)setDisplaysSearchBarInNavigationBar:(BOOL)a3
{
  if (self->_displaysSearchBarInNavigationBar != a3)
  {
    self->_displaysSearchBarInNavigationBar = a3;
    -[SKUISearchFieldController setDisplaysSearchBarInNavigationBar:](self->_searchFieldController, "setDisplaysSearchBarInNavigationBar:");
  }
}

- (void)setSearchBarViewElement:(id)a3
{
  SKUISearchBarViewElement *v5;
  SKUISearchBarViewElement *v6;

  v5 = (SKUISearchBarViewElement *)a3;
  if (self->_viewElement != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewElement, a3);
    -[SKUISearchBarController reloadAfterDocumentUpdate](self, "reloadAfterDocumentUpdate");
    v5 = v6;
  }

}

- (void)searchFieldController:(id)a3 requestSearch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "term");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKUIIPadSearchController setLastSearchTerm:](SKUIIPadSearchController, "setLastSearchTerm:", v6);

  objc_msgSend(v5, "term");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchHintOriginalTerm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchHintIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKUISearchBarController _dispatchSubmitEventWithText:URL:searchHintOriginalTerm:searchHintIndex:](self, "_dispatchSubmitEventWithText:URL:searchHintOriginalTerm:searchHintIndex:", v10, v7, v8, v9);
}

- (void)searchFieldController:(id)a3 searchBarDidChangeText:(id)a4
{
  id v5;

  v5 = a4;
  +[SKUIIPadSearchController setLastSearchTerm:](SKUIIPadSearchController, "setLastSearchTerm:", v5);
  -[SKUISearchBarController _dispatchChangeEventWithText:](self, "_dispatchChangeEventWithText:", v5);

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  SKUIFocusedTouchGestureRecognizer *cancelTouchGestureRecognizer;
  void *v5;
  SKUIFocusedTouchGestureRecognizer *v6;
  SKUIFocusedTouchGestureRecognizer *v7;
  SKUIFocusedTouchGestureRecognizer *v8;
  SKUIFocusedTouchGestureRecognizer *v9;
  void *v10;
  id v11;

  v11 = a3;
  cancelTouchGestureRecognizer = self->_cancelTouchGestureRecognizer;
  if (cancelTouchGestureRecognizer)
  {
    -[SKUIFocusedTouchGestureRecognizer removeTarget:action:](cancelTouchGestureRecognizer, "removeTarget:action:", self, 0);
    -[SKUIFocusedTouchGestureRecognizer view](self->_cancelTouchGestureRecognizer, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", self->_cancelTouchGestureRecognizer);

    v6 = self->_cancelTouchGestureRecognizer;
    self->_cancelTouchGestureRecognizer = 0;

  }
  v7 = [SKUIFocusedTouchGestureRecognizer alloc];
  v8 = -[SKUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:](v7, "initWithFocusedView:touchAllowance:", v11, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v9 = self->_cancelTouchGestureRecognizer;
  self->_cancelTouchGestureRecognizer = v8;

  -[SKUIFocusedTouchGestureRecognizer addTarget:action:](self->_cancelTouchGestureRecognizer, "addTarget:action:", self, sel__cancelGestureAction_);
  objc_msgSend(v11, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addGestureRecognizer:", self->_cancelTouchGestureRecognizer);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[SKUISearchBarController _dispatchChangeEventWithText:](self, "_dispatchChangeEventWithText:", a4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "resignFirstResponder");
  objc_msgSend(v4, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUISearchBarController _dispatchSubmitEventWithText:URL:searchHintOriginalTerm:searchHintIndex:](self, "_dispatchSubmitEventWithText:URL:searchHintOriginalTerm:searchHintIndex:", v5, 0, 0, 0);
}

- (void)_cancelGestureAction:(id)a3
{
  if (self->_cancelTouchGestureRecognizer == a3)
  {
    -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
    -[SKUISearchBarController _removeCancelTouchGestureRecognizer](self, "_removeCancelTouchGestureRecognizer");
  }
}

- (void)_customizeSearchBar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchBarViewElement style](self->_viewElement, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "setTextColor:", v6);
  if ((objc_msgSend(v10, "isFirstResponder") & 1) == 0)
  {
    -[SKUISearchBarViewElement defaultText](self->_viewElement, "defaultText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v8);

  }
  -[SKUISearchBarViewElement placeholderString](self->_viewElement, "placeholderString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v9);

}

- (void)_customizeSearchFieldController:(id)a3
{
  SKUISearchBarViewElement *viewElement;
  id v5;
  void *v6;
  void *v7;
  id v8;

  viewElement = self->_viewElement;
  v5 = a3;
  -[SKUISearchBarViewElement accessoryText](viewElement, "accessoryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchBarAccessoryText:", v6);

  -[SKUISearchBarViewElement searchHintsURLString](self->_viewElement, "searchHintsURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchHintsURLString:", v7);

  -[SKUISearchBarViewElement trendingSearchURLString](self->_viewElement, "trendingSearchURLString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrendingSearchURLString:", v8);

}

- (void)_dispatchChangeEventWithText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0C99D80];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithObjectsAndKeys:", v5, CFSTR("term"), 0);

  -[SKUISearchBarViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v6, 0);
}

- (void)_dispatchSubmitEventWithText:(id)a3 URL:(id)a4 searchHintOriginalTerm:(id)a5 searchHintIndex:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = v13;
  if (v16)
    objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("term"));
  if (v10)
  {
    objc_msgSend(v10, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("url"));

  }
  if (v11)
    objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("searchHintOriginalTerm"));
  if (v12)
    objc_msgSend(v14, "setObject:forKey:", v12, CFSTR("searchHintIndex"));
  if (objc_msgSend(v14, "count"))
    -[SKUISearchBarViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 14, 1, 1, v14, 0);

}

- (id)_newSearchFieldController
{
  SKUISearchFieldController *v3;
  id WeakRetained;
  SKUISearchFieldController *v5;
  void *v6;

  v3 = [SKUISearchFieldController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  v5 = -[SKUISearchFieldController initWithContentsController:clientContext:](v3, "initWithContentsController:clientContext:", WeakRetained, self->_clientContext);

  -[SKUISearchBarController _customizeSearchFieldController:](self, "_customizeSearchFieldController:", v5);
  if (self->_displaysSearchBarInNavigationBar)
    -[SKUISearchFieldController setDisplaysSearchBarInNavigationBar:](v5, "setDisplaysSearchBarInNavigationBar:", 1);
  if (self->_showsResultsForEmptyField)
    -[SKUISearchFieldController setShowsResultsForEmptyField:](v5, "setShowsResultsForEmptyField:", 1);
  -[SKUISearchFieldController searchBar](v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISearchBarController _customizeSearchBar:](self, "_customizeSearchBar:", v6);

  return v5;
}

- (void)_removeCancelTouchGestureRecognizer
{
  void *v3;
  SKUIFocusedTouchGestureRecognizer *cancelTouchGestureRecognizer;

  -[SKUIFocusedTouchGestureRecognizer removeTarget:action:](self->_cancelTouchGestureRecognizer, "removeTarget:action:", self, 0);
  -[SKUIFocusedTouchGestureRecognizer view](self->_cancelTouchGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_cancelTouchGestureRecognizer);

  cancelTouchGestureRecognizer = self->_cancelTouchGestureRecognizer;
  self->_cancelTouchGestureRecognizer = 0;

}

- (id)_searchFieldController
{
  SKUISearchFieldController *searchFieldController;
  SKUISearchFieldController *v4;
  SKUISearchFieldController *v5;

  searchFieldController = self->_searchFieldController;
  if (!searchFieldController)
  {
    v4 = -[SKUISearchBarController _newSearchFieldController](self, "_newSearchFieldController");
    v5 = self->_searchFieldController;
    self->_searchFieldController = v4;

    -[SKUISearchFieldController setDelegate:](self->_searchFieldController, "setDelegate:", self);
    searchFieldController = self->_searchFieldController;
  }
  return searchFieldController;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (BOOL)displaysSearchBarInNavigationBar
{
  return self->_displaysSearchBarInNavigationBar;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (SKUISearchBarViewElement)searchBarViewElement
{
  return self->_viewElement;
}

- (BOOL)showsResultsForEmptyField
{
  return self->_showsResultsForEmptyField;
}

- (void)setShowsResultsForEmptyField:(BOOL)a3
{
  self->_showsResultsForEmptyField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_searchFieldController, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_cancelTouchGestureRecognizer, 0);
}

- (void)initWithSearchBarViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISearchBarController initWithSearchBarViewElement:]";
}

@end
