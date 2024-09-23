@implementation CarKeyboardSearchResultsViewController

- (CarKeyboardSearchResultsViewController)init
{
  CarKeyboardSearchResultsViewController *v2;
  SearchDataProvider *v3;
  SearchDataProvider *searchDataProvider;
  uint64_t v5;
  NSMapTable *modelsByItem;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarKeyboardSearchResultsViewController;
  v2 = -[CarKeyboardSearchResultsViewController init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(SearchDataProvider);
    searchDataProvider = v2->_searchDataProvider;
    v2->_searchDataProvider = v3;

    -[SearchDataProvider setEnableRAPIfAvailable:](v2->_searchDataProvider, "setEnableRAPIfAvailable:", 0);
    -[SearchDataProvider setDelegate:](v2->_searchDataProvider, "setDelegate:", v2);
    -[SearchDataProvider setSearchMode:](v2->_searchDataProvider, "setSearchMode:", 3);
    v2->_cellStyle = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    modelsByItem = v2->_modelsByItem;
    v2->_modelsByItem = (NSMapTable *)v5;

  }
  return v2;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarKeyboardSearchResultsViewController;
  -[CarKeyboardSearchResultsViewController viewDidLoad](&v3, "viewDidLoad");
  -[CarKeyboardSearchResultsViewController prepareTableView](self, "prepareTableView");
}

- (void)prepareTableView
{
  UITableView *v3;
  UITableView *searchResultTableView;
  void *v5;
  UITableView *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  UITableView *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (UITableView *)objc_alloc_init((Class)UITableView);
  searchResultTableView = self->_searchResultTableView;
  self->_searchResultTableView = v3;

  -[UITableView setAccessibilityIdentifier:](self->_searchResultTableView, "setAccessibilityIdentifier:", CFSTR("CarSearchResultTableView"));
  -[UITableView setDelegate:](self->_searchResultTableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_searchResultTableView, "setDataSource:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_searchResultTableView, "setBackgroundColor:", v5);

  v6 = self->_searchResultTableView;
  v7 = objc_opt_class(CarSearchItemCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCell reuseIdentifier](CarSearchItemCell, "reuseIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](v6, "registerClass:forCellReuseIdentifier:", v7, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_searchResultTableView);

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_searchResultTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = self->_searchResultTableView;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "safeAreaLayoutGuide"));
  LODWORD(v12) = 1148846080;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v10, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v11, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)updateForInteractionModel:(unint64_t)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3 != 1;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController searchResultTableView](self, "searchResultTableView"));
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (void)handleSearchButtonPressedWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  CarKeyboardSearchResultsViewController *v9;
  CarKeyboardSearchResultsViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  SearchFieldItem *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  __CFString *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController keyboardMode](self, "keyboardMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
  objc_msgSend(v6, "captureUserAction:", 2014);

  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Keyboard search button pressed, will perform search", buf, 0xCu);

  }
  v17 = objc_alloc_init(SearchFieldItem);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_stringByTrimmingLeadingWhitespace"));
  -[SearchFieldItem setSearchString:](v17, "setSearchString:", v18);

  -[SearchFieldItem setUserTypedStringForRAP:](v17, "setUserTypedStringForRAP:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v20 = objc_msgSend(v19, "processSearchFieldItem:searchInfo:userInfo:", v17, 0, 0);

}

- (void)handleSearchTextDidChange:(id)a3
{
  void *v4;
  id v5;

  if (!objc_msgSend(a3, "length"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController keyboardMode](self, "keyboardMode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
    objc_msgSend(v4, "captureUserAction:", 2003);

  }
}

- (void)handleCancelButtonPressed
{
  id v3;
  NSObject *v4;
  CarKeyboardSearchResultsViewController *v5;
  CarKeyboardSearchResultsViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  __CFString *v16;

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Keyboard cancel button pressed.", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController keyboardMode](self, "keyboardMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));
  objc_msgSend(v14, "captureUserAction:", 2003);

}

- (void)searchDataProviderDidUpdate:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  CarKeyboardSearchResultsViewController *v22;
  CarKeyboardSearchResultsViewController *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  id v30;
  AutocompleteSection *v31;
  void *v32;
  AutocompleteSection *v33;
  id v34;
  NSArray *v35;
  NSArray *filteredResults;
  void *v37;
  void *v38;
  id obj;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  __CFString *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v3 = a3;
  v41 = objc_alloc_init((Class)NSMutableArray);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v38 = v3;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sections"));
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v51;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v51 != v42)
          objc_enumerationMutation(obj);
        v45 = v4;
        v5 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v4);
        v6 = objc_alloc((Class)NSMutableArray);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
        v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = v5;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v47 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "autocompleteObject"));
              v16 = objc_opt_class(MKLocalSearchCompletion);
              if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
              {
                v17 = v15;
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collectionResult"));
                if (v18)
                {

                }
                else
                {
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "publisherResult"));

                  if (!v19)
                    objc_msgSend(v8, "addObject:", v14);
                }

              }
              else
              {
                objc_msgSend(v8, "addObject:", v14);
              }

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
          }
          while (v11);
        }

        if (objc_msgSend(v8, "count"))
        {
          v20 = sub_10043364C();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = self;
            v23 = v22;
            if (self)
            {
              v24 = (objc_class *)objc_opt_class(v22);
              v25 = NSStringFromClass(v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) == 0)
                goto LABEL_27;
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController performSelector:](v23, "performSelector:", "accessibilityIdentifier"));
              v28 = v27;
              if (v27 && !objc_msgSend(v27, "isEqualToString:", v26))
              {
                v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

              }
              else
              {

LABEL_27:
                v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
              }

            }
            else
            {
              v29 = CFSTR("<nil>");
            }

            v30 = objc_msgSend(v8, "count");
            *(_DWORD *)buf = 138543874;
            v55 = v29;
            v56 = 2112;
            v57 = v44;
            v58 = 2048;
            v59 = v30;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Setting items for sections : %@. Count: %lu", buf, 0x20u);

          }
          v31 = [AutocompleteSection alloc];
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "title"));
          v33 = -[AutocompleteSection initWithTitle:items:isQuerySuggestionsSection:](v31, "initWithTitle:items:isQuerySuggestionsSection:", v32, v8, objc_msgSend(v44, "isQuerySuggestionsSection"));
          objc_msgSend(v41, "addObject:", v33);

        }
        v4 = v45 + 1;
      }
      while ((id)(v45 + 1) != v43);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      v43 = v34;
    }
    while (v34);
  }

  v35 = (NSArray *)objc_msgSend(v41, "copy");
  filteredResults = self->_filteredResults;
  self->_filteredResults = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController searchResultTableView](self, "searchResultTableView"));
  objc_msgSend(v37, "reloadData");

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  CarKeyboardSearchResultsViewController *v9;
  CarKeyboardSearchResultsViewController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  CarKeyboardSearchResultsViewController *v17;
  CarKeyboardSearchResultsViewController *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  NSString *inputText;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  void *v39;

  v4 = a3;
  v5 = objc_msgSend(v4, "isActive");
  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (!v8)
      goto LABEL_26;
    v17 = self;
    v18 = v17;
    if (!v17)
    {
      v24 = CFSTR("<nil>");
      goto LABEL_25;
    }
    v19 = (objc_class *)objc_opt_class(v17);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_17;
      }

    }
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_17:

LABEL_25:
    *(_DWORD *)buf = 138543362;
    v37 = v24;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Seaarch controller is not active", buf, 0xCu);

    goto LABEL_26;
  }
  if (v8)
  {
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_9;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_9:

LABEL_19:
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBar"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "text"));
    *(_DWORD *)buf = 138543618;
    v37 = v16;
    v38 = 2112;
    v39 = v26;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Processing new query on CarPlay : %@", buf, 0x16u);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBar"));
  v28 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "text"));
  inputText = self->_inputText;
  self->_inputText = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController searchResultTableView](self, "searchResultTableView"));
  objc_msgSend(v30, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController keyboardMode](self, "keyboardMode"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "chromeViewController"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "currentTraits"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  LODWORD(v32) = objc_msgSend(v33, "isInNavigatingState");

  if ((_DWORD)v32)
    v34 = 2;
  else
    v34 = 0;
  -[NSObject setAutocompleteOriginationType:](v7, "setAutocompleteOriginationType:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  -[NSObject setNavigating:](v7, "setNavigating:", objc_msgSend(v35, "isInNavigatingState"));

  -[NSObject addSupportedAutocompleteListType:](v7, "addSupportedAutocompleteListType:", 2);
  -[SearchDataProvider setInputText:traits:source:](self->_searchDataProvider, "setInputText:traits:source:", self->_inputText, v7, 12);
LABEL_26:

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_filteredResults, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_filteredResults, "objectAtIndex:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (id)itemAtIndexPath:(id)a3
{
  NSArray *filteredResults;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  filteredResults = self->_filteredResults;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](filteredResults, "objectAtIndex:", objc_msgSend(v4, "section")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  v7 = objc_msgSend(v4, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v7));
  v9 = objc_opt_class(PersonalizedCompoundItem);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "autocompleteObject"));

    v8 = (void *)v10;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  double v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController itemAtIndexPath:](self, "itemAtIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController modelForItemAtIndexPath:](self, "modelForItemAtIndexPath:", v7));
  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCellModel modelWithUpdateBlock:](CarSearchItemCellModel, "modelWithUpdateBlock:", 0));
    objc_msgSend(v8, "updateModel:", v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rating"));
  if (v10)
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chargerNumberString"));

    if (!v11)
    {
      v12 = &CarSearchItemCellTwoLineHeight;
      goto LABEL_7;
    }
  }
  v12 = &CarSearchItemCellThreeLineHeight;
LABEL_7:
  v13 = *(double *)v12;

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  CarKeyboardSearchResultsViewController *v13;
  CarKeyboardSearchResultsViewController *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *inputText;
  void *v26;
  void *v27;
  const __CFString *v28;
  NSString *v29;
  uint8_t buf[4];
  __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController itemAtIndexPath:](self, "itemAtIndexPath:", v6));
  v8 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  v11 = sub_10043364C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    goto LABEL_14;
  v13 = self;
  v14 = v13;
  if (!v13)
  {
    v20 = CFSTR("<nil>");
    goto LABEL_13;
  }
  v15 = (objc_class *)objc_opt_class(v13);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
    v19 = v18;
    if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
    {
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

      goto LABEL_11;
    }

  }
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_11:

LABEL_13:
  *(_DWORD *)buf = 138543874;
  v31 = v20;
  v32 = 2112;
  v33 = v7;
  v34 = 2112;
  v35 = v6;
  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Selected item: %@ at indexPath: %@", buf, 0x20u);

LABEL_14:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController keyboardMode](self, "keyboardMode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "chromeViewController"));
  objc_msgSend(v22, "captureUserAction:mapItem:atResultIndex:", 2007, v10, objc_msgSend(v6, "row"));

  v23 = -[NSString length](self->_inputText, "length");
  if (v23)
  {
    inputText = self->_inputText;
    v28 = CFSTR("userTypedSearchString");
    v29 = inputText;
    v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v26 = (void *)v23;
  }
  else
  {
    v26 = 0;
  }
  if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v23, v24))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    objc_msgSend(v27, "processItem:userInfo:", v7, v26);
  }
  else
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v27, "displayRoutePlanningForDestination:userInfo:", v7, v26);
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  NSObject *v13;
  CarKeyboardSearchResultsViewController *v14;
  CarKeyboardSearchResultsViewController *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id from;
  _BYTE location[12];
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;

  v23 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCell reuseIdentifier](CarSearchItemCell, "reuseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dequeueReusableCellWithIdentifier:forIndexPath:", v7, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController itemAtIndexPath:](self, "itemAtIndexPath:", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController modelForItemAtIndexPath:](self, "modelForItemAtIndexPath:", v6));
  if (!v10)
  {
    objc_initWeak((id *)location, v8);
    objc_initWeak(&from, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10093D30C;
    v24[3] = &unk_1011BA7E0;
    objc_copyWeak(&v25, &from);
    objc_copyWeak(&v26, (id *)location);
    v24[4] = self;
    v11 = objc_retainBlock(v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCellModel modelWithUpdateBlock:](CarSearchItemCellModel, "modelWithUpdateBlock:", v11));
    -[NSMapTable setObject:forKey:](self->_modelsByItem, "setObject:forKey:", v10, v9);
    objc_msgSend(v9, "updateModel:", v10);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
  }
  v12 = sub_10043364C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = self;
    v15 = v14;
    if (!v14)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v16 = (objc_class *)objc_opt_class(v14);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_10;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_10:

LABEL_12:
    *(_DWORD *)location = 138543874;
    *(_QWORD *)&location[4] = v21;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}@] [SearchAC] Setting up cell with model: %@, indexpath: %@", location, 0x20u);

  }
  objc_msgSend(v8, "setupWithModel:cellStyle:", v10, self->_cellStyle);

  return v8;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  NSMapTable *modelsByItem;
  void *v4;
  void *v5;

  modelsByItem = self->_modelsByItem;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarKeyboardSearchResultsViewController itemAtIndexPath:](self, "itemAtIndexPath:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](modelsByItem, "objectForKey:", v4));

  return v5;
}

- (CarKeyboardModeController)keyboardMode
{
  return (CarKeyboardModeController *)objc_loadWeakRetained((id *)&self->_keyboardMode);
}

- (void)setKeyboardMode:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardMode, a3);
}

- (UITableView)searchResultTableView
{
  return self->_searchResultTableView;
}

- (void)setSearchResultTableView:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultTableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultTableView, 0);
  objc_destroyWeak((id *)&self->_keyboardMode);
  objc_storeStrong((id *)&self->_modelsByItem, 0);
  objc_storeStrong((id *)&self->_inputText, 0);
  objc_storeStrong((id *)&self->_filteredResults, 0);
  objc_storeStrong((id *)&self->_searchDataProvider, 0);
}

@end
