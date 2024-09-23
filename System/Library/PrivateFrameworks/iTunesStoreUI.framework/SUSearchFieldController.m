@implementation SUSearchFieldController

- (SUSearchFieldController)init
{
  return -[SUSearchFieldController initWithContentsController:](self, "initWithContentsController:", 0);
}

- (SUSearchFieldController)initWithContentsController:(id)a3
{
  return -[SUSearchFieldController initWithContentsController:clientInterface:](self, "initWithContentsController:clientInterface:", a3, +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"));
}

- (SUSearchFieldController)initWithContentsController:(id)a3 style:(int64_t)a4
{
  return -[SUSearchFieldController initWithContentsController:clientInterface:style:](self, "initWithContentsController:clientInterface:style:", a3, +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface"), a4);
}

- (SUSearchFieldController)initWithContentsController:(id)a3 clientInterface:(id)a4
{
  return -[SUSearchFieldController initWithContentsController:clientInterface:style:](self, "initWithContentsController:clientInterface:style:", a3, a4, 0);
}

- (SUSearchFieldController)initWithContentsController:(id)a3 clientInterface:(id)a4 style:(int64_t)a5
{
  SUSearchFieldController *v8;
  SUScriptTextFieldDelegate *v9;
  SUSearchDisplayController *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUSearchFieldController;
  v8 = -[SUSearchFieldController init](&v12, sel_init);
  if (v8)
  {
    v8->_clientInterface = (SUClientInterface *)a4;
    v8->_searchFieldStyle = a5;
    v9 = objc_alloc_init(SUScriptTextFieldDelegate);
    v8->_textFieldDelegate = v9;
    -[SUScriptTextFieldDelegate addDelegate:](v9, "addDelegate:", v8);
    v10 = -[SUSearchFieldController _newSearchDisplayControllerWithContentsController:](v8, "_newSearchDisplayControllerWithContentsController:", a3);
    v8->_searchController = v10;
    -[UISearchDisplayController setDelegate:](v10, "setDelegate:", v8);
    -[UISearchDisplayController setSearchResultsDataSource:](v8->_searchController, "setSearchResultsDataSource:", v8);
    -[UISearchDisplayController setSearchResultsDelegate:](v8->_searchController, "setSearchResultsDelegate:", v8);
    -[UISearchDisplayController setSearchResultsTitle:](v8->_searchController, "setSearchResultsTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SEARCH_SUGGESTIONS"), &stru_24DE83F60, 0));
    -[UISearchBar setDrawsBackground:](-[SUSearchFieldController searchBar](v8, "searchBar"), "setDrawsBackground:", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v8, sel__savedSearchTermChangedNotification_, CFSTR("SUSearchFieldControllerSavedSearchTermNotification"), 0);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SUSearchFieldControllerSavedSearchTermNotification"), 0);
  -[SUSearchFieldController _tearDownDimmerView](self, "_tearDownDimmerView");

  -[SUScriptTextFieldDelegate removeDelegate:](self->_textFieldDelegate, "removeDelegate:", self);
  if (!-[SUScriptTextFieldDelegate numberOfDelegates](self->_textFieldDelegate, "numberOfDelegates")
    && -[UISearchBar delegate](self->_searchBar, "delegate") == self->_textFieldDelegate)
  {
    -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", 0);
  }

  -[UISearchDisplayController setDelegate:](self->_searchController, "setDelegate:", 0);
  -[UISearchDisplayController setSearchResultsDataSource:](self->_searchController, "setSearchResultsDataSource:", 0);
  -[UISearchDisplayController setSearchResultsDelegate:](self->_searchController, "setSearchResultsDelegate:", 0);

  -[ISStoreURLOperation setDelegate:](self->_completionsOperation, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUSearchFieldController;
  -[SUSearchFieldController dealloc](&v3, sel_dealloc);
}

- (void)handleSearchURL:(id)a3 withSourceApplication:(id)a4 sourceURL:(id)a5
{
  id v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  SUSearchFieldController *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v7 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend(a3, "copyQueryStringDictionaryWithUnescapedValues:", 1);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v19 = v7;
    v20 = a4;
    v21 = self;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("term"), v19)
          || objc_msgSend(v16, "rangeOfString:options:", CFSTR("term"), 13) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = objc_msgSend(v9, "objectForKey:", v16);
        }
        else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("kind")) & 1) != 0
               || objc_msgSend(v16, "isEqualToString:", CFSTR("entity")))
        {
          v13 = objc_msgSend(v9, "objectForKey:", v16);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
    if (v12)
    {
      self = v21;
      -[SUSearchDisplayController _noEventSetSearchFieldText:](v21->_searchController, "_noEventSetSearchFieldText:", v12);
      v7 = v19;
      a4 = v20;
      if (!objc_msgSend(v19, "host"))
      {
        v17 = -[SUSearchFieldController newRequestPropertiesWithSearchTerm:kind:](v21, "newRequestPropertiesWithSearchTerm:kind:", v12, v13);
        goto LABEL_21;
      }
    }
    else
    {
      v7 = v19;
      a4 = v20;
      self = v21;
      if (!objc_msgSend(v19, "host"))
        goto LABEL_23;
    }
  }
  else if (!objc_msgSend(v7, "host"))
  {
    goto LABEL_23;
  }
  v17 = -[SUSearchFieldConfiguration URLRequestPropertiesWithBaseURL:forNetworkType:](self->_configuration, "URLRequestPropertiesWithBaseURL:forNetworkType:", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "networkType"));
LABEL_21:
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "setValue:forHTTPHeaderField:", a5, CFSTR("referer"));
    objc_msgSend(v18, "setValue:forHTTPHeaderField:", a4, CFSTR("ref-user-agent"));
    -[SUSearchFieldController _fetchResultsForURLRequestProperties:](self, "_fetchResultsForURLRequestProperties:", v18);
  }
LABEL_23:

}

- (BOOL)isActive
{
  return -[UISearchDisplayController isActive](self->_searchController, "isActive");
}

- (id)newRequestPropertiesWithSearchTerm:(id)a3
{
  return -[SUSearchFieldController newRequestPropertiesWithSearchTerm:kind:](self, "newRequestPropertiesWithSearchTerm:kind:", a3, 0);
}

- (id)newRequestPropertiesWithSearchTerm:(id)a3 kind:(id)a4
{
  id v7;
  id v8;

  v7 = -[SUSearchFieldConfiguration searchURLRequestPropertiesForNetworkType:](self->_configuration, "searchURLRequestPropertiesForNetworkType:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "networkType"));
  objc_msgSend(v7, "setValue:forRequestParameter:", -[SUSearchFieldController _searchGroupForSearchKind:](self, "_searchGroupForSearchKind:", a4), CFSTR("group"));
  objc_msgSend(v7, "setValue:forRequestParameter:", a3, CFSTR("term"));
  v8 = v7;
  return v7;
}

- (UISearchBar)searchBar
{
  UISearchBar *result;

  result = self->_searchBar;
  if (!result)
  {
    self->_searchBar = (UISearchBar *)-[SUSearchFieldController _newSearchBar](self, "_newSearchBar");
    -[SUSearchFieldController _reloadSearchBar](self, "_reloadSearchBar");
    return self->_searchBar;
  }
  return result;
}

- (void)setSearchFieldConfiguration:(id)a3
{
  SUSearchFieldConfiguration *configuration;

  configuration = self->_configuration;
  if (configuration != a3)
  {

    self->_configuration = (SUSearchFieldConfiguration *)objc_msgSend(a3, "copy");
    -[SUSearchFieldController _reloadSearchBar](self, "_reloadSearchBar");
  }
}

- (void)setSearchFieldStyle:(int64_t)a3
{
  SUSearchDisplayController *v5;
  UIViewController *v6;

  if (self->_searchFieldStyle != a3)
  {
    v6 = -[UISearchDisplayController searchContentsController](self->_searchController, "searchContentsController");
    self->_searchFieldStyle = a3;
    -[UISearchDisplayController setDelegate:](self->_searchController, "setDelegate:", 0);
    -[UISearchDisplayController setSearchResultsDataSource:](self->_searchController, "setSearchResultsDataSource:", self);
    -[UISearchDisplayController setSearchResultsDelegate:](self->_searchController, "setSearchResultsDelegate:", self);

    v5 = -[SUSearchFieldController _newSearchDisplayControllerWithContentsController:](self, "_newSearchDisplayControllerWithContentsController:", v6);
    self->_searchController = v5;
    -[UISearchDisplayController setDelegate:](v5, "setDelegate:", self);
    -[UISearchDisplayController setSearchResultsDataSource:](self->_searchController, "setSearchResultsDataSource:", self);
    -[UISearchDisplayController setSearchResultsDelegate:](self->_searchController, "setSearchResultsDelegate:", self);
    -[SUSearchFieldController _reloadSearchBar](self, "_reloadSearchBar");

  }
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  -[ISStoreURLOperation setDelegate:](self->_completionsOperation, "setDelegate:", 0, a4);

  self->_completionsOperation = 0;
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{

  self->_completions = (NSArray *)(id)objc_msgSend(a4, "completionItems");
  -[UITableView reloadData](-[UISearchDisplayController searchResultsTableView](self->_searchController, "searchResultsTableView"), "reloadData");
}

- (void)operationDidFinish:(id)a3
{
  -[ISStoreURLOperation setDelegate:](self->_completionsOperation, "setDelegate:", 0);

  self->_completionsOperation = 0;
}

- (void)scriptDidChangeTextForField:(id)a3
{
  -[SUSearchFieldController _saveSearchTermToDefaults:](self, "_saveSearchTermToDefaults:", -[UISearchBar text](self->_searchBar, "text", a3));
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  UIViewController *v5;

  v5 = -[UISearchDisplayController searchContentsController](self->_searchController, "searchContentsController", a3, a4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "sendAction:to:from:forEvent:", sel_iTunesStoreUI_searchFieldControllerDidChange_, v5, a3, 0);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "text");
  -[SUSearchDisplayController _noEventSetSearchFieldText:](self->_searchController, "_noEventSetSearchFieldText:", v4);
  -[SUSearchDisplayController setActive:animated:](self->_searchController, "setActive:animated:", 0, 1);
  -[SUSearchFieldController _saveSearchTermToDefaults:](self, "_saveSearchTermToDefaults:", v4);
  if (objc_msgSend(v4, "length"))
    -[SUSearchFieldController _fetchResultsForTerm:URL:](self, "_fetchResultsForTerm:URL:", v4, 0);
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", a3), "userInterfaceIdiom") == 1)
  {
    if (-[NSString length](-[UISearchBar text](self->_searchBar, "text"), "length")
      && -[SUSearchFieldController _focusTransientViewController](self, "_focusTransientViewController"))
    {
      return 0;
    }
    -[SUSearchFieldController _showDimmerView](self, "_showDimmerView");
  }
  return 1;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  _QWORD v5[5];
  _QWORD v6[5];

  if (self->_dimmerView)
  {
    v5[4] = self;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__SUSearchFieldController_searchBarShouldEndEditing___block_invoke;
    v6[3] = &unk_24DE7AF90;
    v6[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__SUSearchFieldController_searchBarShouldEndEditing___block_invoke_2;
    v5[3] = &unk_24DE7B7E8;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v6, v5, 0.3, 0.0);
  }
  -[SUSearchFieldController _cancelCompletionsOperation](self, "_cancelCompletionsOperation", a3);
  return 1;
}

uint64_t __53__SUSearchFieldController_searchBarShouldEndEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAlpha:", 0.0);
}

uint64_t __53__SUSearchFieldController_searchBarShouldEndEditing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownDimmerView");
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  -[SUSearchFieldController _saveSearchTermToDefaults:](self, "_saveSearchTermToDefaults:", -[UISearchBar text](self->_searchBar, "text", a3));
}

- (void)searchBarWillRemoveFromSuperview:(id)a3
{
  _BOOL4 hasLoadedSearchResultsTableView;
  SUSearchDisplayController *searchController;
  uint64_t v6;

  hasLoadedSearchResultsTableView = self->_hasLoadedSearchResultsTableView;
  searchController = self->_searchController;
  if (!hasLoadedSearchResultsTableView)
  {
    if (!-[UISearchDisplayController isActive](searchController, "isActive", a3))
      return;
LABEL_6:
    if (!-[UISearchBar isFirstResponder](self->_searchBar, "isFirstResponder"))
      return;
    goto LABEL_7;
  }
  v6 = -[UITableView window](-[UISearchDisplayController searchResultsTableView](searchController, "searchResultsTableView", a3), "window");
  if (!-[UISearchDisplayController isActive](self->_searchController, "isActive"))
    return;
  if (!v6)
    goto LABEL_6;
LABEL_7:
  -[SUSearchDisplayController setActive:animated:](self->_searchController, "setActive:animated:", 0, 1);
}

- (BOOL)searchDisplayController:(id)a3 shouldReloadTableForSearchString:(id)a4
{
  -[SUSearchFieldController _reloadCompletionsForSearchString:](self, "_reloadCompletionsForSearchString:", a4);
  return objc_msgSend(a4, "length") == 0;
}

- (void)searchDisplayController:(id)a3 didLoadSearchResultsTableView:(id)a4
{
  self->_hasLoadedSearchResultsTableView = 1;
}

- (void)searchDisplayController:(id)a3 willUnloadSearchResultsTableView:(id)a4
{
  self->_hasLoadedSearchResultsTableView = 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = (id)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("a"));
  if (!v6)
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("a"));
  v7 = -[NSArray objectAtIndex:](self->_completions, "objectAtIndex:", objc_msgSend(a4, "row"));
  v8 = (void *)objc_msgSend(v7, "alternateTitle");
  if (!objc_msgSend(v8, "length"))
    v8 = (void *)objc_msgSend(v7, "title");
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", v8);
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;

  v5 = -[NSArray objectAtIndex:](self->_completions, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  v6 = objc_msgSend(v5, "title");
  -[SUSearchDisplayController _noEventSetSearchFieldText:](self->_searchController, "_noEventSetSearchFieldText:", v6);
  -[SUSearchDisplayController setActive:animated:](self->_searchController, "setActive:animated:", 0, 1);
  -[SUSearchFieldController _saveSearchTermToDefaults:](self, "_saveSearchTermToDefaults:", v6);
  -[SUSearchFieldController _fetchResultsForTerm:URL:](self, "_fetchResultsForTerm:URL:", v6, objc_msgSend(v5, "URL"));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_completions, "count", a3, a4);
}

- (void)_dimmerViewAction:(id)a3
{
  -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder", a3);
}

- (void)_savedSearchTermChangedNotification:(id)a3
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "searchFieldConfiguration"), "userDefaultsKey"), "isEqualToString:", -[SUSearchFieldConfiguration userDefaultsKey](self->_configuration, "userDefaultsKey")))-[SUSearchDisplayController _noEventSetSearchFieldText:](self->_searchController, "_noEventSetSearchFieldText:", -[SUSearchFieldController _defaultSearchTerm](self, "_defaultSearchTerm"));
}

- (id)_cancelButtonView
{
  UIViewController *v2;
  UINavigationItem *v3;

  v2 = -[UISearchDisplayController searchContentsController](self->_searchController, "searchContentsController");
  if (!v2)
    return 0;
  v3 = -[UIViewController navigationItem](v2, "navigationItem");
  if (sel_isEqual(sel_cancelTransientViewController_, -[UIBarButtonItem action](-[UINavigationItem leftBarButtonItem](v3, "leftBarButtonItem"), "action")))
  {
    return (id)-[UINavigationItem customLeftView](v3, "customLeftView");
  }
  if (sel_isEqual(sel_cancelTransientViewController_, -[UIBarButtonItem action](-[UINavigationItem rightBarButtonItem](v3, "rightBarButtonItem"), "action")))
  {
    return (id)-[UINavigationItem customRightView](v3, "customRightView");
  }
  else
  {
    return 0;
  }
}

- (void)_cancelCompletionsOperation
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__fetchCompletions, 0);
  -[ISStoreURLOperation setDelegate:](self->_completionsOperation, "setDelegate:", 0);
  -[ISStoreURLOperation cancel](self->_completionsOperation, "cancel");

  self->_completionsOperation = 0;
}

- (id)_defaultSearchTerm
{
  id result;

  result = -[SUSearchFieldConfiguration userDefaultsKey](self->_configuration, "userDefaultsKey");
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", result);
  return result;
}

- (void)_fetchCompletions
{
  NSString *v3;
  ISStoreURLOperation *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  v3 = -[UISearchBar text](-[SUSearchFieldController searchBar](self, "searchBar"), "text");
  if (-[NSString length](v3, "length"))
  {
    v4 = (ISStoreURLOperation *)objc_alloc_init(MEMORY[0x24BEC8C30]);
    self->_completionsOperation = v4;
    -[ISStoreURLOperation setDataProvider:](v4, "setDataProvider:", +[ISDataProvider provider](SUCompletionDataProvider, "provider"));
    -[ISStoreURLOperation setDelegate:](self->_completionsOperation, "setDelegate:", self);
    -[ISStoreURLOperation setShouldMessageMainThread:](self->_completionsOperation, "setShouldMessageMainThread:", 1);
    v5 = -[SUSearchFieldConfiguration hintsURLRequestPropertiesForNetworkType:](self->_configuration, "hintsURLRequestPropertiesForNetworkType:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "networkType"));
    objc_msgSend(v5, "setValue:forRequestParameter:", v3, CFSTR("q"));
    -[ISStoreURLOperation setRequestProperties:](self->_completionsOperation, "setRequestProperties:", v5);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", self->_completionsOperation);
  }
}

- (void)_fetchResultsForTerm:(id)a3 URL:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__SUSearchFieldController__fetchResultsForTerm_URL___block_invoke;
  v4[3] = &unk_24DE7D288;
  v4[4] = a4;
  v4[5] = self;
  v4[6] = a3;
  -[SUSearchFieldController _sendOnXEventWithTerm:URL:completionBlock:](self, "_sendOnXEventWithTerm:URL:completionBlock:", a3, a4, v4);
}

void __52__SUSearchFieldController__fetchResultsForTerm_URL___block_invoke(uint64_t a1, char a2)
{
  id *v3;
  uint64_t v4;
  id v5;
  id v6;

  if ((a2 & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(id **)(a1 + 40);
    if (v4)
      v5 = (id)objc_msgSend(v3[4], "URLRequestPropertiesWithBaseURL:forNetworkType:", v4, objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance"), "networkType"));
    else
      v5 = (id)objc_msgSend(v3, "newRequestPropertiesWithSearchTerm:", *(_QWORD *)(a1 + 48));
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 40), "_fetchResultsForURLRequestProperties:", v5);

  }
}

- (void)_fetchResultsForURLRequestProperties:(id)a3
{
  id v6;

  v6 = -[SUSearchFieldController _targetViewController](self, "_targetViewController");
  if (!v6)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUSearchFieldController.m"), 493, CFSTR("Must have a target view controller"));
  objc_msgSend(v6, "reloadWithURLRequestProperties:", a3);
}

- (BOOL)_focusTransientViewController
{
  UITabBarController *v3;
  UITabBarController *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SUSearchFieldController *v8;

  v3 = -[UIViewController tabBarController](-[UISearchDisplayController searchContentsController](self->_searchController, "searchContentsController"), "tabBarController");
  if (!__SharedTransientViewController)
    goto LABEL_6;
  v4 = v3;
  v5 = -[UITabBarController transientViewController](v3, "transientViewController");
  if (v5 == __SharedTransientViewController)
    goto LABEL_6;
  v6 = (void *)objc_msgSend((id)__SharedTransientViewController, "topViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v7 = (void *)objc_msgSend(v6, "searchFieldController");
  if (v7)
  {
    if (objc_msgSend((id)objc_msgSend(v7, "searchFieldConfiguration"), "location") == 2)
    {
LABEL_6:
      LOBYTE(v7) = 0;
      return (char)v7;
    }
    v8 = self;
    -[UITabBarController setTransientViewController:animated:](v4, "setTransientViewController:animated:", __SharedTransientViewController, 0);
    LOBYTE(v7) = 1;
  }
  return (char)v7;
}

- (id)_newBlankStorePageViewController
{
  SUSearchRootStorePageViewController *v3;

  v3 = -[SUViewController initWithSection:]([SUSearchRootStorePageViewController alloc], "initWithSection:", -[UIViewController section](-[UISearchDisplayController searchContentsController](self->_searchController, "searchContentsController"), "section"));
  -[SUViewController setClientInterface:](v3, "setClientInterface:", self->_clientInterface);
  return v3;
}

- (id)_newSearchBar
{
  SUSearchBar *v3;
  SUSearchBar *v4;

  v3 = [SUSearchBar alloc];
  v4 = -[SUSearchBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[SUSearchBar setAutocapitalizationType:](v4, "setAutocapitalizationType:", 0);
  -[SUSearchBar setAutocorrectionType:](v4, "setAutocorrectionType:", 1);
  -[SUSearchBar setDelegate:](v4, "setDelegate:", self->_textFieldDelegate);
  return v4;
}

- (id)_newSearchDisplayControllerWithContentsController:(id)a3
{
  SUSearchDisplayController *v4;

  v4 = -[UISearchDisplayController initWithSearchBar:contentsController:]([SUSearchDisplayController alloc], "initWithSearchBar:contentsController:", -[SUSearchFieldController searchBar](self, "searchBar"), a3);
  -[UISearchDisplayController _setAllowDisablingNavigationBarHiding:](v4, "_setAllowDisablingNavigationBarHiding:", 1);
  -[UISearchDisplayController setAutomaticallyShowsNoResultsMessage:](v4, "setAutomaticallyShowsNoResultsMessage:", 0);
  -[UISearchDisplayController setDimTableViewOnEmptySearchString:](v4, "setDimTableViewOnEmptySearchString:", 1);
  if (self->_searchFieldStyle)
  {
    -[SUSearchDisplayController setNavigationBarHidingEnabled:](v4, "setNavigationBarHidingEnabled:", 1);
    -[UISearchDisplayController _setCancelButtonManagementDisabled:](v4, "_setCancelButtonManagementDisabled:", 0);
  }
  else
  {
    -[SUSearchDisplayController setNavigationBarHidingEnabled:](v4, "setNavigationBarHidingEnabled:", 0);
    -[UISearchDisplayController _setCancelButtonManagementDisabled:](v4, "_setCancelButtonManagementDisabled:", 1);
    if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    {
      -[UISearchDisplayController setDisplaysSearchBarInNavigationBar:](v4, "setDisplaysSearchBarInNavigationBar:", 1);
      -[UINavigationItem setRightBarButtonItem:](-[UISearchDisplayController navigationItem](v4, "navigationItem"), "setRightBarButtonItem:", 0);
    }
  }
  return v4;
}

- (id)_newTransientViewController
{
  id v3;
  id v4;
  SUNavigationController *v5;

  v3 = -[UIViewController section](-[UISearchDisplayController searchContentsController](self->_searchController, "searchContentsController"), "section");
  v4 = -[SUSearchFieldController _newBlankStorePageViewController](self, "_newBlankStorePageViewController");
  v5 = -[SUNavigationController initWithSection:rootViewController:]([SUNavigationController alloc], "initWithSection:rootViewController:", v3, v4);
  -[SUNavigationController setClientInterface:](v5, "setClientInterface:", objc_msgSend(v4, "clientInterface"));

  return v5;
}

- (void)_reloadCompletionsForSearchString:(id)a3
{
  -[SUSearchFieldController _cancelCompletionsOperation](self, "_cancelCompletionsOperation");
  if (objc_msgSend(a3, "length"))
  {
    -[SUSearchFieldController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__fetchCompletions, 0, 0.3);
  }
  else
  {

    self->_completions = 0;
  }
}

- (void)_reloadSearchBar
{
  int v3;
  void *v4;
  uint64_t v5;
  UISearchBar *searchBar;
  uint64_t v7;
  uint64_t v8;

  -[SUSearchFieldController _resizeSearchBarForOrientation:](self, "_resizeSearchBarForOrientation:", -[UIViewController interfaceOrientation](-[UISearchDisplayController searchContentsController](self->_searchController, "searchContentsController"), "interfaceOrientation"));
  if (!-[NSString length](-[UISearchBar text](self->_searchBar, "text"), "length"))
    -[SUSearchDisplayController _noEventSetSearchFieldText:](self->_searchController, "_noEventSetSearchFieldText:", -[SUSearchFieldController _defaultSearchTerm](self, "_defaultSearchTerm"));
  v3 = _UIApplicationUsesLegacyUI();
  v4 = (void *)-[UISearchBar searchField](self->_searchBar, "searchField");
  if (v3)
  {
    if (self->_searchFieldStyle)
    {
      -[UISearchBar setSearchFieldBackgroundImage:forState:](self->_searchBar, "setSearchFieldBackgroundImage:forState:", 0, 0);
      -[UISearchBar setSearchFieldBackgroundImage:forState:](self->_searchBar, "setSearchFieldBackgroundImage:forState:", 0, 2);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", 0, 1, 0);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", 0, 0, 0);
      -[UISearchBar setPositionAdjustment:forSearchBarIcon:](self->_searchBar, "setPositionAdjustment:forSearchBarIcon:", 1, 0.0, 1.0);
      objc_msgSend(v4, "setShadowColor:", 0);
      v5 = objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      -[UISearchBar setSearchFieldBackgroundImage:forState:](self->_searchBar, "setSearchFieldBackgroundImage:forState:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISearch"), v8), "resizableImageWithCapInsets:", 0.0, 16.0, 0.0, 16.0), 0);
      -[UISearchBar setSearchFieldBackgroundImage:forState:](self->_searchBar, "setSearchFieldBackgroundImage:forState:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISearchInactive"), v8), "resizableImageWithCapInsets:", 0.0, 16.0, 0.0, 16.0), 2);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISearchBarClear"), v8), 1, 0);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISearchBarClearPressed"), v8), 1, 1);
      -[UISearchBar setPositionAdjustment:forSearchBarIcon:](self->_searchBar, "setPositionAdjustment:forSearchBarIcon:", 1, 0.0, -1.0);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISearchBarResultsList"), v8), 3, 0);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISearchBarResultsListPressed"), v8), 3, 1);
      -[UISearchBar setImage:forSearchBarIcon:state:](self->_searchBar, "setImage:forSearchBarIcon:state:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UISearchBarSearch"), v8), 0, 0);
      objc_msgSend(v4, "setShadowColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.08, 1.0));
      objc_msgSend(v4, "setShadowOffset:", 0.0, -1.0);
      v5 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.73, 1.0);
    }
    objc_msgSend(v4, "setTextColor:", v5);
  }
  else
  {
    objc_msgSend(v4, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0));
    searchBar = self->_searchBar;
    if (self->_searchFieldStyle)
    {
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v7 = 2;
      else
        v7 = 1;
    }
    else
    {
      v7 = 2;
    }
    -[UISearchBar setSearchBarStyle:](searchBar, "setSearchBarStyle:", v7);
  }
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", -[SUSearchFieldConfiguration placeholderString](self->_configuration, "placeholderString"));
  -[UISearchBar setDrawsBackground:](self->_searchBar, "setDrawsBackground:", self->_searchFieldStyle != 0);
}

- (void)_resizeSearchBarForOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[SUSearchFieldConfiguration widthForOrientation:](self->_configuration, "widthForOrientation:");
  v6 = v5;
  if (v5 < 0.00000011920929)
  {
    objc_msgSend(+[SUSearchFieldConfiguration defaultConfigurationWithClientInterface:](SUSearchFieldConfiguration, "defaultConfigurationWithClientInterface:", self->_clientInterface), "widthForOrientation:", a3);
    v6 = v7;
  }
  -[UISearchBar frame](self->_searchBar, "frame");
  v9 = v8;
  v11 = v10;
  -[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", v6, 0.0);
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:", v9, v11, v12, v13);
  objc_msgSend((id)-[UISearchBar superview](self->_searchBar, "superview"), "setNeedsLayout");
}

- (void)_saveSearchTermToDefaults:(id)a3
{
  NSString *v5;
  NSString *v6;
  uint64_t v7;
  void *v8;

  v5 = -[SUSearchFieldConfiguration userDefaultsKey](self->_configuration, "userDefaultsKey");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(a3, "length");
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    if (v7)
      objc_msgSend(v8, "setObject:forKey:", a3, v6);
    else
      objc_msgSend(v8, "removeObjectForKey:", v6);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUSearchFieldControllerSavedSearchTermNotification"), self);
  }
}

- (id)_searchGroupForSearchKind:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("epubBook")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("metaEbook")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("ibook")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("ibookTextbook")) & 1) != 0)
  {
    return CFSTR("ebook");
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("book")) & 1) != 0)
    return CFSTR("audiobook");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("iMix")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("itunesMix")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("mix")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("preorderAlbum")) & 1) != 0)
  {
    return CFSTR("album");
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("shortFilm")) & 1) != 0)
    return CFSTR("movie");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("tvEpisode")) & 1) != 0)
    return CFSTR("tvSeason");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("podcastEpisode")) & 1) != 0)
    return CFSTR("podcast");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("tone")) & 1) != 0)
    return CFSTR("ringtone");
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("course")))
    return CFSTR("iTunesUCourse");
  return a3;
}

- (void)_sendOnXEventWithTerm:(id)a3 URL:(id)a4 completionBlock:(id)a5
{
  void *v9;
  void *v10;
  SUClientInterface *clientInterface;
  _QWORD v12[5];

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", CFSTR("search"), CFSTR("type"), 0);
  v10 = v9;
  if (a3)
    objc_msgSend(v9, "setObject:forKey:", a3, CFSTR("term"));
  if (a4)
    objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a4, "absoluteString"), CFSTR("url"));
  clientInterface = self->_clientInterface;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__SUSearchFieldController__sendOnXEventWithTerm_URL_completionBlock___block_invoke;
  v12[3] = &unk_24DE7B710;
  v12[4] = a5;
  -[SUClientInterface _dispatchXEvent:withCompletionBlock:](clientInterface, "_dispatchXEvent:withCompletionBlock:", v10, v12);
}

void __69__SUSearchFieldController__sendOnXEventWithTerm_URL_completionBlock___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __69__SUSearchFieldController__sendOnXEventWithTerm_URL_completionBlock___block_invoke_2;
  v2[3] = &unk_24DE7D2B0;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

uint64_t __69__SUSearchFieldController__sendOnXEventWithTerm_URL_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_showDimmerView
{
  UIControl *dimmerView;
  UIControl *v4;
  UIViewController *v5;
  UIViewController *v6;
  UIView *v7;
  UIView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[5];

  if (_UIApplicationUsesLegacyUI())
  {
    dimmerView = self->_dimmerView;
    if (!dimmerView)
    {
      v4 = (UIControl *)objc_alloc_init(MEMORY[0x24BDF6998]);
      self->_dimmerView = v4;
      -[UIControl setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
      -[UIControl setBackgroundColor:](self->_dimmerView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"));
      -[UIControl addTarget:action:forControlEvents:](self->_dimmerView, "addTarget:action:forControlEvents:", self, sel__dimmerViewAction_, 64);
      dimmerView = self->_dimmerView;
    }
    if (!-[UIControl superview](dimmerView, "superview"))
    {
      v5 = -[UISearchDisplayController searchContentsController](self->_searchController, "searchContentsController");
      -[UIControl setAlpha:](self->_dimmerView, "setAlpha:", 0.0);
      v6 = -[UIViewController parentViewController](v5, "parentViewController");
      if (v6)
      {
        v7 = -[UIViewController view](v6, "view");
        v8 = -[UIViewController view](v5, "view");
        -[UIView frame](v8, "frame");
        -[UIView convertRect:fromView:](v7, "convertRect:fromView:", -[UIView superview](v8, "superview"), v9, v10, v11, v12);
      }
      else
      {
        v7 = -[UIViewController view](v5, "view");
        -[UIView bounds](v7, "bounds");
      }
      -[UIControl setFrame:](self->_dimmerView, "setFrame:");
      -[UIView addSubview:](v7, "addSubview:", self->_dimmerView);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __42__SUSearchFieldController__showDimmerView__block_invoke;
      v13[3] = &unk_24DE7AF90;
      v13[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v13, &__block_literal_global_11, 0.3, 0.0);
    }
  }
}

uint64_t __42__SUSearchFieldController__showDimmerView__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  UIInterfaceGetContentDisabledAlpha();
  return objc_msgSend(v1, "setAlpha:");
}

- (id)_targetViewController
{
  UIViewController *v3;
  id v4;
  id v5;
  void *v6;
  SUSearchFieldController *v7;
  UITabBarController *v8;

  v3 = -[UISearchDisplayController searchContentsController](self->_searchController, "searchContentsController");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    if (__SharedTransientViewController)
    {
      v4 = -[SUSearchFieldController _newBlankStorePageViewController](self, "_newBlankStorePageViewController");
      objc_msgSend((id)__SharedTransientViewController, "setViewControllers:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, 0));

      v5 = (id)__SharedTransientViewController;
    }
    else
    {
      v5 = -[SUSearchFieldController _newTransientViewController](self, "_newTransientViewController");
      __SharedTransientViewController = (uint64_t)v5;
    }
    v6 = (void *)objc_msgSend(v5, "topViewController");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = (void *)objc_msgSend(v6, "embeddedViewController");
    v7 = self;
    v8 = -[UIViewController tabBarController](v3, "tabBarController");
    -[UITabBarController setTransientViewController:animated:](v8, "setTransientViewController:animated:", __SharedTransientViewController, 0);
    return v6;
  }
  return v3;
}

- (void)_tearDownDimmerView
{
  -[UIControl removeTarget:action:forControlEvents:](self->_dimmerView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[UIControl removeFromSuperview](self->_dimmerView, "removeFromSuperview");

  self->_dimmerView = 0;
}

- (SUSearchFieldConfiguration)searchFieldConfiguration
{
  return self->_configuration;
}

- (int64_t)searchFieldStyle
{
  return self->_searchFieldStyle;
}

@end
